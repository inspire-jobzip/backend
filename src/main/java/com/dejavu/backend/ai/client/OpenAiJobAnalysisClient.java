package com.dejavu.backend.ai.client;

import com.dejavu.backend.ai.domain.JobAiAnalysisPrompt;
import com.dejavu.backend.ai.dto.AiAnalysisResponse;
import com.dejavu.backend.common.ApiException;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

@Component
public class OpenAiJobAnalysisClient implements JobAiAnalysisClient {

	private static final String OPENAI_CHAT_COMPLETIONS_URL = "https://api.openai.com/v1/chat/completions";
	private static final String SYSTEM_PROMPT = """
		You are an AI career assistant specializing in software engineering job postings.

		Your task is to analyze a job posting and infer what the candidate is most likely to do after joining the company.

		Rules:
		1. Use ONLY the information explicitly stated or strongly implied in the job posting.
		2. Do NOT fabricate company culture, technology, or responsibilities that are not supported by the text.
		3. Infer reasonable day-to-day responsibilities from the required skills and job description.
		4. Keep the analysis concise and practical for job seekers.
		5. Write in Korean.
		6. The response must be valid JSON only. Do not include markdown or additional explanations.
		7. Keep the entire response under 250 words.
		8. Do not explain your reasoning.
		9. Do not output any text except the required JSON.
		10. If the job posting does not provide enough information, state only what can reasonably be inferred.
		11. Never invent responsibilities that are unsupported by the posting.

		Return the following JSON structure:

		{
		  "taskSummary": [
		    "...",
		    "...",
		    "..."
		  ],
		  "requiredSkills": [
		    "...",
		    "..."
		  ]
		}

		Requirements:

		- taskSummary
		  - Exactly 3 sentences.
		  - Each sentence should explain what the applicant is likely to do after joining.
		  - Each sentence should be under 60 Korean characters if possible.
		- requiredSkills
		  - Extract only core technical skills explicitly mentioned.
		  - Remove duplicates.
		  - Maximum 8 items.
		""";

	private final RestClient restClient;
	private final ObjectMapper objectMapper;
	private final String apiKey;
	private final String model;

	public OpenAiJobAnalysisClient(
		ObjectMapper objectMapper,
		@Value("${openai.api-key:}") String apiKey,
		@Value("${openai.model:gpt-4.1-mini}") String model
	) {
		this.restClient = RestClient.create();
		this.objectMapper = objectMapper;
		this.apiKey = apiKey;
		this.model = model;
	}

	@Override
	public AiAnalysisResponse.AiAnalysis analyze(JobAiAnalysisPrompt prompt) {
		if (apiKey == null || apiKey.isBlank()) {
			throw new ApiException(HttpStatus.INTERNAL_SERVER_ERROR, "AI_ANALYSIS_FAILED", "OpenAI API Key가 설정되지 않았습니다.");
		}

		try {
			OpenAiChatResponse response = requestAnalysis(prompt);
			String content = response.firstContent();
			if (content == null || content.isBlank()) {
				throw new IllegalStateException("OpenAI response content is empty.");
			}

			JsonNode analysisJson = objectMapper.readTree(content);
			List<String> taskSummary = readStringList(analysisJson, "taskSummary", 3);
			// 잘못된 AI 응답을 캐시에 저장하지 않도록 명세의 3문장 조건을 검증한다.
			if (taskSummary.size() != 3) {
				throw new IllegalStateException("OpenAI taskSummary must contain exactly 3 sentences.");
			}

			return new AiAnalysisResponse.AiAnalysis(
				taskSummary,
				readStringList(analysisJson, "requiredSkills", 8),
				LocalDateTime.now()
			);
		} catch (ApiException exception) {
			throw exception;
		} catch (Exception exception) {
			throw new ApiException(HttpStatus.INTERNAL_SERVER_ERROR, "AI_ANALYSIS_FAILED", "AI 분석에 실패했습니다.");
		}
	}

	private OpenAiChatResponse requestAnalysis(JobAiAnalysisPrompt prompt) {
		Map<String, Object> requestBody = Map.of(
			"model", model,
			"messages", List.of(
				Map.of("role", "system", "content", SYSTEM_PROMPT),
				Map.of("role", "user", "content", createUserPrompt(prompt))
			),
			"temperature", 0.2,
			"max_tokens", 500,
			// 응답 파싱 안정성을 위해 OpenAI에 JSON 객체 형식을 요청한다.
			"response_format", Map.of("type", "json_object")
		);

		return restClient.post()
			.uri(OPENAI_CHAT_COMPLETIONS_URL)
			.header(HttpHeaders.AUTHORIZATION, "Bearer " + apiKey)
			.contentType(MediaType.APPLICATION_JSON)
			.body(requestBody)
			.retrieve()
			.body(OpenAiChatResponse.class);
	}

	private String createUserPrompt(JobAiAnalysisPrompt prompt) {
		return """
			다음은 채용공고입니다.

			직무:
			%s

			회사명:
			%s

			공고 제목:
			%s

			채용공고 내용:
			%s

			위 공고를 분석하여 JSON 형식으로만 응답하세요.
			""".formatted(
			blankToFallback(prompt.jobRole()),
			blankToFallback(prompt.companyName()),
			blankToFallback(prompt.title()),
			trimDescription(prompt.description())
		);
	}

	private String trimDescription(String description) {
		String content = blankToFallback(description);
		if (content.length() <= 6_000) {
			return content;
		}

		// 긴 공고문은 비용과 토큰 사용량을 줄이기 위해 분석에 필요한 앞부분만 사용한다.
		return content.substring(0, 6_000);
	}

	private String blankToFallback(String value) {
		return value == null || value.isBlank() ? "제공되지 않음" : value;
	}

	private List<String> readStringList(JsonNode jsonNode, String fieldName, int limit) {
		JsonNode value = jsonNode.path(fieldName);
		if (!value.isArray()) {
			return List.of();
		}

		List<String> result = new ArrayList<>();
		for (JsonNode item : value) {
			String text = item.asText(null);
			if (text == null || text.isBlank() || result.contains(text.trim())) {
				continue;
			}

			result.add(text.trim());
			if (result.size() >= limit) {
				break;
			}
		}

		return result;
	}

	@JsonIgnoreProperties(ignoreUnknown = true)
	private record OpenAiChatResponse(List<Choice> choices) {

		private String firstContent() {
			if (choices == null || choices.isEmpty() || choices.get(0).message() == null) {
				return null;
			}

			return choices.get(0).message().content();
		}
	}

	@JsonIgnoreProperties(ignoreUnknown = true)
	private record Choice(Message message) {
	}

	@JsonIgnoreProperties(ignoreUnknown = true)
	private record Message(String content) {
	}
}

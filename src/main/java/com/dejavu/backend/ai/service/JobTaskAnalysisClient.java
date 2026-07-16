package com.dejavu.backend.ai.service;

import com.dejavu.backend.ai.domain.JobNoticeSnapshot;
import com.dejavu.backend.ai.dto.AiAnalysisResponse;
import com.dejavu.backend.common.ApiException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

@Component
public class JobTaskAnalysisClient {

    private static final String RESPONSES_API_URL = "https://api.openai.com/v1/responses";
    private static final String SYSTEM_PROMPT = """
            You are an AI career assistant specializing in software engineering job postings.
            Your task is to analyze a job posting and infer what the candidate is most likely to do after joining the company.
            Use a helpful career advisor tone.

            Do not write from the applicant's perspective.

            Do not use definitive expressions such as
            "~할 것입니다", "~하게 됩니다", "~입니다."

            Instead, use cautious and natural expressions such as

            - "담당할 가능성이 높습니다."
            - "수행할 수 있습니다."
            - "포함될 수 있습니다."
            - "경험할 수 있습니다."
            - "예상됩니다."
            - "주요 업무가 될 수 있습니다."

            Describe inferred responsibilities rather than making definite predictions.

            Rules:
            1. Use ONLY the information explicitly stated or strongly implied in the job posting.
            2. Do NOT fabricate company culture, technology, or responsibilities that are not supported by the text.
            3. Infer reasonable day-to-day responsibilities from the required skills and job description.
            4. Keep the analysis concise and practical for job seekers.
            5. Write in Korean.
            6. Respond in clear and easy-to-understand Korean suitable for software developer job seekers.
            7. The response must be valid JSON only. Do not include markdown or additional explanations.
            8. Keep the entire response under 300 words.
            9. Do not explain your reasoning.
            10. Do not output any text except the required JSON.
            11. If the job posting does not provide enough information, state only what can reasonably be inferred.
            12. Never invent responsibilities that are unsupported by the posting.

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
              ],
              "possibleTasks": [
                "...",
                "..."
              ]
            }

            Requirements:

            - taskSummary
                - Exactly 3 sentences.
                - Each sentence should explain what the applicant is likely to do after joining.
                - Each sentence should be under 60 Korean characters if possible.
                - Write from the perspective of explaining the job to a job seeker.
                - Use natural Korean.
                - Avoid sounding absolute or deterministic.
                - Prefer expressions such as
                    "담당할 가능성이 높습니다."
                    "포함될 수 있습니다."
                    "경험할 수 있습니다."
                    "수행하게 될 수 있습니다."
                - Never use expressions such as
                    "지원자는 ~할 것입니다."
                    "~하게 됩니다."
                    "~일 것입니다."
                - Never begin a sentence with
                    - 지원자는
                    - 귀하는
                    Instead, describe the role itself.

            - requiredSkills
              - Extract only core technical skills explicitly mentioned.
              - Remove duplicates.
              - Maximum 8 items.

            - possibleTasks
              - Infer 3~6 short task keywords.
              - Examples:
                - API 개발
                - DB 설계
                - 서비스 운영
                - 성능 최적화
                - 장애 대응
                - 테스트 코드 작성

            Bad
            [
            "지원자는 API를 개발할 것입니다.",
            "지원자는 DB를 설계할 것입니다.",
            "지원자는 서비스를 운영할 것입니다."
            ]

            Good
            [
            "입사 후 Spring Boot 기반 API 개발 업무를 담당할 가능성이 높습니다.",
            "JPA를 활용한 데이터 모델링 업무가 포함될 수 있습니다.",
            "서비스 운영 및 장애 대응 업무를 경험할 수 있습니다."
            ]
            """;

    private final ObjectMapper objectMapper = new ObjectMapper().findAndRegisterModules();
    private final HttpClient httpClient;
    private final String apiKey;
    private final String model;

    public JobTaskAnalysisClient(
            @Value("${openai.api-key:}") String apiKey,
            @Value("${openai.model:gpt-4.1-mini}") String model
    ) {
        this.httpClient = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(5))
                .build();
        this.apiKey = apiKey == null ? "" : apiKey.trim();
        this.model = model == null || model.isBlank() ? "gpt-4.1-mini" : model.trim();
    }

    public AiAnalysisResponse.AiAnalysis analyze(JobNoticeSnapshot job) {
        if (apiKey.isBlank()) {
            throw new ApiException(HttpStatus.INTERNAL_SERVER_ERROR, "AI_ANALYSIS_FAILED", "OpenAI API Key가 설정되지 않았습니다.");
        }

        try {
            String requestBody = objectMapper.writeValueAsString(new ResponsesRequest(
                    model,
                    List.of(
                            new ResponsesMessage("system", SYSTEM_PROMPT),
                            new ResponsesMessage("user", createUserPrompt(job))
                    ),
                    0.2
            ));

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(RESPONSES_API_URL))
                    .timeout(Duration.ofSeconds(20))
                    .header("Authorization", "Bearer " + apiKey)
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(requestBody))
                    .build();

            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() < 200 || response.statusCode() >= 300) {
                throw new IllegalStateException("OpenAI response status is " + response.statusCode());
            }

            String outputText = extractOutputText(response.body());
            if (outputText == null || outputText.isBlank()) {
                throw new IllegalStateException("OpenAI response content is empty.");
            }

            return toAnalysis(objectMapper.readTree(stripCodeFence(outputText)));
        } catch (ApiException exception) {
            throw exception;
        } catch (Exception exception) {
            throw new ApiException(HttpStatus.INTERNAL_SERVER_ERROR, "AI_ANALYSIS_FAILED", "AI 분석에 실패했습니다.");
        }
    }

    private AiAnalysisResponse.AiAnalysis toAnalysis(JsonNode node) {
        List<String> taskSummary = stringList(node, "taskSummary", 3);
        if (taskSummary.size() != 3) {
            throw new IllegalStateException("taskSummary must contain exactly 3 sentences.");
        }

        return new AiAnalysisResponse.AiAnalysis(
                null,
                taskSummary,
                List.of(),
                List.of(),
                List.of(),
                List.of(),
                List.of(),
                List.of(),
                stringList(node, "requiredSkills", 8),
                List.of(),
                stringList(node, "possibleTasks", 6),
                null,
                null,
                "OPENAI_TASK_ANALYSIS:" + model,
                LocalDateTime.now()
        );
    }

    private String createUserPrompt(JobNoticeSnapshot job) {
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
                blankToFallback(job.jobCategory()),
                blankToFallback(job.companyName()),
                blankToFallback(job.title()),
                truncate(createDescription(job), 6_000)
        );
    }

    private String createDescription(JobNoticeSnapshot job) {
        return String.join("\n",
                blankToFallback(job.descriptionRaw()),
                String.join(", ", Optional.ofNullable(job.keywords()).orElse(List.of()))
        );
    }

    private String extractOutputText(String responseBody) throws Exception {
        JsonNode root = objectMapper.readTree(responseBody);
        JsonNode output = root.path("output");
        if (!output.isArray()) {
            return null;
        }

        StringBuilder builder = new StringBuilder();
        for (JsonNode item : output) {
            JsonNode content = item.path("content");
            if (!content.isArray()) {
                continue;
            }
            for (JsonNode contentItem : content) {
                String text = contentItem.path("text").asText(null);
                if (text != null) {
                    builder.append(text);
                }
            }
        }
        return builder.toString();
    }

    private String stripCodeFence(String text) {
        String trimmed = text.trim();
        if (!trimmed.startsWith("```")) {
            return trimmed;
        }
        return trimmed
                .replaceFirst("^```json\\s*", "")
                .replaceFirst("^```\\s*", "")
                .replaceFirst("\\s*```$", "")
                .trim();
    }

    private List<String> stringList(JsonNode node, String fieldName, int limit) {
        JsonNode value = node.path(fieldName);
        if (!value.isArray()) {
            return List.of();
        }

        List<String> result = new ArrayList<>();
        for (JsonNode item : value) {
            String text = item.asText("");
            if (text.isBlank() || result.contains(text.trim())) {
                continue;
            }

            result.add(text.trim());
            if (result.size() >= limit) {
                break;
            }
        }
        return result;
    }

    private String blankToFallback(String value) {
        return value == null || value.isBlank() ? "제공되지 않음" : value;
    }

    private String truncate(String value, int maxLength) {
        if (value == null) {
            return "";
        }
        return value.length() <= maxLength ? value : value.substring(0, maxLength);
    }

    private record ResponsesRequest(
            String model,
            List<ResponsesMessage> input,
            double temperature
    ) {
    }

    private record ResponsesMessage(
            String role,
            String content
    ) {
    }
}

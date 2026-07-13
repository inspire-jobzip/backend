package com.dejavu.backend.ai.service;

import com.dejavu.backend.ai.dto.AiAnalysisResponse;
import com.dejavu.backend.ai.domain.JobNoticeSnapshot;
import com.dejavu.backend.ai.domain.SkillMatch;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Component
public class OpenAiJobAnalysisClient {

    private static final String RESPONSES_API_URL = "https://api.openai.com/v1/responses";

    private final ObjectMapper objectMapper = new ObjectMapper();
    private final HttpClient httpClient;
    private final String apiKey;
    private final String model;

    public OpenAiJobAnalysisClient(
            @Value("${openai.api-key:}") String apiKey,
            @Value("${openai.model:gpt-4.1-mini}") String model
    ) {
        this.httpClient = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(5))
                .build();
        this.apiKey = apiKey == null ? "" : apiKey.trim();
        this.model = model == null || model.isBlank() ? "gpt-4.1-mini" : model.trim();
    }

    public Optional<AiAnalysisResponse.AiAnalysis> analyze(
            JobNoticeSnapshot job,
            List<SkillMatch> mappedSkills,
            JobContentAnalysisService.JobContentSections sections
    ) {
        if (apiKey.isBlank()) {
            return Optional.empty();
        }

        try {
            String prompt = buildPrompt(job, mappedSkills, sections);
            String requestBody = objectMapper.writeValueAsString(new ResponsesRequest(
                    model,
                    List.of(
                            new ResponsesMessage(
                                    "system",
                                    "너는 개발자 채용공고를 분석하는 커리어 매칭 에이전트다. 반드시 JSON만 반환한다."
                            ),
                            new ResponsesMessage("user", prompt)
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
                return Optional.empty();
            }

            String outputText = extractOutputText(response.body());
            if (outputText == null || outputText.isBlank()) {
                return Optional.empty();
            }

            JsonNode node = objectMapper.readTree(stripCodeFence(outputText));
            return Optional.of(new AiAnalysisResponse.AiAnalysis(
                    text(node, "overview"),
                    stringList(node, "taskSummary"),
                    stringList(node, "responsibilities"),
                    stringList(node, "qualifications"),
                    stringList(node, "preferredQualifications"),
                    stringList(node, "workConditions"),
                    stringList(node, "benefits"),
                    stringList(node, "hiringProcess"),
                    stringList(node, "requiredSkills"),
                    mappedSkills,
                    stringList(node, "possibleTasks"),
                    text(node, "applicationComment"),
                    text(node, "preferredSummary"),
                    "OPENAI:" + model,
                    LocalDateTime.now()
            ));
        } catch (Exception ignored) {
            return Optional.empty();
        }
    }

    private String buildPrompt(
            JobNoticeSnapshot job,
            List<SkillMatch> mappedSkills,
            JobContentAnalysisService.JobContentSections sections
    ) {
        return """
                아래 채용공고 정보를 분석해서 JSON으로만 답해줘.

                JSON 필드:
                - overview: 공고 전체를 1문장으로 요약
                - taskSummary: 입사 후 하게 될 일을 2~3개 문장 배열로 요약
                - responsibilities: 담당업무 목록
                - qualifications: 자격요건 목록
                - preferredQualifications: 우대사항 목록
                - workConditions: 근무조건 목록
                - benefits: 복리후생 목록
                - hiringProcess: 채용절차 목록
                - requiredSkills: 핵심 기술스택 목록
                - possibleTasks: 담당 가능 업무 키워드 목록
                - applicationComment: 이 공고에 지원하려면 어떤 경험을 강조하면 좋은지 1문장
                - preferredSummary: 우대사항 중 중요한 내용을 1문장으로 요약

                주의:
                - 없는 정보는 억지로 만들지 말고 빈 배열로 둔다.
                - OCR 때문에 깨진 문장은 의미가 확실한 경우만 정리한다.
                - 개발자 취업 준비생이 이해하기 쉬운 한국어로 답한다.
                - 아직 이력서 기반 피드백은 하지 않으므로, 지원자 개인 역량을 단정하지 말고 공고 기준으로만 말한다.

                [공고 기본정보]
                회사명: %s
                제목: %s
                직무: %s
                지역: %s
                경력: %s
                고용형태: %s
                학력: %s
                급여: %s
                감지 기술스택: %s

                [가공 섹션]
                담당업무: %s
                자격요건: %s
                우대사항: %s
                근무조건: %s
                복리후생: %s
                채용절차: %s

                [공고 원문]
                %s
                """.formatted(
                blankToDash(job.companyName()),
                blankToDash(job.title()),
                blankToDash(job.jobCategory()),
                blankToDash(job.locationText()),
                blankToDash(job.experienceLevel()),
                blankToDash(job.employmentType()),
                blankToDash(job.educationLevel()),
                blankToDash(job.salaryText()),
                mappedSkills.stream().map(SkillMatch::skillName).toList(),
                sections.tasks(),
                sections.requirements(),
                sections.preferred(),
                sections.workConditions(),
                sections.benefits(),
                sections.process(),
                truncate(job.descriptionRaw(), 6000)
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

    private List<String> stringList(JsonNode node, String fieldName) {
        JsonNode value = node.path(fieldName);
        if (!value.isArray()) {
            return List.of();
        }
        List<String> result = new ArrayList<>();
        value.forEach(item -> {
            String text = item.asText("");
            if (!text.isBlank()) {
                result.add(text.trim());
            }
        });
        return result;
    }

    private String text(JsonNode node, String fieldName) {
        String value = node.path(fieldName).asText("");
        return value.isBlank() ? "" : value;
    }

    private String blankToDash(String value) {
        return value == null || value.isBlank() ? "-" : value;
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

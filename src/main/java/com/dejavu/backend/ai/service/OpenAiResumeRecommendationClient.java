package com.dejavu.backend.ai.service;

import com.dejavu.backend.ai.domain.JobNoticeSnapshot;
import com.dejavu.backend.ai.dto.AiRecommendationResponse;
import com.dejavu.backend.ai.dto.ResumeKeywordResponse;
import com.dejavu.backend.resume.domain.Resume;
import com.dejavu.backend.resume.domain.ResumeProject;
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
import java.util.List;
import java.util.Optional;

@Component
public class OpenAiResumeRecommendationClient {

    private static final String RESPONSES_API_URL = "https://api.openai.com/v1/responses";

    private final ObjectMapper objectMapper = new ObjectMapper();
    private final HttpClient httpClient;
    private final String apiKey;
    private final String model;

    public OpenAiResumeRecommendationClient(
            @Value("${openai.api-key:}") String apiKey,
            @Value("${openai.model:gpt-4.1-mini}") String model
    ) {
        this.httpClient = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(5))
                .build();
        this.apiKey = apiKey == null ? "" : apiKey.trim();
        this.model = model == null || model.isBlank() ? "gpt-4.1-mini" : model.trim();
    }

    public Optional<AiRecommendationResponse> createFeedback(
            Long aiRecommendationId,
            Long userId,
            JobNoticeSnapshot job,
            Resume resume,
            ResumeKeywordResponse keywordResponse
    ) {
        if (apiKey.isBlank()) {
            return Optional.empty();
        }

        try {
            String requestBody = objectMapper.writeValueAsString(new ResponsesRequest(
                    model,
                    List.of(
                            new ResponsesMessage(
                                    "system",
                                    "너는 개발자 취업 이력서를 공고 기준으로 피드백하는 커리어 코치다. 반드시 JSON만 반환한다."
                            ),
                            new ResponsesMessage("user", buildPrompt(job, resume, keywordResponse))
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
            return Optional.of(new AiRecommendationResponse(
                    aiRecommendationId,
                    userId,
                    job.jobNoticeId(),
                    resume.getResumeId(),
                    text(node, "feedbackText"),
                    keywordResponse.missingKeywords(),
                    text(node, "recommendedProjectTitle"),
                    text(node, "recommendedProjectDescription"),
                    model,
                    LocalDateTime.now()
            ));
        } catch (Exception ignored) {
            return Optional.empty();
        }
    }

    private String buildPrompt(
            JobNoticeSnapshot job,
            Resume resume,
            ResumeKeywordResponse keywordResponse
    ) {
        return """
                아래 채용공고와 이력서를 비교해서 이 공고에 지원할 때 이력서를 어떻게 보완하면 좋을지 JSON으로만 답해줘.

                JSON 필드:
                - feedbackText: 공고 기준 이력서 피드백을 3~5문장으로 작성
                - recommendedProjectTitle: 보완하면 좋은 프로젝트 제목 1개
                - recommendedProjectDescription: 해당 프로젝트에서 강조할 기능/역할/기술을 2~3문장으로 작성

                주의:
                - 지원자의 실제 이력서에 없는 경험을 했다고 단정하지 않는다.
                - 부족한 키워드는 학습, 프로젝트 보완, 표현 보완 관점으로 조언한다.
                - 개발자 취업 준비생이 바로 수정할 수 있는 표현으로 답한다.

                [공고]
                회사명: %s
                제목: %s
                직무: %s
                공고 원문: %s
                공고 키워드: %s

                [이력서]
                제목: %s
                자기소개 요약: %s
                기술스택: %s
                학력: %s
                경력: %s
                지원동기: %s
                장단점: %s
                프로젝트: %s

                [비교 결과]
                일치 키워드: %s
                부족 키워드: %s
                자카드 유사도: %s
                기존 추천 사유: %s
                """.formatted(
                blankToDash(job.companyName()),
                blankToDash(job.title()),
                blankToDash(job.jobCategory()),
                truncate(job.descriptionRaw(), 3500),
                keywordResponse.jobKeywords(),
                blankToDash(resume.getTitle()),
                blankToDash(resume.getSummaryText()),
                resume.getResumeSkillNames(),
                resume.getEducation(),
                resume.getExperience(),
                blankToDash(resume.getMotivationText()),
                blankToDash(resume.getStrengthsAndWeaknessesText()),
                resumeProjectsText(resume.getProjects()),
                keywordResponse.matchedKeywords(),
                keywordResponse.missingKeywords(),
                keywordResponse.jaccardScore(),
                keywordResponse.recommendedReason()
        );
    }

    private String resumeProjectsText(List<ResumeProject> projects) {
        if (projects.isEmpty()) {
            return "[]";
        }

        return projects.stream()
                .map(project -> "%s / 역할: %s / 설명: %s / 트러블슈팅: %s / 기술: %s".formatted(
                        blankToDash(project.getProjectName()),
                        blankToDash(project.getRoleName()),
                        blankToDash(project.getDescription()),
                        blankToDash(project.getTroubleshooting()),
                        project.getTechStacks()
                ))
                .toList()
                .toString();
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

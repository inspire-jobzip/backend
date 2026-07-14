package com.dejavu.backend.ai.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.dejavu.backend.ai.domain.JobNoticeSnapshot;
import com.dejavu.backend.ai.domain.SkillMatch;
import com.dejavu.backend.ai.dto.AiAnalysisResponse;
import com.dejavu.backend.ai.dto.AiRecommendationResponse;
import com.dejavu.backend.ai.dto.ResumeKeywordResponse;
import com.dejavu.backend.ai.entity.AiRecommendationEntity;
import com.dejavu.backend.ai.repository.AiRecommendationRepository;
import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.jobNotices.domain.entity.JobNotices;
import com.dejavu.backend.jobNotices.repository.JobNoticesRepository;
import com.dejavu.backend.resume.domain.Resume;
import com.dejavu.backend.resume.service.ResumeService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class AiAnalysisService {

    private final ResumeService resumeService;
    private final SkillMappingService skillMappingService;
    private final JobContentAnalysisService jobContentAnalysisService;
    private final OpenAiResumeRecommendationClient openAiResumeRecommendationClient;
    private final JobNoticesRepository jobNoticesRepository;
    private final AiRecommendationRepository aiRecommendationRepository;
    private final ObjectMapper objectMapper = new ObjectMapper().findAndRegisterModules();
    private final Resource sampleJobNoticeResource;
    private final Map<Long, JobNoticeSnapshot> jobNotices = new ConcurrentHashMap<>();
    private final Map<Long, AiAnalysisResponse.AiAnalysis> aiAnalysisCache = new ConcurrentHashMap<>();

    public AiAnalysisService(
            ResumeService resumeService,
            SkillMappingService skillMappingService,
            JobContentAnalysisService jobContentAnalysisService,
            OpenAiResumeRecommendationClient openAiResumeRecommendationClient,
            JobNoticesRepository jobNoticesRepository,
            AiRecommendationRepository aiRecommendationRepository,
            @Value("classpath:sample/saramin-job-notices.json") Resource sampleJobNoticeResource
    ) {
        this.resumeService = resumeService;
        this.skillMappingService = skillMappingService;
        this.jobContentAnalysisService = jobContentAnalysisService;
        this.openAiResumeRecommendationClient = openAiResumeRecommendationClient;
        this.jobNoticesRepository = jobNoticesRepository;
        this.aiRecommendationRepository = aiRecommendationRepository;
        this.sampleJobNoticeResource = sampleJobNoticeResource;
        seedJobs();
    }

    @Transactional
    public AiAnalysisResponse analyzeJob(Long jobNoticeId) {
        Optional<JobNotices> dbJob = findJobNoticeEntity(jobNoticeId);
        if (dbJob.isPresent()) {
            JobNotices jobNotice = dbJob.get();
            AiAnalysisResponse.AiAnalysis savedAnalysis = readSavedAnalysis(jobNotice.getAiAnalysisJson());
            if (isReusableAnalysis(jobNotice, savedAnalysis)) {
                aiAnalysisCache.put(jobNotice.getJobNoticeId(), savedAnalysis);
                return new AiAnalysisResponse(jobNotice.getJobNoticeId(), true, savedAnalysis);
            }

            AiAnalysisResponse.AiAnalysis cached = aiAnalysisCache.get(jobNotice.getJobNoticeId());
            if (isReusableAnalysis(jobNotice, cached)) {
                saveAnalysis(jobNotice, cached);
                return new AiAnalysisResponse(jobNotice.getJobNoticeId(), true, cached);
            }

            JobNoticeSnapshot job = toSnapshot(jobNotice);
            List<SkillMatch> mappedSkills = skillMappingService.mapJobSkills(job);
            AiAnalysisResponse.AiAnalysis analysis = jobContentAnalysisService.analyze(job, mappedSkills);
            saveAnalysis(jobNotice, analysis);
            aiAnalysisCache.put(jobNotice.getJobNoticeId(), analysis);
            return new AiAnalysisResponse(jobNotice.getJobNoticeId(), false, analysis);
        }

        JobNoticeSnapshot job = findJob(jobNoticeId);
        AiAnalysisResponse.AiAnalysis cached = aiAnalysisCache.get(jobNoticeId);
        if (cached != null) {
            return new AiAnalysisResponse(jobNoticeId, true, cached);
        }

        List<SkillMatch> mappedSkills = skillMappingService.mapJobSkills(job);
        AiAnalysisResponse.AiAnalysis analysis = jobContentAnalysisService.analyze(job, mappedSkills);
        aiAnalysisCache.put(jobNoticeId, analysis);
        return new AiAnalysisResponse(jobNoticeId, false, analysis);
    }

    private boolean isReusableAnalysis(JobNotices jobNotice, AiAnalysisResponse.AiAnalysis analysis) {
        if (analysis == null || analysis.analyzedAt() == null) {
            return false;
        }

        LocalDateTime updatedAt = jobNotice.getUpdatedAt();
        // 공고가 분석 이후 수정되었다면 저장된 AI 분석 결과를 재사용하지 않는다.
        return updatedAt == null || !updatedAt.isAfter(analysis.analyzedAt());
    }

    public ResumeKeywordResponse compareResumeKeywords(Long userId, Long jobNoticeId, Long resumeId) {
        JobNoticeSnapshot job = findJob(jobNoticeId);
        Resume resume = resumeId == null ? resumeService.findDefaultResume(userId) : resumeService.findById(userId, resumeId);

        List<SkillMatch> mappedJobSkills = skillMappingService.mapJobSkills(job);
        List<String> jobKeywords = mappedJobSkills.stream()
                .map(SkillMatch::skillName)
                .toList();
        List<String> resumeKeywords = skillMappingService.normalizeSkillNames(resume.getResumeSkillNames());
        Set<String> jobSet = new LinkedHashSet<>(jobKeywords);
        Set<String> resumeSet = new LinkedHashSet<>(resumeKeywords);

        List<String> matchedKeywords = jobSet.stream()
                .filter(resumeSet::contains)
                .toList();
        List<String> missingKeywords = jobSet.stream()
                .filter(keyword -> !resumeSet.contains(keyword))
                .toList();

        double jaccardScore = calculateJaccardScore(jobSet, resumeSet);
        String recommendedReason = missingKeywords.isEmpty()
                ? "공고의 핵심 키워드가 이력서에 잘 드러나 있습니다."
                : "공고의 핵심 키워드 중 " + String.join(", ", missingKeywords) + " 경험이 이력서에 부족합니다.";

        return new ResumeKeywordResponse(
                jobNoticeId,
                resume.getResumeId(),
                mappedJobSkills,
                jobKeywords,
                resumeKeywords,
                matchedKeywords,
                missingKeywords,
                jaccardScore,
                jobKeywords.stream().limit(3).toList(),
                recommendedReason
        );
    }

    @Transactional
    public AiRecommendationResponse createRecommendation(Long userId, Long jobNoticeId, Long resumeId) {
        JobNotices jobNotice = findJobNoticeEntity(jobNoticeId)
                .orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, "JOB_NOTICE_NOT_FOUND", "채용공고를 찾을 수 없습니다."));
        ResumeKeywordResponse keywordResponse = compareResumeKeywords(userId, jobNotice.getJobNoticeId(), resumeId);
        Resume resume = resumeService.findById(userId, keywordResponse.resumeId());
        JobNoticeSnapshot job = toSnapshot(jobNotice);

        AiRecommendationResponse generated = openAiResumeRecommendationClient
                .createFeedback(0L, userId, job, resume, keywordResponse)
                .orElseGet(() -> fallbackRecommendation(userId, keywordResponse));

        AiRecommendationEntity saved = aiRecommendationRepository.save(new AiRecommendationEntity(
                userId,
                job.jobNoticeId(),
                generated.resumeId(),
                generated.feedbackText(),
                toRecommendationPayloadJson(generated),
                generated.modelName()
        ));
        return toRecommendationResponse(saved);
    }

    private AiRecommendationResponse fallbackRecommendation(Long userId, ResumeKeywordResponse keywordResponse) {
        return new AiRecommendationResponse(
                0L,
                userId,
                keywordResponse.jobNoticeId(),
                keywordResponse.resumeId(),
                keywordResponse.recommendedReason(),
                keywordResponse.missingKeywords(),
                "공고 맞춤 백엔드 개선 프로젝트",
                "부족 키워드를 반영해 REST API, DB 설계, 트러블슈팅 경험이 드러나는 프로젝트를 보완해보세요.",
                "mock-ai",
                java.time.LocalDateTime.now()
        );
    }

    @Transactional(readOnly = true)
    public List<AiRecommendationResponse> findRecommendations(Long userId) {
        return aiRecommendationRepository.findByUserIdOrderByCreatedAtDesc(userId).stream()
                .map(this::toRecommendationResponse)
                .toList();
    }

    private String toRecommendationPayloadJson(AiRecommendationResponse response) {
        try {
            return objectMapper.writeValueAsString(new RecommendationPayload(
                    response.missingKeywords(),
                    response.recommendedProjectTitle(),
                    response.recommendedProjectDescription()
            ));
        } catch (Exception ignored) {
            return null;
        }
    }

    private AiRecommendationResponse toRecommendationResponse(AiRecommendationEntity entity) {
        RecommendationPayload payload = readRecommendationPayload(entity.getResponsePayload());
        return new AiRecommendationResponse(
                entity.getAiRecommendationId(),
                entity.getUserId(),
                entity.getJobNoticeId(),
                entity.getResumeId(),
                entity.getFeedbackText(),
                payload.missingKeywords(),
                payload.recommendedProjectTitle(),
                payload.recommendedProjectDescription(),
                entity.getModelName(),
                entity.getCreatedAt()
        );
    }

    private RecommendationPayload readRecommendationPayload(String responsePayload) {
        if (responsePayload == null || responsePayload.isBlank()) {
            return RecommendationPayload.empty();
        }

        try {
            return objectMapper.readValue(responsePayload, RecommendationPayload.class);
        } catch (Exception ignored) {
            return RecommendationPayload.empty();
        }
    }

    private record RecommendationPayload(
            List<String> missingKeywords,
            String recommendedProjectTitle,
            String recommendedProjectDescription
    ) {
        private static RecommendationPayload empty() {
            return new RecommendationPayload(List.of(), "", "");
        }
    }

    private JobNoticeSnapshot findJob(Long jobNoticeId) {
        JobNoticeSnapshot dbJob = findJobFromDatabase(jobNoticeId);
        if (dbJob != null) {
            return dbJob;
        }

        JobNoticeSnapshot job = jobNotices.get(jobNoticeId);
        if (job == null) {
            throw new ApiException(HttpStatus.NOT_FOUND, "JOB_NOTICE_NOT_FOUND", "채용공고를 찾을 수 없습니다.");
        }
        return job;
    }

    private Optional<JobNotices> findJobNoticeEntity(Long jobNoticeId) {
        return jobNoticesRepository.findById(jobNoticeId)
                .or(() -> jobNoticesRepository.findByExternalNoticeId(String.valueOf(jobNoticeId)));
    }

    private JobNoticeSnapshot findJobFromDatabase(Long jobNoticeId) {
        return findJobNoticeEntity(jobNoticeId)
                .map(this::toSnapshot)
                .orElse(null);
    }

    private AiAnalysisResponse.AiAnalysis readSavedAnalysis(String aiAnalysisJson) {
        if (aiAnalysisJson == null || aiAnalysisJson.isBlank()) {
            return null;
        }

        try {
            return objectMapper.readValue(aiAnalysisJson, AiAnalysisResponse.AiAnalysis.class);
        } catch (Exception ignored) {
            return null;
        }
    }

    private void saveAnalysis(JobNotices jobNotice, AiAnalysisResponse.AiAnalysis analysis) {
        try {
            jobNotice.updateAiAnalysisJson(objectMapper.writeValueAsString(analysis));
        } catch (Exception ignored) {
            // 분석 저장에 실패해도 사용자에게 분석 응답은 반환한다.
        }
    }

    private JobNoticeSnapshot toSnapshot(JobNotices jobNotice) {
        return new JobNoticeSnapshot(
                jobNotice.getJobNoticeId(),
                jobNotice.getCompanyName(),
                jobNotice.getTitle(),
                jobNotice.getJobCategory(),
                jobNotice.getLocationText(),
                jobNotice.getExperienceLevel(),
                jobNotice.getEmploymentType(),
                jobNotice.getEducationLevel(),
                jobNotice.getSalaryText(),
                jobNotice.getDescriptionRaw(),
                jobNotice.getRawPayload(),
                extractKeywords(jobNotice.getRoleKeywordsText())
        );
    }

    private double calculateJaccardScore(Set<String> jobSet, Set<String> resumeSet) {
        Set<String> union = new LinkedHashSet<>(jobSet);
        union.addAll(resumeSet);
        if (union.isEmpty()) {
            return 0.0;
        }

        Set<String> intersection = new LinkedHashSet<>(jobSet);
        intersection.retainAll(resumeSet);
        return Math.round(((double) intersection.size() / union.size()) * 100.0) / 100.0;
    }

    private void seedJobs() {
        loadSampleJobNotices();
        if (!jobNotices.isEmpty()) {
            return;
        }

        jobNotices.put(101L, new JobNoticeSnapshot(
                101L,
                "카카오",
                "Backend Developer",
                "BACKEND",
                null,
                null,
                null,
                null,
                null,
                "Java, SpringBoot, JPA 기반 백엔드 REST API 개발 및 MySQL 서비스 운영",
                null,
                List.of("Java", "SpringBoot", "JPA", "RestAPI", "MySQL", "DB 설계", "트러블슈팅")
        ));
        jobNotices.put(102L, new JobNoticeSnapshot(
                102L,
                "네이버",
                "AI Service Backend Developer",
                "BACKEND",
                null,
                null,
                null,
                null,
                null,
                "AI 서비스 서버 개발과 Python 데이터 파이프라인 운영, Kafka 기반 이벤트 처리",
                null,
                List.of("Java", "Spring Boot", "Python", "MySQL", "Kafka", "AI", "데이터 파이프라인", "서비스 운영")
        ));
    }

    private void loadSampleJobNotices() {
        if (!sampleJobNoticeResource.exists()) {
            return;
        }

        try {
            JsonNode root = objectMapper.readTree(sampleJobNoticeResource.getInputStream());
            if (!root.isArray()) {
                return;
            }

            long fallbackId = 900_000L;
            for (JsonNode node : root) {
                Long jobNoticeId = parseJobNoticeId(node.path("externalNoticeId").asText(null), fallbackId++);
                jobNotices.put(jobNoticeId, new JobNoticeSnapshot(
                        jobNoticeId,
                        text(node, "companyName"),
                        text(node, "title"),
                        text(node, "jobCategory"),
                        text(node, "locationText"),
                        text(node, "experienceLevel"),
                        text(node, "employmentType"),
                        text(node, "educationLevel"),
                        text(node, "salaryText"),
                        text(node, "descriptionRaw"),
                        node.hasNonNull("rawPayload") ? node.path("rawPayload").toString() : null,
                        extractKeywords(node)
                ));
            }
        } catch (IOException ignored) {
            // If the local sample file is missing or malformed, fallback MVP jobs are used.
        }
    }

    private Long parseJobNoticeId(String externalNoticeId, long fallbackId) {
        if (externalNoticeId == null || externalNoticeId.isBlank()) {
            return fallbackId;
        }

        try {
            return Long.parseLong(externalNoticeId);
        } catch (NumberFormatException ignored) {
            return fallbackId;
        }
    }

    private List<String> extractKeywords(JsonNode node) {
        Set<String> keywords = new LinkedHashSet<>();
        JsonNode skillNames = node.path("skillNames");
        if (skillNames.isArray()) {
            skillNames.forEach(skill -> addKeyword(keywords, skill.asText(null)));
        }

        String roleKeywordsText = text(node, "roleKeywordsText");
        if (roleKeywordsText != null) {
            for (String keyword : roleKeywordsText.split(",")) {
                addKeyword(keywords, keyword);
            }
        }
        return new ArrayList<>(keywords);
    }

    private List<String> extractKeywords(String roleKeywordsText) {
        Set<String> keywords = new LinkedHashSet<>();
        if (roleKeywordsText == null || roleKeywordsText.isBlank()) {
            return List.of();
        }

        for (String keyword : roleKeywordsText.split(",")) {
            addKeyword(keywords, keyword);
        }
        return new ArrayList<>(keywords);
    }

    private void addKeyword(Set<String> keywords, String keyword) {
        if (keyword == null || keyword.isBlank()) {
            return;
        }
        keywords.add(keyword.trim());
    }

    private String text(JsonNode node, String fieldName) {
        JsonNode value = node.path(fieldName);
        if (value.isMissingNode() || value.isNull()) {
            return null;
        }
        String text = value.asText();
        return text == null || text.isBlank() ? null : text;
    }
}

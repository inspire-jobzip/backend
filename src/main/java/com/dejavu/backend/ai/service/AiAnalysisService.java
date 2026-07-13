package com.dejavu.backend.ai.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.dejavu.backend.ai.domain.JobNoticeSnapshot;
import com.dejavu.backend.ai.domain.SkillMatch;
import com.dejavu.backend.ai.dto.AiAnalysisResponse;
import com.dejavu.backend.ai.dto.AiRecommendationResponse;
import com.dejavu.backend.ai.dto.ResumeKeywordResponse;
import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.jobNotices.domain.entity.JobNotices;
import com.dejavu.backend.jobNotices.repository.JobNoticesRepository;
import com.dejavu.backend.resume.domain.Resume;
import com.dejavu.backend.resume.service.ResumeService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

@Service
public class AiAnalysisService {

    private static final Long MVP_USER_ID = 1L;

    private final ResumeService resumeService;
    private final SkillMappingService skillMappingService;
    private final JobNoticesRepository jobNoticesRepository;
    private final ObjectMapper objectMapper = new ObjectMapper();
    private final Resource sampleJobNoticeResource;
    private final Map<Long, JobNoticeSnapshot> jobNotices = new ConcurrentHashMap<>();
    private final Map<Long, AiAnalysisResponse.AiAnalysis> aiAnalysisCache = new ConcurrentHashMap<>();
    private final Map<Long, AiRecommendationResponse> recommendations = new ConcurrentHashMap<>();
    private final AtomicLong recommendationIdSequence = new AtomicLong(1);

    public AiAnalysisService(
            ResumeService resumeService,
            SkillMappingService skillMappingService,
            JobNoticesRepository jobNoticesRepository,
            @Value("classpath:sample/saramin-job-notices.json") Resource sampleJobNoticeResource
    ) {
        this.resumeService = resumeService;
        this.skillMappingService = skillMappingService;
        this.jobNoticesRepository = jobNoticesRepository;
        this.sampleJobNoticeResource = sampleJobNoticeResource;
        seedJobs();
    }

    public AiAnalysisResponse analyzeJob(Long jobNoticeId) {
        JobNoticeSnapshot job = findJob(jobNoticeId);
        AiAnalysisResponse.AiAnalysis cached = aiAnalysisCache.get(jobNoticeId);
        if (cached != null) {
            return new AiAnalysisResponse(jobNoticeId, true, cached);
        }

        List<SkillMatch> mappedSkills = skillMappingService.mapJobSkills(job);
        List<String> requiredSkills = mappedSkills.stream()
                .map(SkillMatch::skillName)
                .limit(7)
                .toList();

        AiAnalysisResponse.AiAnalysis analysis = new AiAnalysisResponse.AiAnalysis(
                List.of(
                        "입사 후 " + job.title() + " 포지션에서 백엔드 API 개발 업무를 담당할 가능성이 높습니다.",
                        "공고의 주요 기술스택을 바탕으로 데이터 모델링과 서비스 운영 업무가 포함될 수 있습니다.",
                        "문제 상황을 분석하고 트러블슈팅하는 경험이 중요하게 평가될 수 있습니다."
                ),
                requiredSkills,
                mappedSkills,
                List.of("API 개발", "DB 설계", "서비스 운영", "트러블슈팅"),
                LocalDateTime.now()
        );
        aiAnalysisCache.put(jobNoticeId, analysis);
        return new AiAnalysisResponse(jobNoticeId, false, analysis);
    }

    public ResumeKeywordResponse compareResumeKeywords(Long jobNoticeId, Long resumeId) {
        JobNoticeSnapshot job = findJob(jobNoticeId);
        Resume resume = resumeId == null ? resumeService.findDefaultResume() : resumeService.findById(resumeId);

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

    public AiRecommendationResponse createRecommendation(Long jobNoticeId, Long resumeId) {
        ResumeKeywordResponse keywordResponse = compareResumeKeywords(jobNoticeId, resumeId);
        Long id = recommendationIdSequence.getAndIncrement();
        AiRecommendationResponse response = new AiRecommendationResponse(
                id,
                MVP_USER_ID,
                keywordResponse.jobNoticeId(),
                keywordResponse.resumeId(),
                keywordResponse.recommendedReason(),
                keywordResponse.missingKeywords(),
                "공고 맞춤 백엔드 개선 프로젝트",
                "부족 키워드를 반영해 REST API, DB 설계, 트러블슈팅 경험이 드러나는 프로젝트를 보완해보세요.",
                "mock-ai",
                LocalDateTime.now()
        );
        recommendations.put(id, response);
        return response;
    }

    public List<AiRecommendationResponse> findRecommendations() {
        return recommendations.values().stream()
                .sorted((left, right) -> right.createdAt().compareTo(left.createdAt()))
                .toList();
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

    private JobNoticeSnapshot findJobFromDatabase(Long jobNoticeId) {
        return jobNoticesRepository.findById(jobNoticeId)
                .or(() -> jobNoticesRepository.findByExternalNoticeId(String.valueOf(jobNoticeId)))
                .map(this::toSnapshot)
                .orElse(null);
    }

    private JobNoticeSnapshot toSnapshot(JobNotices jobNotice) {
        return new JobNoticeSnapshot(
                jobNotice.getJobNoticeId(),
                jobNotice.getCompanyName(),
                jobNotice.getTitle(),
                jobNotice.getJobCategory(),
                jobNotice.getDescriptionRaw(),
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
                "Java, SpringBoot, JPA 기반 백엔드 REST API 개발 및 MySQL 서비스 운영",
                List.of("Java", "SpringBoot", "JPA", "RestAPI", "MySQL", "DB 설계", "트러블슈팅")
        ));
        jobNotices.put(102L, new JobNoticeSnapshot(
                102L,
                "네이버",
                "AI Service Backend Developer",
                "BACKEND",
                "AI 서비스 서버 개발과 Python 데이터 파이프라인 운영, Kafka 기반 이벤트 처리",
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
                        text(node, "descriptionRaw"),
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

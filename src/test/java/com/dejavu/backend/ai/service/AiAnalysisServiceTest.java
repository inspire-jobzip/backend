package com.dejavu.backend.ai.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.dejavu.backend.ai.dto.AiAnalysisResponse;
import com.dejavu.backend.ai.repository.AiRecommendationRepository;
import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.jobNotices.domain.entity.JobNotices;
import com.dejavu.backend.jobNotices.repository.JobNoticesRepository;
import com.dejavu.backend.resume.service.ResumeService;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.Test;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.test.util.ReflectionTestUtils;

class AiAnalysisServiceTest {

	private final ObjectMapper objectMapper = new ObjectMapper().findAndRegisterModules();

	@Test
	void analyzeJobReturnsSavedAnalysisWhenJobNoticeIsNotUpdated() throws Exception {
		LocalDateTime analyzedAt = LocalDateTime.of(2026, 7, 14, 10, 0);
		AiAnalysisResponse.AiAnalysis savedAnalysis = createAnalysis("저장된 분석", analyzedAt);
		JobNotices jobNotice = createJobNotice(analyzedAt.minusHours(1), objectMapper.writeValueAsString(savedAnalysis));
		JobNoticesRepository jobNoticesRepository = mock(JobNoticesRepository.class);
		JobTaskAnalysisClient jobTaskAnalysisClient = mock(JobTaskAnalysisClient.class);
		when(jobNoticesRepository.findById(101L)).thenReturn(Optional.of(jobNotice));
		AiAnalysisService aiAnalysisService = createService(jobNoticesRepository, jobTaskAnalysisClient);

		AiAnalysisResponse response = aiAnalysisService.analyzeJob(101L);

		assertThat(response.cached()).isTrue();
		assertThat(response.aiAnalysis().taskSummary()).contains("저장된 분석");
		verify(jobTaskAnalysisClient, never()).analyze(any());
	}

	@Test
	void analyzeJobReanalyzesWhenJobNoticeIsNewerThanSavedAnalysis() throws Exception {
		LocalDateTime oldAnalyzedAt = LocalDateTime.of(2026, 7, 14, 10, 0);
		LocalDateTime newAnalyzedAt = LocalDateTime.of(2026, 7, 14, 12, 0);
		JobNotices jobNotice = createJobNotice(
			oldAnalyzedAt.plusHours(1),
			objectMapper.writeValueAsString(createAnalysis("이전 분석", oldAnalyzedAt))
		);
		JobNoticesRepository jobNoticesRepository = mock(JobNoticesRepository.class);
		JobTaskAnalysisClient jobTaskAnalysisClient = mock(JobTaskAnalysisClient.class);
		when(jobNoticesRepository.findById(101L)).thenReturn(Optional.of(jobNotice));
		when(jobTaskAnalysisClient.analyze(any()))
			.thenReturn(createAnalysis("새 분석", newAnalyzedAt));
		AiAnalysisService aiAnalysisService = createService(jobNoticesRepository, jobTaskAnalysisClient);

		AiAnalysisResponse response = aiAnalysisService.analyzeJob(101L);

		assertThat(response.cached()).isFalse();
		assertThat(response.aiAnalysis().taskSummary()).contains("새 분석");
		assertThat(jobNotice.getAiAnalysisJson()).contains("새 분석");
		verify(jobTaskAnalysisClient).analyze(any());
	}

	@Test
	void aiAnalysisJsonContainsOnlyApiSpecFields() throws Exception {
		AiAnalysisResponse response = new AiAnalysisResponse(
			101L,
			true,
			createAnalysis("담당업무 분석", LocalDateTime.of(2026, 7, 14, 12, 0))
		);

		String json = objectMapper.writeValueAsString(response);

		assertThat(json).contains("taskSummary", "requiredSkills", "possibleTasks", "analyzedAt");
		assertThat(json).doesNotContain("overview", "responsibilities", "mappedSkills", "analysisSource");
	}

	@Test
	void analyzeJobThrowsWhenJobNoticeDoesNotExist() {
		JobNoticesRepository jobNoticesRepository = mock(JobNoticesRepository.class);
		when(jobNoticesRepository.findById(999L)).thenReturn(Optional.empty());
		when(jobNoticesRepository.findByExternalNoticeId("999")).thenReturn(Optional.empty());
		AiAnalysisService aiAnalysisService = createService(
			jobNoticesRepository,
			mock(JobTaskAnalysisClient.class)
		);

		assertThatThrownBy(() -> aiAnalysisService.analyzeJob(999L))
			.isInstanceOf(ApiException.class)
			.hasMessage("채용공고를 찾을 수 없습니다.");
	}

	private AiAnalysisService createService(
		JobNoticesRepository jobNoticesRepository,
		JobTaskAnalysisClient jobTaskAnalysisClient
	) {
		return new AiAnalysisService(
			mock(ResumeService.class),
			mock(SkillMappingService.class),
			mock(JobContentAnalysisService.class),
			jobTaskAnalysisClient,
			mock(OpenAiResumeRecommendationClient.class),
			jobNoticesRepository,
			mock(AiRecommendationRepository.class),
			new ByteArrayResource("[]".getBytes(StandardCharsets.UTF_8))
		);
	}

	private AiAnalysisResponse.AiAnalysis createAnalysis(String firstSummary, LocalDateTime analyzedAt) {
		return new AiAnalysisResponse.AiAnalysis(
			null,
			List.of(
				firstSummary,
				"Spring Boot 기반 API 개발을 담당합니다.",
				"JPA를 활용한 데이터 처리가 포함됩니다."
			),
			List.of(),
			List.of(),
			List.of(),
			List.of(),
			List.of(),
			List.of(),
			List.of("Java", "Spring Boot", "JPA"),
			List.of(),
			List.of("API 개발", "DB 설계", "서비스 운영"),
			null,
			null,
			"OPENAI_TASK_ANALYSIS:gpt-4.1-mini",
			analyzedAt
		);
	}

	private JobNotices createJobNotice(LocalDateTime updatedAt, String aiAnalysisJson) {
		JobNotices jobNotice = newInstance();
		ReflectionTestUtils.setField(jobNotice, "jobNoticeId", 101L);
		ReflectionTestUtils.setField(jobNotice, "companyName", "Dejavu Labs");
		ReflectionTestUtils.setField(jobNotice, "title", "Backend Developer");
		ReflectionTestUtils.setField(jobNotice, "jobCategory", "BACKEND");
		ReflectionTestUtils.setField(jobNotice, "descriptionRaw", "Java, Spring Boot, JPA 기반 백엔드 API 개발");
		ReflectionTestUtils.setField(jobNotice, "roleKeywordsText", "Java,Spring Boot,JPA");
		ReflectionTestUtils.setField(jobNotice, "aiAnalysisJson", aiAnalysisJson);
		ReflectionTestUtils.setField(jobNotice, "updatedAt", updatedAt);
		return jobNotice;
	}

	private JobNotices newInstance() {
		try {
			var constructor = JobNotices.class.getDeclaredConstructor();
			constructor.setAccessible(true);
			return constructor.newInstance();
		} catch (ReflectiveOperationException exception) {
			throw new IllegalStateException(exception);
		}
	}
}

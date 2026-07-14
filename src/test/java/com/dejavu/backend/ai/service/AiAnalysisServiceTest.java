package com.dejavu.backend.ai.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.dejavu.backend.ai.client.JobAiAnalysisClient;
import com.dejavu.backend.ai.domain.JobAiAnalysisPrompt;
import com.dejavu.backend.ai.dto.AiAnalysisResponse;
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
	void analyzeJobReturnsCachedAnalysisWhenJobNoticeIsNotUpdated() throws Exception {
		LocalDateTime analyzedAt = LocalDateTime.of(2026, 7, 14, 10, 0);
		AiAnalysisResponse.AiAnalysis cachedAnalysis = createAnalysis(analyzedAt);
		JobNotices jobNotice = createJobNotice(analyzedAt.minusHours(1), objectMapper.writeValueAsString(cachedAnalysis));
		JobNoticesRepository jobNoticesRepository = mock(JobNoticesRepository.class);
		when(jobNoticesRepository.findById(101L)).thenReturn(Optional.of(jobNotice));
		FakeJobAiAnalysisClient jobAiAnalysisClient = new FakeJobAiAnalysisClient(createAnalysis(analyzedAt.plusHours(1)));
		AiAnalysisService aiAnalysisService = createService(jobNoticesRepository, jobAiAnalysisClient);

		AiAnalysisResponse response = aiAnalysisService.analyzeJob(101L);

		assertThat(response.cached()).isTrue();
		assertThat(response.aiAnalysis().analyzedAt()).isEqualTo(analyzedAt);
		assertThat(jobAiAnalysisClient.requestCount).isZero();
	}

	@Test
	void analyzeJobRequestsOpenAiAndStoresAnalysisWhenJobNoticeIsNewerThanCache() throws Exception {
		LocalDateTime oldAnalyzedAt = LocalDateTime.of(2026, 7, 14, 10, 0);
		LocalDateTime newAnalyzedAt = LocalDateTime.of(2026, 7, 14, 12, 0);
		JobNotices jobNotice = createJobNotice(
			oldAnalyzedAt.plusHours(1),
			objectMapper.writeValueAsString(createAnalysis(oldAnalyzedAt))
		);
		JobNoticesRepository jobNoticesRepository = mock(JobNoticesRepository.class);
		when(jobNoticesRepository.findById(101L)).thenReturn(Optional.of(jobNotice));
		FakeJobAiAnalysisClient jobAiAnalysisClient = new FakeJobAiAnalysisClient(createAnalysis(newAnalyzedAt));
		AiAnalysisService aiAnalysisService = createService(jobNoticesRepository, jobAiAnalysisClient);

		AiAnalysisResponse response = aiAnalysisService.analyzeJob(101L);

		assertThat(response.cached()).isFalse();
		assertThat(response.aiAnalysis().analyzedAt()).isEqualTo(newAnalyzedAt);
		assertThat(jobAiAnalysisClient.requestCount).isOne();
		assertThat(jobNotice.getAiAnalysisJson()).contains("Spring Boot");
	}

	@Test
	void analyzeJobThrowsWhenJobNoticeDoesNotExist() {
		JobNoticesRepository jobNoticesRepository = mock(JobNoticesRepository.class);
		when(jobNoticesRepository.findById(999L)).thenReturn(Optional.empty());
		AiAnalysisService aiAnalysisService = createService(
			jobNoticesRepository,
			new FakeJobAiAnalysisClient(createAnalysis(LocalDateTime.now()))
		);

		assertThatThrownBy(() -> aiAnalysisService.analyzeJob(999L))
			.isInstanceOf(ApiException.class)
			.hasMessage("채용공고를 찾을 수 없습니다.");
	}

	private AiAnalysisService createService(
		JobNoticesRepository jobNoticesRepository,
		JobAiAnalysisClient jobAiAnalysisClient
	) {
		return new AiAnalysisService(
			mock(ResumeService.class),
			mock(SkillMappingService.class),
			jobNoticesRepository,
			jobAiAnalysisClient,
			objectMapper,
			new ByteArrayResource("[]".getBytes(StandardCharsets.UTF_8))
		);
	}

	private AiAnalysisResponse.AiAnalysis createAnalysis(LocalDateTime analyzedAt) {
		return new AiAnalysisResponse.AiAnalysis(
			List.of(
				"Spring Boot 기반 API 개발을 담당합니다.",
				"JPA를 활용한 데이터 모델링을 수행합니다.",
				"서비스 운영 이슈를 분석하고 개선합니다."
			),
			List.of("Java", "Spring Boot", "JPA"),
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
		ReflectionTestUtils.setField(jobNotice, "active", true);
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

	private static class FakeJobAiAnalysisClient implements JobAiAnalysisClient {

		private final AiAnalysisResponse.AiAnalysis analysis;
		private int requestCount;

		private FakeJobAiAnalysisClient(AiAnalysisResponse.AiAnalysis analysis) {
			this.analysis = analysis;
		}

		@Override
		public AiAnalysisResponse.AiAnalysis analyze(JobAiAnalysisPrompt prompt) {
			requestCount++;
			return analysis;
		}
	}
}

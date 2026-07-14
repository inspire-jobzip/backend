package com.dejavu.backend.jobNotices.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesDetailRepositoryRow;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesDetailResponseDTO;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesPageResponseDTO;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesRepositoryRow;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesResponseDTO;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesSearchCondition;
import com.dejavu.backend.jobNotices.exception.JobNoticesException;
import com.dejavu.backend.jobNotices.repository.JobNoticesRepository;
import com.dejavu.backend.resume.domain.Resume;
import com.dejavu.backend.resume.domain.ResumeProject;
import com.dejavu.backend.resume.service.ResumeService;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;

class JobNoticesServiceTest {

	@Test
	void readReturnsAllJobNoticesWhenQueryParametersAreEmpty() {
		JobNoticesRepository jobNoticesRepository = createRepository(List.of(
			createJobNotice(1L, "Tech Bridge", "Backend Developer", "Experienced", List.of("Java", "Spring Boot")),
			createJobNotice(2L, "Data Room", "Frontend Developer", "New", List.of("React", "TypeScript"))
		));
		JobNoticesService jobNoticesService = new JobNoticesService(jobNoticesRepository, mock(ResumeService.class));

		JobNoticesPageResponseDTO<JobNoticesResponseDTO> response =
			jobNoticesService.read(JobNoticesSearchCondition.of(null, null, null, null, null, null, null, null));

		assertThat(response.getContent()).hasSize(2);
		assertThat(response.getPage()).isZero();
		assertThat(response.getSize()).isEqualTo(2);
		assertThat(response.getTotalElements()).isEqualTo(2);
	}

	@Test
	void readFiltersJobNoticesByJobRoleAndSkillNames() {
		JobNoticesRepository jobNoticesRepository = createRepository(List.of(
			createJobNotice(1L, "Tech Bridge", "Backend Developer", "Experienced", List.of("Java", "Spring Boot")),
			createJobNotice(2L, "Data Room", "Frontend Developer", "New", List.of("React", "TypeScript"))
		));
		JobNoticesService jobNoticesService = new JobNoticesService(jobNoticesRepository, mock(ResumeService.class));

		JobNoticesPageResponseDTO<JobNoticesResponseDTO> response =
			jobNoticesService.read(JobNoticesSearchCondition.of(null, "BACKEND", "Spring Boot", null, null, null, "0", "20"));

		assertThat(response.getContent()).hasSize(1);
		assertThat(response.getContent().get(0).getCompanyName()).isEqualTo("Tech Bridge");
		assertThat(response.getContent().get(0).getJobCategory()).isEqualTo("BACKEND");
	}

	@Test
	void searchConditionRejectsInvalidJobRole() {
		assertThatThrownBy(() -> JobNoticesSearchCondition.of(null, "SERVER", null, null, null, null, null, null))
			.isInstanceOf(JobNoticesException.class)
			.hasMessage("jobRole 값이 올바르지 않습니다.");
	}

	@Test
	void readDetailReturnsJobNoticeDetailWithJaccardScore() {
		JobNoticesRepository jobNoticesRepository = createRepository(
			List.of(),
			Optional.of(createJobNoticeDetail(101L, "saramin_101", "Dejavu Labs", List.of("Java", "Spring Boot", "JPA")))
		);
		ResumeService resumeService = mock(ResumeService.class);
		when(resumeService.findDefaultResume(1L)).thenReturn(createResume(List.of("Java", "Spring Boot", "MySQL")));
		JobNoticesService jobNoticesService = new JobNoticesService(jobNoticesRepository, resumeService);

		JobNoticesDetailResponseDTO response = jobNoticesService.readDetail(101L, 1L);

		assertThat(response.getJobNoticeId()).isEqualTo(101L);
		assertThat(response.getExternalNoticeId()).isEqualTo("saramin_101");
		assertThat(response.getCompanyName()).isEqualTo("Dejavu Labs");
		assertThat(response.getJobCategory()).isEqualTo("BACKEND");
		assertThat(response.getSkillNames()).containsExactly("Java", "Spring Boot", "JPA");
		assertThat(response.isBookmarked()).isFalse();
		assertThat(response.getJaccardScore()).isEqualTo(0.5);
	}

	@Test
	void readDetailUsesProjectTechStacksWhenResumeSkillNamesArePlaceholder() {
		JobNoticesRepository jobNoticesRepository = createRepository(
			List.of(),
			Optional.of(createJobNoticeDetail(101L, "saramin_101", "Dejavu Labs", List.of("Java", "Spring Boot", "JPA")))
		);
		Resume resume = createResume(List.of("String"));
		resume.addProject(createProject(List.of("Java", "Spring Boot", "MySQL")));
		ResumeService resumeService = mock(ResumeService.class);
		when(resumeService.findDefaultResume(1L)).thenReturn(resume);
		JobNoticesService jobNoticesService = new JobNoticesService(jobNoticesRepository, resumeService);

		JobNoticesDetailResponseDTO response = jobNoticesService.readDetail(101L, 1L);

		assertThat(response.getJaccardScore()).isEqualTo(0.5);
	}

	@Test
	void readDetailSplitsCommaSeparatedResumeSkillNames() {
		JobNoticesRepository jobNoticesRepository = createRepository(
			List.of(),
			Optional.of(createJobNoticeDetail(101L, "saramin_101", "Dejavu Labs", List.of("Java", "Spring Boot", "JPA")))
		);
		ResumeService resumeService = mock(ResumeService.class);
		when(resumeService.findDefaultResume(1L)).thenReturn(createResume(List.of("Java, Spring Boot, MySQL")));
		JobNoticesService jobNoticesService = new JobNoticesService(jobNoticesRepository, resumeService);

		JobNoticesDetailResponseDTO response = jobNoticesService.readDetail(101L, 1L);

		assertThat(response.getJaccardScore()).isEqualTo(0.5);
	}

	@Test
	void readDetailReturnsZeroJaccardScoreWhenUserIsNotAuthenticated() {
		JobNoticesRepository jobNoticesRepository = createRepository(
			List.of(),
			Optional.of(createJobNoticeDetail(101L, "saramin_101", "Dejavu Labs", List.of("Java", "Spring Boot", "JPA")))
		);
		JobNoticesService jobNoticesService = new JobNoticesService(jobNoticesRepository, mock(ResumeService.class));

		JobNoticesDetailResponseDTO response = jobNoticesService.readDetail(101L);

		assertThat(response.getJaccardScore()).isZero();
	}

	@Test
	void readDetailReturnsZeroJaccardScoreWhenDefaultResumeDoesNotExist() {
		JobNoticesRepository jobNoticesRepository = createRepository(
			List.of(),
			Optional.of(createJobNoticeDetail(101L, "saramin_101", "Dejavu Labs", List.of("Java", "Spring Boot", "JPA")))
		);
		ResumeService resumeService = mock(ResumeService.class);
		when(resumeService.findDefaultResume(1L))
			.thenThrow(new ApiException(HttpStatus.NOT_FOUND, "RESUME_NOT_FOUND", "기본 이력서를 찾을 수 없습니다."));
		JobNoticesService jobNoticesService = new JobNoticesService(jobNoticesRepository, resumeService);

		JobNoticesDetailResponseDTO response = jobNoticesService.readDetail(101L, 1L);

		assertThat(response.getJaccardScore()).isZero();
	}

	@Test
	void readDetailThrowsWhenJobNoticeDoesNotExist() {
		JobNoticesRepository jobNoticesRepository = createRepository(List.of());
		JobNoticesService jobNoticesService = new JobNoticesService(jobNoticesRepository, mock(ResumeService.class));

		assertThatThrownBy(() -> jobNoticesService.readDetail(999L))
			.isInstanceOf(JobNoticesException.class)
			.hasMessage("채용공고를 찾을 수 없습니다.");
	}

	private JobNoticesRepository createRepository(List<JobNoticesRepositoryRow> jobNotices) {
		return createRepository(jobNotices, Optional.empty());
	}

	private JobNoticesRepository createRepository(
		List<JobNoticesRepositoryRow> jobNotices,
		Optional<JobNoticesDetailRepositoryRow> jobNoticeDetail
	) {
		JobNoticesRepository jobNoticesRepository = mock(JobNoticesRepository.class);
		when(jobNoticesRepository.findActiveJobNotices(null, null)).thenReturn(jobNotices);
		when(jobNoticesRepository.findActiveJobNotice(101L)).thenReturn(jobNoticeDetail);
		when(jobNoticesRepository.findActiveJobNotice(999L)).thenReturn(Optional.empty());
		return jobNoticesRepository;
	}

	private JobNoticesRepositoryRow createJobNotice(
		Long jobNoticeId,
		String companyName,
		String title,
		String experienceLevel,
		List<String> skillNames
	) {
		return JobNoticesRepositoryRow.builder()
			.jobNoticeId(jobNoticeId)
			.companyName(companyName)
			.title(title)
			.jobCategory("IT")
			.locationText("Seoul")
			.experienceLevel(experienceLevel)
			.employmentType("Full-time")
			.deadlineAt(LocalDateTime.of(2027, 7, 12, 23, 59, 59))
			.roleKeywordsText(String.join(",", skillNames))
			.skillNames(skillNames)
			.build();
	}

	private JobNoticesDetailRepositoryRow createJobNoticeDetail(
		Long jobNoticeId,
		String externalNoticeId,
		String companyName,
		List<String> skillNames
	) {
		return JobNoticesDetailRepositoryRow.builder()
			.jobNoticeId(jobNoticeId)
			.externalNoticeId(externalNoticeId)
			.companyName(companyName)
			.title("Backend Developer")
			.sourceUrl("https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=101")
			.jobCategory("IT")
			.locationText("Seoul")
			.experienceLevel("New")
			.employmentType("Full-time")
			.educationLevel("Any")
			.salaryText("Negotiable")
			.deadlineAt(LocalDateTime.of(2027, 7, 12, 23, 59, 59))
			.roleKeywordsText(String.join(",", skillNames))
			.descriptionRaw("Job notice detail")
			.skillNames(skillNames)
			.build();
	}

	private Resume createResume(List<String> resumeSkillNames) {
		return new Resume(
			1L,
			1L,
			"Default Resume",
			"Dejavu",
			"dejavu@example.com",
			null,
			null,
			null,
			null,
			List.of(),
			List.of(),
			resumeSkillNames,
			null,
			null,
			true
		);
	}

	private ResumeProject createProject(List<String> techStacks) {
		return new ResumeProject(
			1L,
			1L,
			"Project",
			"Backend",
			"2026-01",
			"2026-02",
			"Project description",
			"Troubleshooting",
			techStacks,
			1
		);
	}
}

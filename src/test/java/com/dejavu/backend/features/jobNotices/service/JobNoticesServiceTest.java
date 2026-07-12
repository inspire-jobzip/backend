package com.dejavu.backend.features.jobNotices.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import com.dejavu.backend.features.jobNotices.domain.dto.JobNoticesPageResponseDTO;
import com.dejavu.backend.features.jobNotices.domain.dto.JobNoticesRepositoryRow;
import com.dejavu.backend.features.jobNotices.domain.dto.JobNoticesResponseDTO;
import com.dejavu.backend.features.jobNotices.domain.dto.JobNoticesSearchCondition;
import com.dejavu.backend.features.jobNotices.exception.JobNoticesException;
import com.dejavu.backend.features.jobNotices.repository.JobNoticesRepository;
import java.time.LocalDateTime;
import java.util.List;
import org.junit.jupiter.api.Test;

class JobNoticesServiceTest {

	@Test
	void readReturnsAllJobNoticesWhenQueryParametersAreEmpty() {
		JobNoticesService jobNoticesService = new JobNoticesService(new FakeJobNoticesRepository(List.of(
			createJobNotice(1L, "테크브릿지", "백엔드 개발자", "경력 3~7년", List.of("Java", "Spring Boot")),
			createJobNotice(2L, "데이터루프", "프론트엔드 개발자", "신입", List.of("React", "TypeScript"))
		)));

		JobNoticesPageResponseDTO<JobNoticesResponseDTO> response =
			jobNoticesService.read(JobNoticesSearchCondition.of(null, null, null, null, null, null, null, null));

		assertThat(response.getContent()).hasSize(2);
		assertThat(response.getPage()).isZero();
		assertThat(response.getSize()).isEqualTo(2);
		assertThat(response.getTotalElements()).isEqualTo(2);
	}

	@Test
	void readFiltersJobNoticesByJobRoleAndSkillNames() {
		JobNoticesService jobNoticesService = new JobNoticesService(new FakeJobNoticesRepository(List.of(
			createJobNotice(1L, "테크브릿지", "백엔드 개발자", "경력 3~7년", List.of("Java", "Spring Boot")),
			createJobNotice(2L, "데이터루프", "프론트엔드 개발자", "신입", List.of("React", "TypeScript"))
		)));

		JobNoticesPageResponseDTO<JobNoticesResponseDTO> response =
			jobNoticesService.read(JobNoticesSearchCondition.of(null, "BACKEND", "Spring Boot", null, null, null, "0", "20"));

		assertThat(response.getContent()).hasSize(1);
		assertThat(response.getContent().get(0).getCompanyName()).isEqualTo("테크브릿지");
		assertThat(response.getContent().get(0).getJobCategory()).isEqualTo("BACKEND");
	}

	@Test
	void searchConditionRejectsInvalidJobRole() {
		assertThatThrownBy(() -> JobNoticesSearchCondition.of(null, "SERVER", null, null, null, null, null, null))
			.isInstanceOf(JobNoticesException.class)
			.hasMessage("jobRole 값이 올바르지 않습니다.");
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
			.jobCategory("IT개발·데이터")
			.locationText("서울")
			.experienceLevel(experienceLevel)
			.employmentType("정규직")
			.deadlineAt(LocalDateTime.of(2027, 7, 12, 23, 59, 59))
			.roleKeywordsText(String.join(",", skillNames))
			.skillNames(skillNames)
			.build();
	}

	private static class FakeJobNoticesRepository extends JobNoticesRepository {

		private final List<JobNoticesRepositoryRow> jobNotices;

		private FakeJobNoticesRepository(List<JobNoticesRepositoryRow> jobNotices) {
			super(null);
			this.jobNotices = jobNotices;
		}

		@Override
		public List<JobNoticesRepositoryRow> findActiveJobNotices(String keyword, String location) {
			return jobNotices;
		}
	}
}

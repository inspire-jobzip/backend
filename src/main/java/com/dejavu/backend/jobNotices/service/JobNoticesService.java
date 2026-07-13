package com.dejavu.backend.jobNotices.service;

import java.util.Comparator;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.dejavu.backend.jobNotices.domain.dto.JobNoticesPageResponseDTO;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesRepositoryRow;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesResponseDTO;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesSearchCondition;
import com.dejavu.backend.jobNotices.domain.enums.JobNoticesExperienceLevel;
import com.dejavu.backend.jobNotices.domain.enums.JobNoticesJobRole;
import com.dejavu.backend.jobNotices.domain.enums.JobNoticesSortOption;
import com.dejavu.backend.jobNotices.repository.JobNoticesRepository;

@Service
@RequiredArgsConstructor
public class JobNoticesService {

	private static final int DEFAULT_PAGE = 0;
	private static final int DEFAULT_SIZE = 20;

	private final JobNoticesRepository jobNoticesRepository;

	public JobNoticesPageResponseDTO<JobNoticesResponseDTO> read(JobNoticesSearchCondition condition) {
		List<JobNoticesResponseDTO> filteredJobNotices = jobNoticesRepository.findActiveJobNotices(
				condition.getKeyword(),
				condition.getLocation()
			)
			.stream()
			.map(this::convertToResponse)
			.filter(jobNotice -> matchesJobRole(jobNotice, condition.getJobRole()))
			.filter(jobNotice -> matchesSkillNames(jobNotice, condition.getSkillNames()))
			.filter(jobNotice -> matchesExperienceLevel(jobNotice, condition.getExperienceLevel()))
			.sorted(getComparator(condition.getSort()))
			.toList();

		int page = condition.hasPagingParameter() ? condition.getPage() : DEFAULT_PAGE;
		int size = getPageSize(condition, filteredJobNotices.size());
		List<JobNoticesResponseDTO> content = getPagedContent(filteredJobNotices, page, size);

		return JobNoticesPageResponseDTO.<JobNoticesResponseDTO>builder()
			.content(content)
			.page(page)
			.size(size)
			.totalElements(filteredJobNotices.size())
			.build();
	}

	private JobNoticesResponseDTO convertToResponse(JobNoticesRepositoryRow row) {
		return JobNoticesResponseDTO.builder()
			.jobNoticeId(row.getJobNoticeId())
			.companyName(row.getCompanyName())
			.title(row.getTitle())
			.jobCategory(getJobRole(row).name())
			.locationText(row.getLocationText())
			.experienceLevel(getExperienceLevel(row.getExperienceLevel()).name())
			.employmentType(row.getEmploymentType())
			.deadlineAt(row.getDeadlineAt())
			.skillNames(row.getSkillNames())
			.isBookmarked(false)
			.build();
	}

	private boolean matchesJobRole(JobNoticesResponseDTO jobNotice, JobNoticesJobRole jobRole) {
		return jobRole == null || jobNotice.getJobCategory().equals(jobRole.name());
	}

	private boolean matchesSkillNames(JobNoticesResponseDTO jobNotice, List<String> skillNames) {
		if (skillNames.isEmpty()) {
			return true;
		}

		return jobNotice.getSkillNames()
			.stream()
			.anyMatch(skillName -> skillNames.stream().anyMatch(skillName::equalsIgnoreCase));
	}

	private boolean matchesExperienceLevel(JobNoticesResponseDTO jobNotice, JobNoticesExperienceLevel experienceLevel) {
		return experienceLevel == JobNoticesExperienceLevel.ANY
			|| jobNotice.getExperienceLevel().equals(experienceLevel.name());
	}

	private Comparator<JobNoticesResponseDTO> getComparator(JobNoticesSortOption sort) {
		if (sort == JobNoticesSortOption.DEADLINE) {
			return Comparator.comparing(
				JobNoticesResponseDTO::getDeadlineAt,
				Comparator.nullsLast(Comparator.naturalOrder())
			);
		}

		return Comparator.comparing(JobNoticesResponseDTO::getJobNoticeId).reversed();
	}

	private int getPageSize(JobNoticesSearchCondition condition, int totalElements) {
		if (!condition.hasPagingParameter() && !condition.hasAnyQueryParameter()) {
			return totalElements;
		}

		return condition.getSize() == null ? DEFAULT_SIZE : condition.getSize();
	}

	private List<JobNoticesResponseDTO> getPagedContent(List<JobNoticesResponseDTO> jobNotices, int page, int size) {
		int fromIndex = Math.min(page * size, jobNotices.size());
		int toIndex = Math.min(fromIndex + size, jobNotices.size());

		return jobNotices.subList(fromIndex, toIndex);
	}

	private JobNoticesJobRole getJobRole(JobNoticesRepositoryRow row) {
		// DB에 표준 직무 enum 컬럼이 생기기 전까지 제목/키워드/스킬로 대표 직무를 추론한다.
		String searchText = String.join(" ",
			row.getTitle(),
			row.getRoleKeywordsText(),
			String.join(",", row.getSkillNames())
		).toLowerCase();

		if (containsAny(searchText, "게임", "unity", "게임서버")) {
			return JobNoticesJobRole.GAME;
		}
		if (containsAny(searchText, "보안", "security", "취약점", "c++")) {
			return JobNoticesJobRole.SECURITY;
		}
		if (containsAny(searchText, "devops", "kubernetes", "docker", "terraform", "cloud", "클라우드")) {
			return JobNoticesJobRole.DEVOPS;
		}
		if (containsAny(searchText, "풀스택", "fullstack")) {
			return JobNoticesJobRole.FULLSTACK;
		}
		if (containsAny(searchText, "ai", "openai", "머신러닝", "인공지능")) {
			return JobNoticesJobRole.AI;
		}
		if (containsAny(searchText, "데이터", "airflow", "spark", "bigquery", "tableau", "sql")) {
			return JobNoticesJobRole.DATA;
		}
		if (containsAny(searchText, "프론트엔드", "frontend", "react", "typescript", "next.js", "vue.js")) {
			return JobNoticesJobRole.FRONTEND;
		}
		if (containsAny(searchText, "모바일", "mobile", "android", "ios", "app")) {
			return JobNoticesJobRole.MOBILE;
		}
		if (containsAny(searchText, "qa", "테스트", "품질")) {
			return JobNoticesJobRole.QA;
		}

		return JobNoticesJobRole.BACKEND;
	}

	private JobNoticesExperienceLevel getExperienceLevel(String experienceLevel) {
		if (experienceLevel == null || experienceLevel.isBlank()) {
			return JobNoticesExperienceLevel.ANY;
		}
		if (containsAny(experienceLevel, "신입", "경력무관")) {
			return JobNoticesExperienceLevel.NEW;
		}

		return JobNoticesExperienceLevel.EXPERIENCED;
	}

	private boolean containsAny(String source, String... keywords) {
		if (source == null) {
			return false;
		}

		String lowerSource = source.toLowerCase();
		for (String keyword : keywords) {
			if (lowerSource.contains(keyword.toLowerCase())) {
				return true;
			}
		}

		return false;
	}
}

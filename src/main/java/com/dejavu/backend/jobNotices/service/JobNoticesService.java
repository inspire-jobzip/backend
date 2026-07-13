package com.dejavu.backend.jobNotices.service;

import java.util.Comparator;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.dejavu.backend.jobNotices.domain.dto.JobNoticesDetailRepositoryRow;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesDetailResponseDTO;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesPageResponseDTO;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesRepositoryRow;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesResponseDTO;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesSearchCondition;
import com.dejavu.backend.jobNotices.domain.enums.JobNoticesExperienceLevel;
import com.dejavu.backend.jobNotices.domain.enums.JobNoticesJobRole;
import com.dejavu.backend.jobNotices.domain.enums.JobNoticesSortOption;
import com.dejavu.backend.jobNotices.exception.JobNoticesException;
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

	public JobNoticesDetailResponseDTO readDetail(Long jobNoticeId) {
		JobNoticesDetailRepositoryRow row = jobNoticesRepository.findActiveJobNotice(jobNoticeId)
			.orElseThrow(JobNoticesException::jobNoticeNotFound);

		return convertToDetailResponse(row);
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

	private JobNoticesDetailResponseDTO convertToDetailResponse(JobNoticesDetailRepositoryRow row) {
		return JobNoticesDetailResponseDTO.builder()
			.jobNoticeId(row.getJobNoticeId())
			.externalNoticeId(row.getExternalNoticeId())
			.companyName(row.getCompanyName())
			.title(row.getTitle())
			.sourceUrl(row.getSourceUrl())
			.jobCategory(getJobRole(row.getTitle(), row.getRoleKeywordsText(), row.getSkillNames()).name())
			.locationText(row.getLocationText())
			.experienceLevel(getExperienceLevel(row.getExperienceLevel()).name())
			.employmentType(row.getEmploymentType())
			.educationLevel(row.getEducationLevel())
			.salaryText(row.getSalaryText())
			.deadlineAt(row.getDeadlineAt())
			.roleKeywordsText(row.getRoleKeywordsText())
			.descriptionRaw(row.getDescriptionRaw())
			.skillNames(row.getSkillNames())
			.isBookmarked(false)
			.jaccardScore(0.0)
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
		return getJobRole(row.getTitle(), row.getRoleKeywordsText(), row.getSkillNames());
	}

	private JobNoticesJobRole getJobRole(String title, String roleKeywordsText, List<String> skillNames) {
		// The API response requires a fixed enum even when cached Saramin data stores free-form categories.
		String searchText = String.join(" ",
			title == null ? "" : title,
			roleKeywordsText == null ? "" : roleKeywordsText,
			String.join(",", skillNames == null ? List.of() : skillNames)
		).toLowerCase();

		if (containsAny(searchText, "\uAC8C\uC784", "\uAC8C\uC784\uC11C\uBC84", "game", "unity", "unreal")) {
			return JobNoticesJobRole.GAME;
		}
		if (containsAny(searchText, "\uBCF4\uC548", "\uCDE8\uC57D\uC810", "security", "secure", "vulnerability", "c++")) {
			return JobNoticesJobRole.SECURITY;
		}
		if (containsAny(searchText, "devops", "kubernetes", "docker", "terraform", "cloud", "\uD074\uB77C\uC6B0\uB4DC")) {
			return JobNoticesJobRole.DEVOPS;
		}
		if (containsAny(searchText, "\uD480\uC2A4\uD0DD", "fullstack", "full-stack")) {
			return JobNoticesJobRole.FULLSTACK;
		}
		if (containsAny(searchText, "ai", "openai", "\uBA38\uC2E0\uB7EC\uB2DD", "\uC778\uACF5\uC9C0\uB2A5", "machine learning", "ml", "llm")) {
			return JobNoticesJobRole.AI;
		}
		if (containsAny(searchText, "\uB370\uC774\uD130", "data", "airflow", "spark", "bigquery", "tableau", "sql")) {
			return JobNoticesJobRole.DATA;
		}
		if (containsAny(searchText, "\uD504\uB860\uD2B8\uC5D4\uB4DC", "frontend", "front-end", "react", "typescript", "next.js", "vue.js")) {
			return JobNoticesJobRole.FRONTEND;
		}
		if (containsAny(searchText, "\uBAA8\uBC14\uC77C", "mobile", "android", "ios", "app")) {
			return JobNoticesJobRole.MOBILE;
		}
		if (containsAny(searchText, "qa", "\uD14C\uC2A4\uD2B8", "\uD488\uC9C8", "test", "quality assurance")) {
			return JobNoticesJobRole.QA;
		}

		return JobNoticesJobRole.BACKEND;
	}

	private JobNoticesExperienceLevel getExperienceLevel(String experienceLevel) {
		if (experienceLevel == null || experienceLevel.isBlank()) {
			return JobNoticesExperienceLevel.ANY;
		}
		if (containsAny(experienceLevel, "\uC2E0\uC785", "\uACBD\uB825\uBB34\uAD00", "new", "entry")) {
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


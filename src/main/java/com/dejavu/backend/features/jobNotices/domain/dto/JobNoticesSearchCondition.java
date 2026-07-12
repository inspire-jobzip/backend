package com.dejavu.backend.features.jobNotices.domain.dto;

import com.dejavu.backend.features.jobNotices.domain.enums.JobNoticesExperienceLevel;
import com.dejavu.backend.features.jobNotices.domain.enums.JobNoticesJobRole;
import com.dejavu.backend.features.jobNotices.domain.enums.JobNoticesSortOption;
import com.dejavu.backend.features.jobNotices.exception.JobNoticesException;
import java.util.Arrays;
import java.util.List;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class JobNoticesSearchCondition {

	private String keyword;
	private JobNoticesJobRole jobRole;
	private List<String> skillNames;
	private JobNoticesExperienceLevel experienceLevel;
	private String location;
	private JobNoticesSortOption sort;
	private Integer page;
	private Integer size;
	private boolean hasPagingParameter;
	private boolean hasAnyQueryParameter;

	public static JobNoticesSearchCondition of(
		String keyword,
		String jobRole,
		String skillNames,
		String experienceLevel,
		String location,
		String sort,
		String page,
		String size
	) {
		return new JobNoticesSearchCondition(
			normalize(keyword),
			JobNoticesJobRole.from(jobRole),
			parseSkillNames(skillNames),
			JobNoticesExperienceLevel.from(experienceLevel),
			normalize(location),
			JobNoticesSortOption.from(sort),
			parsePage(page),
			parseSize(size),
			hasText(page) || hasText(size),
			hasAnyQueryParameter(keyword, jobRole, skillNames, experienceLevel, location, sort, page, size)
		);
	}

	private static String normalize(String value) {
		return hasText(value) ? value.trim() : null;
	}

	public boolean hasPagingParameter() {
		return hasPagingParameter;
	}

	public boolean hasAnyQueryParameter() {
		return hasAnyQueryParameter;
	}

	private static List<String> parseSkillNames(String skillNames) {
		if (!hasText(skillNames)) {
			return List.of();
		}

		return Arrays.stream(skillNames.split(","))
			.map(String::trim)
			.filter(JobNoticesSearchCondition::hasText)
			.toList();
	}

	private static Integer parsePage(String page) {
		if (!hasText(page)) {
			return 0;
		}

		// Spring 기본 변환 오류 대신 명세의 공통 실패 응답으로 내려보내기 위해 직접 파싱한다.

		int parsedPage = parseInteger(page, "page 형식이 올바르지 않습니다.");
		if (parsedPage < 0) {
			throw JobNoticesException.invalidQueryParameter("page 값은 0 이상이어야 합니다.");
		}

		return parsedPage;
	}

	private static Integer parseSize(String size) {
		if (!hasText(size)) {
			return null;
		}

		int parsedSize = parseInteger(size, "size 형식이 올바르지 않습니다.");
		if (parsedSize < 1) {
			throw JobNoticesException.invalidQueryParameter("size 값은 1 이상이어야 합니다.");
		}

		return parsedSize;
	}

	private static int parseInteger(String value, String errorMessage) {
		try {
			return Integer.parseInt(value.trim());
		} catch (NumberFormatException exception) {
			throw JobNoticesException.invalidQueryParameter(errorMessage);
		}
	}

	private static boolean hasAnyQueryParameter(String... values) {
		return Arrays.stream(values).anyMatch(JobNoticesSearchCondition::hasText);
	}

	private static boolean hasText(String value) {
		return value != null && !value.trim().isEmpty();
	}
}

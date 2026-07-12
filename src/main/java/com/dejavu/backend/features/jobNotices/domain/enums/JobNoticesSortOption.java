package com.dejavu.backend.features.jobNotices.domain.enums;

import com.dejavu.backend.features.jobNotices.exception.JobNoticesException;

public enum JobNoticesSortOption {

	LATEST,
	DEADLINE;

	public static JobNoticesSortOption from(String value) {
		if (value == null || value.isBlank()) {
			return LATEST;
		}

		return switch (value.trim().toLowerCase()) {
			case "latest" -> LATEST;
			case "deadline" -> DEADLINE;
			default -> throw JobNoticesException.invalidQueryParameter("sort 값이 올바르지 않습니다.");
		};
	}
}

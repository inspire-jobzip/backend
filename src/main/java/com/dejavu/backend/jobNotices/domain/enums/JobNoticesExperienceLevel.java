package com.dejavu.backend.jobNotices.domain.enums;

import com.dejavu.backend.jobNotices.exception.JobNoticesException;

public enum JobNoticesExperienceLevel {

	NEW,
	EXPERIENCED,
	ANY;

	public static JobNoticesExperienceLevel from(String value) {
		if (value == null || value.isBlank()) {
			return ANY;
		}

		try {
			return JobNoticesExperienceLevel.valueOf(value.trim().toUpperCase());
		} catch (IllegalArgumentException exception) {
			throw JobNoticesException.invalidQueryParameter("experienceLevel 값이 올바르지 않습니다.");
		}
	}
}

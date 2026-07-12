package com.dejavu.backend.features.jobNotices.domain.enums;

import com.dejavu.backend.features.jobNotices.exception.JobNoticesException;

public enum JobNoticesJobRole {

	BACKEND,
	FRONTEND,
	FULLSTACK,
	MOBILE,
	DATA,
	AI,
	DEVOPS,
	SECURITY,
	QA,
	GAME;

	public static JobNoticesJobRole from(String value) {
		if (value == null || value.isBlank()) {
			return null;
		}

		try {
			return JobNoticesJobRole.valueOf(value.trim().toUpperCase());
		} catch (IllegalArgumentException exception) {
			throw JobNoticesException.invalidQueryParameter("jobRole 값이 올바르지 않습니다.");
		}
	}
}

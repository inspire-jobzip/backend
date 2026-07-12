package com.dejavu.backend.features.jobNotices.exception;

import com.dejavu.backend.features.jobNotices.domain.enums.JobNoticesErrorCode;
import lombok.Getter;

@Getter
public class JobNoticesException extends RuntimeException {

	private final JobNoticesErrorCode errorCode;

	private JobNoticesException(JobNoticesErrorCode errorCode, String message) {
		super(message);
		this.errorCode = errorCode;
	}

	public static JobNoticesException invalidQueryParameter(String message) {
		return new JobNoticesException(JobNoticesErrorCode.INVALID_QUERY_PARAMETER, message);
	}
}

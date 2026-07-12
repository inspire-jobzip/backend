package com.dejavu.backend.jobNotices.exception;

import com.dejavu.backend.jobNotices.domain.enums.JobNoticesErrorCode;

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

	public static JobNoticesException jobNoticeNotFound() {
		return new JobNoticesException(JobNoticesErrorCode.JOB_NOTICE_NOT_FOUND, "채용공고를 찾을 수 없습니다.");
	}
}

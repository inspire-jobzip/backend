package com.dejavu.backend.jobNotices.domain.enums;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public enum JobNoticesErrorCode {

	INVALID_QUERY_PARAMETER(HttpStatus.BAD_REQUEST, "INVALID_QUERY_PARAMETER"),
	INTERNAL_SERVER_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "INTERNAL_SERVER_ERROR");

	private final HttpStatus httpStatus;
	private final String code;

	JobNoticesErrorCode(HttpStatus httpStatus, String code) {
		this.httpStatus = httpStatus;
		this.code = code;
	}
}

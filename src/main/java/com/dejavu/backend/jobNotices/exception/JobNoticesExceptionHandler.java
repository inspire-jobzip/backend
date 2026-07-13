package com.dejavu.backend.jobNotices.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import com.dejavu.backend.jobNotices.domain.dto.JobNoticesApiResponse;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesErrorResponse;
import com.dejavu.backend.jobNotices.domain.enums.JobNoticesErrorCode;

@RestControllerAdvice(basePackages = "com.dejavu.backend.jobNotices")
public class JobNoticesExceptionHandler {

	@ExceptionHandler(JobNoticesException.class)
	public ResponseEntity<JobNoticesApiResponse<Void>> handleJobNoticesException(JobNoticesException exception) {
		JobNoticesErrorCode errorCode = exception.getErrorCode();

		return ResponseEntity
			.status(errorCode.getHttpStatus())
			.body(JobNoticesApiResponse.fail(new JobNoticesErrorResponse(errorCode.getCode(), exception.getMessage())));
	}

	@ExceptionHandler(MethodArgumentTypeMismatchException.class)
	public ResponseEntity<JobNoticesApiResponse<Void>> handleMethodArgumentTypeMismatch(
		MethodArgumentTypeMismatchException exception
	) {
		JobNoticesErrorCode errorCode = JobNoticesErrorCode.INVALID_QUERY_PARAMETER;

		return ResponseEntity
			.status(errorCode.getHttpStatus())
			.body(JobNoticesApiResponse.fail(new JobNoticesErrorResponse(
				errorCode.getCode(),
				"jobNoticeId 형식이 올바르지 않습니다."
			)));
	}

	@ExceptionHandler(Exception.class)
	public ResponseEntity<JobNoticesApiResponse<Void>> handleException(Exception exception) {
		JobNoticesErrorCode errorCode = JobNoticesErrorCode.INTERNAL_SERVER_ERROR;

		return ResponseEntity
			.status(errorCode.getHttpStatus())
			.body(JobNoticesApiResponse.fail(new JobNoticesErrorResponse(
				errorCode.getCode(),
				"서버 처리 중 오류가 발생했습니다."
			)));
	}
}

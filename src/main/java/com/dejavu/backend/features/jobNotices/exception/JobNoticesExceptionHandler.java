package com.dejavu.backend.features.jobNotices.exception;

import com.dejavu.backend.features.jobNotices.domain.dto.JobNoticesApiResponse;
import com.dejavu.backend.features.jobNotices.domain.dto.JobNoticesErrorResponse;
import com.dejavu.backend.features.jobNotices.domain.enums.JobNoticesErrorCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice(basePackages = "com.dejavu.backend.features.jobNotices")
public class JobNoticesExceptionHandler {

	@ExceptionHandler(JobNoticesException.class)
	public ResponseEntity<JobNoticesApiResponse<Void>> handleJobNoticesException(JobNoticesException exception) {
		JobNoticesErrorCode errorCode = exception.getErrorCode();

		return ResponseEntity
			.status(errorCode.getHttpStatus())
			.body(JobNoticesApiResponse.fail(new JobNoticesErrorResponse(errorCode.getCode(), exception.getMessage())));
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

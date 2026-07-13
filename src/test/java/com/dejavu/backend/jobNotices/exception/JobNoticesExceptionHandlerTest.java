package com.dejavu.backend.jobNotices.exception;

import static org.assertj.core.api.Assertions.assertThat;

import com.dejavu.backend.jobNotices.domain.dto.JobNoticesApiResponse;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

class JobNoticesExceptionHandlerTest {

	private final JobNoticesExceptionHandler exceptionHandler = new JobNoticesExceptionHandler();

	@Test
	void handleJobNoticeNotFoundReturnsApiSpecErrorResponse() {
		ResponseEntity<JobNoticesApiResponse<Void>> response =
			exceptionHandler.handleJobNoticesException(JobNoticesException.jobNoticeNotFound());

		assertThat(response.getStatusCode()).isEqualTo(HttpStatus.NOT_FOUND);
		assertThat(response.getBody()).isNotNull();
		assertThat(response.getBody().isSuccess()).isFalse();
		assertThat(response.getBody().getError().getCode()).isEqualTo("JOB_NOTICE_NOT_FOUND");
		assertThat(response.getBody().getError().getMessage()).isEqualTo("채용공고를 찾을 수 없습니다.");
	}

	@Test
	void handleInvalidJobNoticeIdFormatReturnsBadRequest() {
		MethodArgumentTypeMismatchException exception = new MethodArgumentTypeMismatchException(
			"abc",
			Long.class,
			"jobNoticeId",
			null,
			new NumberFormatException()
		);

		ResponseEntity<JobNoticesApiResponse<Void>> response =
			exceptionHandler.handleMethodArgumentTypeMismatch(exception);

		assertThat(response.getStatusCode()).isEqualTo(HttpStatus.BAD_REQUEST);
		assertThat(response.getBody()).isNotNull();
		assertThat(response.getBody().isSuccess()).isFalse();
		assertThat(response.getBody().getError().getCode()).isEqualTo("INVALID_QUERY_PARAMETER");
		assertThat(response.getBody().getError().getMessage()).isEqualTo("jobNoticeId 형식이 올바르지 않습니다.");
	}

	@Test
	void handleUnexpectedExceptionReturnsInternalServerError() {
		ResponseEntity<JobNoticesApiResponse<Void>> response =
			exceptionHandler.handleException(new RuntimeException("unexpected"));

		assertThat(response.getStatusCode()).isEqualTo(HttpStatus.INTERNAL_SERVER_ERROR);
		assertThat(response.getBody()).isNotNull();
		assertThat(response.getBody().isSuccess()).isFalse();
		assertThat(response.getBody().getError().getCode()).isEqualTo("INTERNAL_SERVER_ERROR");
		assertThat(response.getBody().getError().getMessage()).isEqualTo("서버 처리 중 오류가 발생했습니다.");
	}
}

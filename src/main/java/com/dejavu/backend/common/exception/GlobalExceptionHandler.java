package com.dejavu.backend.common.exception;

import com.dejavu.backend.common.api.ApiResponse;
import jakarta.validation.ConstraintViolationException;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.http.converter.HttpMessageNotReadableException;

@RestControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(BusinessException.class)
	public ResponseEntity<ApiResponse<Void>> handleBusinessException(BusinessException exception) {
		ErrorCode errorCode = exception.getErrorCode();
		return ResponseEntity
			.status(errorCode.getStatus())
			.body(ApiResponse.fail(errorCode.getCode(), exception.getMessage()));
	}

	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<ApiResponse<Void>> handleMethodArgumentNotValidException(
		MethodArgumentNotValidException exception
	) {
		String message = exception.getBindingResult().getFieldErrors().stream()
			.findFirst()
			.map(FieldError::getDefaultMessage)
			.orElse(ErrorCode.INVALID_INPUT.getMessage());

		return ResponseEntity
			.status(ErrorCode.INVALID_INPUT.getStatus())
			.body(ApiResponse.fail(ErrorCode.INVALID_INPUT.getCode(), message));
	}

	@ExceptionHandler(ConstraintViolationException.class)
	public ResponseEntity<ApiResponse<Void>> handleConstraintViolationException(
		ConstraintViolationException exception
	) {
		String message = exception.getConstraintViolations().stream()
			.findFirst()
			.map(violation -> violation.getMessage())
			.orElse(ErrorCode.INVALID_INPUT.getMessage());

		return ResponseEntity
			.status(ErrorCode.INVALID_INPUT.getStatus())
			.body(ApiResponse.fail(ErrorCode.INVALID_INPUT.getCode(), message));
	}

	@ExceptionHandler(HttpMessageNotReadableException.class)
	public ResponseEntity<ApiResponse<Void>> handleHttpMessageNotReadableException(
		HttpMessageNotReadableException exception
	) {
		return ResponseEntity
			.status(ErrorCode.INVALID_INPUT.getStatus())
			.body(ApiResponse.fail(ErrorCode.INVALID_INPUT.getCode(), "요청 본문 형식이 올바르지 않습니다."));
	}

	@ExceptionHandler(Exception.class)
	public ResponseEntity<ApiResponse<Void>> handleException(Exception exception) {
		return ResponseEntity
			.status(ErrorCode.INTERNAL_SERVER_ERROR.getStatus())
			.body(ApiResponse.fail(ErrorCode.INTERNAL_SERVER_ERROR.getCode(), ErrorCode.INTERNAL_SERVER_ERROR.getMessage()));
	}
}

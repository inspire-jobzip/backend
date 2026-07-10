package com.dejavu.backend.common.api;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiResponse<T> {

	private final boolean success;
	private final T data;
	private final String message;
	private final ApiError error;

	private ApiResponse(boolean success, T data, String message, ApiError error) {
		this.success = success;
		this.data = data;
		this.message = message;
		this.error = error;
	}

	public static <T> ApiResponse<T> success(T data) {
		return new ApiResponse<>(true, data, null, null);
	}

	public static <T> ApiResponse<T> success(T data, String message) {
		return new ApiResponse<>(true, data, message, null);
	}

	public static ApiResponse<Void> successMessage(String message) {
		return new ApiResponse<>(true, null, message, null);
	}

	public static ApiResponse<Void> fail(String code, String message) {
		return new ApiResponse<>(false, null, null, new ApiError(code, message));
	}

	public boolean isSuccess() {
		return success;
	}

	public T getData() {
		return data;
	}

	public String getMessage() {
		return message;
	}

	public ApiError getError() {
		return error;
	}
}

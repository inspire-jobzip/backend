package com.dejavu.backend.common;

public record ApiResponse<T>(
        boolean success,
        T data,
        String message,
        ErrorBody error
) {

    public static <T> ApiResponse<T> ok(T data) {
        return new ApiResponse<>(true, data, null, null);
    }

    public static <T> ApiResponse<T> created(T data) {
        return new ApiResponse<>(true, data, null, null);
    }

    public static <T> ApiResponse<T> message(T data, String message) {
        return new ApiResponse<>(true, data, message, null);
    }

    public static ApiResponse<Void> fail(String code, String message) {
        return new ApiResponse<>(false, null, null, new ErrorBody(code, message));
    }

    public record ErrorBody(String code, String message) {
    }
}

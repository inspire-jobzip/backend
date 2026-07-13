package com.dejavu.backend.jobNotices.domain.dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class JobNoticesApiResponse<T> {

	private boolean success;
	private T data;
	private JobNoticesErrorResponse error;

	public static <T> JobNoticesApiResponse<T> success(T data) {
		return new JobNoticesApiResponse<>(true, data, null);
	}

	public static JobNoticesApiResponse<Void> fail(JobNoticesErrorResponse error) {
		return new JobNoticesApiResponse<>(false, null, error);
	}
}

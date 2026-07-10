package com.dejavu.backend.features.jobNotices.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class JobNoticesErrorResponse {

	private String code;
	private String message;
}

package com.dejavu.backend.auth.dto;

import com.dejavu.backend.user.entity.CareerStatus;
import com.dejavu.backend.user.entity.DesiredJobRole;

public record LoginUserResponse(
	Long userId,
	String email,
	DesiredJobRole desiredJobRole,
	CareerStatus careerStatus
) {
}

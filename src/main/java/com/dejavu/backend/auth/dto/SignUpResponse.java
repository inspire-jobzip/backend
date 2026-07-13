package com.dejavu.backend.auth.dto;

import com.dejavu.backend.user.entity.CareerStatus;
import com.dejavu.backend.user.entity.DesiredJobRole;
import java.math.BigDecimal;
import java.util.List;

public record SignUpResponse(
	Long userId,
	String email,
	DesiredJobRole desiredJobRole,
	CareerStatus careerStatus,
	BigDecimal careerYears,
	List<String> preferredSkillNames
) {
}

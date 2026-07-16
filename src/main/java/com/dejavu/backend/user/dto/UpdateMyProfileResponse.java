package com.dejavu.backend.user.dto;

import com.dejavu.backend.user.entity.CareerStatus;
import com.dejavu.backend.user.entity.DesiredJobRole;
import java.math.BigDecimal;
import java.util.List;

public record UpdateMyProfileResponse(
	Long userId,
	DesiredJobRole desiredJobRole,
	CareerStatus careerStatus,
	BigDecimal careerYears,
	List<String> preferredSkillNames
) {
}

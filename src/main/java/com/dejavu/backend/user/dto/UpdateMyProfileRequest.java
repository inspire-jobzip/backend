package com.dejavu.backend.user.dto;

import com.dejavu.backend.user.entity.CareerStatus;
import com.dejavu.backend.user.entity.DesiredJobRole;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;

public record UpdateMyProfileRequest(
	@NotNull(message = "희망 직무는 필수입니다.")
	DesiredJobRole desiredJobRole,

	@NotNull(message = "경력 상태는 필수입니다.")
	CareerStatus careerStatus,

	@DecimalMin(value = "0.0", inclusive = true, message = "경력 연차는 0 이상이어야 합니다.")
	BigDecimal careerYears,

	List<String> preferredSkillNames
) {
}

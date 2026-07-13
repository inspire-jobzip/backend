package com.dejavu.backend.auth.dto;

import com.dejavu.backend.user.entity.CareerStatus;
import com.dejavu.backend.user.entity.DesiredJobRole;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.List;

public record SignUpRequest(
	@NotBlank(message = "이메일은 필수입니다.")
	@Email(message = "올바른 이메일 형식이어야 합니다.")
	String email,

	@NotBlank(message = "비밀번호는 필수입니다.")
	@Size(min = 8, max = 100, message = "비밀번호는 8자 이상 100자 이하여야 합니다.")
	String password,

	@NotNull(message = "희망 직무는 필수입니다.")
	DesiredJobRole desiredJobRole,

	@NotNull(message = "경력 상태는 필수입니다.")
	CareerStatus careerStatus,

	@DecimalMin(value = "0.0", inclusive = true, message = "경력 연차는 0 이상이어야 합니다.")
	BigDecimal careerYears,

	List<String> preferredSkillNames
) {
}

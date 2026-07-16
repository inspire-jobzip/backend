package com.dejavu.backend.mypage.dto;

import com.dejavu.backend.user.entity.CareerStatus;
import com.dejavu.backend.user.entity.DesiredJobRole;
import java.math.BigDecimal;
import java.util.List;

public record MyPageProfileResponse(
	Long userId,
	String email,
	DesiredJobRole desiredJobRole,
	CareerStatus careerStatus,
	BigDecimal careerYears,
	List<String> preferredSkillNames
) {
}

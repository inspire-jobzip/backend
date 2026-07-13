package com.dejavu.backend.mypage.dto;

import java.time.LocalDateTime;

public record MyPageResumeResponse(
	Long resumeId,
	String title,
	boolean isDefault,
	LocalDateTime updatedAt
) {
}

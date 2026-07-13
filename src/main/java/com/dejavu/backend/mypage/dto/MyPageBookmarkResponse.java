package com.dejavu.backend.mypage.dto;

import java.time.LocalDateTime;

public record MyPageBookmarkResponse(
	Long bookmarkId,
	Long jobNoticeId,
	String companyName,
	String title,
	String recruitStatus,
	String recruitStatusText,
	LocalDateTime deadlineAt,
	Long daysUntilDeadline
) {
}

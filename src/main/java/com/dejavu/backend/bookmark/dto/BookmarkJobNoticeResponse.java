package com.dejavu.backend.bookmark.dto;

import java.time.LocalDateTime;
import java.util.List;

public record BookmarkJobNoticeResponse(
	Long bookmarkId,
	Long jobNoticeId,
	String companyName,
	String title,
	LocalDateTime deadlineAt,
	String recruitStatus,
	String recruitStatusText,
	long daysUntilDeadline,
	List<String> skillNames
) {
}

package com.dejavu.backend.calendar.dto;

import java.time.LocalDateTime;

public record CalendarBookmarkRow(
	Long bookmarkId,
	Long jobNoticeId,
	String companyName,
	String title,
	LocalDateTime deadlineAt
) {
}

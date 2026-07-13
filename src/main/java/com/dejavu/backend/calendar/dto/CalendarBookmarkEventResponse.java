package com.dejavu.backend.calendar.dto;

import java.time.LocalDateTime;

public record CalendarBookmarkEventResponse(
	Long bookmarkId,
	Long jobNoticeId,
	String companyName,
	String title,
	LocalDateTime deadlineAt,
	String recruitStatus,
	String recruitStatusText,
	long daysUntilDeadline,
	String colorType
) {
}

package com.dejavu.backend.calendar.dto;

import java.time.LocalDateTime;

public record CalendarJobNoticeEventResponse(
	Long jobNoticeId,
	String companyName,
	String title,
	LocalDateTime deadlineAt,
	String eventType,
	String recruitStatus,
	String recruitStatusText
) {
}

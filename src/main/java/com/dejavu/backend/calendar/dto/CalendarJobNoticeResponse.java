package com.dejavu.backend.calendar.dto;

import java.util.List;

public record CalendarJobNoticeResponse(
	int year,
	int month,
	List<CalendarJobNoticeEventResponse> events
) {
}

package com.dejavu.backend.calendar.dto;

import java.util.List;

public record CalendarBookmarkResponse(
	int year,
	int month,
	CalendarBookmarkSummaryResponse summary,
	List<CalendarBookmarkEventResponse> events
) {
}

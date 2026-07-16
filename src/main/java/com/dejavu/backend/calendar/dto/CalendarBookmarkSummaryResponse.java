package com.dejavu.backend.calendar.dto;

public record CalendarBookmarkSummaryResponse(
	long openCount,
	long closingSoonCount,
	long closedCount
) {
}

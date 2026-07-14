package com.dejavu.backend.calendar.dto;

import java.time.LocalDateTime;
import java.util.List;

public record CalendarJobNoticeRow(
	Long jobNoticeId,
	String companyName,
	String title,
	LocalDateTime deadlineAt,
	String roleKeywordsText,
	List<String> skillNames
) {
}

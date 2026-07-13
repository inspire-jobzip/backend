package com.dejavu.backend.calendar.controller;

import com.dejavu.backend.calendar.dto.CalendarBookmarkResponse;
import com.dejavu.backend.calendar.dto.CalendarJobNoticeResponse;
import com.dejavu.backend.calendar.service.CalendarService;
import com.dejavu.backend.common.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/calendar")
@RequiredArgsConstructor
public class CalendarController {

	private final CalendarService calendarService;

	@GetMapping("/job-notices")
	public ApiResponse<CalendarJobNoticeResponse> getJobNoticeEvents(
		@RequestParam(required = false) String year,
		@RequestParam(required = false) String month,
		@RequestParam(required = false) String jobRole,
		@RequestParam(required = false) String skillNames
	) {
		CalendarJobNoticeResponse response = calendarService.readJobNoticeEvents(year, month, jobRole, skillNames);

		return ApiResponse.ok(response);
	}

	@GetMapping("/bookmarks")
	public ApiResponse<CalendarBookmarkResponse> getBookmarkEvents(
		@RequestHeader(value = "Authorization", required = false) String authorizationHeader,
		@RequestParam(required = false) String year,
		@RequestParam(required = false) String month
	) {
		CalendarBookmarkResponse response = calendarService.readBookmarkEvents(authorizationHeader, year, month);

		return ApiResponse.ok(response);
	}
}

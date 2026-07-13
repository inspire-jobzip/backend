package com.dejavu.backend.calendar.controller;

import com.dejavu.backend.calendar.dto.CalendarBookmarkResponse;
import com.dejavu.backend.calendar.dto.CalendarJobNoticeResponse;
import com.dejavu.backend.calendar.service.CalendarService;
import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.common.ApiResponse;
import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
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
		@AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser,
		@RequestParam(required = false) String year,
		@RequestParam(required = false) String month
	) {
		CalendarBookmarkResponse response = calendarService.readBookmarkEvents(
			getAuthenticatedUserId(authenticatedUser),
			year,
			month
		);

		return ApiResponse.ok(response);
	}

	private Long getAuthenticatedUserId(JwtAuthenticatedUser authenticatedUser) {
		if (authenticatedUser == null || authenticatedUser.userId() == null) {
			throw new ApiException(HttpStatus.UNAUTHORIZED, "UNAUTHORIZED", "로그인이 필요합니다.");
		}

		return authenticatedUser.userId();
	}
}

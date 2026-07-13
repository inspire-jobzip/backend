package com.dejavu.backend.mypage.controller;

import com.dejavu.backend.common.ApiResponse;
import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import com.dejavu.backend.mypage.dto.MyPageSummaryResponse;
import com.dejavu.backend.mypage.service.MyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
public class MyPageController {

	private final MyPageService myPageService;

	@GetMapping("/mypage")
	public ApiResponse<MyPageSummaryResponse> readSummary(
		@AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser
	) {
		return ApiResponse.ok(myPageService.readSummary(authenticatedUser));
	}
}

package com.dejavu.backend.user.controller;

import com.dejavu.backend.common.ApiResponse;
import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import com.dejavu.backend.user.dto.UpdateMyProfileRequest;
import com.dejavu.backend.user.dto.UpdateMyProfileResponse;
import com.dejavu.backend.user.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/users")
public class UserController {

	private final UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
	}

	@PatchMapping("/me")
	public ApiResponse<UpdateMyProfileResponse> updateMyProfile(
		@AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser,
		@Valid @RequestBody UpdateMyProfileRequest request
	) {
		return ApiResponse.ok(userService.updateMyProfile(authenticatedUser, request));
	}
}

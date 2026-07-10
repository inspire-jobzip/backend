package com.dejavu.backend.auth.controller;

import com.dejavu.backend.auth.dto.LoginRequest;
import com.dejavu.backend.auth.dto.LoginResponse;
import com.dejavu.backend.auth.dto.LogoutRequest;
import com.dejavu.backend.auth.dto.RefreshTokenRequest;
import com.dejavu.backend.auth.dto.SignUpRequest;
import com.dejavu.backend.auth.dto.SignUpResponse;
import com.dejavu.backend.auth.dto.TokenRefreshResponse;
import com.dejavu.backend.auth.service.AuthService;
import com.dejavu.backend.common.api.ApiResponse;
import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {

	private final AuthService authService;

	public AuthController(AuthService authService) {
		this.authService = authService;
	}

	@PostMapping("/signup")
	public ResponseEntity<ApiResponse<SignUpResponse>> signUp(@Valid @RequestBody SignUpRequest request) {
		SignUpResponse response = authService.signUp(request);
		return ResponseEntity
			.status(HttpStatus.CREATED)
			.body(ApiResponse.success(response));
	}

	@PostMapping("/login")
	public ResponseEntity<ApiResponse<LoginResponse>> login(@Valid @RequestBody LoginRequest request) {
		LoginResponse response = authService.login(request);
		return ResponseEntity.ok(ApiResponse.success(response));
	}

	@PostMapping("/refresh")
	public ResponseEntity<ApiResponse<TokenRefreshResponse>> refresh(@Valid @RequestBody RefreshTokenRequest request) {
		TokenRefreshResponse response = authService.refreshToken(request);
		return ResponseEntity.ok(ApiResponse.success(response));
	}

	@PostMapping("/logout")
	public ResponseEntity<ApiResponse<Void>> logout(
		@AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser,
		@Valid @RequestBody LogoutRequest request
	) {
		authService.logout(authenticatedUser, request);
		return ResponseEntity.ok(ApiResponse.successMessage("로그아웃되었습니다."));
	}
}

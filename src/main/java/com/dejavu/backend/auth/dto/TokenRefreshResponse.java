package com.dejavu.backend.auth.dto;

public record TokenRefreshResponse(
	String accessToken,
	String refreshToken
) {
}

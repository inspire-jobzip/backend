package com.dejavu.backend.auth.dto;

public record LoginResponse(
	String accessToken,
	String refreshToken,
	LoginUserResponse user
) {
}

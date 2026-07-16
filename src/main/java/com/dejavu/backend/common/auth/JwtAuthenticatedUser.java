package com.dejavu.backend.common.auth;

public record JwtAuthenticatedUser(
	Long userId,
	String email
) {
}

package com.dejavu.backend.common.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.springframework.stereotype.Component;

@Component
public class Sha256TokenHasher {

	public String hash(String rawToken) {
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
			byte[] digest = messageDigest.digest(rawToken.getBytes(StandardCharsets.UTF_8));
			return toHex(digest);
		} catch (NoSuchAlgorithmException exception) {
			throw new IllegalStateException("토큰 해시에 실패했습니다.", exception);
		}
	}

	private String toHex(byte[] bytes) {
		StringBuilder builder = new StringBuilder();
		for (byte value : bytes) {
			builder.append(String.format("%02x", value));
		}
		return builder.toString();
	}
}

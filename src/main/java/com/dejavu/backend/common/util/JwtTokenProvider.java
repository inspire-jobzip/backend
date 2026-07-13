package com.dejavu.backend.common.util;

import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import com.dejavu.backend.common.config.JwtProperties;
import com.dejavu.backend.user.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Component;

@Component
public class JwtTokenProvider {

	private static final String HMAC_SHA256 = "HmacSHA256";
	private static final TypeReference<Map<String, Object>> MAP_TYPE = new TypeReference<>() {};

	private final JwtProperties jwtProperties;
	private final ObjectMapper objectMapper = new ObjectMapper();

	public JwtTokenProvider(JwtProperties jwtProperties) {
		this.jwtProperties = jwtProperties;
	}

	public String generateAccessToken(User user) {
		long issuedAt = Instant.now().getEpochSecond();
		long expiresAt = Instant.now().plusMillis(jwtProperties.getAccessExpiration()).getEpochSecond();

		Map<String, Object> header = Map.of(
			"alg", "HS256",
			"typ", "JWT"
		);

		Map<String, Object> payload = new LinkedHashMap<>();
		payload.put("sub", user.getEmail());
		payload.put("userId", user.getUserId());
		payload.put("desiredJobRole", user.getDesiredJobRole().name());
		payload.put("careerStatus", user.getCareerStatus().name());
		payload.put("iat", issuedAt);
		payload.put("exp", expiresAt);

		String encodedHeader = encode(header);
		String encodedPayload = encode(payload);
		String signature = sign(encodedHeader + "." + encodedPayload);

		return encodedHeader + "." + encodedPayload + "." + signature;
	}

	public boolean validateToken(String token) {
		try {
			String[] tokenParts = token.split("\\.");
			if (tokenParts.length != 3) {
				return false;
			}

			String expectedSignature = sign(tokenParts[0] + "." + tokenParts[1]);
			if (!expectedSignature.equals(tokenParts[2])) {
				return false;
			}

			Map<String, Object> payload = parsePayload(tokenParts[1]);
			Object expiration = payload.get("exp");
			if (!(expiration instanceof Number exp)) {
				return false;
			}

			return Instant.ofEpochSecond(exp.longValue()).isAfter(Instant.now());
		} catch (Exception exception) {
			return false;
		}
	}

	public JwtAuthenticatedUser getAuthenticatedUser(String token) {
		String[] tokenParts = token.split("\\.");
		Map<String, Object> payload = parsePayload(tokenParts[1]);

		Object userId = payload.get("userId");
		Object email = payload.get("sub");
		if (!(userId instanceof Number id) || !(email instanceof String subject)) {
			throw new IllegalStateException("JWT payload에 사용자 정보가 없습니다.");
		}

		return new JwtAuthenticatedUser(id.longValue(), subject);
	}

	public static BadCredentialsException unauthorizedException() {
		return new BadCredentialsException("유효하지 않은 액세스 토큰입니다.");
	}

	private String encode(Map<String, Object> value) {
		try {
			String json = objectMapper.writeValueAsString(value);
			return Base64.getUrlEncoder()
				.withoutPadding()
				.encodeToString(json.getBytes(StandardCharsets.UTF_8));
		} catch (JsonProcessingException exception) {
			throw new IllegalStateException("JWT payload를 직렬화할 수 없습니다.", exception);
		}
	}

	private String sign(String value) {
		try {
			Mac mac = Mac.getInstance(HMAC_SHA256);
			SecretKeySpec secretKeySpec = new SecretKeySpec(jwtProperties.getSecret().getBytes(StandardCharsets.UTF_8), HMAC_SHA256);
			mac.init(secretKeySpec);
			byte[] signature = mac.doFinal(value.getBytes(StandardCharsets.UTF_8));
			return Base64.getUrlEncoder().withoutPadding().encodeToString(signature);
		} catch (Exception exception) {
			throw new IllegalStateException("JWT 서명 생성에 실패했습니다.", exception);
		}
	}

	private Map<String, Object> parsePayload(String encodedPayload) {
		try {
			byte[] decodedPayload = Base64.getUrlDecoder().decode(encodedPayload);
			return objectMapper.readValue(decodedPayload, MAP_TYPE);
		} catch (Exception exception) {
			throw new IllegalStateException("JWT payload를 읽을 수 없습니다.", exception);
		}
	}
}

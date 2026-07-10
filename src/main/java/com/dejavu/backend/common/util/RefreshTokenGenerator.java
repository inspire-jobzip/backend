package com.dejavu.backend.common.util;

import java.util.UUID;
import org.springframework.stereotype.Component;

@Component
public class RefreshTokenGenerator {

	public String generate() {
		return UUID.randomUUID().toString() + UUID.randomUUID();
	}
}

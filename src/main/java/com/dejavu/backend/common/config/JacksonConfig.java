package com.dejavu.backend.common.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class JacksonConfig {

	@Bean
	@ConditionalOnMissingBean(ObjectMapper.class)
	ObjectMapper objectMapper() {
		// LocalDateTime이 포함된 AI 분석 JSON을 직렬화하기 위해 JavaTimeModule을 자동 등록한다.
		return new ObjectMapper().findAndRegisterModules();
	}
}

package com.dejavu.backend.common.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;
import java.util.ArrayList;
import java.util.List;

@Converter
public class JsonListConverter implements AttributeConverter<List<String>, String> {

	private static final TypeReference<List<String>> STRING_LIST_TYPE = new TypeReference<>() {};
	private final ObjectMapper objectMapper = new ObjectMapper();

	@Override
	public String convertToDatabaseColumn(List<String> attribute) {
		if (attribute == null) {
			return null;
		}

		if (attribute.isEmpty()) {
			return "[]";
		}

		try {
			return objectMapper.writeValueAsString(attribute);
		} catch (JsonProcessingException exception) {
			throw new IllegalArgumentException("기술스택 목록을 JSON으로 변환할 수 없습니다.", exception);
		}
	}

	@Override
	public List<String> convertToEntityAttribute(String dbData) {
		if (dbData == null) {
			return null;
		}

		if (dbData.isBlank()) {
			return new ArrayList<>();
		}

		try {
			return objectMapper.readValue(dbData, STRING_LIST_TYPE);
		} catch (JsonProcessingException exception) {
			throw new IllegalArgumentException("기술스택 JSON을 읽을 수 없습니다.", exception);
		}
	}
}

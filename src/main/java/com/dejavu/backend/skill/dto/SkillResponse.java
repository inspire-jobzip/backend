package com.dejavu.backend.skill.dto;

public record SkillResponse(
	Long skillId,
	String skillName,
	String category
) {
}

package com.dejavu.backend.ai.domain;

public record JobAiAnalysisPrompt(
	String jobRole,
	String companyName,
	String title,
	String description
) {
}

package com.dejavu.backend.ai.dto;

import java.time.LocalDateTime;
import java.util.List;

public record AiAnalysisResponse(
	Long jobNoticeId,
	boolean cached,
	AiAnalysis aiAnalysis
) {

	public record AiAnalysis(
		List<String> taskSummary,
		List<String> requiredSkills,
		LocalDateTime analyzedAt
	) {
	}
}

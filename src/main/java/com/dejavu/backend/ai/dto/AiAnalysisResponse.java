package com.dejavu.backend.ai.dto;

import com.dejavu.backend.ai.domain.SkillMatch;

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
            List<SkillMatch> mappedSkills,
            List<String> possibleTasks,
            LocalDateTime analyzedAt
    ) {
    }
}

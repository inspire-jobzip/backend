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
            String overview,
            List<String> taskSummary,
            List<String> responsibilities,
            List<String> qualifications,
            List<String> preferredQualifications,
            List<String> workConditions,
            List<String> benefits,
            List<String> hiringProcess,
            List<String> requiredSkills,
            List<SkillMatch> mappedSkills,
            List<String> possibleTasks,
            String applicationComment,
            String preferredSummary,
            String analysisSource,
            LocalDateTime analyzedAt
    ) {
    }
}

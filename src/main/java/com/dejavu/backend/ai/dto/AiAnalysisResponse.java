package com.dejavu.backend.ai.dto;

import com.dejavu.backend.ai.domain.SkillMatch;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.time.LocalDateTime;
import java.util.List;

public record AiAnalysisResponse(
        Long jobNoticeId,
        boolean cached,
        AiAnalysis aiAnalysis
) {

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record AiAnalysis(
            @JsonIgnore
            String overview,
            List<String> taskSummary,
            @JsonIgnore
            List<String> responsibilities,
            @JsonIgnore
            List<String> qualifications,
            @JsonIgnore
            List<String> preferredQualifications,
            @JsonIgnore
            List<String> workConditions,
            @JsonIgnore
            List<String> benefits,
            @JsonIgnore
            List<String> hiringProcess,
            List<String> requiredSkills,
            @JsonIgnore
            List<SkillMatch> mappedSkills,
            List<String> possibleTasks,
            @JsonIgnore
            String applicationComment,
            @JsonIgnore
            String preferredSummary,
            @JsonIgnore
            String analysisSource,
            LocalDateTime analyzedAt
    ) {
    }
}

package com.dejavu.backend.ai.dto;

import com.dejavu.backend.ai.domain.SkillMatch;

import java.util.List;

public record ResumeKeywordResponse(
        Long jobNoticeId,
        Long resumeId,
        List<SkillMatch> mappedJobSkills,
        List<String> jobKeywords,
        List<String> resumeKeywords,
        List<String> matchedKeywords,
        List<String> missingKeywords,
        double jaccardScore,
        List<String> baseSkills,
        String recommendedReason
) {
}

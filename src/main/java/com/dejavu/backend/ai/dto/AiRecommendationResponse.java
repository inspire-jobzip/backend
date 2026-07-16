package com.dejavu.backend.ai.dto;

import java.time.LocalDateTime;
import java.util.List;

public record AiRecommendationResponse(
        Long aiRecommendationId,
        Long userId,
        Long jobNoticeId,
        Long resumeId,
        String feedbackText,
        List<String> missingKeywords,
        String recommendedProjectTitle,
        String recommendedProjectDescription,
        String modelName,
        LocalDateTime createdAt
) {
}

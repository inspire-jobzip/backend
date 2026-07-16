package com.dejavu.backend.ai.dto;

import jakarta.validation.constraints.NotNull;

public record AiRecommendationRequest(
        @NotNull Long jobNoticeId,
        Long resumeId
) {
}

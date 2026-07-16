package com.dejavu.backend.ai.domain;

import java.util.List;

public record JobNoticeSnapshot(
        Long jobNoticeId,
        String companyName,
        String title,
        String jobCategory,
        String locationText,
        String experienceLevel,
        String employmentType,
        String educationLevel,
        String salaryText,
        String descriptionRaw,
        String rawPayload,
        List<String> keywords
) {
}

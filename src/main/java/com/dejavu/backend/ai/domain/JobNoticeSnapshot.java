package com.dejavu.backend.ai.domain;

import java.util.List;

public record JobNoticeSnapshot(
        Long jobNoticeId,
        String companyName,
        String title,
        String jobCategory,
        String descriptionRaw,
        List<String> keywords
) {
}

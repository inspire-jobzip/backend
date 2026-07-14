package com.dejavu.backend.resume.dto;

import java.util.List;

public record ResumeProjectUpdateRequest(
        String projectName,
        String roleName,
        String startYearMonth,
        String endYearMonth,
        String description,
        String troubleshooting,
        List<String> techStacks,
        Integer sortOrder
) {
}

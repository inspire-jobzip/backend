package com.dejavu.backend.resume.dto;

import jakarta.validation.constraints.NotBlank;

import java.util.List;

public record ResumeProjectRequest(
        @NotBlank String projectName,
        String roleName,
        String startYearMonth,
        String endYearMonth,
        String description,
        String troubleshooting,
        List<String> techStacks,
        Integer sortOrder
) {
}

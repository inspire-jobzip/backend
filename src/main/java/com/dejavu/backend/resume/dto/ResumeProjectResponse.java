package com.dejavu.backend.resume.dto;

import com.dejavu.backend.resume.domain.ResumeProject;

import java.time.LocalDateTime;
import java.util.List;

public record ResumeProjectResponse(
        Long resumeProjectId,
        Long resumeId,
        String projectName,
        String roleName,
        String startYearMonth,
        String endYearMonth,
        String description,
        String troubleshooting,
        List<String> techStacks,
        int sortOrder,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
) {

    public static ResumeProjectResponse from(ResumeProject project) {
        return new ResumeProjectResponse(
                project.getResumeProjectId(),
                project.getResumeId(),
                project.getProjectName(),
                project.getRoleName(),
                project.getStartYearMonth(),
                project.getEndYearMonth(),
                project.getDescription(),
                project.getTroubleshooting(),
                project.getTechStacks(),
                project.getSortOrder(),
                project.getCreatedAt(),
                project.getUpdatedAt()
        );
    }
}

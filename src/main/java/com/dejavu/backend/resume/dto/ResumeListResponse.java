package com.dejavu.backend.resume.dto;

import com.dejavu.backend.resume.domain.Resume;

import java.time.LocalDateTime;

public record ResumeListResponse(
        Long resumeId,
        String title,
        String name,
        boolean isDefault,
        LocalDateTime updatedAt
) {

    public static ResumeListResponse from(Resume resume) {
        return new ResumeListResponse(
                resume.getResumeId(),
                resume.getTitle(),
                resume.getName(),
                resume.isDefault(),
                resume.getUpdatedAt()
        );
    }
}

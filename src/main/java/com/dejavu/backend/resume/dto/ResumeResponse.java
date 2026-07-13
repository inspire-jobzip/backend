package com.dejavu.backend.resume.dto;

import com.dejavu.backend.resume.domain.Resume;

import java.time.LocalDateTime;
import java.util.List;

public record ResumeResponse(
        Long resumeId,
        String title,
        String name,
        String email,
        String phone,
        String githubUrl,
        String blogUrl,
        String summaryText,
        List<String> education,
        List<String> experience,
        List<String> resumeSkillNames,
        String motivationText,
        String strengthsAndWeaknessesText,
        boolean isDefault,
        List<ResumeProjectResponse> projects,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
) {

    public static ResumeResponse from(Resume resume) {
        return new ResumeResponse(
                resume.getResumeId(),
                resume.getTitle(),
                resume.getName(),
                resume.getEmail(),
                resume.getPhone(),
                resume.getGithubUrl(),
                resume.getBlogUrl(),
                resume.getSummaryText(),
                resume.getEducation(),
                resume.getExperience(),
                resume.getResumeSkillNames(),
                resume.getMotivationText(),
                resume.getStrengthsAndWeaknessesText(),
                resume.isDefault(),
                resume.getProjects().stream().map(ResumeProjectResponse::from).toList(),
                resume.getCreatedAt(),
                resume.getUpdatedAt()
        );
    }
}

package com.dejavu.backend.resume.dto;

import com.dejavu.backend.resume.domain.ResumeExperience;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

import java.util.List;

public record ResumeRequest(
        @NotBlank String title,
        @NotBlank String name,
        @Email @NotBlank String email,
        String phone,
        String githubUrl,
        String blogUrl,
        String summaryText,
        List<String> education,
        List<@Valid ResumeExperience> experience,
        List<String> resumeSkillNames,
        String motivationText,
        String strengthsAndWeaknessesText,
        boolean isDefault
) {
}

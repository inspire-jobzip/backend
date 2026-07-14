package com.dejavu.backend.resume.dto;

import com.dejavu.backend.resume.domain.ResumeEducation;
import com.dejavu.backend.resume.domain.ResumeExperience;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;

import java.util.List;

public record ResumeUpdateRequest(
        String title,
        String name,
        @Email String email,
        String phone,
        String githubUrl,
        String blogUrl,
        String summaryText,
        List<@Valid ResumeEducation> education,
        List<@Valid ResumeExperience> experience,
        List<String> resumeSkillNames,
        String motivationText,
        String strengthsAndWeaknessesText,
        Boolean isDefault
) {
}

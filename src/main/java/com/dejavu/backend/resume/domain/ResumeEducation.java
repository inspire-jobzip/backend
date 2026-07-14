package com.dejavu.backend.resume.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@JsonIgnoreProperties(ignoreUnknown = true)
public record ResumeEducation(
        @NotBlank
        @Size(max = 100)
        String schoolName,
        @Size(max = 100)
        String major,
        @Size(max = 50)
        String status,
        @Pattern(regexp = "^\\d{4}-(0[1-9]|1[0-2])$")
        String startYearMonth,
        @Pattern(regexp = "^\\d{4}-(0[1-9]|1[0-2])$")
        String endYearMonth
) {
}

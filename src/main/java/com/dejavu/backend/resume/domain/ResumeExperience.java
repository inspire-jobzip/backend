package com.dejavu.backend.resume.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

@JsonIgnoreProperties(ignoreUnknown = true)
public record ResumeExperience(
        @NotBlank
        String companyName,
        @NotBlank
        String roleName,
        EmploymentType employmentType,
        @NotBlank
        @Pattern(regexp = "^\\d{4}-\\d{2}$")
        String startYearMonth,
        @Pattern(regexp = "^\\d{4}-\\d{2}$")
        String endYearMonth,
        @NotNull
        Boolean isCurrent,
        String responsibilities,
        @NotNull
        Integer sortOrder
) {
    public ResumeExperience {
        if (Boolean.TRUE.equals(isCurrent)) {
            endYearMonth = null;
        }
    }

    @JsonIgnore
    @AssertTrue(message = "현재 재직 중이 아니면 퇴사 연월이 필요합니다.")
    public boolean isEndYearMonthValid() {
        return Boolean.TRUE.equals(isCurrent) || (endYearMonth != null && !endYearMonth.isBlank());
    }
}

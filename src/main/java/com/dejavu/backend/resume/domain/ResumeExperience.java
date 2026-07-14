package com.dejavu.backend.resume.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

import java.time.YearMonth;
import java.time.format.DateTimeParseException;

@JsonIgnoreProperties(ignoreUnknown = true)
public record ResumeExperience(
        @NotBlank
        @Size(max = 100)
        String companyName,
        @NotBlank
        @Size(max = 100)
        String roleName,
        @NotNull
        EmploymentType employmentType,
        @NotBlank
        @Pattern(regexp = "^\\d{4}-(0[1-9]|1[0-2])$")
        String startYearMonth,
        @Pattern(regexp = "^\\d{4}-(0[1-9]|1[0-2])$")
        String endYearMonth,
        @NotNull
        Boolean isCurrent,
        @Size(max = 2000)
        String responsibilities,
        @NotNull
        @Positive
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

    @JsonIgnore
    @AssertTrue(message = "퇴사 연월은 입사 연월보다 빠를 수 없습니다.")
    public boolean isYearMonthRangeValid() {
        if (Boolean.TRUE.equals(isCurrent)) {
            return endYearMonth == null;
        }

        if (startYearMonth == null || endYearMonth == null) {
            return false;
        }

        try {
            YearMonth start = YearMonth.parse(startYearMonth);
            YearMonth end = YearMonth.parse(endYearMonth);
            return !end.isBefore(start);
        } catch (DateTimeParseException exception) {
            return false;
        }
    }
}

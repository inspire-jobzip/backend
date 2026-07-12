package com.dejavu.backend.jobNotices.domain.dto;

import java.time.LocalDateTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class JobNoticesDetailRepositoryRow {

	private Long jobNoticeId;
	private String externalNoticeId;
	private String companyName;
	private String title;
	private String sourceUrl;
	private String jobCategory;
	private String locationText;
	private String experienceLevel;
	private String employmentType;
	private String educationLevel;
	private String salaryText;
	private LocalDateTime deadlineAt;
	private String roleKeywordsText;
	private String descriptionRaw;
	private List<String> skillNames;
}

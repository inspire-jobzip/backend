package com.dejavu.backend.features.jobNotices.domain.dto;

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
public class JobNoticesRepositoryRow {

	private Long jobNoticeId;
	private String companyName;
	private String title;
	private String jobCategory;
	private String locationText;
	private String experienceLevel;
	private String employmentType;
	private LocalDateTime deadlineAt;
	private String roleKeywordsText;
	private List<String> skillNames;
}

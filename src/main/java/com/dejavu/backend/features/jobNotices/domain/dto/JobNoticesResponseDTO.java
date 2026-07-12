package com.dejavu.backend.features.jobNotices.domain.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.time.LocalDateTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Builder
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class JobNoticesResponseDTO {

	private Long jobNoticeId;
	private String companyName;
	private String title;
	private String jobCategory;
	private String locationText;
	private String experienceLevel;
	private String employmentType;
	private LocalDateTime deadlineAt;
	private List<String> skillNames;
	@JsonProperty("isBookmarked")
	private boolean isBookmarked;
}

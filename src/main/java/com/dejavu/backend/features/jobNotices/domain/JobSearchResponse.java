package com.dejavu.backend.features.jobNotices.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;

public record JobSearchResponse(
	Jobs jobs
) {

	public record Jobs(
		int count,
		int start,
		String total,
		List<JobPosting> job
	) {
	}

	public record JobPosting(
		String id,
		String url,
		int active,
		Company company,
		Position position,
		String keyword,
		CodeName salary,
		@JsonProperty("posting-timestamp")
		String postingTimestamp,
		@JsonProperty("posting-date")
		String postingDate,
		@JsonProperty("modification-timestamp")
		String modificationTimestamp,
		@JsonProperty("opening-timestamp")
		String openingTimestamp,
		@JsonProperty("expiration-timestamp")
		String expirationTimestamp,
		@JsonProperty("expiration-date")
		String expirationDate,
		@JsonProperty("close-type")
		CodeName closeType,
		@JsonProperty("read-cnt")
		String readCount,
		@JsonProperty("apply-cnt")
		String applyCount
	) {
	}

	public record Company(
		CompanyDetail detail
	) {
	}

	public record CompanyDetail(
		String href,
		String name
	) {
	}

	public record Position(
		String title,
		CodeName industry,
		CodeName location,
		@JsonProperty("job-type")
		CodeName jobType,
		@JsonProperty("job-mid-code")
		CodeName jobMidCode,
		@JsonProperty("job-code")
		CodeName jobCode,
		@JsonProperty("experience-level")
		ExperienceLevel experienceLevel,
		@JsonProperty("required-education-level")
		CodeName requiredEducationLevel
	) {
	}

	public record ExperienceLevel(
		int code,
		int min,
		int max,
		String name
	) {
	}

	public record CodeName(
		String code,
		String name
	) {
	}
}

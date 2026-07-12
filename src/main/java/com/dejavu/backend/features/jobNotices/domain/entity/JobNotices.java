package com.dejavu.backend.features.jobNotices.domain.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

// Bookmarks, ai_recommendations JPA entity 작성 후 다시 테스트 할 예정

@Entity
@Table(
	name = "job_notices",
	uniqueConstraints = {
		@UniqueConstraint(name = "uk_job_notices_external_notice_id", columnNames = "external_notice_id")
	},
	indexes = {
		@Index(name = "idx_job_notices_company_name", columnList = "company_name"),
		@Index(name = "idx_job_notices_job_category", columnList = "job_category"),
		@Index(name = "idx_job_notices_location_text", columnList = "location_text"),
		@Index(name = "idx_job_notices_experience_level", columnList = "experience_level"),
		@Index(name = "idx_job_notices_deadline_at", columnList = "deadline_at"),
		@Index(name = "idx_job_notices_is_active", columnList = "is_active")
	}
)
public class JobNotices {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_notice_id")
	private Long jobNoticeId;

	@Column(name = "external_notice_id", nullable = false, length = 100, unique = true)
	private String externalNoticeId;

	@Column(name = "company_name", nullable = false, length = 200)
	private String companyName;

	@Column(name = "title", nullable = false, length = 300)
	private String title;

	@Column(name = "source_url", length = 1000)
	private String sourceUrl;

	@Column(name = "job_category", length = 100)
	private String jobCategory;

	@Column(name = "location_text")
	private String locationText;

	@Column(name = "experience_level", length = 50)
	private String experienceLevel;

	@Column(name = "employment_type", length = 50)
	private String employmentType;

	@Column(name = "education_level", length = 100)
	private String educationLevel;

	@Column(name = "salary_text")
	private String salaryText;

	@Column(name = "deadline_at", columnDefinition = "TIMESTAMP NULL")
	private LocalDateTime deadlineAt;

	@Column(name = "role_keywords_text", columnDefinition = "TEXT")
	private String roleKeywordsText;

	@Column(name = "description_raw", columnDefinition = "TEXT")
	private String descriptionRaw;

	@Column(name = "ai_analysis_json", columnDefinition = "JSON")
	private String aiAnalysisJson;

	@Column(name = "raw_payload", columnDefinition = "JSON")
	private String rawPayload;

	// ddl-auto=create 검증 시에도 SQL 스키마와 같은 기본 수집 시각을 만든다.
	@Column(name = "fetched_at", nullable = false, columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP")
	private LocalDateTime fetchedAt;

	@Column(name = "is_active", nullable = false, columnDefinition = "BOOLEAN NOT NULL DEFAULT TRUE")
	private Boolean active;

	// 생성/수정 시각은 애플리케이션이 아니라 DB 기본값과 ON UPDATE에 맡긴다.
	@Column(
		name = "created_at",
		nullable = false,
		insertable = false,
		updatable = false,
		columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP"
	)
	private LocalDateTime createdAt;

	@Column(
		name = "updated_at",
		nullable = false,
		insertable = false,
		updatable = false,
		columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"
	)
	private LocalDateTime updatedAt;

	@OneToMany(mappedBy = "jobNotice")
	private List<JobNoticeSkills> jobNoticeSkills = new ArrayList<>();

	protected JobNotices() {
	}

	public Long getJobNoticeId() {
		return jobNoticeId;
	}

	public String getExternalNoticeId() {
		return externalNoticeId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public String getTitle() {
		return title;
	}

	public String getSourceUrl() {
		return sourceUrl;
	}

	public String getJobCategory() {
		return jobCategory;
	}

	public String getLocationText() {
		return locationText;
	}

	public String getExperienceLevel() {
		return experienceLevel;
	}

	public String getEmploymentType() {
		return employmentType;
	}

	public String getEducationLevel() {
		return educationLevel;
	}

	public String getSalaryText() {
		return salaryText;
	}

	public LocalDateTime getDeadlineAt() {
		return deadlineAt;
	}

	public String getRoleKeywordsText() {
		return roleKeywordsText;
	}

	public String getDescriptionRaw() {
		return descriptionRaw;
	}

	public String getAiAnalysisJson() {
		return aiAnalysisJson;
	}

	public String getRawPayload() {
		return rawPayload;
	}

	public LocalDateTime getFetchedAt() {
		return fetchedAt;
	}

	public Boolean getActive() {
		return active;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public List<JobNoticeSkills> getJobNoticeSkills() {
		return jobNoticeSkills;
	}
}

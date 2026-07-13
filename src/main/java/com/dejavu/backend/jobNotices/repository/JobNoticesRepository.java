package com.dejavu.backend.jobNotices.repository;

import com.dejavu.backend.jobNotices.domain.dto.JobNoticesDetailRepositoryRow;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesRepositoryRow;
import com.dejavu.backend.jobNotices.domain.entity.JobNotices;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface JobNoticesRepository extends JpaRepository<JobNotices, Long> {

	@Query(
		value = """
			SELECT
			  job_notices.job_notice_id AS jobNoticeId,
			  job_notices.company_name AS companyName,
			  job_notices.title AS title,
			  job_notices.job_category AS jobCategory,
			  job_notices.location_text AS locationText,
			  job_notices.experience_level AS experienceLevel,
			  job_notices.employment_type AS employmentType,
			  job_notices.deadline_at AS deadlineAt,
			  job_notices.role_keywords_text AS roleKeywordsText,
			  COALESCE(GROUP_CONCAT(skills.skill_name ORDER BY skills.skill_name SEPARATOR ','), '') AS skillNames
			FROM job_notices
			LEFT JOIN job_notice_skills
			  ON job_notices.job_notice_id = job_notice_skills.job_notice_id
			LEFT JOIN skills
			  ON job_notice_skills.skill_id = skills.skill_id
			WHERE job_notices.is_active = TRUE
			  AND (:keyword IS NULL OR :keyword = ''
			    OR job_notices.company_name LIKE CONCAT('%', :keyword, '%')
			    OR job_notices.title LIKE CONCAT('%', :keyword, '%'))
			  AND (:location IS NULL OR :location = ''
			    OR job_notices.location_text LIKE CONCAT('%', :location, '%'))
			GROUP BY
			  job_notices.job_notice_id,
			  job_notices.company_name,
			  job_notices.title,
			  job_notices.job_category,
			  job_notices.location_text,
			  job_notices.experience_level,
			  job_notices.employment_type,
			  job_notices.deadline_at,
			  job_notices.role_keywords_text
			""",
		nativeQuery = true
	)
	List<JobNoticesListProjection> findActiveJobNoticeRows(
		@Param("keyword") String keyword,
		@Param("location") String location
	);

	@Query(
		value = """
			SELECT
			  job_notices.job_notice_id AS jobNoticeId,
			  job_notices.external_notice_id AS externalNoticeId,
			  job_notices.company_name AS companyName,
			  job_notices.title AS title,
			  job_notices.source_url AS sourceUrl,
			  job_notices.job_category AS jobCategory,
			  job_notices.location_text AS locationText,
			  job_notices.experience_level AS experienceLevel,
			  job_notices.employment_type AS employmentType,
			  job_notices.education_level AS educationLevel,
			  job_notices.salary_text AS salaryText,
			  job_notices.deadline_at AS deadlineAt,
			  job_notices.role_keywords_text AS roleKeywordsText,
			  job_notices.description_raw AS descriptionRaw,
			  COALESCE(GROUP_CONCAT(skills.skill_name ORDER BY skills.skill_name SEPARATOR ','), '') AS skillNames
			FROM job_notices
			LEFT JOIN job_notice_skills
			  ON job_notices.job_notice_id = job_notice_skills.job_notice_id
			LEFT JOIN skills
			  ON job_notice_skills.skill_id = skills.skill_id
			WHERE job_notices.is_active = TRUE
			  AND job_notices.job_notice_id = :jobNoticeId
			GROUP BY
			  job_notices.job_notice_id,
			  job_notices.external_notice_id,
			  job_notices.company_name,
			  job_notices.title,
			  job_notices.source_url,
			  job_notices.job_category,
			  job_notices.location_text,
			  job_notices.experience_level,
			  job_notices.employment_type,
			  job_notices.education_level,
			  job_notices.salary_text,
			  job_notices.deadline_at,
			  job_notices.role_keywords_text,
			  job_notices.description_raw
			""",
		nativeQuery = true
	)
	Optional<JobNoticesDetailProjection> findActiveJobNoticeRow(@Param("jobNoticeId") Long jobNoticeId);

	Optional<JobNotices> findByExternalNoticeId(String externalNoticeId);

	default List<JobNoticesRepositoryRow> findActiveJobNotices(String keyword, String location) {
		return findActiveJobNoticeRows(keyword, location)
			.stream()
			.map(row -> JobNoticesRepositoryRow.builder()
				.jobNoticeId(row.getJobNoticeId())
				.companyName(row.getCompanyName())
				.title(row.getTitle())
				.jobCategory(row.getJobCategory())
				.locationText(row.getLocationText())
				.experienceLevel(row.getExperienceLevel())
				.employmentType(row.getEmploymentType())
				.deadlineAt(row.getDeadlineAt())
				.roleKeywordsText(row.getRoleKeywordsText())
				.skillNames(getSkillNames(row.getSkillNames()))
				.build())
			.toList();
	}

	default Optional<JobNoticesDetailRepositoryRow> findActiveJobNotice(Long jobNoticeId) {
		return findActiveJobNoticeRow(jobNoticeId)
			.map(row -> JobNoticesDetailRepositoryRow.builder()
				.jobNoticeId(row.getJobNoticeId())
				.externalNoticeId(row.getExternalNoticeId())
				.companyName(row.getCompanyName())
				.title(row.getTitle())
				.sourceUrl(row.getSourceUrl())
				.jobCategory(row.getJobCategory())
				.locationText(row.getLocationText())
				.experienceLevel(row.getExperienceLevel())
				.employmentType(row.getEmploymentType())
				.educationLevel(row.getEducationLevel())
				.salaryText(row.getSalaryText())
				.deadlineAt(row.getDeadlineAt())
				.roleKeywordsText(row.getRoleKeywordsText())
				.descriptionRaw(row.getDescriptionRaw())
				.skillNames(getSkillNames(row.getSkillNames()))
				.build());
	}

	private List<String> getSkillNames(String skillNames) {
		if (skillNames == null || skillNames.isBlank()) {
			return List.of();
		}

		return Arrays.stream(skillNames.split(","))
			.map(String::trim)
			.filter(skillName -> !skillName.isBlank())
			.toList();
	}

	interface JobNoticesListProjection {

		Long getJobNoticeId();

		String getCompanyName();

		String getTitle();

		String getJobCategory();

		String getLocationText();

		String getExperienceLevel();

		String getEmploymentType();

		LocalDateTime getDeadlineAt();

		String getRoleKeywordsText();

		String getSkillNames();
	}

	interface JobNoticesDetailProjection {

		Long getJobNoticeId();

		String getExternalNoticeId();

		String getCompanyName();

		String getTitle();

		String getSourceUrl();

		String getJobCategory();

		String getLocationText();

		String getExperienceLevel();

		String getEmploymentType();

		String getEducationLevel();

		String getSalaryText();

		LocalDateTime getDeadlineAt();

		String getRoleKeywordsText();

		String getDescriptionRaw();

		String getSkillNames();
	}
}

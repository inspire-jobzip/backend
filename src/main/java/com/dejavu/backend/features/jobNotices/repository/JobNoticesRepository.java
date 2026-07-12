package com.dejavu.backend.features.jobNotices.repository;

import com.dejavu.backend.features.jobNotices.domain.dto.JobNoticesRepositoryRow;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class JobNoticesRepository {

	// 공고별 기술스택을 응답에 한 번에 싣기 위해 N:M 관계를 skill_names로 집계한다.
	private static final String BASE_SELECT_QUERY = """
		SELECT
		  job_notices.job_notice_id,
		  job_notices.company_name,
		  job_notices.title,
		  job_notices.job_category,
		  job_notices.location_text,
		  job_notices.experience_level,
		  job_notices.employment_type,
		  job_notices.deadline_at,
		  job_notices.role_keywords_text,
		  COALESCE(GROUP_CONCAT(skills.skill_name ORDER BY skills.skill_name SEPARATOR ','), '') AS skill_names
		FROM job_notices
		LEFT JOIN job_notice_skills
		  ON job_notices.job_notice_id = job_notice_skills.job_notice_id
		LEFT JOIN skills
		  ON job_notice_skills.skill_id = skills.skill_id
		WHERE job_notices.is_active = TRUE
		""";

	private final JdbcTemplate jdbcTemplate;

	public List<JobNoticesRepositoryRow> findActiveJobNotices(String keyword, String location) {
		StringBuilder query = new StringBuilder(BASE_SELECT_QUERY);
		List<Object> parameters = new ArrayList<>();

		appendKeywordCondition(query, parameters, keyword);
		appendLocationCondition(query, parameters, location);

		query.append("""
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
			""");

		return jdbcTemplate.query(query.toString(), this::mapToJobNoticeRow, parameters.toArray());
	}

	private void appendKeywordCondition(StringBuilder query, List<Object> parameters, String keyword) {
		if (keyword == null || keyword.isBlank()) {
			return;
		}

		String keywordPattern = "%" + keyword.trim() + "%";
		query.append("AND (job_notices.company_name LIKE ? OR job_notices.title LIKE ?) ");
		parameters.add(keywordPattern);
		parameters.add(keywordPattern);
	}

	private void appendLocationCondition(StringBuilder query, List<Object> parameters, String location) {
		if (location == null || location.isBlank()) {
			return;
		}

		query.append("AND job_notices.location_text LIKE ? ");
		parameters.add("%" + location.trim() + "%");
	}

	private JobNoticesRepositoryRow mapToJobNoticeRow(ResultSet resultSet, int rowNumber) throws SQLException {
		return JobNoticesRepositoryRow.builder()
			.jobNoticeId(resultSet.getLong("job_notice_id"))
			.companyName(resultSet.getString("company_name"))
			.title(resultSet.getString("title"))
			.jobCategory(resultSet.getString("job_category"))
			.locationText(resultSet.getString("location_text"))
			.experienceLevel(resultSet.getString("experience_level"))
			.employmentType(resultSet.getString("employment_type"))
			.deadlineAt(getLocalDateTime(resultSet.getTimestamp("deadline_at")))
			.roleKeywordsText(resultSet.getString("role_keywords_text"))
			.skillNames(getSkillNames(resultSet.getString("skill_names")))
			.build();
	}

	private java.time.LocalDateTime getLocalDateTime(Timestamp timestamp) {
		return timestamp == null ? null : timestamp.toLocalDateTime();
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
}

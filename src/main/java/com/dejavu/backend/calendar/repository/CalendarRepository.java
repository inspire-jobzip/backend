package com.dejavu.backend.calendar.repository;

import com.dejavu.backend.calendar.dto.CalendarBookmarkRow;
import com.dejavu.backend.calendar.dto.CalendarJobNoticeRow;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class CalendarRepository {

	private static final String JOB_NOTICE_EVENTS_QUERY = """
		SELECT
		  job_notices.job_notice_id,
		  job_notices.company_name,
		  job_notices.title,
		  job_notices.deadline_at,
		  job_notices.role_keywords_text,
		  COALESCE(GROUP_CONCAT(skills.skill_name ORDER BY skills.skill_name SEPARATOR ','), '') AS skill_names
		FROM job_notices
		LEFT JOIN job_notice_skills
		  ON job_notices.job_notice_id = job_notice_skills.job_notice_id
		LEFT JOIN skills
		  ON job_notice_skills.skill_id = skills.skill_id
		WHERE job_notices.is_active = TRUE
		  AND job_notices.deadline_at >= ?
		  AND job_notices.deadline_at < ?
		GROUP BY
		  job_notices.job_notice_id,
		  job_notices.company_name,
		  job_notices.title,
		  job_notices.deadline_at,
		  job_notices.role_keywords_text
		ORDER BY job_notices.deadline_at ASC, job_notices.job_notice_id ASC
		""";

	private static final String BOOKMARK_EVENTS_QUERY = """
		SELECT
		  bookmarks.bookmark_id,
		  job_notices.job_notice_id,
		  job_notices.company_name,
		  job_notices.title,
		  job_notices.deadline_at
		FROM bookmarks
		JOIN job_notices
		  ON bookmarks.job_notice_id = job_notices.job_notice_id
		WHERE bookmarks.user_id = ?
		  AND job_notices.deadline_at >= ?
		  AND job_notices.deadline_at < ?
		ORDER BY job_notices.deadline_at ASC, bookmarks.bookmark_id ASC
		""";

	private final JdbcTemplate jdbcTemplate;

	public List<CalendarJobNoticeRow> findJobNoticeEvents(LocalDateTime startAt, LocalDateTime endAt) {
		return jdbcTemplate.query(JOB_NOTICE_EVENTS_QUERY, this::mapToJobNoticeRow, startAt, endAt);
	}

	public List<CalendarBookmarkRow> findBookmarkEvents(Long userId, LocalDateTime startAt, LocalDateTime endAt) {
		return jdbcTemplate.query(BOOKMARK_EVENTS_QUERY, this::mapToBookmarkRow, userId, startAt, endAt);
	}

	private CalendarJobNoticeRow mapToJobNoticeRow(ResultSet resultSet, int rowNumber) throws SQLException {
		return new CalendarJobNoticeRow(
			resultSet.getLong("job_notice_id"),
			resultSet.getString("company_name"),
			resultSet.getString("title"),
			getLocalDateTime(resultSet.getTimestamp("deadline_at")),
			resultSet.getString("role_keywords_text"),
			getSkillNames(resultSet.getString("skill_names"))
		);
	}

	private CalendarBookmarkRow mapToBookmarkRow(ResultSet resultSet, int rowNumber) throws SQLException {
		return new CalendarBookmarkRow(
			resultSet.getLong("bookmark_id"),
			resultSet.getLong("job_notice_id"),
			resultSet.getString("company_name"),
			resultSet.getString("title"),
			getLocalDateTime(resultSet.getTimestamp("deadline_at"))
		);
	}

	private LocalDateTime getLocalDateTime(Timestamp timestamp) {
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

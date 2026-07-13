package com.dejavu.backend.bookmark.repository;

import com.dejavu.backend.bookmark.dto.BookmarkJobNoticeRow;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BookmarkRepository {

	private static final String BOOKMARK_LIST_QUERY = """
		SELECT
		  bookmarks.bookmark_id,
		  job_notices.job_notice_id,
		  job_notices.company_name,
		  job_notices.title,
		  job_notices.deadline_at,
		  COALESCE(GROUP_CONCAT(skills.skill_name ORDER BY skills.skill_name SEPARATOR ','), '') AS skill_names
		FROM bookmarks
		JOIN job_notices
		  ON bookmarks.job_notice_id = job_notices.job_notice_id
		LEFT JOIN job_notice_skills
		  ON job_notices.job_notice_id = job_notice_skills.job_notice_id
		LEFT JOIN skills
		  ON job_notice_skills.skill_id = skills.skill_id
		WHERE bookmarks.user_id = ?
		GROUP BY
		  bookmarks.bookmark_id,
		  job_notices.job_notice_id,
		  job_notices.company_name,
		  job_notices.title,
		  job_notices.deadline_at
		ORDER BY bookmarks.bookmark_id DESC
		""";

	private final JdbcTemplate jdbcTemplate;

	public boolean existsActiveJobNotice(Long jobNoticeId) {
		Integer count = jdbcTemplate.queryForObject(
			"SELECT COUNT(*) FROM job_notices WHERE job_notice_id = ? AND is_active = TRUE",
			Integer.class,
			jobNoticeId
		);

		return count != null && count > 0;
	}

	public boolean existsBookmark(Long userId, Long jobNoticeId) {
		Integer count = jdbcTemplate.queryForObject(
			"SELECT COUNT(*) FROM bookmarks WHERE user_id = ? AND job_notice_id = ?",
			Integer.class,
			userId,
			jobNoticeId
		);

		return count != null && count > 0;
	}

	public Long save(Long userId, Long jobNoticeId) {
		KeyHolder keyHolder = new GeneratedKeyHolder();

		jdbcTemplate.update(connection -> {
			PreparedStatement statement = connection.prepareStatement(
				"INSERT INTO bookmarks (user_id, job_notice_id) VALUES (?, ?)",
				Statement.RETURN_GENERATED_KEYS
			);
			statement.setLong(1, userId);
			statement.setLong(2, jobNoticeId);
			return statement;
		}, keyHolder);

		return Objects.requireNonNull(keyHolder.getKey()).longValue();
	}

	public boolean delete(Long userId, Long jobNoticeId) {
		int deletedCount = jdbcTemplate.update(
			"DELETE FROM bookmarks WHERE user_id = ? AND job_notice_id = ?",
			userId,
			jobNoticeId
		);

		return deletedCount > 0;
	}

	public List<BookmarkJobNoticeRow> findByUserId(Long userId) {
		return jdbcTemplate.query(BOOKMARK_LIST_QUERY, this::mapToBookmarkJobNoticeRow, userId);
	}

	private BookmarkJobNoticeRow mapToBookmarkJobNoticeRow(ResultSet resultSet, int rowNumber) throws SQLException {
		return new BookmarkJobNoticeRow(
			resultSet.getLong("bookmark_id"),
			resultSet.getLong("job_notice_id"),
			resultSet.getString("company_name"),
			resultSet.getString("title"),
			getLocalDateTime(resultSet.getTimestamp("deadline_at")),
			getSkillNames(resultSet.getString("skill_names"))
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

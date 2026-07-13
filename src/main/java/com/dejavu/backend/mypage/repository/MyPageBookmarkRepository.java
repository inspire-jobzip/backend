package com.dejavu.backend.mypage.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class MyPageBookmarkRepository {

	private static final String FIND_BOOKMARKS_QUERY = """
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
		ORDER BY bookmarks.created_at DESC
	""";

	private final JdbcTemplate jdbcTemplate;

	public List<MyPageBookmarkRow> findByUserId(Long userId) {
		return jdbcTemplate.query(FIND_BOOKMARKS_QUERY, this::mapRow, userId);
	}

	private MyPageBookmarkRow mapRow(ResultSet resultSet, int rowNumber) throws SQLException {
		return new MyPageBookmarkRow(
			resultSet.getLong("bookmark_id"),
			resultSet.getLong("job_notice_id"),
			resultSet.getString("company_name"),
			resultSet.getString("title"),
			toLocalDateTime(resultSet.getTimestamp("deadline_at"))
		);
	}

	private LocalDateTime toLocalDateTime(Timestamp timestamp) {
		return timestamp == null ? null : timestamp.toLocalDateTime();
	}
}

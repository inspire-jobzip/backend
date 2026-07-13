package com.dejavu.backend.bookmark.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import java.time.LocalDateTime;

@Entity
@Table(
	name = "bookmarks",
	uniqueConstraints = {
		@UniqueConstraint(name = "uk_bookmarks_user_job_notice", columnNames = {"user_id", "job_notice_id"})
	},
	indexes = {
		@Index(name = "idx_bookmarks_job_notice_id", columnList = "job_notice_id")
	}
)
public class BookmarkEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bookmark_id")
	private Long bookmarkId;

	@Column(name = "user_id", nullable = false)
	private Long userId;

	@Column(name = "job_notice_id", nullable = false)
	private Long jobNoticeId;

	@Column(
		name = "created_at",
		nullable = false,
		insertable = false,
		updatable = false,
		columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP"
	)
	private LocalDateTime createdAt;

	protected BookmarkEntity() {
	}

	public Long getBookmarkId() {
		return bookmarkId;
	}

	public Long getUserId() {
		return userId;
	}

	public Long getJobNoticeId() {
		return jobNoticeId;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
}

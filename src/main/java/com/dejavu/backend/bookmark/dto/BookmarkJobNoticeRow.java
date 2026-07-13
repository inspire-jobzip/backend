package com.dejavu.backend.bookmark.dto;

import java.time.LocalDateTime;
import java.util.List;

public record BookmarkJobNoticeRow(
	Long bookmarkId,
	Long jobNoticeId,
	String companyName,
	String title,
	LocalDateTime deadlineAt,
	List<String> skillNames
) {
}

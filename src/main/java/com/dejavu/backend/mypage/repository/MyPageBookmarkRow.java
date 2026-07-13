package com.dejavu.backend.mypage.repository;

import java.time.LocalDateTime;

public record MyPageBookmarkRow(
	Long bookmarkId,
	Long jobNoticeId,
	String companyName,
	String title,
	LocalDateTime deadlineAt
) {
}

package com.dejavu.backend.mypage.dto;

import java.util.List;

public record MyPageSummaryResponse(
	MyPageProfileResponse profile,
	List<MyPageBookmarkResponse> bookmarks,
	List<MyPageResumeResponse> resumes
) {
}

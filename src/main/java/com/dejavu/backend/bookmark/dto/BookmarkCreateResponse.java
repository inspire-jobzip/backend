package com.dejavu.backend.bookmark.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public record BookmarkCreateResponse(
	Long bookmarkId,
	Long jobNoticeId,
	@JsonProperty("isBookmarked")
	boolean bookmarked
) {
}

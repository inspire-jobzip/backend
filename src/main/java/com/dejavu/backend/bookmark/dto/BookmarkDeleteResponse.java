package com.dejavu.backend.bookmark.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public record BookmarkDeleteResponse(
	Long jobNoticeId,
	@JsonProperty("isBookmarked")
	boolean bookmarked
) {
}

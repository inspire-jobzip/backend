package com.dejavu.backend.bookmark.controller;

import com.dejavu.backend.bookmark.dto.BookmarkCreateResponse;
import com.dejavu.backend.bookmark.dto.BookmarkDeleteResponse;
import com.dejavu.backend.bookmark.dto.BookmarkJobNoticeResponse;
import com.dejavu.backend.bookmark.service.BookmarkService;
import com.dejavu.backend.common.ApiResponse;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
public class BookmarkController {

	private final BookmarkService bookmarkService;

	@PostMapping("/job-notices/{jobNoticeId}/bookmark")
	public ApiResponse<BookmarkCreateResponse> create(
		@RequestHeader(value = "Authorization", required = false) String authorizationHeader,
		@PathVariable Long jobNoticeId
	) {
		BookmarkCreateResponse response = bookmarkService.create(authorizationHeader, jobNoticeId);

		return ApiResponse.message(response, "공고를 스크랩했습니다.");
	}

	@DeleteMapping("/job-notices/{jobNoticeId}/bookmark")
	public ApiResponse<BookmarkDeleteResponse> delete(
		@RequestHeader(value = "Authorization", required = false) String authorizationHeader,
		@PathVariable Long jobNoticeId
	) {
		BookmarkDeleteResponse response = bookmarkService.delete(authorizationHeader, jobNoticeId);

		return ApiResponse.message(response, "스크랩을 취소했습니다.");
	}

	@GetMapping("/bookmarks")
	public ApiResponse<List<BookmarkJobNoticeResponse>> getBookmarks(
		@RequestHeader(value = "Authorization", required = false) String authorizationHeader,
		@RequestParam(required = false) String status,
		@RequestParam(required = false) String page,
		@RequestParam(required = false) String size
	) {
		List<BookmarkJobNoticeResponse> response = bookmarkService.read(authorizationHeader, status, page, size);

		return ApiResponse.ok(response);
	}
}

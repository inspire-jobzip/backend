package com.dejavu.backend.bookmark.service;

import com.dejavu.backend.bookmark.domain.BookmarkRecruitStatus;
import com.dejavu.backend.bookmark.dto.BookmarkCreateResponse;
import com.dejavu.backend.bookmark.dto.BookmarkDeleteResponse;
import com.dejavu.backend.bookmark.dto.BookmarkJobNoticeResponse;
import com.dejavu.backend.bookmark.dto.BookmarkJobNoticeRow;
import com.dejavu.backend.bookmark.repository.BookmarkRepository;
import com.dejavu.backend.common.ApiException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BookmarkService {

	private static final int DEFAULT_PAGE = 0;
	private static final int DEFAULT_SIZE = 20;
	private static final int CLOSING_SOON_DAYS = 3;

	private final BookmarkRepository bookmarkRepository;

	public BookmarkCreateResponse create(String authorizationHeader, Long jobNoticeId) {
		Long userId = resolveUserId(authorizationHeader);
		validateActiveJobNotice(jobNoticeId);

		if (bookmarkRepository.existsBookmark(userId, jobNoticeId)) {
			throw new ApiException(HttpStatus.CONFLICT, "BOOKMARK_ALREADY_EXISTS", "이미 스크랩한 공고입니다.");
		}

		Long bookmarkId = bookmarkRepository.save(userId, jobNoticeId);

		return new BookmarkCreateResponse(bookmarkId, jobNoticeId, true);
	}

	public BookmarkDeleteResponse delete(String authorizationHeader, Long jobNoticeId) {
		Long userId = resolveUserId(authorizationHeader);

		if (!bookmarkRepository.delete(userId, jobNoticeId)) {
			throw new ApiException(HttpStatus.NOT_FOUND, "BOOKMARK_NOT_FOUND", "스크랩한 공고를 찾을 수 없습니다.");
		}

		return new BookmarkDeleteResponse(jobNoticeId, false);
	}

	public List<BookmarkJobNoticeResponse> read(String authorizationHeader, String status, String page, String size) {
		Long userId = resolveUserId(authorizationHeader);
		BookmarkRecruitStatus recruitStatus = getRecruitStatus(status);
		int pageNumber = getPageNumber(page);
		int pageSize = getPageSize(size);

		List<BookmarkJobNoticeResponse> filteredBookmarks = bookmarkRepository.findByUserId(userId)
				.stream()
				.map(this::convertToResponse)
				.filter(bookmark -> recruitStatus == null || bookmark.recruitStatus().equals(recruitStatus.name()))
				.toList();

		return getPagedContent(filteredBookmarks, pageNumber, pageSize);
	}

	private Long resolveUserId(String authorizationHeader) {
		if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")
				|| authorizationHeader.length() <= 7) {
			throw new ApiException(HttpStatus.UNAUTHORIZED, "UNAUTHORIZED", "로그인이 필요합니다.");
		}

		// TODO: JWT 발급/검증 기능이 연결되면 accessToken에서 userId를 추출하도록 교체한다.
		return bookmarkRepository.findFirstActiveUserId()
				.orElseThrow(() -> new ApiException(HttpStatus.UNAUTHORIZED, "UNAUTHORIZED", "로그인이 필요합니다."));
	}

	private void validateActiveJobNotice(Long jobNoticeId) {
		if (!bookmarkRepository.existsActiveJobNotice(jobNoticeId)) {
			throw new ApiException(HttpStatus.NOT_FOUND, "JOB_NOTICE_NOT_FOUND", "채용공고를 찾을 수 없습니다.");
		}
	}

	private BookmarkJobNoticeResponse convertToResponse(BookmarkJobNoticeRow row) {
		long daysUntilDeadline = getDaysUntilDeadline(row.deadlineAt());
		BookmarkRecruitStatus recruitStatus = getRecruitStatus(row.deadlineAt(), daysUntilDeadline);

		return new BookmarkJobNoticeResponse(
				row.bookmarkId(),
				row.jobNoticeId(),
				row.companyName(),
				row.title(),
				row.deadlineAt(),
				recruitStatus.name(),
				recruitStatus.getText(),
				daysUntilDeadline,
				row.skillNames());
	}

	private BookmarkRecruitStatus getRecruitStatus(String status) {
		if (status == null || status.isBlank()) {
			return null;
		}

		try {
			return BookmarkRecruitStatus.valueOf(status.trim().toUpperCase());
		} catch (IllegalArgumentException exception) {
			throw new ApiException(HttpStatus.BAD_REQUEST, "INVALID_QUERY_PARAMETER", "status 값이 올바르지 않습니다.");
		}
	}

	private BookmarkRecruitStatus getRecruitStatus(LocalDateTime deadlineAt, long daysUntilDeadline) {
		if (deadlineAt != null && deadlineAt.isBefore(LocalDateTime.now())) {
			return BookmarkRecruitStatus.CLOSED;
		}
		if (deadlineAt != null && daysUntilDeadline <= CLOSING_SOON_DAYS) {
			return BookmarkRecruitStatus.CLOSING_SOON;
		}

		return BookmarkRecruitStatus.OPEN;
	}

	private long getDaysUntilDeadline(LocalDateTime deadlineAt) {
		if (deadlineAt == null) {
			return 0;
		}

		return ChronoUnit.DAYS.between(LocalDate.now(), deadlineAt.toLocalDate());
	}

	private int getPageNumber(String page) {
		if (page == null || page.isBlank()) {
			return DEFAULT_PAGE;
		}

		return parseNonNegativeNumber(page, "page");
	}

	private int getPageSize(String size) {
		if (size == null || size.isBlank()) {
			return DEFAULT_SIZE;
		}

		return parseNonNegativeNumber(size, "size");
	}

	private int parseNonNegativeNumber(String value, String parameterName) {
		try {
			int number = Integer.parseInt(value);
			if (number < 0) {
				throw new NumberFormatException();
			}

			return number;
		} catch (NumberFormatException exception) {
			throw new ApiException(HttpStatus.BAD_REQUEST, "INVALID_QUERY_PARAMETER",
					parameterName + " 형식이 올바르지 않습니다.");
		}
	}

	private List<BookmarkJobNoticeResponse> getPagedContent(
			List<BookmarkJobNoticeResponse> bookmarks,
			int page,
			int size) {
		int fromIndex = Math.min(page * size, bookmarks.size());
		int toIndex = Math.min(fromIndex + size, bookmarks.size());

		return bookmarks.subList(fromIndex, toIndex);
	}
}

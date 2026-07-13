package com.dejavu.backend.bookmark.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import com.dejavu.backend.bookmark.dto.BookmarkCreateResponse;
import com.dejavu.backend.bookmark.dto.BookmarkDeleteResponse;
import com.dejavu.backend.bookmark.dto.BookmarkJobNoticeResponse;
import com.dejavu.backend.bookmark.dto.BookmarkJobNoticeRow;
import com.dejavu.backend.bookmark.repository.BookmarkRepository;
import com.dejavu.backend.common.ApiException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.Test;

class BookmarkServiceTest {

	private static final String AUTHORIZATION_HEADER = "Bearer test-token";

	@Test
	void createReturnsBookmarkResponse() {
		FakeBookmarkRepository bookmarkRepository = new FakeBookmarkRepository();
		BookmarkService bookmarkService = new BookmarkService(bookmarkRepository);

		BookmarkCreateResponse response = bookmarkService.create(AUTHORIZATION_HEADER, 101L);

		assertThat(response.bookmarkId()).isEqualTo(1L);
		assertThat(response.jobNoticeId()).isEqualTo(101L);
		assertThat(response.bookmarked()).isTrue();
	}

	@Test
	void createRejectsDuplicateBookmark() {
		FakeBookmarkRepository bookmarkRepository = new FakeBookmarkRepository();
		bookmarkRepository.bookmarkExists = true;
		BookmarkService bookmarkService = new BookmarkService(bookmarkRepository);

		assertThatThrownBy(() -> bookmarkService.create(AUTHORIZATION_HEADER, 101L))
			.isInstanceOf(ApiException.class)
			.hasMessage("이미 스크랩한 공고입니다.");
	}

	@Test
	void createRejectsMissingAuthorizationHeader() {
		BookmarkService bookmarkService = new BookmarkService(new FakeBookmarkRepository());

		assertThatThrownBy(() -> bookmarkService.create(null, 101L))
			.isInstanceOf(ApiException.class)
			.hasMessage("로그인이 필요합니다.");
	}

	@Test
	void deleteReturnsBookmarkOffResponse() {
		FakeBookmarkRepository bookmarkRepository = new FakeBookmarkRepository();
		BookmarkService bookmarkService = new BookmarkService(bookmarkRepository);

		BookmarkDeleteResponse response = bookmarkService.delete(AUTHORIZATION_HEADER, 101L);

		assertThat(response.jobNoticeId()).isEqualTo(101L);
		assertThat(response.bookmarked()).isFalse();
	}

	@Test
	void deleteThrowsWhenBookmarkDoesNotExist() {
		FakeBookmarkRepository bookmarkRepository = new FakeBookmarkRepository();
		bookmarkRepository.deleted = false;
		BookmarkService bookmarkService = new BookmarkService(bookmarkRepository);

		assertThatThrownBy(() -> bookmarkService.delete(AUTHORIZATION_HEADER, 101L))
			.isInstanceOf(ApiException.class)
			.hasMessage("스크랩한 공고를 찾을 수 없습니다.");
	}

	@Test
	void readFiltersBookmarksByRecruitStatus() {
		FakeBookmarkRepository bookmarkRepository = new FakeBookmarkRepository();
		bookmarkRepository.bookmarks = List.of(
			createBookmarkJobNotice(1L, LocalDateTime.now().plusDays(10)),
			createBookmarkJobNotice(2L, LocalDateTime.now().plusDays(1)),
			createBookmarkJobNotice(3L, LocalDateTime.now().minusDays(1))
		);
		BookmarkService bookmarkService = new BookmarkService(bookmarkRepository);

		List<BookmarkJobNoticeResponse> response = bookmarkService.read(
			AUTHORIZATION_HEADER,
			"CLOSING_SOON",
			"0",
			"20"
		);

		assertThat(response).hasSize(1);
		assertThat(response.get(0).bookmarkId()).isEqualTo(2L);
		assertThat(response.get(0).recruitStatus()).isEqualTo("CLOSING_SOON");
	}

	@Test
	void readRejectsInvalidStatus() {
		BookmarkService bookmarkService = new BookmarkService(new FakeBookmarkRepository());

		assertThatThrownBy(() -> bookmarkService.read(AUTHORIZATION_HEADER, "PENDING", null, null))
			.isInstanceOf(ApiException.class)
			.hasMessage("status 값이 올바르지 않습니다.");
	}

	private BookmarkJobNoticeRow createBookmarkJobNotice(Long bookmarkId, LocalDateTime deadlineAt) {
		return new BookmarkJobNoticeRow(
			bookmarkId,
			100L + bookmarkId,
			"Dejavu Labs",
			"Backend Developer",
			deadlineAt,
			List.of("Java", "Spring Boot")
		);
	}

	private static class FakeBookmarkRepository extends BookmarkRepository {

		private boolean activeJobNoticeExists = true;
		private boolean bookmarkExists = false;
		private boolean deleted = true;
		private List<BookmarkJobNoticeRow> bookmarks = List.of();

		private FakeBookmarkRepository() {
			super(null);
		}

		@Override
		public boolean existsActiveJobNotice(Long jobNoticeId) {
			return activeJobNoticeExists;
		}

		@Override
		public boolean existsBookmark(Long userId, Long jobNoticeId) {
			return bookmarkExists;
		}

		@Override
		public Long save(Long userId, Long jobNoticeId) {
			return 1L;
		}

		@Override
		public boolean delete(Long userId, Long jobNoticeId) {
			return deleted;
		}

		@Override
		public List<BookmarkJobNoticeRow> findByUserId(Long userId) {
			return bookmarks;
		}

		@Override
		public Optional<Long> findFirstActiveUserId() {
			return Optional.of(1L);
		}
	}
}

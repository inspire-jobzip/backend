package com.dejavu.backend.calendar.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import com.dejavu.backend.calendar.dto.CalendarBookmarkResponse;
import com.dejavu.backend.calendar.dto.CalendarBookmarkRow;
import com.dejavu.backend.calendar.dto.CalendarJobNoticeResponse;
import com.dejavu.backend.calendar.dto.CalendarJobNoticeRow;
import com.dejavu.backend.calendar.repository.CalendarRepository;
import com.dejavu.backend.common.ApiException;
import java.time.LocalDateTime;
import java.util.List;
import org.junit.jupiter.api.Test;

class CalendarServiceTest {

	private static final Long USER_ID = 1L;

	@Test
	void readJobNoticeEventsReturnsMonthlyEvents() {
		FakeCalendarRepository calendarRepository = new FakeCalendarRepository();
		calendarRepository.jobNoticeRows = List.of(
			createJobNoticeRow(101L, "Backend Developer", List.of("Java", "Spring Boot")),
			createJobNoticeRow(102L, "Frontend Developer", List.of("React", "TypeScript"))
		);
		CalendarService calendarService = new CalendarService(calendarRepository);

		CalendarJobNoticeResponse response = calendarService.readJobNoticeEvents("2026", "7", "BACKEND", "Java");

		assertThat(response.year()).isEqualTo(2026);
		assertThat(response.month()).isEqualTo(7);
		assertThat(response.events()).hasSize(1);
		assertThat(response.events().get(0).jobNoticeId()).isEqualTo(101L);
		assertThat(response.events().get(0).eventType()).isEqualTo("DEADLINE");
	}

	@Test
	void readJobNoticeEventsRejectsMissingYearOrMonth() {
		CalendarService calendarService = new CalendarService(new FakeCalendarRepository());

		assertThatThrownBy(() -> calendarService.readJobNoticeEvents(null, "7", null, null))
			.isInstanceOf(ApiException.class)
			.hasMessage("연도와 월은 필수입니다.");
	}

	@Test
	void readJobNoticeEventsRejectsInvalidMonth() {
		CalendarService calendarService = new CalendarService(new FakeCalendarRepository());

		assertThatThrownBy(() -> calendarService.readJobNoticeEvents("2026", "13", null, null))
			.isInstanceOf(ApiException.class)
			.hasMessage("월 값이 올바르지 않습니다.");
	}

	@Test
	void readBookmarkEventsReturnsSummary() {
		FakeCalendarRepository calendarRepository = new FakeCalendarRepository();
		calendarRepository.bookmarkRows = List.of(
			createBookmarkRow(1L, LocalDateTime.now().plusDays(10)),
			createBookmarkRow(2L, LocalDateTime.now().plusDays(1)),
			createBookmarkRow(3L, LocalDateTime.now().minusDays(1))
		);
		CalendarService calendarService = new CalendarService(calendarRepository);

		CalendarBookmarkResponse response = calendarService.readBookmarkEvents(USER_ID, "2026", "7");

		assertThat(response.summary().openCount()).isEqualTo(1);
		assertThat(response.summary().closingSoonCount()).isEqualTo(1);
		assertThat(response.summary().closedCount()).isEqualTo(1);
		assertThat(response.events()).hasSize(3);
	}

	@Test
	void readBookmarkEventsRejectsMissingAuthenticatedUser() {
		CalendarService calendarService = new CalendarService(new FakeCalendarRepository());

		assertThatThrownBy(() -> calendarService.readBookmarkEvents(null, "2026", "7"))
			.isInstanceOf(ApiException.class)
			.hasMessage("로그인이 필요합니다.");
	}

	private CalendarJobNoticeRow createJobNoticeRow(Long jobNoticeId, String title, List<String> skillNames) {
		return new CalendarJobNoticeRow(
			jobNoticeId,
			"Dejavu Labs",
			title,
			LocalDateTime.of(2026, 7, 12, 23, 59, 59),
			String.join(",", skillNames),
			skillNames
		);
	}

	private CalendarBookmarkRow createBookmarkRow(Long bookmarkId, LocalDateTime deadlineAt) {
		return new CalendarBookmarkRow(
			bookmarkId,
			100L + bookmarkId,
			"Dejavu Labs",
			"Backend Developer",
			deadlineAt
		);
	}

	private static class FakeCalendarRepository extends CalendarRepository {

		private List<CalendarJobNoticeRow> jobNoticeRows = List.of();
		private List<CalendarBookmarkRow> bookmarkRows = List.of();

		private FakeCalendarRepository() {
			super(null);
		}

		@Override
		public List<CalendarJobNoticeRow> findJobNoticeEvents(LocalDateTime startAt, LocalDateTime endAt) {
			return jobNoticeRows;
		}

		@Override
		public List<CalendarBookmarkRow> findBookmarkEvents(Long userId, LocalDateTime startAt, LocalDateTime endAt) {
			return bookmarkRows;
		}
	}
}

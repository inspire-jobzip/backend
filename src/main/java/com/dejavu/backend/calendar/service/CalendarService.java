package com.dejavu.backend.calendar.service;

import com.dejavu.backend.calendar.domain.CalendarEventType;
import com.dejavu.backend.calendar.domain.CalendarRecruitStatus;
import com.dejavu.backend.calendar.dto.CalendarBookmarkEventResponse;
import com.dejavu.backend.calendar.dto.CalendarBookmarkResponse;
import com.dejavu.backend.calendar.dto.CalendarBookmarkRow;
import com.dejavu.backend.calendar.dto.CalendarBookmarkSummaryResponse;
import com.dejavu.backend.calendar.dto.CalendarJobNoticeEventResponse;
import com.dejavu.backend.calendar.dto.CalendarJobNoticeResponse;
import com.dejavu.backend.calendar.dto.CalendarJobNoticeRow;
import com.dejavu.backend.calendar.repository.CalendarRepository;
import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.jobNotices.domain.enums.JobNoticesJobRole;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CalendarService {

	private static final int CLOSING_SOON_DAYS = 3;

	private final CalendarRepository calendarRepository;

	public CalendarJobNoticeResponse readJobNoticeEvents(
		String year,
		String month,
		String jobRole,
		String skillNames
	) {
		YearMonth yearMonth = getYearMonth(year, month);
		JobNoticesJobRole requestedJobRole = getJobRole(jobRole);
		List<String> requestedSkillNames = getSkillNames(skillNames);

		List<CalendarJobNoticeEventResponse> events = calendarRepository.findJobNoticeEvents(
				yearMonth.atDay(1).atStartOfDay(),
				yearMonth.plusMonths(1).atDay(1).atStartOfDay()
			)
			.stream()
			.filter(row -> matchesJobRole(row, requestedJobRole))
			.filter(row -> matchesSkillNames(row.skillNames(), requestedSkillNames))
			.map(this::convertToJobNoticeEventResponse)
			.toList();

		return new CalendarJobNoticeResponse(yearMonth.getYear(), yearMonth.getMonthValue(), events);
	}

	public CalendarBookmarkResponse readBookmarkEvents(Long userId, String year, String month) {
		validateAuthenticatedUser(userId);
		YearMonth yearMonth = getYearMonth(year, month);

		List<CalendarBookmarkEventResponse> events = calendarRepository.findBookmarkEvents(
				userId,
				yearMonth.atDay(1).atStartOfDay(),
				yearMonth.plusMonths(1).atDay(1).atStartOfDay()
			)
			.stream()
			.map(this::convertToBookmarkEventResponse)
			.toList();

		return new CalendarBookmarkResponse(
			yearMonth.getYear(),
			yearMonth.getMonthValue(),
			getSummary(events),
			events
		);
	}

	private void validateAuthenticatedUser(Long userId) {
		if (userId == null) {
			throw new ApiException(HttpStatus.UNAUTHORIZED, "UNAUTHORIZED", "로그인이 필요합니다.");
		}
	}

	private YearMonth getYearMonth(String year, String month) {
		if (year == null || year.isBlank() || month == null || month.isBlank()) {
			throw new ApiException(HttpStatus.BAD_REQUEST, "INVALID_QUERY_PARAMETER", "연도와 월은 필수입니다.");
		}

		try {
			return YearMonth.of(Integer.parseInt(year), Integer.parseInt(month));
		} catch (NumberFormatException exception) {
			throw new ApiException(HttpStatus.BAD_REQUEST, "INVALID_QUERY_PARAMETER", "연도 또는 월 형식이 올바르지 않습니다.");
		} catch (DateTimeException exception) {
			throw new ApiException(HttpStatus.BAD_REQUEST, "INVALID_QUERY_PARAMETER", "월 값이 올바르지 않습니다.");
		}
	}

	private JobNoticesJobRole getJobRole(String jobRole) {
		if (jobRole == null || jobRole.isBlank()) {
			return null;
		}

		try {
			return JobNoticesJobRole.valueOf(jobRole.trim().toUpperCase());
		} catch (IllegalArgumentException exception) {
			throw new ApiException(HttpStatus.BAD_REQUEST, "INVALID_QUERY_PARAMETER", "jobRole 값이 올바르지 않습니다.");
		}
	}

	private List<String> getSkillNames(String skillNames) {
		if (skillNames == null || skillNames.isBlank()) {
			return List.of();
		}

		return Arrays.stream(skillNames.split(","))
			.map(String::trim)
			.filter(skillName -> !skillName.isBlank())
			.toList();
	}

	private boolean matchesJobRole(CalendarJobNoticeRow row, JobNoticesJobRole jobRole) {
		return jobRole == null || getJobRole(row).equals(jobRole);
	}

	private boolean matchesSkillNames(List<String> sourceSkillNames, List<String> requestedSkillNames) {
		if (requestedSkillNames.isEmpty()) {
			return true;
		}

		return sourceSkillNames.stream()
			.anyMatch(skillName -> requestedSkillNames.stream().anyMatch(skillName::equalsIgnoreCase));
	}

	private CalendarJobNoticeEventResponse convertToJobNoticeEventResponse(CalendarJobNoticeRow row) {
		long daysUntilDeadline = getDaysUntilDeadline(row.deadlineAt());
		CalendarRecruitStatus recruitStatus = getRecruitStatus(row.deadlineAt(), daysUntilDeadline);

		return new CalendarJobNoticeEventResponse(
			row.jobNoticeId(),
			row.companyName(),
			row.title(),
			row.deadlineAt(),
			CalendarEventType.DEADLINE.name(),
			recruitStatus.name(),
			recruitStatus.getText()
		);
	}

	private CalendarBookmarkEventResponse convertToBookmarkEventResponse(CalendarBookmarkRow row) {
		long daysUntilDeadline = getDaysUntilDeadline(row.deadlineAt());
		CalendarRecruitStatus recruitStatus = getRecruitStatus(row.deadlineAt(), daysUntilDeadline);

		return new CalendarBookmarkEventResponse(
			row.bookmarkId(),
			row.jobNoticeId(),
			row.companyName(),
			row.title(),
			row.deadlineAt(),
			recruitStatus.name(),
			recruitStatus.getText()
		);
	}

	private CalendarBookmarkSummaryResponse getSummary(List<CalendarBookmarkEventResponse> events) {
		return new CalendarBookmarkSummaryResponse(
			countByStatus(events, CalendarRecruitStatus.OPEN),
			countByStatus(events, CalendarRecruitStatus.CLOSING_SOON),
			countByStatus(events, CalendarRecruitStatus.CLOSED)
		);
	}

	private long countByStatus(List<CalendarBookmarkEventResponse> events, CalendarRecruitStatus status) {
		return events.stream()
			.filter(event -> event.recruitStatus().equals(status.name()))
			.count();
	}

	private CalendarRecruitStatus getRecruitStatus(LocalDateTime deadlineAt, long daysUntilDeadline) {
		if (deadlineAt != null && deadlineAt.isBefore(LocalDateTime.now())) {
			return CalendarRecruitStatus.CLOSED;
		}
		if (deadlineAt != null && daysUntilDeadline <= CLOSING_SOON_DAYS) {
			return CalendarRecruitStatus.CLOSING_SOON;
		}

		return CalendarRecruitStatus.OPEN;
	}

	private long getDaysUntilDeadline(LocalDateTime deadlineAt) {
		if (deadlineAt == null) {
			return 0;
		}

		return ChronoUnit.DAYS.between(LocalDate.now(), deadlineAt.toLocalDate());
	}

	private JobNoticesJobRole getJobRole(CalendarJobNoticeRow row) {
		String searchText = String.join(" ",
			row.title() == null ? "" : row.title(),
			row.roleKeywordsText() == null ? "" : row.roleKeywordsText(),
			String.join(",", row.skillNames())
		).toLowerCase();

		if (containsAny(searchText, "게임", "게임서버", "game", "unity", "unreal")) {
			return JobNoticesJobRole.GAME;
		}
		if (containsAny(searchText, "보안", "취약점", "security", "secure", "vulnerability", "c++")) {
			return JobNoticesJobRole.SECURITY;
		}
		if (containsAny(searchText, "devops", "kubernetes", "docker", "terraform", "cloud", "클라우드")) {
			return JobNoticesJobRole.DEVOPS;
		}
		if (containsAny(searchText, "풀스택", "fullstack", "full-stack")) {
			return JobNoticesJobRole.FULLSTACK;
		}
		if (containsAny(searchText, "ai", "openai", "머신러닝", "인공지능", "machine learning", "ml", "llm")) {
			return JobNoticesJobRole.AI;
		}
		if (containsAny(searchText, "데이터", "data", "airflow", "spark", "bigquery", "tableau", "sql")) {
			return JobNoticesJobRole.DATA;
		}
		if (containsAny(searchText, "프론트엔드", "frontend", "front-end", "react", "typescript", "next.js", "vue.js")) {
			return JobNoticesJobRole.FRONTEND;
		}
		if (containsAny(searchText, "모바일", "mobile", "android", "ios", "app")) {
			return JobNoticesJobRole.MOBILE;
		}
		if (containsAny(searchText, "qa", "테스트", "품질", "test", "quality assurance")) {
			return JobNoticesJobRole.QA;
		}

		return JobNoticesJobRole.BACKEND;
	}

	private boolean containsAny(String source, String... keywords) {
		for (String keyword : keywords) {
			if (source.contains(keyword.toLowerCase())) {
				return true;
			}
		}

		return false;
	}
}

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

	public CalendarBookmarkResponse readBookmarkEvents(String authorizationHeader, String year, String month) {
		Long userId = resolveUserId(authorizationHeader);
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

	private Long resolveUserId(String authorizationHeader) {
		if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")
			|| authorizationHeader.length() <= 7) {
			throw new ApiException(HttpStatus.UNAUTHORIZED, "UNAUTHORIZED", "\uB85C\uADF8\uC778\uC774 \uD544\uC694\uD569\uB2C8\uB2E4.");
		}

		// TODO: JWT 발급/검증 기능이 연결되면 accessToken에서 userId를 추출하도록 교체한다.
		return calendarRepository.findFirstActiveUserId()
			.orElseThrow(() -> new ApiException(
				HttpStatus.UNAUTHORIZED,
				"UNAUTHORIZED",
				"\uB85C\uADF8\uC778\uC774 \uD544\uC694\uD569\uB2C8\uB2E4."
			));
	}

	private YearMonth getYearMonth(String year, String month) {
		if (year == null || year.isBlank() || month == null || month.isBlank()) {
			throw new ApiException(HttpStatus.BAD_REQUEST, "INVALID_QUERY_PARAMETER", "\uC5F0\uB3C4\uC640 \uC6D4\uC740 \uD544\uC218\uC785\uB2C8\uB2E4.");
		}

		try {
			return YearMonth.of(Integer.parseInt(year), Integer.parseInt(month));
		} catch (NumberFormatException exception) {
			throw new ApiException(HttpStatus.BAD_REQUEST, "INVALID_QUERY_PARAMETER", "\uC5F0\uB3C4 \uB610\uB294 \uC6D4 \uD615\uC2DD\uC774 \uC62C\uBC14\uB974\uC9C0 \uC54A\uC2B5\uB2C8\uB2E4.");
		} catch (DateTimeException exception) {
			throw new ApiException(HttpStatus.BAD_REQUEST, "INVALID_QUERY_PARAMETER", "\uC6D4 \uAC12\uC774 \uC62C\uBC14\uB974\uC9C0 \uC54A\uC2B5\uB2C8\uB2E4.");
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
			recruitStatus.getText(),
			daysUntilDeadline,
			recruitStatus.getColorType().name()
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
			recruitStatus.getText(),
			daysUntilDeadline,
			recruitStatus.getColorType().name()
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

		if (containsAny(searchText, "\uAC8C\uC784", "\uAC8C\uC784\uC11C\uBC84", "game", "unity", "unreal")) {
			return JobNoticesJobRole.GAME;
		}
		if (containsAny(searchText, "\uBCF4\uC548", "\uCDE8\uC57D\uC810", "security", "secure", "vulnerability", "c++")) {
			return JobNoticesJobRole.SECURITY;
		}
		if (containsAny(searchText, "devops", "kubernetes", "docker", "terraform", "cloud", "\uD074\uB77C\uC6B0\uB4DC")) {
			return JobNoticesJobRole.DEVOPS;
		}
		if (containsAny(searchText, "\uD480\uC2A4\uD0DD", "fullstack", "full-stack")) {
			return JobNoticesJobRole.FULLSTACK;
		}
		if (containsAny(searchText, "ai", "openai", "\uBA38\uC2E0\uB7EC\uB2DD", "\uC778\uACF5\uC9C0\uB2A5", "machine learning", "ml", "llm")) {
			return JobNoticesJobRole.AI;
		}
		if (containsAny(searchText, "\uB370\uC774\uD130", "data", "airflow", "spark", "bigquery", "tableau", "sql")) {
			return JobNoticesJobRole.DATA;
		}
		if (containsAny(searchText, "\uD504\uB860\uD2B8\uC5D4\uB4DC", "frontend", "front-end", "react", "typescript", "next.js", "vue.js")) {
			return JobNoticesJobRole.FRONTEND;
		}
		if (containsAny(searchText, "\uBAA8\uBC14\uC77C", "mobile", "android", "ios", "app")) {
			return JobNoticesJobRole.MOBILE;
		}
		if (containsAny(searchText, "qa", "\uD14C\uC2A4\uD2B8", "\uD488\uC9C8", "test", "quality assurance")) {
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

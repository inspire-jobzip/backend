package com.dejavu.backend.mypage.service;

import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import com.dejavu.backend.mypage.dto.MyPageBookmarkResponse;
import com.dejavu.backend.mypage.dto.MyPageProfileResponse;
import com.dejavu.backend.mypage.dto.MyPageResumeResponse;
import com.dejavu.backend.mypage.dto.MyPageSummaryResponse;
import com.dejavu.backend.mypage.repository.MyPageBookmarkRepository;
import com.dejavu.backend.mypage.repository.MyPageBookmarkRow;
import com.dejavu.backend.resume.entity.ResumeEntity;
import com.dejavu.backend.resume.repository.ResumeRepository;
import com.dejavu.backend.user.entity.User;
import com.dejavu.backend.user.repository.UserRepository;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class MyPageService {

	private static final String RECRUIT_STATUS_OPEN = "OPEN";
	private static final String RECRUIT_STATUS_CLOSED = "CLOSED";
	private static final String RECRUIT_STATUS_UNKNOWN = "UNKNOWN";

	private final UserRepository userRepository;
	private final ResumeRepository resumeRepository;
	private final MyPageBookmarkRepository myPageBookmarkRepository;

	public MyPageSummaryResponse readSummary(JwtAuthenticatedUser authenticatedUser) {
		User user = userRepository.findById(authenticatedUser.userId())
			.orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, "USER_NOT_FOUND", "사용자를 찾을 수 없습니다."));

		return new MyPageSummaryResponse(
			toProfileResponse(user),
			myPageBookmarkRepository.findByUserId(user.getUserId()).stream()
				.map(this::toBookmarkResponse)
				.toList(),
			resumeRepository.findByUserIdOrderByUpdatedAtDesc(user.getUserId()).stream()
				.map(this::toResumeResponse)
				.toList()
		);
	}

	private MyPageProfileResponse toProfileResponse(User user) {
		return new MyPageProfileResponse(
			user.getUserId(),
			user.getEmail(),
			user.getDesiredJobRole(),
			user.getCareerStatus(),
			user.getCareerYears(),
			user.getPreferredSkillNames()
		);
	}

	private MyPageBookmarkResponse toBookmarkResponse(MyPageBookmarkRow row) {
		return new MyPageBookmarkResponse(
			row.bookmarkId(),
			row.jobNoticeId(),
			row.companyName(),
			row.title(),
			getRecruitStatus(row.deadlineAt()),
			getRecruitStatusText(row.deadlineAt()),
			row.deadlineAt(),
			getDaysUntilDeadline(row.deadlineAt())
		);
	}

	private MyPageResumeResponse toResumeResponse(ResumeEntity resume) {
		return new MyPageResumeResponse(
			resume.getResumeId(),
			resume.getTitle(),
			Boolean.TRUE.equals(resume.getDefaultResume()),
			resume.getUpdatedAt()
		);
	}

	private String getRecruitStatus(LocalDateTime deadlineAt) {
		if (deadlineAt == null) {
			return RECRUIT_STATUS_UNKNOWN;
		}

		return deadlineAt.isBefore(LocalDateTime.now()) ? RECRUIT_STATUS_CLOSED : RECRUIT_STATUS_OPEN;
	}

	private String getRecruitStatusText(LocalDateTime deadlineAt) {
		return switch (getRecruitStatus(deadlineAt)) {
			case RECRUIT_STATUS_OPEN -> "모집 중";
			case RECRUIT_STATUS_CLOSED -> "마감";
			default -> "마감일 미정";
		};
	}

	private Long getDaysUntilDeadline(LocalDateTime deadlineAt) {
		if (deadlineAt == null) {
			return null;
		}

		return ChronoUnit.DAYS.between(LocalDate.now(), deadlineAt.toLocalDate());
	}
}

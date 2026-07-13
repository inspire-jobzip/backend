# 2026-07-13 작업 로그

## Calendar API 인증 연동
- 전체 공고 마감일정 조회는 비회원 공개 API로 유지했다.
- 내 스크랩 공고 마감일정 조회는 `@AuthenticationPrincipal JwtAuthenticatedUser` 기반으로 인증 사용자 ID를 사용하도록 변경했다.
- 캘린더 북마크 조회의 임시 활성 사용자 조회 로직을 제거했다.
- `/api/v1/calendar/bookmarks`는 인증 필수 경로로 지정하고 `/api/v1/calendar/job-notices`는 공개 경로로 유지했다.
- Calendar API 서비스 테스트를 인증 사용자 ID 전달 방식과 최신 응답 명세에 맞게 수정했다.

# 2026-07-13 작업 로그

## Bookmark API 토큰 인증 연동
- 북마크 등록, 취소, 내 북마크 목록 조회에서 `Authorization` 헤더 직접 처리 로직을 제거했다.
- Spring Security의 `@AuthenticationPrincipal JwtAuthenticatedUser`를 이용해 인증 사용자 ID로 북마크를 처리하도록 변경했다.
- 북마크 API 3개 엔드포인트를 인증 필수 경로로 지정해 토큰이 없는 요청은 401 응답을 받도록 보완했다.
- 서비스 테스트를 실제 인증 사용자 ID 전달 방식에 맞게 수정했다.

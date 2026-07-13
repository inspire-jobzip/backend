# 2026-07-13 도메인별 작업 로그

## 작업 개요

오늘 작업은 API 명세를 기준으로 아래 도메인별 기능을 구현했습니다.

- `Skill`: 기술스택 목록 조회 API
- `User`: 내 프로필 수정 API
- `MyPage`: 마이페이지 요약 조회 API

검증은 각 작업 후 `./gradlew test`로 진행했습니다.

---

## 1. Skill 도메인

### 구현 API

```text
GET /api/v1/skills
```

### 작업 내용

- 기술스택 목록 조회 API를 추가했습니다.
- `keyword`, `category` 쿼리 파라미터를 선택적으로 받을 수 있도록 구현했습니다.
- 기존 `skills` 테이블과 이미 존재하던 `Skills` 엔티티를 재사용했습니다.
- 중복 엔티티를 만들지 않고 `skill` 도메인에는 조회용 controller/service/repository/dto만 추가했습니다.
- 인증 없이 조회할 수 있도록 `SecurityConfig` 공개 경로에 `/api/v1/skills`를 추가했습니다.

### 생성 파일

- `src/main/java/com/dejavu/backend/skill/controller/SkillController.java`
- `src/main/java/com/dejavu/backend/skill/dto/SkillResponse.java`
- `src/main/java/com/dejavu/backend/skill/repository/SkillRepository.java`
- `src/main/java/com/dejavu/backend/skill/service/SkillService.java`

### 수정 파일

- `src/main/java/com/dejavu/backend/common/config/SecurityConfig.java`
- `src/test/java/com/dejavu/backend/BackendApplicationTests.java`

### 확인 내용

- `skills` 테이블은 ERD/DDL 기준의 마스터 테이블입니다.
- `SkillRepository`는 `com.dejavu.backend.jobNotices.domain.entity.Skills` 엔티티를 사용합니다.
- 기존 테스트가 JPA 자동설정을 제외하고 있어 현재 애플리케이션 구조와 맞지 않았으므로, 기본 `@SpringBootTest` 방식으로 정리했습니다.

---

## 2. User 도메인

### 구현 API

```text
PATCH /api/v1/users/me
```

### 작업 내용

- 로그인한 사용자의 프로필 수정 API를 추가했습니다.
- JWT 인증 필터가 넣어주는 `JwtAuthenticatedUser`의 `userId`로 현재 사용자를 식별합니다.
- 수정 대상 필드는 아래와 같습니다.

```text
desiredJobRole
careerStatus
careerYears
preferredSkillNames
```

- `careerStatus`가 `NEW`일 때 `careerYears`가 `0`이 아니면 `400 INVALID_INPUT`이 발생하도록 검증했습니다.
- `careerYears`, `preferredSkillNames`는 ERD 기준에 맞춰 `null`을 허용합니다.
- `User` 엔티티에 `updateProfile(...)` 메서드를 추가해 프로필 수정 책임을 엔티티에 두었습니다.

### 생성 파일

- `src/main/java/com/dejavu/backend/user/controller/UserController.java`
- `src/main/java/com/dejavu/backend/user/dto/UpdateMyProfileRequest.java`
- `src/main/java/com/dejavu/backend/user/dto/UpdateMyProfileResponse.java`
- `src/main/java/com/dejavu/backend/user/service/UserService.java`

### 수정 파일

- `src/main/java/com/dejavu/backend/user/entity/User.java`

### 확인 내용

- 응답은 공통 `ApiResponse.ok(...)` 형식을 사용합니다.
- 인증이 필요한 API이므로 `SecurityConfig` 공개 경로에는 추가하지 않았습니다.
- 액세스 토큰이 없거나 유효하지 않으면 기존 JWT 인증 처리에 따라 `401 UNAUTHORIZED`가 반환됩니다.

---

## 3. MyPage 도메인

### 구현 API

```text
GET /api/v1/mypage
```

### 작업 내용

- 마이페이지 요약 조회 API를 추가했습니다.
- 로그인한 사용자의 정보를 기준으로 아래 데이터를 한 번에 조회합니다.

```text
profile
bookmarks
resumes
```

- `profile`은 `users` 테이블의 회원 정보를 사용합니다.
- `bookmarks`는 아직 별도 도메인 구현이 없으므로 마이페이지 전용 조회 저장소에서 `bookmarks`와 `job_notices`를 조인해 조회합니다.
- `resumes`는 기존 `ResumeRepository`의 `findByUserIdOrderByUpdatedAtDesc(...)`를 재사용합니다.
- 북마크 공고의 `recruitStatus`, `recruitStatusText`, `daysUntilDeadline`은 `deadline_at` 기준으로 계산합니다.

### 생성 파일

- `src/main/java/com/dejavu/backend/mypage/controller/MyPageController.java`
- `src/main/java/com/dejavu/backend/mypage/dto/MyPageBookmarkResponse.java`
- `src/main/java/com/dejavu/backend/mypage/dto/MyPageProfileResponse.java`
- `src/main/java/com/dejavu/backend/mypage/dto/MyPageResumeResponse.java`
- `src/main/java/com/dejavu/backend/mypage/dto/MyPageSummaryResponse.java`
- `src/main/java/com/dejavu/backend/mypage/repository/MyPageBookmarkRepository.java`
- `src/main/java/com/dejavu/backend/mypage/repository/MyPageBookmarkRow.java`
- `src/main/java/com/dejavu/backend/mypage/service/MyPageService.java`

### 수정 파일

- 없음

### 확인 내용

- `GET /api/v1/mypage`는 로그인 필요 API입니다.
- `bookmarks` 테이블과 `job_notices` 테이블이 존재해야 북마크 요약이 조회됩니다.
- `deadline_at`이 없는 공고는 `UNKNOWN`, `마감일 미정`, `daysUntilDeadline = null`로 응답합니다.
- `deadline_at`이 현재보다 이전이면 `CLOSED`, 이후이면 `OPEN`으로 계산합니다.

---

## 4. 검증 내용

아래 명령으로 전체 테스트를 확인했습니다.

```bash
./gradlew test
```

결과:

```text
BUILD SUCCESSFUL
```

---

## 5. 현재 브랜치 상태 메모

현재 브랜치:

```text
feature/skill
```

최근 관련 커밋:

```text
f109f70 [Add]_13/GET_Skills
60cfed1 [Add]_13/UserUpdate
```

마이페이지 작업은 아직 커밋 전 상태입니다.

---

## 6. 다음 작업 후보

- 마이페이지 API에 대한 MockMvc 테스트 추가
- 북마크 도메인 API 구현
- 이력서 API의 임시 `MVP_USER_ID = 1L`을 JWT 인증 사용자 기준으로 변경
- 마이페이지 응답에 북마크/이력서 개수 요약 필드 추가 여부 검토

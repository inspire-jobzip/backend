# Déjà vu 팀 프로젝트용 경량 RDB ERD 최종 정리

## 1. 이번 수정사항 반영 요약

지금까지 논의한 내용을 기준으로, 팀 프로젝트 MVP에 맞게 아래처럼 정리합니다.

- 채용 공고 수집처는 당장은 `사람인` 1개만 사용
- 회원가입 시 `희망직무`, `기술스택`, `경력여부`를 함께 저장
- 회원 탈퇴 데이터는 별도 상태값보다 `CASCADE 삭제` 중심으로 단순화
- 토큰 관리는 `user_refresh_tokens` 테이블로 분리
- 기술스택 필터링은 핵심 기능이므로 `skills`, `job_notice_skills` 유지
- 이력서의 학력/경력/기술스택 일부는 `JSON`으로 단순화
- 공고-이력서 AI 피드백은 `ai_recommendations`에 저장

## 2. 최종 테이블 구성

최종 추천 테이블은 아래 9개입니다.

- `users`
- `user_refresh_tokens`
- `skills`
- `job_notices`
- `job_notice_skills`
- `bookmarks`
- `resumes`
- `resume_projects`
- `ai_recommendations`

실제로는 9개입니다. MVP에서 가장 균형이 좋은 구성이 이 정도입니다.

## 3. 테이블별 최종 설계

### 3.1 `users`

회원가입과 인증에 필요한 핵심 정보만 둡니다.

| 컬럼명 | 데이터 타입 | Key | Null | 설명 |
|---|---|---|---|---|
| user_id | BIGINT | PK | N | 회원 식별자 |
| email | VARCHAR(255) | UK | N | 로그인 이메일 |
| password_hash | VARCHAR(255) |  | N | 암호화 비밀번호 |
| status | VARCHAR(20) |  | N | `ACTIVE`, `WITHDRAWN` 회원탈퇴상태 |
| desired_job_role | VARCHAR(100) |  | N | 희망 직무. 예: 백엔드, 프론트엔드 |
| career_status | VARCHAR(20) |  | N | 경력 상태. 예: `NEW`, `EXPERIENCED` |
| career_years | DECIMAL(4,1) |  | Y | 경력 연차. 신입이면 `0` 또는 `NULL` |
| preferred_skill_names_json | JSON |  | Y | 회원가입 시 입력받은 기술스택 배열 |
| created_at | TIMESTAMP |  | N | 생성일시 |
| updated_at | TIMESTAMP |  | N | 수정일시 |

설계 메모:

- 탈퇴 시 `users`를 직접 삭제하고 하위 데이터는 `CASCADE`
- `access token`은 DB에 저장하지 않음
- `refresh token`은 `user_refresh_tokens`에서 관리

### 3.2 `user_refresh_tokens`

로그인 세션과 리프레시 토큰을 관리하는 테이블입니다.

| 컬럼명 | 데이터 타입 | Key | Null | 설명 |
|---|---|---|---|---|
| refresh_token_id | BIGINT | PK | N | 리프레시 토큰 식별자 |
| user_id | BIGINT | FK | N | 회원 FK |
| token_hash | VARCHAR(255) | UK | N | 리프레시 토큰 해시 |
| expires_at | TIMESTAMP |  | N | 만료일시 |
| revoked_at | TIMESTAMP |  | Y | 로그아웃/폐기 시각 |
| created_at | TIMESTAMP |  | N | 발급 시각 |

설계 메모:

- 한 유저가 여러 기기에서 로그인할 수 있도록 분리
- 로그아웃 시 토큰 폐기 처리에 유리
- 토큰 평문 저장보다 해시 저장 권장

### 3.3 `skills`

기술스택 이름을 표준화하는 마스터 테이블입니다.

| 컬럼명 | 데이터 타입 | Key | Null | 설명 |
|---|---|---|---|---|
| skill_id | BIGINT | PK | N | 기술스택 식별자 |
| skill_name | VARCHAR(100) | UK | N | 표준 기술명. 예: `Java`, `Spring Boot`, `Docker` |
| category | VARCHAR(50) |  | Y | 언어, 프레임워크, DB, 인프라 등 |
| created_at | TIMESTAMP |  | N | 생성일시 |

설계 메모:

- 공고 필터링 정확도를 위해 유지
- 사용자 보유 기술은 MVP에서 `users.preferred_skill_names_json`으로 단순 저장

### 3.4 `job_notices`

사람인 API에서 가져온 공고의 캐시이자 서비스용 공고 본체입니다.

| 컬럼명 | 데이터 타입 | Key | Null | 설명 |
|---|---|---|---|---|
| job_notice_id | BIGINT | PK | N | 내부 공고 식별자 |
| external_notice_id | VARCHAR(100) | UK | N | 사람인 공고 원본 ID |
| company_name | VARCHAR(200) |  | N | 기업명 |
| title | VARCHAR(300) |  | N | 공고 제목 |
| source_url | VARCHAR(1000) |  | Y | 사람인 원문 URL |
| job_category | VARCHAR(100) |  | Y | 대표 직무 |
| location_text | VARCHAR(255) |  | Y | 근무지 |
| experience_level | VARCHAR(50) |  | Y | 신입, 경력, 경력무관 |
| employment_type | VARCHAR(50) |  | Y | 정규직, 인턴, 계약직 |
| education_level | VARCHAR(100) |  | Y | 학력 조건 |
| salary_text | VARCHAR(255) |  | Y | 급여 정보 |
| deadline_at | TIMESTAMP |  | Y | 마감일시 |
| role_keywords_text | TEXT |  | Y | 직무/기술 키워드 텍스트 |
| description_raw | TEXT |  | Y | 공고 원문 또는 수집 본문 |
| ai_analysis_json | JSON |  | Y | AI 업무 예측 결과 |
| raw_payload | JSON |  | Y | 사람인 API 원본 응답 캐시 |
| fetched_at | TIMESTAMP |  | N | 마지막 수집 시각 |
| is_active | BOOLEAN |  | N | 현재 서비스 노출 여부 |
| created_at | TIMESTAMP |  | N | 생성일시 |
| updated_at | TIMESTAMP |  | N | 수정일시 |

설계 메모:

- `source_provider`는 제거
- 현재는 사람인만 사용하므로 `external_notice_id` 단독 유니크
- 그래도 `job_notice_id`는 내부 PK로 유지

### 3.5 `job_notice_skills`

공고와 기술스택의 N:M 관계를 풀기 위한 매핑 테이블입니다.

| 컬럼명 | 데이터 타입 | Key | Null | 설명 |
|---|---|---|---|---|
| job_notice_id | BIGINT | PK, FK | N | 공고 FK |
| skill_id | BIGINT | PK, FK | N | 기술스택 FK |
| created_at | TIMESTAMP |  | N | 생성일시 |

복합 PK: (`job_notice_id`, `skill_id`)

설계 메모:

- 핵심 이유는 `기술스택별 공고 필터링`
- `"Java, Spring"` 같은 문자열 저장보다 정확한 조회가 가능

### 3.6 `bookmarks`

회원이 저장한 관심 공고 목록입니다. 캘린더 기능은 이 테이블과 `job_notices.deadline_at` 조합으로 구현합니다.

| 컬럼명 | 데이터 타입 | Key | Null | 설명 |
|---|---|---|---|---|
| bookmark_id | BIGINT | PK | N | 북마크 식별자 |
| user_id | BIGINT | FK | N | 회원 FK |
| job_notice_id | BIGINT | FK | N | 공고 FK |
| created_at | TIMESTAMP |  | N | 등록일시 |

복합 유니크 키: (`user_id`, `job_notice_id`)

### 3.7 `resumes`

텍스트 기반 이력서 본체입니다.

| 컬럼명 | 데이터 타입 | Key | Null | 설명 |
|---|---|---|---|---|
| resume_id | BIGINT | PK | N | 이력서 식별자 |
| user_id | BIGINT | FK | N | 회원 FK |
| title | VARCHAR(300) |  | N | 이력서 제목 |
| name | VARCHAR(100) |  | N | 이름 |
| email | VARCHAR(255) |  | N | 연락 이메일 |
| phone | VARCHAR(30) |  | Y | 연락처 |
| github_url | VARCHAR(500) |  | Y | GitHub 주소 |
| blog_url | VARCHAR(500) |  | Y | 블로그 주소 |
| summary_text | TEXT |  | Y | 자기소개 요약 |
| education_json | JSON |  | Y | 학력 배열 JSON |
| experience_json | JSON |  | Y | 경력 배열 JSON |
| resume_skill_names_json | JSON |  | Y | 이력서 기술스택 배열 JSON |
| motivation_text | TEXT |  | Y | 지원동기 |
| strengths_and_weaknesses_text | TEXT |  | Y | 장단점 |
| is_default | BOOLEAN |  | N | 기본 이력서 여부 |
| created_at | TIMESTAMP |  | N | 생성일시 |
| updated_at | TIMESTAMP |  | N | 수정일시 |

설계 메모:

- 학력, 경력, 기술스택은 MVP라서 JSON으로 단순화
- 이력서 프로젝트 경험은 별도 테이블로 분리

### 3.8 `resume_projects`

이력서 내 프로젝트 경험 저장 테이블입니다.

| 컬럼명 | 데이터 타입 | Key | Null | 설명 |
|---|---|---|---|---|
| resume_project_id | BIGINT | PK | N | 프로젝트 식별자 |
| resume_id | BIGINT | FK | N | 이력서 FK |
| project_name | VARCHAR(255) |  | N | 프로젝트명 |
| role_name | VARCHAR(150) |  | Y | 담당 역할 |
| start_year_month | CHAR(7) |  | Y | 시작 연월(`YYYY-MM`) |
| end_year_month | CHAR(7) |  | Y | 종료 연월(`YYYY-MM`) |
| description | TEXT |  | Y | 프로젝트 설명 |
| troubleshooting | TEXT |  | Y | 트러블슈팅/성과 |
| tech_stacks_json | JSON |  | Y | 프로젝트 기술스택 배열 JSON |
| sort_order | INTEGER |  | N | 출력 순서 |
| created_at | TIMESTAMP |  | N | 생성일시 |

### 3.9 `ai_recommendations`

특정 공고와 이력서를 비교해 생성한 AI 피드백 결과를 저장합니다.

| 컬럼명 | 데이터 타입 | Key | Null | 설명 |
|---|---|---|---|---|
| ai_recommendation_id | BIGINT | PK | N | AI 피드백 식별자 |
| user_id | BIGINT | FK | N | 요청 회원 FK |
| job_notice_id | BIGINT | FK | N | 대상 공고 FK |
| resume_id | BIGINT | FK | N | 대상 이력서 FK |
| feedback_text | TEXT |  | N | 종합 피드백 |
| response_payload | JSON |  | Y | 부족 키워드, 추천 프로젝트 등 전체 응답 JSON |
| model_name | VARCHAR(100) |  | Y | 사용 모델명 |
| created_at | TIMESTAMP |  | N | 생성일시 |

## 4. 관계 정리

- `users` 1:N `user_refresh_tokens`
- `users` 1:N `bookmarks`
- `users` 1:N `resumes`
- `users` 1:N `ai_recommendations`
- `job_notices` 1:N `job_notice_skills`
- `job_notices` 1:N `bookmarks`
- `job_notices` 1:N `ai_recommendations`
- `skills` 1:N `job_notice_skills`
- `resumes` 1:N `resume_projects`
- `resumes` 1:N `ai_recommendations`

## 5. 삭제 정책

- 회원 탈퇴 시 `users` 삭제
- 연관 `user_refresh_tokens`, `bookmarks`, `resumes`, `resume_projects`, `ai_recommendations`는 `CASCADE`
- 공고 삭제 시 `job_notice_skills`, `bookmarks`, `ai_recommendations`는 `CASCADE`
- `skills`는 마스터 데이터이므로 삭제하지 않음

## 6. 중복 방지 정책

- `users.email` 유니크
- `skills.skill_name` 유니크
- `job_notices.external_notice_id` 유니크
- `bookmarks(user_id, job_notice_id)` 유니크
- `job_notice_skills(job_notice_id, skill_id)` 복합 PK

## 7. MariaDB 메모

- MariaDB의 `JSON`은 내부적으로 별도 바이너리 타입이 아니라 JSON 유효성 검사가 붙은 문자열 계열로 이해하면 됩니다.
- MVP에서는 그대로 사용해도 충분합니다.
- 나중에 조회가 잦아지면 JSON 내부 값은 별도 컬럼/테이블로 빼는 방식으로 확장하면 됩니다.

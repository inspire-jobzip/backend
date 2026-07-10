# dejavu 백엔드 폴더 구조 문서

## 1. 문서 목적

이 문서는 현재 `dejavu` 백엔드 프로젝트의 폴더 구조를 설명하기 위해 작성합니다.

`docs/api/api-spec.md`, `docs/database/erd-plan.md`, `docs/database/ddl.sql`, `docs/convention/git-rules.md`를 기준으로,
현재 프로젝트가 어떤 역할 단위로 나뉘어 있는지 정리합니다.

현재 백엔드는 Spring Boot 기반으로 초기 세팅이 진행된 상태이며,
설정 영역은 일부 구현되었고 도메인 패키지는 이후 기능 구현을 위한 골격이 먼저 잡혀 있습니다.

---

## 2. 최상위 폴더 구조

```text
backend
├── docs
│   ├── api
│   ├── convention
│   └── database
├── gradle
├── src
│   ├── main
│   │   ├── java/com/dejavu/backend
│   │   └── resources
│   └── test
├── .env
├── .env.example
├── build.gradle
├── settings.gradle
├── gradlew
└── gradlew.bat
```

### 각 폴더/파일 역할

| 경로 | 설명 |
| --- | --- |
| `docs/` | 프로젝트 문서 모음 |
| `gradle/` | Gradle Wrapper 실행에 필요한 파일 |
| `src/main/java/` | 실제 백엔드 애플리케이션 Java 코드 |
| `src/main/resources/` | 설정 파일, 정적 리소스, 템플릿 |
| `src/test/java/` | 테스트 코드 |
| `.env` | 로컬 실행용 환경변수 파일 |
| `.env.example` | 팀 공유용 환경변수 예시 |
| `build.gradle` | 의존성 및 빌드 설정 |
| `settings.gradle` | Gradle 프로젝트 이름/구성 설정 |

---

## 3. docs 폴더 구조

```text
docs
├── ai
│   └── job-resume-keyword-comparison.md
├── api
│   └── api-spec.md
├── convention
│   └── git-rules.md
├── database
│   ├── ddl.sql
│   └── erd-plan.md
└── project-folder-structure.md
```

### 문서별 역할

| 문서 | 설명 |
| --- | --- |
| `docs/ai/job-resume-keyword-comparison.md` | 공고 기술스택과 이력서 기술스택 비교 기능 설명 |
| `docs/api/api-spec.md` | MVP 기준 API 명세 초안 |
| `docs/convention/git-rules.md` | 브랜치 전략, 커밋 규칙, PR 규칙 |
| `docs/database/erd-plan.md` | DB 테이블 설계 방향 및 관계 설명 |
| `docs/database/ddl.sql` | MariaDB 기준 실제 DDL 초안 |
| `docs/project-folder-structure.md` | 현재 백엔드 프로젝트 구조 설명 문서 |

---

## 4. src/main/java 구조

현재 Java 패키지는 아래처럼 구성되어 있습니다.

```text
src/main/java/com/dejavu/backend
├── BackendApplication.java
├── airecommendation
├── auth
│   └── entity
├── bookmark
├── calendar
├── common
│   ├── config
│   ├── filter
│   └── util
├── jobnotice
├── resume
├── skill
└── user
```

이 구조는 기능별 패키지를 분리하는 방식입니다.

즉, `Auth`, `User`, `Resume`, `Job Notice`처럼 도메인별로 코드를 나누고,
여러 기능에서 공통으로 사용하는 설정과 유틸은 `common` 아래에 두는 방향입니다.

---

## 5. 주요 패키지 설명

### 5.1 `com.dejavu.backend`

애플리케이션 루트 패키지입니다.

- `BackendApplication.java`
  - Spring Boot 실행 시작점
  - 전체 컴포넌트 스캔 기준 패키지

### 5.2 `com.dejavu.backend.common`

공통 기능을 담는 패키지입니다.

현재 구조상 아래 역할로 나뉘어 있습니다.

| 패키지 | 역할 |
| --- | --- |
| `common.config` | 보안, CORS, Swagger 등 전역 설정 |
| `common.filter` | JWT 인증 필터, 요청 공통 필터 예정 |
| `common.util` | 토큰 유틸, 날짜/응답 공통 유틸 예정 |

### 5.3 `com.dejavu.backend.auth`

로그인, 회원가입, 토큰 재발급, 로그아웃 등 인증 기능 패키지입니다.

`docs/api/api-spec.md`의 `Auth API`와 직접 연결되는 영역입니다.

현재 하위에 `entity` 패키지가 있으며,
이후에는 아래와 같은 클래스가 들어갈 가능성이 높습니다.

- `controller`
- `service`
- `repository`
- `dto`
- `entity`

### 5.4 `com.dejavu.backend.user`

회원 프로필 수정, 사용자 정보 조회 등 사용자 기능 패키지입니다.

API 문서의 `User API`와 연결됩니다.

### 5.5 `com.dejavu.backend.skill`

기술스택 목록 조회, 카테고리 기반 조회 등 기술스택 관련 패키지입니다.

ERD의 `skills` 테이블과 연결되는 영역입니다.

### 5.6 `com.dejavu.backend.jobnotice`

채용공고 목록/상세/필터링/스크랩 연계 기능을 담당하는 패키지입니다.

다음 문서와 연결됩니다.

- `docs/api/api-spec.md`의 `Job Notice API`
- `docs/database/erd-plan.md`의 `job_notices`, `job_notice_skills`

### 5.7 `com.dejavu.backend.bookmark`

회원이 저장한 공고 북마크 기능 패키지입니다.

ERD의 `bookmarks` 테이블과 연결됩니다.

### 5.8 `com.dejavu.backend.resume`

이력서 CRUD, 프로젝트 경험, AI 피드백 대상 이력서 관리 기능 패키지입니다.

다음 DB 구조와 직접 연결됩니다.

- `resumes`
- `resume_projects`

### 5.9 `com.dejavu.backend.airecommendation`

특정 공고와 이력서를 비교해 AI 분석 결과를 저장하거나 조회하는 기능 패키지입니다.

ERD의 `ai_recommendations` 테이블과 연결되는 영역입니다.

### 5.10 `com.dejavu.backend.calendar`

북마크한 공고의 마감일을 일정 형태로 보여주는 기능 패키지입니다.

API 문서의 `Calendar` 화면 요구사항과 연결됩니다.

---

## 6. common/config 현재 구현 파일 설명

현재 실제로 구현된 주요 설정 클래스는 아래 4개입니다.

```text
src/main/java/com/dejavu/backend/common/config
├── CorsConfig.java
├── CorsProperties.java
├── SecurityConfig.java
└── SwaggerConfig.java
```

### 각 파일 역할

| 파일 | 역할 |
| --- | --- |
| `CorsProperties.java` | `application.yml`의 CORS 설정값 바인딩 |
| `CorsConfig.java` | 허용 origin, method, header 등 CORS 정책 등록 |
| `SecurityConfig.java` | Spring Security 기본 정책 및 공개 경로 설정 |
| `SwaggerConfig.java` | Swagger/OpenAPI 문서 정보 및 Bearer JWT 스키마 등록 |

현재 `SecurityConfig`는 세션 없는 `stateless` 기반으로 열려 있어,
이후 JWT 필터를 붙이기 쉬운 구조입니다.

---

## 7. src/main/resources 구조

현재 리소스 폴더는 아래와 같습니다.

```text
src/main/resources
├── application.yml
├── application-local.yml
├── application-prod.yml
├── static
└── templates
```

### 각 파일 역할

| 파일 | 설명 |
| --- | --- |
| `application.yml` | 공통 설정 |
| `application-local.yml` | 로컬 개발용 설정 |
| `application-prod.yml` | 운영 배포용 설정 |
| `static/` | 정적 리소스용 폴더 |
| `templates/` | 서버 템플릿 엔진 사용 시 템플릿 위치 |

현재 프로젝트는 REST API 서버 중심 구조이므로,
실질적으로 중요한 설정 파일은 `application*.yml`입니다.

---

## 8. src/test 구조

```text
src/test/java/com/dejavu/backend
└── BackendApplicationTests.java
```

현재는 프로젝트 기본 실행 여부를 확인하는 테스트가 들어 있습니다.

이후 기능 구현이 진행되면 아래 테스트들이 추가될 수 있습니다.

- 컨트롤러 테스트
- 서비스 단위 테스트
- 리포지토리 테스트
- 통합 테스트
- Security/JWT 테스트

---

## 9. 현재 구조와 문서의 연결 관계

현재 폴더 구조는 프로젝트 문서와 아래처럼 연결됩니다.

| 문서 | 연결되는 코드 패키지 |
| --- | --- |
| `docs/api/api-spec.md` | `auth`, `user`, `skill`, `jobnotice`, `bookmark`, `resume`, `calendar`, `airecommendation` |
| `docs/database/erd-plan.md` | `user`, `auth`, `skill`, `jobnotice`, `bookmark`, `resume`, `airecommendation` |
| `docs/database/ddl.sql` | Entity, Repository 설계 기준 |
| `docs/convention/git-rules.md` | 브랜치/커밋/PR 작업 방식 기준 |

즉, 현재 폴더 구조는 API 화면 단위와 DB 테이블 단위를 함께 반영한 초기 설계라고 볼 수 있습니다.

---

## 10. 현재 시점 정리

현재 백엔드 구조는 아래 특징을 가집니다.

- Spring Boot + Gradle 기반 초기 프로젝트 세팅이 완료된 상태
- 환경설정은 `application.yml`, `.env`, `common.config` 중심으로 구성
- 도메인 패키지는 MVP 기능 기준으로 미리 분리됨
- 실제 구현은 아직 설정 영역 위주로 시작된 상태
- 이후 각 도메인 패키지에 `controller`, `service`, `repository`, `dto`, `entity` 등이 채워질 예정

정리하면, 지금 폴더 구조는 단순 파일 나열이 아니라
MVP 기능 문서와 DB 설계 문서를 기준으로 백엔드 기능을 확장하기 쉽게 미리 나눠 놓은 초기 아키텍처입니다.

# dejavu API 명세 초안

와이어프레임 기준으로 `dejavu` MVP 화면은 크게 6개입니다.

1. 메인: 맞춤 채용공고 리스트 + 필터 + 북마크
2. Auth: 로그인 / 회원가입
3. 공고 상세: 공고 원문 + AI 업무 분석 + 이력서 보완 키워드
4. Calendar: 전체/스크랩 공고 마감일정
5. My Page: 프로필 + 스크랩 공고 + 이력서 목록
6. Resume CRUD: 개발자 이력서 작성/수정

## 주의사항

각 도메인 별 최종 수정 api는 노션의 api 명세서 표를 확인. (본 명세서는 흐름을 위한 전체 api명세서입니다)


## 공통

### Base URL

```text
/api/v1
```

### 인증 헤더

```text
Authorization: Bearer {accessToken}
```

### 공통 성공 응답

```json
{
  "success": true,
  "data": {},
  "message": "요청이 성공했습니다."
}
```

### 공통 실패 응답

```json
{
  "success": false,
  "error": {
    "code": "UNAUTHORIZED",
    "message": "로그인이 필요합니다."
  }
}
```

## 1. Auth API

### 1.1 회원가입

```text
POST /auth/signup

desiredJobRole 허용 값:
BACKEND | FRONTEND | FULLSTACK | MOBILE | DATA | AI | DEVOPS | SECURITY | QA | GAME
```

#### Request

```json
{
  "email": "user@email.com",
  "password": "password1234",
  "desiredJobRole": "Backend Developer",
  "careerStatus": "NEW",
  "careerYears": 0,
  "preferredSkillNames": ["React", "TypeScript", "Spring Boot"]
}
```

#### Response

```json
{
  "success": true,
  "data": {
    "userId": 1,
    "email": "user@email.com",
    "desiredJobRole": "Backend Developer",
    "careerStatus": "NEW",
    "careerYears": 0,
    "preferredSkillNames": ["React", "TypeScript", "Spring Boot"]
  }
}
```

### 1.2 로그인

```text
POST /auth/login
```

#### Request

```json
{
  "email": "user@email.com",
  "password": "password1234"
}
```

#### Response

```json
{
  "success": true,
  "data": {
    "accessToken": "jwt-access-token",
    "refreshToken": "refresh-token",
    "user": {
      "userId": 1,
      "email": "user@email.com",
      "desiredJobRole": "Backend Developer",
      "careerStatus": "NEW"
    }
  }
}
```

### 1.3 토큰 재발급

```text
POST /auth/refresh
```

#### Request

```json
{
  "refreshToken": "refresh-token"
}
```

#### Response

```json
{
  "success": true,
  "data": {
    "accessToken": "new-access-token",
    "refreshToken": "new-refresh-token"
  }
}
```

### 1.4 로그아웃

```text
POST /auth/logout
```

로그인 필요.

#### Request

```json
{
  "refreshToken": "refresh-token"
}
```

#### Response

```json
{
  "success": true,
  "message": "로그아웃되었습니다."
}
```

## 2. User API

### 2.1 내 프로필 수정

```text
PATCH /users/me
```

로그인 필요.

#### Request

```json
{
  "desiredJobRole": "FRONTEND",
  "careerStatus": "EXPERIENCED",
  "careerYears": 2,
  "preferredSkillNames": ["React", "TypeScript", "Next.js"]
}
```

#### Response

```json
{
  "success": true,
  "data": {
    "userId": 1,
    "desiredJobRole": "Frontend Engineer",
    "careerStatus": "EXPERIENCED",
    "careerYears": 2,
    "preferredSkillNames": ["React", "TypeScript", "Next.js"]
  }
}
```

## 3. Skill API

### 3.1 기술스택 목록 조회

```text
GET /skills
```

#### Query Parameters

| 이름 | 필수 | 설명 |
| --- | --- | --- |
| `keyword` | N | 기술명 검색 |
| `category` | N | 기술 카테고리 |

#### Response

```json
{
  "success": true,
  "data": [
    {
      "skillId": 1,
      "skillName": "React",
      "category": "Frontend"
    },
    {
      "skillId": 2,
      "skillName": "Spring Boot",
      "category": "Backend"
    }
  ]
}
```

## 4. Job Notice API

### 4.1 채용공고 목록 조회

```text
GET /job-notices
```

비회원도 조회 가능.

로그인 사용자는 `preferredSkillNames` 기준으로 `match` 정보를 함께 내려줄 수 있습니다.

#### Query Parameters

| 이름 | 필수 | 설명 |
| --- | --- | --- |
| `keyword` | N | 회사명/공고명 검색 |
| `jobRole` | N | 직무 필터 | 
| `skillNames` | N | `React,Spring,JPA` |
| `experienceLevel` | N | `NEW`, `EXPERIENCED`, `ANY` |
| `location` | N | 지역 |
| `sort` | N | `latest`, `deadline`, `jaccard` |
| `page` | N | 페이지 번호 |
| `size` | N | 페이지 크기 |

**jobRole 허용 값**

`BACKEND`, `FRONTEND`, `FULLSTACK`, `MOBILE`, `DATA`, `AI`, `DEVOPS`, `SECURITY`, `QA`, `GAME`

**experienceLevel 허용 값**

- `NEW`
- `EXPERIENCED`
- `ANY`

**sort 허용 값**

- `latest`
- `deadline`
- `~~jaccard~~`

#### Response

```json
{
  "success": true,
  "data": {
    "content": [
      {
        "jobNoticeId": 101,
        "companyName": "카카오",
        "title": "Backend Developer",
        "jobCategory": "Backend",
        "locationText": "서울",
        "experienceLevel": "신입/경력",
        "employmentType": "정규직",
        "deadlineAt": "2027-07-12T23:59:59",
        "skillNames": ["React", "Spring", "Java"],
        "isBookmarked": false
      }
    ],
    "page": 0,
    "size": 20,
    "totalElements": 100
  }
}
```

### 4.2  채용공고 상세 조회

```text
GET /job-notices/{jobNoticeId}
```
### Header

- 없음

### Path Parameter

- `jobNoticeId` (integer) : 조회할 공고 ID

**Request Example**

```
GET /api/v1/job-notices/101
```

### Response

- 공통 성공 응답 구조 사용
- `data.jobNoticeId` (integer) : 공고 ID
- `data.externalNoticeId` (string) : 외부 공고 원본 ID
- `data.companyName` (string) : 회사명
- `data.title` (string) : 공고 제목
- `data.sourceUrl` (string) : 원문 URL
- `data.jobCategory` (string) : 대표 직무
- `data.locationText` (string) : 근무지
- `data.experienceLevel` (string) : 경력 조건
- `data.employmentType` (string) : 고용 형태
- `data.educationLevel` (string) : 학력 조건
- `data.salaryText` (string) : 급여 정보
- `data.deadlineAt` (string) : 마감일시
- `data.roleKeywordsText` (string) : 직무/기술 키워드 텍스트
- `data.descriptionRaw` (string) : 공고 원문
- `data.skillNames` (array of strings) : 공고 기술스택
- `data.isBookmarked` (boolean) : 스크랩 여부
- `data.jaccardScore` (number) : 유사도 점수


**Success**
#### Response

```json
{
  "success": true,
  "data": {
    "jobNoticeId": 101,
    "externalNoticeId": "saramin_12345",
    "companyName": "카카오",
    "title": "Backend Developer",
    "sourceUrl": "https://www.saramin.co.kr/...",
    "jobCategory": "Backend",
    "locationText": "서울",
    "experienceLevel": "신입/경력",
    "employmentType": "정규직",
    "educationLevel": "학력무관",
    "salaryText": "회사 내규에 따름",
    "deadlineAt": "2027-07-12T23:59:59",
    "roleKeywordsText": "Java, Spring Boot, JPA, MSA",
    "descriptionRaw": "공고 원문 내용입니다.",
    "skillNames": ["Java", "Spring Boot", "JPA", "MSA"],
    "isBookmarked": true,
    "jaccardScore": 0.5"
  }
}
```


### Error

- 공통 실패 응답 구조 사용

**Error Example**

```
{
  "success": false,
  "error": {
    "code": "JOB_NOTICE_NOT_FOUND",
    "message": "채용공고를 찾을 수 없습니다."
  }
}
```

### 예외

1. `jobNoticeId` 형식이 잘못되면 `400 Bad Request`
2. 해당 공고가 존재하지 않으면 `404 Not Found`
3. 서버 처리 실패 시 `500 Internal Server Error`


## 5. Job AI Analysis API

### 5.1 공고 기반 담당업무 AI 분석

```text
POST /job-notices/{jobNoticeId}/ai-analysis
```

#### Header

- `Authorization: Bearer {accessToken}` 선택
- 비회원도 분석 가능하게 할 경우 Header 없음 가능

#### Path Variable

- `jobNoticeId` (number) : 분석할 채용공고 ID

#### Request

- 없음

#### Response

- `data.jobNoticeId` (number) : 채용공고 ID
- `data.cached` (boolean) : 기존 분석 결과 사용 여부
- `data.aiAnalysis.taskSummary` (array of strings) : AI가 예측한 담당업무 요약
- `data.aiAnalysis.requiredSkills` (array of strings) : 공고에서 요구하는 주요 기술
- `data.aiAnalysis.analyzedAt` (string) : 분석 시각


```json
{
  "success": true,
  "data": {
    "jobNoticeId": 101,
    "cached": true,
    "aiAnalysis": {
      "taskSummary": [
        "입사 후 Spring Boot 기반 백엔드 API 개발 업무를 담당할 가능성이 높습니다.",
        "JPA와 MySQL을 활용한 데이터 모델링 업무가 포함될 수 있습니다.",
        "서비스 운영 및 장애 대응 업무를 경험할 수 있습니다."
      ],
      "requiredSkills": ["Java", "Spring Boot", "JPA", "MSA"],
      "analyzedAt": "2026-07-10T12:00:00"
    }
  }
}
```


## 6. Bookmark API

### 6.1 공고 북마크 등록

```text
POST /job-notices/{jobNoticeId}/bookmark
```

#### Header

- `Authorization: Bearer {accessToken}` 필수

#### Path Variable

- `jobNoticeId` (number) : 북마크할 채용공고 ID

#### Request

- 없음

#### Response

- `data.bookmarkId` (number) : 생성된 북마크 ID
- `data.jobNoticeId` (number) : 채용공고 ID
- `data.isBookmarked` (boolean) : 북마크 여부

**Success**

```json
{
  "success": true,
  "data": {
    "bookmarkId": 1,
    "jobNoticeId": 101,
    "isBookmarked": true
  },
  "message": "공고를 스크랩했습니다."
}
```

#### 예외

1. 로그인하지 않은 경우 `401 Unauthorized`
2. 존재하지 않는 공고이면 `404 Not Found`
3. 이미 북마크한 공고이면 `409 Conflict`

### 6.2 공고 북마크 취소

```text
DELETE /job-notices/{jobNoticeId}/bookmark
```

#### Header

- `Authorization: Bearer {accessToken}` 필수

#### Path Variable

- `jobNoticeId` (number) : 북마크 취소할 채용공고 ID

#### Request

- 없음

#### Response

- `data.jobNoticeId` (number) : 채용공고 ID
- `data.isBookmarked` (boolean) : 북마크 여부

**Success**

```json
{
  "success": true,
  "data": {
    "jobNoticeId": 101,
    "isBookmarked": false
  },
  "message": "스크랩을 취소했습니다."
}
```

#### 예외

1. 로그인하지 않은 경우 `401 Unauthorized`
2. 북마크하지 않은 공고이면 `404 Not Found`

### 6.3 내 북마크 공고 목록 조회

```text
GET /bookmarks
```

### Header

- `Authorization: Bearer {accessToken}` 필수

#### Query Parameters

- `status` (string) : 공고 상태. `OPEN`, `CLOSING_SOON`, `CLOSED`
- `page` (number) : 페이지 번호
- `size` (number) : 페이지 크기

#### Response

- `data.bookmarkId` (number) : 북마크 ID
- `data.jobNoticeId` (number) : 채용공고 ID
- `data.companyName` (string) : 회사명
- `data.title` (string) : 공고 제목
- `data.deadlineAt` (string) : 마감일시
- `data.recruitStatus` (string) : 공고 상태 코드
- `data.recruitStatusText` (string) : 공고 상태 표시명
- `data.daysUntilDeadline` (number) : 마감일까지 남은 일수
- `data.skillNames` (array of strings) : 기술스택 목록

**Success**

```json
{
  "success": true,
  "data": [
    {
      "bookmarkId": 1,
      "jobNoticeId": 101,
      "companyName": "카카오",
      "title": "Backend Developer",
      "deadlineAt": "2026-07-12T23:59:59",
      "recruitStatus": "OPEN",
      "recruitStatusText": "모집 중",
      "daysUntilDeadline": 2,
      "skillNames": ["Java", "Spring Boot", "JPA"]
    }
  ]
}
```

#### 예외

1. 로그인하지 않은 경우 `401 Unauthorized`
2. Query Parameter 형식 오류 시 `400 Bad Request`


## 7. Calendar API

### 7.1 전체 공고 마감일정 조회

```text
GET /calendar/job-notices
```

비회원도 조회 가능.


#### Header

- 없음

#### Query Parameters

| 이름 | 필수 | 설명 |
| --- | --- | --- |
| `year` | Y | 조회 연도 |
| `month` | Y | 조회 월 |
| `jobRole` | N | 직무 |
| `skillNames` | N | 기술스택 |


#### Response

- `data.year` (number) : 조회 연도
- `data.month` (number) : 조회 월
- `data.events` (array) : 달력에 표시할 공고 일정 목록

**Success**
#### Response

```json
{
  "success": true,
  "data": {
    "year": 2026,
    "month": 7,
    "events": [
      {
        "jobNoticeId": 101,
        "companyName": "카카오",
        "title": "Backend Developer",
        "deadlineAt": "2026-07-12T23:59:59",
        "eventType": "DEADLINE",
        "recruitStatus": "OPEN"
        "recruitStatusText": "모집 중",
      }
    ]
  }
}
```

#### 예외

1. 연도 또는 월 누락 시 `400 Bad Request`
2. 잘못된 월 값이면 `400 Bad Request`



### 7.2 내 스크랩 공고 마감일정 조회

```text
GET /calendar/bookmarks
```

로그인 필요.

#### Query Parameters

| 이름 | 필수 | 설명 |
| --- | --- | --- |
| `year` | Y | 조회 연도 |
| `month` | Y | 조회 월 |

#### Response

- `data.summary.openCount` (number) : 모집 중 공고 수
- `data.summary.closingSoonCount` (number) : 마감 임박 공고 수
- `data.summary.closedCount` (number) : 마감 공고 수
- `data.events` (array) : 스크랩한 공고 일정 목록

**Success**

```json
{
  "success": true,
  "data": {
    "year": 2026,
    "month": 7,
    "summary": {
      "openCount": 2,
      "closingSoonCount": 1,
      "closedCount": 1
    },
    "events": [
      {
        "bookmarkId": 1,
        "jobNoticeId": 101,
        "companyName": "카카오",
        "title": "Backend Developer",
        "deadlineAt": "2026-07-12T23:59:59",
        "recruitStatus": "OPEN",
        "recruitStatusText": "모집 중"
      }
    ]
  }
}
```

#### 예외

1. 로그인하지 않은 경우 `401 Unauthorized`
2. 연도 또는 월 누락 시 `400 Bad Request`

## 8. My Page API

### 8.1 마이페이지 요약 조회

```text
GET /mypage
```

로그인 필요.

#### Header

- `Authorization: Bearer {accessToken}` 필수

#### Request

- 없음
- 로그인 토큰을 통해 현재 사용자를 식별

#### Response

- `data.profile` (object) : 회원 프로필 정보
- `data.profile.userId` (number) : 회원 ID
- `data.profile.email` (string) : 회원 이메일
- `data.profile.desiredJobRole` (string) : 희망 직무
- `data.profile.careerStatus` (string) : 경력 상태
- `data.profile.careerYears` (number) : 경력 연차
- `data.profile.preferredSkillNames` (array of strings) : 선호 기술스택
- `data.bookmarks` (array) : 스크랩한 공고 목록
- `data.resumes` (array) : 이력서 목록

**Success**

```
{
  "success": true,
  "data": {
    "profile": {
      "userId": 1,
      "email": "user@email.com",
      "desiredJobRole": "BACKEND",
      "careerStatus": "NEW",
      "careerYears": 0,
      "preferredSkillNames": ["React", "Spring", "JPA"]
    },
    "bookmarks": [
      {
        "bookmarkId": 1,
        "jobNoticeId": 101,
        "companyName": "카카오",
        "title": "Backend Developer",
        "recruitStatus": "OPEN",
        "recruitStatusText": "모집 중",
        "deadlineAt": "2026-07-12T23:59:59",
        "daysUntilDeadline": 2
      }
    ],
    "resumes": [
      {
        "resumeId": 10,
        "title": "Resume 01",
        "isDefault": true,
        "updatedAt": "2026-07-10T12:00:00"
      }
    ]
  }
}
```

#### Error

```
{
  "success": false,
  "error": {
    "code": "UNAUTHORIZED",
    "message": "로그인이 필요합니다."
  }
}
```

#### 예외

1. 로그인하지 않은 경우 `401 Unauthorized`
2. 토큰이 만료된 경우 `401 Unauthorized`
3. 서버 처리 실패 시 `500 Internal Server Error`




## 9. Resume API

### 9.1 이력서 생성

```text
POST /resumes
```

로그인 필요.

#### Request

```json
{
  "title": "Resume 01",
  "name": "홍길동",
  "email": "developer@email.com",
  "phone": "010-1234-5678",
  "githubUrl": "https://github.com/your-id",
  "blogUrl": "https://velog.io/@your-id",
  "summaryText": "백엔드 개발자를 지망하는 신입 개발자입니다.",
  "education": [
    {
      "schoolName": "한국대학교",
      "major": "컴퓨터공학과",
      "status": "재학",
      "startYearMonth": "2023-03",
      "endYearMonth": "2027-02"
    }
  ],
  "experience": [],
  "resumeSkillNames": ["Java", "Spring Boot", "MySQL"],
  "motivationText": "지원동기 내용입니다.",
  "strengthsAndWeaknessesText": "장단점 내용입니다.",
  "isDefault": true
}
```

#### Response

```json
{
  "success": true,
  "data": {
    "resumeId": 10,
    "title": "Resume 01",
    "isDefault": true
  }
}
```
-> 한사람당 여러 이력서 생성할 수 있어야하기 때문에 

### 9.2 이력서 목록 조회

```text
GET /resumes
```

로그인 필요.

#### Response

```json
{
  "success": true,
  "data": [
    {
      "resumeId": 10,
      "title": "Resume 01",
      "name": "홍길동",
      "isDefault": true,
      "updatedAt": "2026-07-09T12:00:00"
    }
  ]
}
```

### 9.3 이력서 상세 조회

```text
GET /resumes/{resumeId}
```

로그인 필요.

#### Response

```json
{
  "success": true,
  "data": {
    "resumeId": 10,
    "title": "Resume 01",
    "name": "홍길동",
    "email": "developer@email.com",
    "phone": "010-1234-5678",
    "githubUrl": "https://github.com/your-id",
    "blogUrl": "https://velog.io/@your-id",
    "summaryText": "백엔드 개발자를 지망하는 신입 개발자입니다.",
    "education": [],
    "experience": [],
    "resumeSkillNames": ["Java", "Spring Boot", "MySQL"],
    "motivationText": "지원동기 내용입니다.",
    "strengthsAndWeaknessesText": "장단점 내용입니다.",
    "isDefault": true,
    "projects": [
      {
        "resumeProjectId": 1,
        "projectName": "AI 기반 채용공고 필터링 서비스",
        "roleName": "백엔드 개발",
        "startYearMonth": "2026-04",
        "endYearMonth": "2026-06",
        "description": "사람인 API와 LLM을 활용한 공고 필터링 서비스입니다.",
        "troubleshooting": "AI 분석 결과를 캐싱하여 응답 속도를 개선했습니다.",
        "techStacks": ["Java", "Spring Boot", "MySQL"],
        "sortOrder": 1
      }
    ]
  }
}
```

### 9.4 이력서 수정

```text
PATCH /resumes/{resumeId}
```

로그인 필요.

#### Request

```json
{
  "title": "Backend Resume",
  "summaryText": "Spring Boot 기반 API 개발에 관심이 있습니다.",
  "resumeSkillNames": ["Java", "Spring Boot", "JPA", "MySQL"],
  "isDefault": true
}
```

#### Response

```json
{
  "success": true,
  "data": {
    "resumeId": 10,
    "title": "Backend Resume",
    "updatedAt": "2026-07-09T12:00:00"
  }
}
```

### 9.5 이력서 삭제

```text
DELETE /resumes/{resumeId}
```

로그인 필요.

#### Response

```json
{
  "success": true,
  "message": "이력서가 삭제되었습니다."
}
```

## 10. Resume Project API

- 이력서 생성 이후 프로젝트만 추가/수정/삭제할 때만 필요

### 10.1 프로젝트 추가

```text
POST /resumes/{resumeId}/projects
```

로그인 필요.

#### Request

```json
{
  "projectName": "AI 기반 채용공고 필터링 서비스",
  "roleName": "백엔드 개발",
  "startYearMonth": "2026-04",
  "endYearMonth": "2026-06",
  "description": "사람인 API 데이터를 수집하고 LLM으로 공고를 분석하는 서비스입니다.",
  "troubleshooting": "On-demand 분석과 캐싱을 적용하여 AI 호출 비용을 줄였습니다.",
  "techStacks": ["Java", "Spring Boot", "MySQL", "OpenAI API"],
  "sortOrder": 1
}
```

#### Response

```json
{
  "success": true,
  "data": {
    "resumeProjectId": 1,
    "resumeId": 10,
    "projectName": "AI 기반 채용공고 필터링 서비스"
  }
}
```

### 10.2 프로젝트 수정

```text
PATCH /resumes/{resumeId}/projects/{projectId}
```

로그인 필요.

### 10.3 프로젝트 삭제

```text
DELETE /resumes/{resumeId}/projects/{projectId}
```

로그인 필요.


## 11. AI Recommendation API

### 11.1 이력서 AI 피드백 생성

```text
POST /ai-recommendations
```

로그인 필요.

#### Request

```json
{
  "resumeId": 10,
  "jobNoticeId": 101
}
```

#### Response

```json
{
  "success": true,
  "data": {
    "aiRecommendationId": 1,
    "resumeId": 10,
    "jobNoticeId": 101,
    "responsePayload": {
      "missingKeywords": ["REST API", "DB 설계", "트러블슈팅"],
      "feedback": "지원하신 공고는 REST API 개발과 DB 설계 경험을 중요하게 보고 있습니다. 현재 이력서에는 Spring Boot 경험은 잘 드러나지만, JPA와 트러블슈팅 경험을 더 구체적으로 보완하면 좋습니다,
      "recommendedProject": {
        "title": "REST API와 DB 설계를 포함한 백엔드 서비스 고도화",
        "description": "기존 프로젝트에 인증, 예외 처리, 성능 개선, 배포 자동화를 추가하는 프로젝트입니다.",
        "keyFeatures": [
          "JWT 기반 로그인 구현",
          "JPA 연관관계 설계",
          "쿼리 성능 개선 기록 작성"
        ]
      }
    },
    "modelName": "gpt-4.1-mini",
    "createdAt": "2026-07-09T12:00:00"
  }
}
```

### 11.2 내 AI 피드백 목록 조회

```text
GET /ai-recommendations
```

로그인 필요.

#### Query Parameters

| 이름 | 필수 | 설명 |
| --- | --- | --- |
| `resumeId` | N | 이력서별 조회 |
| `jobNoticeId` | N | 공고별 조회 |

#### Response

```json
{
  "success": true,
  "data": [
    {
      "aiRecommendationId": 1,
      "resumeId": 10,
      "jobNoticeId": 101,
      "companyName": "카카오",
      "jobTitle": "Backend Developer",
      "feedbackText": "지원하신 공고는 REST API 개발과 DB 설계 경험을 중요하게 보고 있습니다.",
      "createdAt": "2026-07-09T12:00:00"
    }
  ]
}
```

### 11.3 AI 피드백 상세 조회

```text
GET /ai-recommendations/{aiRecommendationId}
```

로그인 필요.

## 12. Admin / Batch API

- 백엔드에서 사람인 공고 데이터를 가져오고 정리하기 위한 관리자/내부 작업용 API

### 12.1 사람인 공고 수집 실행

```text
POST /admin/job-notices/fetch-saramin
```
사람인 API에서 채용공고를 가져와서 우리 DB의 job_notices에 저장
관리자 권한 필요.

#### Response

```json
{
  "success": true,
  "data": {
    "message": "사람인 공고 수집 작업이 시작되었습니다."
  }
}
```

### 12.2 공고 기술스택 매핑

```text
POST /admin/job-notices/{jobNoticeId}/map-skills
```
공고 원문이나 키워드에서 기술스택을 추출해서 job_notice_skills에 저장
관리자 권한 필요.

#### Response

```json
{
  "success": true,
  "data": {
    "jobNoticeId": 101,
    "mappedSkillNames": ["Java", "Spring Boot", "JPA"]
  }
}
```

## 화면별 필요 API 요약

| 화면 | 필요한 API |
| --- | --- |
| 메인 맞춤 공고 리스트 | `GET /job-notices`, `GET /job-notices/recommended`, `POST/DELETE /job-notices/{id}/bookmark` |
| 로그인/회원가입 | `POST /auth/signup`, `POST /auth/login`, `POST /auth/refresh`, `POST /auth/logout` |
| 공고 상세 + AI 분석 | `GET /job-notices/{id}`, `POST /job-notices/{id}/ai-analysis`, `GET /job-notices/{id}/resume-keywords` |
| 캘린더 | `GET /calendar/job-notices`, `GET /calendar/bookmarks` |
| 마이페이지 | `GET /mypage`, `GET /users/me`, `PATCH /users/me`, `GET /bookmarks`, `GET /resumes` |
| 이력서 작성/수정 | `POST /resumes`, `GET /resumes/{id}`, `PATCH /resumes/{id}`, `DELETE /resumes/{id}` |
| 프로젝트 경험 관리 | `POST /resumes/{id}/projects`, `PATCH /resumes/{id}/projects/{projectId}`, `DELETE /resumes/{id}/projects/{projectId}` |
| 이력서 AI 피드백 | `POST /ai-recommendations`, `GET /ai-recommendations` |

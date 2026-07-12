# 공고-이력서 키워드 비교 기능 문서

## 1. 문서 목적

이 문서는 C 파트에서 구현한 `공고 기준 이력서 보완 키워드 조회` 기능의 동작 방식을 정리합니다.

해당 기능은 채용공고에 포함된 기술스택과 사용자의 이력서 기술스택을 비교하여,
공고에는 필요하지만 이력서에는 부족한 키워드를 찾아주는 기능입니다.

와이어프레임의 공고 상세 화면에서 `이력서 보완 키워드` 영역에 표시될 데이터를 만드는 역할을 합니다.

---

## 2. 관련 API

### 2.1 공고 기준 이력서 보완 키워드 생성

```text
POST /job-notices/{jobNoticeId}/resume-keywords
```

### 기능 목적

특정 채용공고와 특정 이력서를 비교하여 아래 정보를 생성합니다.

| 항목 | 설명 |
| --- | --- |
| 공고 기술스택 | 공고 원문, 공고 제목, 공고 키워드에서 추출한 기술스택 |
| 이력서 기술스택 | 사용자가 이력서에 작성한 기술스택 |
| 일치 키워드 | 공고와 이력서에 공통으로 존재하는 기술 |
| 부족 키워드 | 공고에는 있지만 이력서에는 없는 기술 |
| 자카드 유사도 | 공고 기술스택과 이력서 기술스택의 겹침 정도 |
| 추천 사유 | 부족 키워드를 바탕으로 생성한 보완 안내 문구 |

---

## 3. Request

### Path Variable

| 이름 | 타입 | 필수 | 설명 |
| --- | --- | --- | --- |
| `jobNoticeId` | Long | Y | 비교 대상 채용공고 ID |

### Body

| 이름 | 타입 | 필수 | 설명 |
| --- | --- | --- | --- |
| `resumeId` | Long | N | 비교할 이력서 ID. 없으면 기본 이력서를 사용 |

### Request Example

```json
{
  "resumeId": 10
}
```

---

## 4. Response

### Response Fields

| 필드 | 타입 | 설명 |
| --- | --- | --- |
| `jobNoticeId` | Long | 비교한 채용공고 ID |
| `resumeId` | Long | 비교한 이력서 ID |
| `mappedJobSkills` | Array | 공고에서 추출된 기술스택과 카테고리 |
| `jobKeywords` | Array | 공고 기준 핵심 기술 키워드 |
| `resumeKeywords` | Array | 이력서에 작성된 기술 키워드 |
| `matchedKeywords` | Array | 공고와 이력서에 공통으로 존재하는 기술 |
| `missingKeywords` | Array | 공고에는 있지만 이력서에는 없는 부족 키워드 |
| `jaccardScore` | Number | 공고와 이력서 기술스택의 자카드 유사도 |
| `baseSkills` | Array | 화면에서 우선 표시할 대표 공고 기술 키워드 |
| `recommendedReason` | String | 부족 키워드 기반 이력서 보완 안내 문구 |

### Response Example

```json
{
  "success": true,
  "data": {
    "jobNoticeId": 54379324,
    "resumeId": 10,
    "mappedJobSkills": [
      {
        "skillName": "Spring",
        "category": "BACKEND"
      },
      {
        "skillName": "JPA",
        "category": "BACKEND"
      },
      {
        "skillName": "SQL",
        "category": "DATABASE"
      },
      {
        "skillName": "AWS",
        "category": "DEVOPS"
      }
    ],
    "jobKeywords": ["Spring", "JPA", "SQL", "AWS"],
    "resumeKeywords": ["Java", "Spring", "MySQL"],
    "matchedKeywords": ["Spring"],
    "missingKeywords": ["JPA", "SQL", "AWS"],
    "jaccardScore": 0.17,
    "baseSkills": ["Spring", "JPA", "SQL"],
    "recommendedReason": "공고의 핵심 키워드 중 JPA, SQL, AWS 경험이 이력서에 부족합니다."
  },
  "message": null,
  "error": null
}
```

---

## 5. 동작 흐름

```text
1. 사용자가 공고 상세 화면에서 이력서 보완 키워드 조회 요청
2. jobNoticeId로 공고 데이터를 조회
3. resumeId가 있으면 해당 이력서 조회
4. resumeId가 없으면 기본 이력서 조회
5. 공고 제목, 공고 원문, 공고 키워드를 하나의 텍스트로 합침
6. SkillMappingService가 텍스트에서 기술스택을 추출
7. 이력서 기술스택도 대표 기술명 기준으로 정규화
8. 공고 기술스택과 이력서 기술스택을 Set으로 변환
9. 교집합으로 matchedKeywords 계산
10. 공고 기술스택 - 이력서 기술스택으로 missingKeywords 계산
11. 자카드 유사도 계산
12. 부족 키워드 기반 recommendedReason 생성
```

---

## 6. 기술스택 매핑 방식

공고마다 기술명이 서로 다르게 작성될 수 있으므로, 같은 의미의 기술명을 하나의 대표 이름으로 정규화합니다.

예시:

| 공고에 적힌 표현 | 대표 기술명 |
| --- | --- |
| `SpringBoot` | `Spring Boot` |
| `RestAPI` | `REST API` |
| `ReactJS` | `React` |
| `HTML5` | `HTML` |
| `CSS3` | `CSS` |
| `NodeJS` | `Node.js` |

현재 기술스택 매핑은 `SkillMappingService` 내부의 기술 목록과 alias 목록을 기준으로 동작합니다.

---

## 7. 자카드 유사도 계산 방식

자카드 유사도는 두 집합이 얼마나 겹치는지 계산하는 방식입니다.

```text
자카드 유사도 = 공통 기술 개수 / 전체 기술 개수
```

예시:

```text
공고 기술스택: Spring, JPA, SQL, AWS
이력서 기술스택: Java, Spring, MySQL

공통 기술: Spring
전체 기술: Spring, JPA, SQL, AWS, Java, MySQL

자카드 유사도 = 1 / 6 = 0.17
```

현재 구현에서는 소수점 둘째 자리까지 반올림하여 응답합니다.

---

## 8. 현재 구현 상태

| 구분 | 상태 | 설명 |
| --- | --- | --- |
| 공고 기술스택 추출 | 구현 | 공고 제목, 원문, 키워드 기반 추출 |
| 기술명 정규화 | 구현 | alias 기반 대표 기술명 매핑 |
| 이력서 기술스택 비교 | 구현 | 공고 기술스택과 이력서 기술스택 비교 |
| 부족 키워드 추출 | 구현 | 공고에는 있고 이력서에는 없는 기술 추출 |
| 자카드 유사도 계산 | 구현 | 교집합 / 합집합 기준 계산 |
| 추천 사유 생성 | 구현 | 부족 키워드 기반 문장 생성 |
| 실제 OpenAI 연동 | 미구현 | 현재는 룰 기반 mock 분석 |
| DB Repository 연동 | 1차 구현 | `job_notices` 테이블을 먼저 조회하고, 없으면 샘플 데이터로 fallback |

---

## 9. 관련 코드

| 파일 | 역할 |
| --- | --- |
| `src/main/java/com/dejavu/backend/ai/controller/JobAiAnalysisController.java` | 공고 AI 분석, 이력서 키워드 비교 API 엔드포인트 |
| `src/main/java/com/dejavu/backend/ai/service/AiAnalysisService.java` | 공고 분석, 이력서 키워드 비교, 추천 결과 생성 로직 |
| `src/main/java/com/dejavu/backend/ai/service/SkillMappingService.java` | 공고/이력서 텍스트에서 기술스택 추출 및 정규화 |
| `src/main/java/com/dejavu/backend/ai/dto/ResumeKeywordRequest.java` | 이력서 키워드 비교 요청 DTO |
| `src/main/java/com/dejavu/backend/ai/dto/ResumeKeywordResponse.java` | 이력서 키워드 비교 응답 DTO |

---

## 10. 이후 개선 방향

1. 현재 메모리 기반 이력서 데이터를 실제 `resumes` 테이블과 연동한다.
2. 기술스택 alias 목록을 코드가 아닌 `skills` 테이블 기반으로 관리한다.
3. 부족 키워드가 단순 기술명뿐 아니라 프로젝트 경험, 트러블슈팅 경험까지 포함하도록 확장한다.
4. OpenAI 연동 후 `recommendedReason`을 공고 원문과 이력서 내용을 바탕으로 더 자연스럽게 생성한다.
5. 이미지 기반 공고는 OCR 또는 분석 제외 정책을 별도로 정한다.

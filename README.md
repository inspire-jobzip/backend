# DejaVu Backend

AI 기반 개발자 채용공고 분석 플랫폼 `DejaVu`의 백엔드 서버입니다.

## 기술 스택
- Java 17
- Spring Boot 4.0.7
- Gradle
- Spring Data JPA
- Spring Security
- MariaDB
- Swagger(OpenAPI)

## 실행 방법

### 1. 프로젝트 클론
```bash
git clone <repository-url>
cd backend
```

### 2. 환경변수 파일 생성
```bash
cp .env.example .env
```

### 3. 애플리케이션 실행
기본 프로필은 `local`이며, `.env` 값을 기준으로 실행됩니다.

```bash
./gradlew bootRun

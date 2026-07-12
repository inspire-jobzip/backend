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
```

## MariaDB 설정

MariaDB 초기 스키마와 샘플 데이터는 `mariadb-setup` 폴더에 정리되어 있습니다.

```bash
cd mariadb-setup
docker compose up -d
```

로컬 MariaDB를 직접 사용하는 경우에는 아래 순서로 실행합니다.

```bash
mysql -u root -p < mariadb-setup/01_schema.sql
mysql -u root -p < mariadb-setup/02_seed_skills.sql
mysql -u root -p < mariadb-setup/05_sample_saramin_job_notices.sql
```

이력서 비교 API까지 로컬에서 확인하려면 `03_sample_data.sql`도 추가로 실행합니다.

기본 Docker 접속 정보는 다음과 같습니다.

| 항목 | 값 |
| --- | --- |
| Database | `dejavu` |
| Username | `dejavu` |
| Password | `dejavu1234` |
| Port | `3306` |

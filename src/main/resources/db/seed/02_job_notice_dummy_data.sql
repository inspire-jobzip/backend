-- Dejavu job notice dummy data
-- Source shape reference: Saramin Job Search API
-- Run after 01_schema.sql.

USE dejavu;

SET NAMES utf8mb4;

INSERT INTO skills (skill_name, category) VALUES
  ('Java', 'Backend'),
  ('Spring Boot', 'Backend'),
  ('JPA', 'Backend'),
  ('MySQL', 'Database'),
  ('MariaDB', 'Database'),
  ('AWS', 'Cloud'),
  ('REST API', 'Backend'),
  ('React', 'Frontend'),
  ('TypeScript', 'Frontend'),
  ('Next.js', 'Frontend'),
  ('Zustand', 'Frontend'),
  ('Node.js', 'Backend'),
  ('Python', 'Backend'),
  ('Django', 'Backend'),
  ('PostgreSQL', 'Database'),
  ('Kubernetes', 'DevOps'),
  ('Docker', 'DevOps'),
  ('Linux', 'DevOps'),
  ('Terraform', 'DevOps'),
  ('Kotlin', 'Backend'),
  ('Spring Cloud', 'Backend'),
  ('MSA', 'Architecture'),
  ('Redis', 'Database'),
  ('Kafka', 'Data'),
  ('ElasticSearch', 'Data'),
  ('C++', 'Backend'),
  ('C#', 'Backend'),
  ('Airflow', 'Data'),
  ('Spark', 'Data'),
  ('BigQuery', 'Data'),
  ('Oracle', 'Database'),
  ('SQL', 'Database'),
  ('Tableau', 'Data'),
  ('Vue.js', 'Frontend'),
  ('JavaScript', 'Frontend'),
  ('OpenAI API', 'AI')
ON DUPLICATE KEY UPDATE
  category = VALUES(category);

INSERT INTO job_notices (
  external_notice_id,
  company_name,
  title,
  source_url,
  job_category,
  location_text,
  experience_level,
  employment_type,
  education_level,
  salary_text,
  deadline_at,
  role_keywords_text,
  description_raw,
  ai_analysis_json,
  raw_payload,
  fetched_at,
  is_active
) VALUES
(
  'SAR-50010001',
  '테크브릿지',
  '백엔드 개발자(Java/Spring) 채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010001&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '서울 > 강남구',
  '경력 3~7년',
  '정규직',
  '대학교졸업(4년)이상',
  '5,000~6,000만원',
  '2026-08-07 23:59:59',
  'Java,Spring Boot,JPA,MySQL,AWS,REST API',
  'B2B SaaS 채용 플랫폼의 채용공고/지원자 관리 API를 설계하고 운영합니다. Java, Spring Boot, JPA 기반 서비스 개발 경험을 우대합니다.',
  JSON_OBJECT('summary', 'Spring 기반 백엔드 채용공고', 'fitTags', JSON_ARRAY('백엔드', 'Spring', 'JPA'), 'experienceYears', JSON_OBJECT('min', 3, 'max', 7)),
  JSON_OBJECT(
    'id', '50010001',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010001&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010001&utm_source=dejavu&utm_medium=mock', 'name', '테크브릿지')),
    'position', JSON_OBJECT(
      'title', '백엔드 개발자(Java/Spring) 채용',
      'industry', JSON_OBJECT('code', '301', 'name', '솔루션·SI·ERP·CRM'),
      'location', JSON_OBJECT('code', '101010', 'name', '서울 > 강남구'),
      'job-type', JSON_OBJECT('code', '1', 'name', '정규직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '84,92,291', 'name', '백엔드/서버개발,Java,Spring'),
      'experience-level', JSON_OBJECT('code', 2, 'min', 3, 'max', 7, 'name', '경력 3~7년'),
      'required-education-level', JSON_OBJECT('code', '8', 'name', '대학교졸업(4년)이상')
    ),
    'keyword', 'Java,Spring Boot,JPA,MySQL,AWS,REST API',
    'salary', JSON_OBJECT('code', '18', 'name', '5,000~6,000만원'),
    'posting-date', '2026-07-08T09:30:00+0900',
    'expiration-date', '2026-08-07T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '1', 'name', '접수마감일'),
    'read-cnt', '382',
    'apply-cnt', '31'
  ),
  '2026-07-10 09:00:00',
  TRUE
),
(
  'SAR-50010002',
  '데이터루프',
  '프론트엔드 개발자(React/TypeScript) 모집',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010002&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '서울 > 마포구',
  '경력 2~5년',
  '정규직',
  '학력무관',
  '4,000~5,000만원',
  '2026-07-31 23:59:59',
  'React,TypeScript,Next.js,Zustand,웹접근성',
  '데이터 분석 대시보드의 프론트엔드 화면과 상태 관리를 담당합니다. 사용자 경험과 접근성 개선에 관심 있는 분을 찾습니다.',
  JSON_OBJECT('summary', 'React 기반 프론트엔드 채용공고', 'fitTags', JSON_ARRAY('프론트엔드', 'React', 'TypeScript'), 'experienceYears', JSON_OBJECT('min', 2, 'max', 5)),
  JSON_OBJECT(
    'id', '50010002',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010002&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010002&utm_source=dejavu&utm_medium=mock', 'name', '데이터루프')),
    'position', JSON_OBJECT(
      'title', '프론트엔드 개발자(React/TypeScript) 모집',
      'industry', JSON_OBJECT('code', '306', 'name', '포털·인터넷·컨텐츠'),
      'location', JSON_OBJECT('code', '101110', 'name', '서울 > 마포구'),
      'job-type', JSON_OBJECT('code', '1', 'name', '정규직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '92,95,100', 'name', '프론트엔드,React,TypeScript'),
      'experience-level', JSON_OBJECT('code', 2, 'min', 2, 'max', 5, 'name', '경력 2~5년'),
      'required-education-level', JSON_OBJECT('code', '0', 'name', '학력무관')
    ),
    'keyword', 'React,TypeScript,Next.js,Zustand,웹접근성',
    'salary', JSON_OBJECT('code', '15', 'name', '4,000~5,000만원'),
    'posting-date', '2026-07-07T14:15:00+0900',
    'expiration-date', '2026-07-31T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '1', 'name', '접수마감일'),
    'read-cnt', '521',
    'apply-cnt', '44'
  ),
  '2026-07-10 09:00:00',
  TRUE
),
(
  'SAR-50010003',
  '클라우드핀',
  '클라우드 플랫폼 엔지니어 신입/경력 채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010003&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '경기 > 성남시 분당구',
  '신입/경력',
  '정규직',
  '대학교졸업(2,3년)이상',
  '회사내규에 따름',
  '2026-08-15 23:59:59',
  'AWS,Kubernetes,Docker,Linux,Terraform',
  '클라우드 인프라 운영 자동화와 컨테이너 기반 배포 환경 개선을 담당합니다. 신입 지원자는 Linux 기본기를 중요하게 봅니다.',
  JSON_OBJECT('summary', '클라우드/DevOps 채용공고', 'fitTags', JSON_ARRAY('DevOps', 'AWS', 'Kubernetes'), 'experienceYears', JSON_OBJECT('min', 0, 'max', 5)),
  JSON_OBJECT(
    'id', '50010003',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010003&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010003&utm_source=dejavu&utm_medium=mock', 'name', '클라우드핀')),
    'position', JSON_OBJECT(
      'title', '클라우드 플랫폼 엔지니어 신입/경력 채용',
      'industry', JSON_OBJECT('code', '305', 'name', '네트워크·통신서비스'),
      'location', JSON_OBJECT('code', '102190', 'name', '경기 > 성남시 분당구'),
      'job-type', JSON_OBJECT('code', '1', 'name', '정규직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '223,224,225', 'name', 'DevOps/시스템엔지니어,Kubernetes,AWS'),
      'experience-level', JSON_OBJECT('code', 3, 'min', 0, 'max', 5, 'name', '신입/경력'),
      'required-education-level', JSON_OBJECT('code', '7', 'name', '대학교졸업(2,3년)이상')
    ),
    'keyword', 'AWS,Kubernetes,Docker,Linux,Terraform',
    'salary', JSON_OBJECT('code', '0', 'name', '회사내규에 따름'),
    'posting-date', '2026-07-06T10:00:00+0900',
    'expiration-date', '2026-08-15T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '1', 'name', '접수마감일'),
    'read-cnt', '294',
    'apply-cnt', '18'
  ),
  '2026-07-10 09:00:00',
  TRUE
),
(
  'SAR-50010004',
  '핀테크웨이브',
  '금융 서비스 서버 개발자 채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010004&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '서울 > 영등포구',
  '경력 5~10년',
  '정규직',
  '대학교졸업(4년)이상',
  '6,000~7,000만원',
  '2026-08-04 23:59:59',
  'Kotlin,Spring Cloud,MSA,Redis,Kafka',
  '금융 거래 API와 비동기 이벤트 처리 시스템을 개발합니다. 대용량 트래픽과 장애 대응 경험을 우대합니다.',
  JSON_OBJECT('summary', '핀테크 서버 개발 채용공고', 'fitTags', JSON_ARRAY('백엔드', 'MSA', 'Kafka'), 'experienceYears', JSON_OBJECT('min', 5, 'max', 10)),
  JSON_OBJECT(
    'id', '50010004',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010004&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010004&utm_source=dejavu&utm_medium=mock', 'name', '핀테크웨이브')),
    'position', JSON_OBJECT(
      'title', '금융 서비스 서버 개발자 채용',
      'industry', JSON_OBJECT('code', '902', 'name', '은행·금융·저축'),
      'location', JSON_OBJECT('code', '101180', 'name', '서울 > 영등포구'),
      'job-type', JSON_OBJECT('code', '1', 'name', '정규직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '84,92,291', 'name', '백엔드/서버개발,Kotlin,Spring'),
      'experience-level', JSON_OBJECT('code', 2, 'min', 5, 'max', 10, 'name', '경력 5~10년'),
      'required-education-level', JSON_OBJECT('code', '8', 'name', '대학교졸업(4년)이상')
    ),
    'keyword', 'Kotlin,Spring Cloud,MSA,Redis,Kafka',
    'salary', JSON_OBJECT('code', '19', 'name', '6,000~7,000만원'),
    'posting-date', '2026-07-05T16:40:00+0900',
    'expiration-date', '2026-08-04T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '1', 'name', '접수마감일'),
    'read-cnt', '713',
    'apply-cnt', '62'
  ),
  '2026-07-10 09:00:00',
  TRUE
),
(
  'SAR-50010005',
  '에듀스택',
  'AI 교육 플랫폼 풀스택 개발자',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010005&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '서울 > 구로구',
  '경력무관',
  '정규직',
  '학력무관',
  '3,600~4,000만원',
  '2026-07-28 23:59:59',
  'Node.js,React,Python,PostgreSQL,OpenAI API',
  'AI 기반 학습 추천 플랫폼의 웹 서비스와 API를 함께 개발합니다. 빠른 실험과 제품 개선을 즐기는 분에게 적합합니다.',
  JSON_OBJECT('summary', 'AI 교육 플랫폼 풀스택 채용공고', 'fitTags', JSON_ARRAY('풀스택', 'AI', 'Node.js'), 'experienceYears', JSON_OBJECT('min', 0, 'max', 0)),
  JSON_OBJECT(
    'id', '50010005',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010005&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010005&utm_source=dejavu&utm_medium=mock', 'name', '에듀스택')),
    'position', JSON_OBJECT(
      'title', 'AI 교육 플랫폼 풀스택 개발자',
      'industry', JSON_OBJECT('code', '1001', 'name', '교육업'),
      'location', JSON_OBJECT('code', '101070', 'name', '서울 > 구로구'),
      'job-type', JSON_OBJECT('code', '1', 'name', '정규직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '84,92,95', 'name', '풀스택,Node.js,React,Python'),
      'experience-level', JSON_OBJECT('code', 0, 'min', 0, 'max', 0, 'name', '경력무관'),
      'required-education-level', JSON_OBJECT('code', '0', 'name', '학력무관')
    ),
    'keyword', 'Node.js,React,Python,PostgreSQL,OpenAI API',
    'salary', JSON_OBJECT('code', '13', 'name', '3,600~4,000만원'),
    'posting-date', '2026-07-04T11:20:00+0900',
    'expiration-date', '2026-07-28T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '1', 'name', '접수마감일'),
    'read-cnt', '449',
    'apply-cnt', '39'
  ),
  '2026-07-10 09:00:00',
  TRUE
),
(
  'SAR-50010006',
  '모빌리티랩',
  '지도/경로 추천 서비스 백엔드 개발자',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010006&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '서울 > 서초구',
  '경력 2~6년',
  '정규직',
  '대학교졸업(4년)이상',
  '4,500~5,500만원',
  '2026-08-02 23:59:59',
  'Python,Django,PostgreSQL,ElasticSearch,REST API',
  '위치 기반 검색과 경로 추천 API를 개발합니다. 지리 데이터 모델링과 검색 품질 개선 경험을 우대합니다.',
  JSON_OBJECT('summary', '모빌리티 백엔드 채용공고', 'fitTags', JSON_ARRAY('백엔드', 'Python', '검색'), 'experienceYears', JSON_OBJECT('min', 2, 'max', 6)),
  JSON_OBJECT(
    'id', '50010006',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010006&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010006&utm_source=dejavu&utm_medium=mock', 'name', '모빌리티랩')),
    'position', JSON_OBJECT(
      'title', '지도/경로 추천 서비스 백엔드 개발자',
      'industry', JSON_OBJECT('code', '304', 'name', '모바일·APP'),
      'location', JSON_OBJECT('code', '101150', 'name', '서울 > 서초구'),
      'job-type', JSON_OBJECT('code', '1', 'name', '정규직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '84,87,200', 'name', '백엔드/서버개발,Python,Django'),
      'experience-level', JSON_OBJECT('code', 2, 'min', 2, 'max', 6, 'name', '경력 2~6년'),
      'required-education-level', JSON_OBJECT('code', '8', 'name', '대학교졸업(4년)이상')
    ),
    'keyword', 'Python,Django,PostgreSQL,ElasticSearch,REST API',
    'salary', JSON_OBJECT('code', '18', 'name', '4,500~5,500만원'),
    'posting-date', '2026-07-03T13:05:00+0900',
    'expiration-date', '2026-08-02T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '1', 'name', '접수마감일'),
    'read-cnt', '336',
    'apply-cnt', '27'
  ),
  '2026-07-10 09:00:00',
  TRUE
),
(
  'SAR-50010007',
  '시큐어넥스트',
  '보안 솔루션 개발자(C/C++/Linux) 채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010007&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '서울 > 금천구',
  '경력 4~8년',
  '정규직',
  '대학교졸업(4년)이상',
  '5,500~6,500만원',
  '2026-08-01 23:59:59',
  'C++,Linux,네트워크,보안솔루션,취약점분석',
  'Endpoint 보안 솔루션의 탐지 모듈과 Linux Agent를 개발합니다. 시스템 프로그래밍 경험을 우대합니다.',
  JSON_OBJECT('summary', '보안 솔루션 개발 채용공고', 'fitTags', JSON_ARRAY('보안', 'C++', 'Linux'), 'experienceYears', JSON_OBJECT('min', 4, 'max', 8)),
  JSON_OBJECT(
    'id', '50010007',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010007&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010007&utm_source=dejavu&utm_medium=mock', 'name', '시큐어넥스트')),
    'position', JSON_OBJECT(
      'title', '보안 솔루션 개발자(C/C++/Linux) 채용',
      'industry', JSON_OBJECT('code', '308', 'name', '정보보안'),
      'location', JSON_OBJECT('code', '101060', 'name', '서울 > 금천구'),
      'job-type', JSON_OBJECT('code', '1', 'name', '정규직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '85,203,224', 'name', '보안컨설팅,정보보안,C++,Linux'),
      'experience-level', JSON_OBJECT('code', 2, 'min', 4, 'max', 8, 'name', '경력 4~8년'),
      'required-education-level', JSON_OBJECT('code', '8', 'name', '대학교졸업(4년)이상')
    ),
    'keyword', 'C++,Linux,네트워크,보안솔루션,취약점분석',
    'salary', JSON_OBJECT('code', '19', 'name', '5,500~6,500만원'),
    'posting-date', '2026-07-02T09:10:00+0900',
    'expiration-date', '2026-08-01T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '1', 'name', '접수마감일'),
    'read-cnt', '267',
    'apply-cnt', '15'
  ),
  '2026-07-10 09:00:00',
  TRUE
),
(
  'SAR-50010008',
  '커머스픽',
  '이커머스 데이터 엔지니어 채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010008&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '서울 > 송파구',
  '경력 3~6년',
  '정규직',
  '학력무관',
  '5,000~6,000만원',
  '2026-07-30 23:59:59',
  'Python,Airflow,Spark,BigQuery,데이터파이프라인',
  '상품/주문/행동 로그 기반 데이터 파이프라인을 설계하고 운영합니다. 배치와 스트리밍 처리 경험을 우대합니다.',
  JSON_OBJECT('summary', '이커머스 데이터 엔지니어 채용공고', 'fitTags', JSON_ARRAY('데이터', 'Airflow', 'Spark'), 'experienceYears', JSON_OBJECT('min', 3, 'max', 6)),
  JSON_OBJECT(
    'id', '50010008',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010008&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010008&utm_source=dejavu&utm_medium=mock', 'name', '커머스픽')),
    'position', JSON_OBJECT(
      'title', '이커머스 데이터 엔지니어 채용',
      'industry', JSON_OBJECT('code', '307', 'name', '쇼핑몰·오픈마켓'),
      'location', JSON_OBJECT('code', '101160', 'name', '서울 > 송파구'),
      'job-type', JSON_OBJECT('code', '1', 'name', '정규직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '89,90,91', 'name', '데이터엔지니어,Python,Airflow,Spark'),
      'experience-level', JSON_OBJECT('code', 2, 'min', 3, 'max', 6, 'name', '경력 3~6년'),
      'required-education-level', JSON_OBJECT('code', '0', 'name', '학력무관')
    ),
    'keyword', 'Python,Airflow,Spark,BigQuery,데이터파이프라인',
    'salary', JSON_OBJECT('code', '18', 'name', '5,000~6,000만원'),
    'posting-date', '2026-07-01T15:25:00+0900',
    'expiration-date', '2026-07-30T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '1', 'name', '접수마감일'),
    'read-cnt', '488',
    'apply-cnt', '36'
  ),
  '2026-07-10 09:00:00',
  TRUE
),
(
  'SAR-50010009',
  '헬스케어온',
  '의료 데이터 플랫폼 백엔드 개발자',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010009&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '서울 > 종로구',
  '경력 1~4년',
  '정규직',
  '대학교졸업(4년)이상',
  '4,000~5,000만원',
  '2026-07-25 23:59:59',
  'Java,Spring Boot,Oracle,REST API,의료데이터',
  '의료 데이터 연동 API와 관리자 서비스를 개발합니다. 개인정보 보호와 로그 추적 설계 경험을 우대합니다.',
  JSON_OBJECT('summary', '헬스케어 백엔드 채용공고', 'fitTags', JSON_ARRAY('백엔드', 'Java', '의료데이터'), 'experienceYears', JSON_OBJECT('min', 1, 'max', 4)),
  JSON_OBJECT(
    'id', '50010009',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010009&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010009&utm_source=dejavu&utm_medium=mock', 'name', '헬스케어온')),
    'position', JSON_OBJECT(
      'title', '의료 데이터 플랫폼 백엔드 개발자',
      'industry', JSON_OBJECT('code', '1002', 'name', '의료·보건'),
      'location', JSON_OBJECT('code', '101220', 'name', '서울 > 종로구'),
      'job-type', JSON_OBJECT('code', '1', 'name', '정규직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '84,92,291', 'name', '백엔드/서버개발,Java,Spring'),
      'experience-level', JSON_OBJECT('code', 2, 'min', 1, 'max', 4, 'name', '경력 1~4년'),
      'required-education-level', JSON_OBJECT('code', '8', 'name', '대학교졸업(4년)이상')
    ),
    'keyword', 'Java,Spring Boot,Oracle,REST API,의료데이터',
    'salary', JSON_OBJECT('code', '15', 'name', '4,000~5,000만원'),
    'posting-date', '2026-06-30T10:45:00+0900',
    'expiration-date', '2026-07-25T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '1', 'name', '접수마감일'),
    'read-cnt', '219',
    'apply-cnt', '22'
  ),
  '2026-07-10 09:00:00',
  TRUE
),
(
  'SAR-50010010',
  '게임스튜디오제로',
  '게임 서버 개발자 채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010010&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '경기 > 성남시 분당구',
  '경력 2~7년',
  '정규직',
  '학력무관',
  '면접 후 결정',
  '2026-08-10 23:59:59',
  'C#,Redis,MySQL,Unity,게임서버',
  '실시간 멀티플레이 게임 서버와 운영 도구를 개발합니다. Redis 기반 매칭/세션 처리 경험을 우대합니다.',
  JSON_OBJECT('summary', '게임 서버 개발 채용공고', 'fitTags', JSON_ARRAY('게임서버', 'C#', 'Redis'), 'experienceYears', JSON_OBJECT('min', 2, 'max', 7)),
  JSON_OBJECT(
    'id', '50010010',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010010&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010010&utm_source=dejavu&utm_medium=mock', 'name', '게임스튜디오제로')),
    'position', JSON_OBJECT(
      'title', '게임 서버 개발자 채용',
      'industry', JSON_OBJECT('code', '314', 'name', '게임'),
      'location', JSON_OBJECT('code', '102190', 'name', '경기 > 성남시 분당구'),
      'job-type', JSON_OBJECT('code', '1', 'name', '정규직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '84,2072,2106', 'name', '게임개발,서버개발,C#,Redis'),
      'experience-level', JSON_OBJECT('code', 2, 'min', 2, 'max', 7, 'name', '경력 2~7년'),
      'required-education-level', JSON_OBJECT('code', '0', 'name', '학력무관')
    ),
    'keyword', 'C#,Redis,MySQL,Unity,게임서버',
    'salary', JSON_OBJECT('code', '0', 'name', '면접 후 결정'),
    'posting-date', '2026-06-29T18:00:00+0900',
    'expiration-date', '2026-08-10T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '2', 'name', '채용시'),
    'read-cnt', '601',
    'apply-cnt', '58'
  ),
  '2026-07-10 09:00:00',
  TRUE
),
(
  'SAR-50010011',
  '그로스애널리틱스',
  '주니어 데이터 분석가 채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010011&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '서울 > 중구',
  '신입',
  '계약직',
  '대학교졸업(4년)이상',
  '3,200~3,600만원',
  '2026-07-22 23:59:59',
  'SQL,Python,Tableau,GA4,데이터시각화',
  '서비스 지표 분석과 리포트 자동화를 담당합니다. SQL 기본기와 데이터 시각화 역량을 중요하게 봅니다.',
  JSON_OBJECT('summary', '주니어 데이터 분석 채용공고', 'fitTags', JSON_ARRAY('데이터분석', 'SQL', 'Tableau'), 'experienceYears', JSON_OBJECT('min', 0, 'max', 0)),
  JSON_OBJECT(
    'id', '50010011',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010011&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010011&utm_source=dejavu&utm_medium=mock', 'name', '그로스애널리틱스')),
    'position', JSON_OBJECT(
      'title', '주니어 데이터 분석가 채용',
      'industry', JSON_OBJECT('code', '1005', 'name', '연구소·컨설팅·조사'),
      'location', JSON_OBJECT('code', '101200', 'name', '서울 > 중구'),
      'job-type', JSON_OBJECT('code', '2', 'name', '계약직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '89,90,91', 'name', '데이터분석가,SQL,Python,Tableau'),
      'experience-level', JSON_OBJECT('code', 1, 'min', 0, 'max', 0, 'name', '신입'),
      'required-education-level', JSON_OBJECT('code', '8', 'name', '대학교졸업(4년)이상')
    ),
    'keyword', 'SQL,Python,Tableau,GA4,데이터시각화',
    'salary', JSON_OBJECT('code', '12', 'name', '3,200~3,600만원'),
    'posting-date', '2026-06-28T12:35:00+0900',
    'expiration-date', '2026-07-22T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '1', 'name', '접수마감일'),
    'read-cnt', '178',
    'apply-cnt', '26'
  ),
  '2026-07-10 09:00:00',
  TRUE
),
(
  'SAR-50010012',
  '스마트팩토리웍스',
  '제조 DX 웹서비스 개발자 모집',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010012&utm_source=dejavu&utm_medium=mock',
  'IT개발·데이터',
  '인천 > 연수구',
  '경력무관',
  '정규직',
  '대학교졸업(2,3년)이상',
  '회사내규에 따름',
  '2026-07-27 23:59:59',
  'Vue.js,Spring Boot,JavaScript,MariaDB,제조DX',
  '스마트팩토리 운영 현황을 보여주는 웹 서비스와 현장 데이터 연동 API를 개발합니다.',
  JSON_OBJECT('summary', '제조 DX 웹서비스 채용공고', 'fitTags', JSON_ARRAY('웹개발', 'Vue.js', 'Spring'), 'experienceYears', JSON_OBJECT('min', 0, 'max', 0)),
  JSON_OBJECT(
    'id', '50010012',
    'url', 'https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=50010012&utm_source=dejavu&utm_medium=mock',
    'active', 1,
    'company', JSON_OBJECT('detail', JSON_OBJECT('href', 'https://www.saramin.co.kr/zf_user/company-info/view?csn=50010012&utm_source=dejavu&utm_medium=mock', 'name', '스마트팩토리웍스')),
    'position', JSON_OBJECT(
      'title', '제조 DX 웹서비스 개발자 모집',
      'industry', JSON_OBJECT('code', '207', 'name', '기계·설비·자동차'),
      'location', JSON_OBJECT('code', '108070', 'name', '인천 > 연수구'),
      'job-type', JSON_OBJECT('code', '1', 'name', '정규직'),
      'job-mid-code', JSON_OBJECT('code', '22', 'name', 'IT개발·데이터'),
      'job-code', JSON_OBJECT('code', '84,92,95', 'name', '웹개발,JavaScript,Vue.js,Spring'),
      'experience-level', JSON_OBJECT('code', 0, 'min', 0, 'max', 0, 'name', '경력무관'),
      'required-education-level', JSON_OBJECT('code', '7', 'name', '대학교졸업(2,3년)이상')
    ),
    'keyword', 'Vue.js,Spring Boot,JavaScript,MariaDB,제조DX',
    'salary', JSON_OBJECT('code', '0', 'name', '회사내규에 따름'),
    'posting-date', '2026-06-27T08:55:00+0900',
    'expiration-date', '2026-07-27T23:59:59+0900',
    'close-type', JSON_OBJECT('code', '4', 'name', '수시'),
    'read-cnt', '242',
    'apply-cnt', '19'
  ),
  '2026-07-10 09:00:00',
  TRUE
)
ON DUPLICATE KEY UPDATE
  company_name = VALUES(company_name),
  title = VALUES(title),
  source_url = VALUES(source_url),
  job_category = VALUES(job_category),
  location_text = VALUES(location_text),
  experience_level = VALUES(experience_level),
  employment_type = VALUES(employment_type),
  education_level = VALUES(education_level),
  salary_text = VALUES(salary_text),
  deadline_at = VALUES(deadline_at),
  role_keywords_text = VALUES(role_keywords_text),
  description_raw = VALUES(description_raw),
  ai_analysis_json = VALUES(ai_analysis_json),
  raw_payload = VALUES(raw_payload),
  fetched_at = VALUES(fetched_at),
  is_active = VALUES(is_active);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('Java', 'Spring Boot', 'JPA', 'MySQL', 'AWS', 'REST API')
WHERE job_notices.external_notice_id = 'SAR-50010001'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('React', 'TypeScript', 'Next.js', 'Zustand')
WHERE job_notices.external_notice_id = 'SAR-50010002'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('AWS', 'Kubernetes', 'Docker', 'Linux', 'Terraform')
WHERE job_notices.external_notice_id = 'SAR-50010003'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('Kotlin', 'Spring Cloud', 'MSA', 'Redis', 'Kafka')
WHERE job_notices.external_notice_id = 'SAR-50010004'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('Node.js', 'React', 'Python', 'PostgreSQL', 'OpenAI API')
WHERE job_notices.external_notice_id = 'SAR-50010005'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('Python', 'Django', 'PostgreSQL', 'ElasticSearch', 'REST API')
WHERE job_notices.external_notice_id = 'SAR-50010006'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('C++', 'Linux')
WHERE job_notices.external_notice_id = 'SAR-50010007'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('Python', 'Airflow', 'Spark', 'BigQuery')
WHERE job_notices.external_notice_id = 'SAR-50010008'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('Java', 'Spring Boot', 'Oracle', 'REST API')
WHERE job_notices.external_notice_id = 'SAR-50010009'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('C#', 'Redis', 'MySQL')
WHERE job_notices.external_notice_id = 'SAR-50010010'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('SQL', 'Python', 'Tableau')
WHERE job_notices.external_notice_id = 'SAR-50010011'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT job_notices.job_notice_id, skills.skill_id
FROM job_notices
JOIN skills ON skills.skill_name IN ('Vue.js', 'Spring Boot', 'JavaScript', 'MariaDB')
WHERE job_notices.external_notice_id = 'SAR-50010012'
ON DUPLICATE KEY UPDATE job_notice_id = VALUES(job_notice_id);

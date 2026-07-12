-- Optional sample data for local API testing
-- Password hash is a placeholder. Replace it with a BCrypt hash from the backend.

USE dejavu;

INSERT INTO users (
  email,
  password_hash,
  status,
  desired_job_role,
  career_status,
  career_years,
  preferred_skill_names_json
) VALUES (
  'developer@email.com',
  '$2a$10$replace_with_real_bcrypt_hash',
  'ACTIVE',
  'Backend Developer',
  'NEW',
  0,
  JSON_ARRAY('Java', 'Spring Boot', 'MySQL')
);

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
  raw_payload,
  fetched_at,
  is_active
) VALUES (
  'saramin_sample_001',
  '데자뷰테크',
  '백엔드 개발자 채용',
  'https://www.saramin.co.kr/',
  'Backend',
  '서울',
  '신입',
  '정규직',
  '학력무관',
  '회사 내규에 따름',
  '2026-08-01 23:59:59',
  'Java, Spring Boot, JPA, MySQL, REST API',
  'Spring Boot 기반 백엔드 API 개발자를 모집합니다.',
  JSON_OBJECT('source', 'saramin', 'sample', true),
  CURRENT_TIMESTAMP,
  TRUE
);

INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('Java', 'Spring Boot', 'JPA', 'MySQL', 'REST API')
WHERE j.external_notice_id = 'saramin_sample_001';

INSERT INTO bookmarks (user_id, job_notice_id)
SELECT u.user_id, j.job_notice_id
FROM users u
JOIN job_notices j ON j.external_notice_id = 'saramin_sample_001'
WHERE u.email = 'developer@email.com'
ON DUPLICATE KEY UPDATE created_at = created_at;

INSERT INTO resumes (
  user_id,
  title,
  name,
  email,
  phone,
  github_url,
  blog_url,
  summary_text,
  education_json,
  experience_json,
  resume_skill_names_json,
  motivation_text,
  strengths_and_weaknesses_text,
  is_default
)
SELECT
  user_id,
  'Resume 01',
  '홍길동',
  'developer@email.com',
  '010-1234-5678',
  'https://github.com/your-id',
  'https://velog.io/@your-id',
  '백엔드 개발자를 지망하는 신입 개발자입니다.',
  JSON_ARRAY(
    JSON_OBJECT(
      'schoolName', '한국대학교',
      'major', '컴퓨터공학과',
      'status', '재학',
      'startYearMonth', '2023-03',
      'endYearMonth', '2027-02'
    )
  ),
  JSON_ARRAY(),
  JSON_ARRAY('Java', 'Spring Boot', 'MySQL'),
  '지원동기 내용입니다.',
  '장단점 내용입니다.',
  TRUE
FROM users
WHERE email = 'developer@email.com';

INSERT INTO resume_projects (
  resume_id,
  project_name,
  role_name,
  start_year_month,
  end_year_month,
  description,
  troubleshooting,
  tech_stacks_json,
  sort_order
)
SELECT
  r.resume_id,
  'AI 기반 채용공고 필터링 서비스',
  '백엔드 개발',
  '2026-04',
  '2026-06',
  '사람인 API와 LLM을 활용한 공고 필터링 서비스입니다.',
  'AI 분석 결과를 캐싱하여 응답 속도를 개선했습니다.',
  JSON_ARRAY('Java', 'Spring Boot', 'MySQL'),
  1
FROM resumes r
JOIN users u ON u.user_id = r.user_id
WHERE u.email = 'developer@email.com'
ORDER BY r.resume_id DESC
LIMIT 1;

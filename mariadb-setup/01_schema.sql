-- Dejavu MariaDB schema
-- Target: MariaDB 10.6+

CREATE DATABASE IF NOT EXISTS dejavu
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE dejavu;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS ai_recommendations;
DROP TABLE IF EXISTS resume_projects;
DROP TABLE IF EXISTS resumes;
DROP TABLE IF EXISTS bookmarks;
DROP TABLE IF EXISTS job_notice_skills;
DROP TABLE IF EXISTS job_notices;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS user_refresh_tokens;
DROP TABLE IF EXISTS users;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE users (
  user_id BIGINT NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
  desired_job_role VARCHAR(100) NOT NULL,
  career_status VARCHAR(20) NOT NULL,
  career_years DECIMAL(4,1) NULL,
  preferred_skill_names_json JSON NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id),
  UNIQUE KEY uk_users_email (email),
  KEY idx_users_status (status),
  KEY idx_users_desired_job_role (desired_job_role),
  CONSTRAINT chk_users_status CHECK (status IN ('ACTIVE', 'WITHDRAWN')),
  CONSTRAINT chk_users_career_status CHECK (career_status IN ('NEW', 'EXPERIENCED')),
  CONSTRAINT chk_users_career_years CHECK (career_years IS NULL OR career_years >= 0),
  CONSTRAINT chk_users_preferred_skills_json CHECK (
    preferred_skill_names_json IS NULL OR JSON_VALID(preferred_skill_names_json)
  )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE user_refresh_tokens (
  refresh_token_id BIGINT NOT NULL AUTO_INCREMENT,
  user_id BIGINT NOT NULL,
  token_hash VARCHAR(255) NOT NULL,
  expires_at TIMESTAMP NOT NULL,
  revoked_at TIMESTAMP NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (refresh_token_id),
  UNIQUE KEY uk_user_refresh_tokens_token_hash (token_hash),
  KEY idx_user_refresh_tokens_user_id (user_id),
  KEY idx_user_refresh_tokens_expires_at (expires_at),
  CONSTRAINT fk_user_refresh_tokens_user
    FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE skills (
  skill_id BIGINT NOT NULL AUTO_INCREMENT,
  skill_name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (skill_id),
  UNIQUE KEY uk_skills_skill_name (skill_name),
  KEY idx_skills_category (category)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE job_notices (
  job_notice_id BIGINT NOT NULL AUTO_INCREMENT,
  external_notice_id VARCHAR(100) NOT NULL,
  company_name VARCHAR(200) NOT NULL,
  title VARCHAR(300) NOT NULL,
  source_url VARCHAR(1000) NULL,
  job_category VARCHAR(100) NULL,
  location_text VARCHAR(255) NULL,
  experience_level VARCHAR(50) NULL,
  employment_type VARCHAR(50) NULL,
  education_level VARCHAR(100) NULL,
  salary_text VARCHAR(255) NULL,
  deadline_at TIMESTAMP NULL,
  role_keywords_text TEXT NULL,
  description_raw TEXT NULL,
  ai_analysis_json JSON NULL,
  raw_payload JSON NULL,
  fetched_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (job_notice_id),
  UNIQUE KEY uk_job_notices_external_notice_id (external_notice_id),
  KEY idx_job_notices_company_name (company_name),
  KEY idx_job_notices_job_category (job_category),
  KEY idx_job_notices_location_text (location_text),
  KEY idx_job_notices_experience_level (experience_level),
  KEY idx_job_notices_deadline_at (deadline_at),
  KEY idx_job_notices_is_active (is_active),
  FULLTEXT KEY ft_job_notices_search (
    company_name,
    title,
    role_keywords_text,
    description_raw
  ),
  CONSTRAINT chk_job_notices_ai_analysis_json CHECK (
    ai_analysis_json IS NULL OR JSON_VALID(ai_analysis_json)
  ),
  CONSTRAINT chk_job_notices_raw_payload CHECK (
    raw_payload IS NULL OR JSON_VALID(raw_payload)
  )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE job_notice_skills (
  job_notice_id BIGINT NOT NULL,
  skill_id BIGINT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (job_notice_id, skill_id),
  KEY idx_job_notice_skills_skill_id (skill_id),
  CONSTRAINT fk_job_notice_skills_job_notice
    FOREIGN KEY (job_notice_id) REFERENCES job_notices (job_notice_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_job_notice_skills_skill
    FOREIGN KEY (skill_id) REFERENCES skills (skill_id)
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE bookmarks (
  bookmark_id BIGINT NOT NULL AUTO_INCREMENT,
  user_id BIGINT NOT NULL,
  job_notice_id BIGINT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (bookmark_id),
  UNIQUE KEY uk_bookmarks_user_job_notice (user_id, job_notice_id),
  KEY idx_bookmarks_job_notice_id (job_notice_id),
  CONSTRAINT fk_bookmarks_user
    FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_bookmarks_job_notice
    FOREIGN KEY (job_notice_id) REFERENCES job_notices (job_notice_id)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE resumes (
  resume_id BIGINT NOT NULL AUTO_INCREMENT,
  user_id BIGINT NOT NULL,
  title VARCHAR(300) NOT NULL,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(30) NULL,
  github_url VARCHAR(500) NULL,
  blog_url VARCHAR(500) NULL,
  summary_text TEXT NULL,
  education_json JSON NULL,
  experience_json JSON NULL,
  resume_skill_names_json JSON NULL,
  motivation_text TEXT NULL,
  strengths_and_weaknesses_text TEXT NULL,
  is_default BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (resume_id),
  KEY idx_resumes_user_id (user_id),
  KEY idx_resumes_user_default (user_id, is_default),
  CONSTRAINT fk_resumes_user
    FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON DELETE CASCADE,
  CONSTRAINT chk_resumes_education_json CHECK (
    education_json IS NULL OR JSON_VALID(education_json)
  ),
  CONSTRAINT chk_resumes_experience_json CHECK (
    experience_json IS NULL OR JSON_VALID(experience_json)
  ),
  CONSTRAINT chk_resumes_skill_names_json CHECK (
    resume_skill_names_json IS NULL OR JSON_VALID(resume_skill_names_json)
  )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE resume_projects (
  resume_project_id BIGINT NOT NULL AUTO_INCREMENT,
  resume_id BIGINT NOT NULL,
  project_name VARCHAR(255) NOT NULL,
  role_name VARCHAR(150) NULL,
  start_year_month CHAR(7) NULL,
  end_year_month CHAR(7) NULL,
  description TEXT NULL,
  troubleshooting TEXT NULL,
  tech_stacks_json JSON NULL,
  sort_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (resume_project_id),
  KEY idx_resume_projects_resume_id (resume_id),
  KEY idx_resume_projects_resume_sort (resume_id, sort_order),
  CONSTRAINT fk_resume_projects_resume
    FOREIGN KEY (resume_id) REFERENCES resumes (resume_id)
    ON DELETE CASCADE,
  CONSTRAINT chk_resume_projects_start_year_month CHECK (
    start_year_month IS NULL OR start_year_month REGEXP '^[0-9]{4}-[0-9]{2}$'
  ),
  CONSTRAINT chk_resume_projects_end_year_month CHECK (
    end_year_month IS NULL OR end_year_month REGEXP '^[0-9]{4}-[0-9]{2}$'
  ),
  CONSTRAINT chk_resume_projects_tech_stacks_json CHECK (
    tech_stacks_json IS NULL OR JSON_VALID(tech_stacks_json)
  )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE ai_recommendations (
  ai_recommendation_id BIGINT NOT NULL AUTO_INCREMENT,
  user_id BIGINT NOT NULL,
  job_notice_id BIGINT NOT NULL,
  resume_id BIGINT NOT NULL,
  feedback_text TEXT NOT NULL,
  response_payload JSON NULL,
  model_name VARCHAR(100) NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ai_recommendation_id),
  KEY idx_ai_recommendations_user_id (user_id),
  KEY idx_ai_recommendations_job_notice_id (job_notice_id),
  KEY idx_ai_recommendations_resume_id (resume_id),
  KEY idx_ai_recommendations_user_created_at (user_id, created_at),
  CONSTRAINT fk_ai_recommendations_user
    FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_ai_recommendations_job_notice
    FOREIGN KEY (job_notice_id) REFERENCES job_notices (job_notice_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_ai_recommendations_resume
    FOREIGN KEY (resume_id) REFERENCES resumes (resume_id)
    ON DELETE CASCADE,
  CONSTRAINT chk_ai_recommendations_response_payload CHECK (
    response_payload IS NULL OR JSON_VALID(response_payload)
  )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

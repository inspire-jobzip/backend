-- Common queries for API implementation checks

USE dejavu;

-- Job list with mapped skills
SELECT
  j.job_notice_id,
  j.company_name,
  j.title,
  j.job_category,
  j.location_text,
  j.experience_level,
  j.employment_type,
  j.deadline_at,
  GROUP_CONCAT(s.skill_name ORDER BY s.skill_name SEPARATOR ', ') AS skill_names
FROM job_notices j
LEFT JOIN job_notice_skills js ON js.job_notice_id = j.job_notice_id
LEFT JOIN skills s ON s.skill_id = js.skill_id
WHERE j.is_active = TRUE
GROUP BY j.job_notice_id
ORDER BY j.deadline_at IS NULL, j.deadline_at ASC;

-- Bookmarked jobs for a user
SELECT
  b.bookmark_id,
  j.job_notice_id,
  j.company_name,
  j.title,
  j.deadline_at,
  CASE
    WHEN j.deadline_at < CURRENT_TIMESTAMP THEN 'CLOSED'
    WHEN j.deadline_at <= DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 7 DAY) THEN 'CLOSING_SOON'
    ELSE 'OPEN'
  END AS recruit_status
FROM bookmarks b
JOIN job_notices j ON j.job_notice_id = b.job_notice_id
JOIN users u ON u.user_id = b.user_id
WHERE u.email = 'developer@email.com'
ORDER BY j.deadline_at IS NULL, j.deadline_at ASC;

-- Simple skill matching count for a user and job notice
SELECT
  j.job_notice_id,
  j.title,
  COUNT(*) AS keyword_match_count
FROM users u
JOIN JSON_TABLE(
  u.preferred_skill_names_json,
  '$[*]' COLUMNS (
    skill_name VARCHAR(100) PATH '$'
  )
) user_skill
JOIN skills s ON s.skill_name = user_skill.skill_name
JOIN job_notice_skills js ON js.skill_id = s.skill_id
JOIN job_notices j ON j.job_notice_id = js.job_notice_id
WHERE u.email = 'developer@email.com'
GROUP BY j.job_notice_id
ORDER BY keyword_match_count DESC;

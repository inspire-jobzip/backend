-- Saramin HTML archive sample data
-- Generated from /Users/hyun/Downloads/아카이브.zip
-- Run after 01_schema.sql and 02_seed_skills.sql

USE dejavu;

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
) VALUES (
  '54347399',
  '(주)마크베이스',
  'Machbase 백엔드 개발자 모집 신입/경력',
  'https://www.saramin.co.kr/zf_user/jobs/view?rec_idx=54347399',
  'BACKEND',
  NULL,
  '신입/경력',
  NULL,
  '대학졸업(2,3년)이상',
  '면접 후 결정',
  '2026-07-15 23:59:59',
  'Java, Node.js, GoLang, AWS',
  '채용공고 상세
백엔드개발 신입/경력 모집
(주)마크베이스
는 산업 loT 데이터처리를 위한 시계열 DBMS를 만들고 있는 소프트웨어 전문기업으로 현재 loT 데이터베이스 표준으로 TPC에 의해 선정되었으며,
세계 성능랭킹 Top 1, 2, 3위
를 기록하고 있는 차세대 혁신 벤처기업입니다.
마크베이스는 이런 회사 입니다.
☞ 2026
.04
마크베이스, AI 실행형 DBMS "Machbase NEO V8.5" 출시
☞ 2025.11  "마크베이스-LS ELECTRIC, 전략적 제휴를 위한 MOU 체결
☞ 2024.04  "마크베이스 네오" 조달청 디지털 서비스몰 등록
☞ 2023.12 시계열 DBMS "마크베이스 네오 V8" GS 인증 1등급 획득
☞ 2023.09 ICT 기금 우수성과 과학기술 정보통신부 장관상 수상
☞ 2022.12 TPC "IOT 분야 DBMS 성능평가" 알라바바 꺾고 세계 1위 차지
☞ 2020.06 KB / KT / 스마일게이트 / 유티씨 인베스트먼트 / 한국투자파트너스 투자유치
☞ 2020.04 TPCx_loT
세계 1위 기록 갱신
(248만초과 TPS)_세계 유일 표준 시계열 DBMS
☞ 2019.11
제 6회 대한민국 SW제품 품질대상 대상 수상(과학기술정보통신부 장관상)
☞ 2019.11 TPCx_loT
세계 1위 등록 완료
(100만초과 TPS)_세계 유일 표준 시계열 DBMS
☞ 2018.06 KB인베스트먼트 / 산은캐피탈 투자유치
☞ 2017.08
신SW 상품대상 과학기술정보통신부 장관상 수상
☞ 2016.11
GS인증 1등급 획득
☞ 2016.03 한국투자파트너스 / 스마일게이트 인베스트먼트 투자유치
☞ 2013.11 기업부설연구소 설립인가
☞ 2013.03 법인 설립
☞
마크베이스 네오 8.5 소개
(
https://youtu.be/iNsf4UFr_OY?t=5
)
☞
K-Champ Lab 5th
DEMODAY-Machbase (
https://www.youtube.com/watch?v=gN807dJeJHA
)
☞
마크베이스 TouTube 공식채널
(
https://www.youtube.com/channel/UCiGQunZgLpFYutRT2BFbWaQ
)
☞
마크베이스 facebook 공식채널
(
https://www.facebook.com/machbaseDB
)
☞
마크베이스 twitter 공식채널
(
https://twitter.com/machbasekorea
)
☞
마크베이스 성능랭킹 1, 2, 3위 인증
(
http://www.tpc.org/tpcx-iot/results/tpcxiot_perf_results5.asp
)
☞
"국내 DBMS 업체 마크베이스, TPCx-loT 테스트서 1위" 관련기사 (디일렉 2020.04.20 일자)
(
http://www.thelec.kr/news/articleView.html?idxno=5773
)
☞
"마크베이스, 100억원 규모 투자유치 (전자신문 / 디지털데일리 / 메가뉴스 2020.07.14일자)
(
https://www.etnews.com/20200714000319
)
☞
"마크베이스, 부산1호선 스마트 예방 검수시스템 구축 (전자신문 / 2022.04.24일자)
(https://www.etnews.com/20220422000043)
☞
"마크베이스,  차세대 데이터 플랫폼 NEO V8.5 출시 (전자신문 / 2026.04.27일자)
(https://www.etnews.com/20260427000260)
효율적인  업무를 위한 근무 환경
▶
업무는 장비빨! 최고 성능의 컴퓨터와 듀얼 모니터 지급
▶ 365일, 24시간 동안 돌아가는 공기청정기로 쾌적한 업무환경을 제공
▶ 동전 없이도 가능한 게임기, 업무로 인한 스트레스 해소~
▶ 언제든 편히 쉴 수 있는 안마의자 제공
▶ 직무에 도움이 되는 서적 제공
▶ 지하철2호선 구로디지털역에서 도보 7분 거리로 편리한 출퇴근이 가능
▶ 신규 입사자에게 welcome kit 제공
아낌없이  주는  포상  및  지원 제도
▶ 입사시 점심회식을 통해 축하파티 제공
▶ 행복은 두배로, 슬픔은 반으로 줄여주는 탄탄한 경조휴가와 경조금을 지원
▶ 생일 축하합니다! 생일날 생일케이크와 열렬한 축하
▶ 종합건강검진 지원으로 임직원의 건강 지킴이
▶ 4대보험 제공, 임직원의 안정적인 회사생활을 보장
▶ 갈 땐 가더라도 받고 가세요! 퇴직금 제공
▶ 장기근속자에게 포상, 장기 근속할수록 점점 늘어나는 혜택
▶ 우수직원에게는 특별한 혜택을 제공
일하기 좋은 사내 문화
▶ 자유로운 연차사용, 휴식권을 보장해드립니다
▶ 복장에 제한을 두지 않아, 편한 복장으로 출근 가능
▶ 업무에 관련하여 자유롭게 어필 할 수 있는 분위기
▶ 대체 공휴일, 법정 공휴일에는 당연히 쉽니다!
▶ 회식 / 야근 강요 없음
이런 인재들을 모집하고자 합니다.
☞ 국내 어디에서도 보기 힘든 높은 수준의 시스템 소프트웨어 개발에 대한 경험을 원하는 인재
☞ 국내 최고의 시스템 소프트웨어 개발자들과 함께 미래를 꿈꾸고자 하는 인재
☞ 우수한 성과를 통해 부여하는 스톡옵션으로 부를 축적하고 싶은 인재
☞ 회사의 성장과 더불어 본인의 성장을 꿈꾸는 인재
☞ 세계 1위 기술력을 보유한 회사에서의 자부심을 뽐내고픈 인재
2013년 03월 21일에 설립된 시스템 소프트웨어 개발 및 공급업업종의 소프트웨어 자문,개발,공급,DBMS개발,분자생물학,유전자검사사업을 하는 중소기업, 주식회사기업 입니다.
모집부문 및 상세내용
공통 자격요건
ㆍ학력 : 초대졸 이상
ㆍ나이/성별 : 무관
백엔드
주요업무
- 클라우드 서비스 백엔드 개발 (신입/경력)
백엔드개발 지원자격
- Java / Go 언어중 한 가지 이상 자신있게 사용 가능하신 분
- 시스템 프로그래밍 / 네트워크 프로그래밍 지식을 보유하신분
우대사항
- golang 경력자
- node.js 사용이 가능한 사람
- WEB/APP 서비스 개발 경험
- 클라우드 환경 개발 경험,  AWS 사용 및 프로젝트 경험
- 하나의 기술에 얽매여 있지 않고 새로운 기술 습득에 거부감이 없으신 분
지원자격
- 경력 2년이상 7년이하
- 신입 지원가능
우대사항
근무조건
ㆍ
근무형태
:
정규직(수습기간)-
3개월
ㆍ
근무일시
:
주 5일(월~금) 09:30 ~ 18:30
ㆍ
근무지역
:
(08380) 서울 구로구 디지털로33길11 에이스테크노타워8차 501호
전형절차
서류전형
1차면접
2차면접
최종합격
접수기간 및 방법
ㆍ
접수기간
:
채용시 마감
ㆍ
접수방법
:
사람인 입사지원 또는 담당자 이메일 접수
ㆍ
이력서양식
:
사람인 온라인 이력서 또는 자유양식
ㆍ
제출서류
:
유의사항
ㆍ학력, 성별, 연령을 보지않는 블라인드 채용입니다.
ㆍ입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
ㆍ모집분야별로 마감일이 상이할 수 있으니 유의하시길 바랍니다.',
  '{"taskSummary": ["Java, Node.js, GoLang, AWS를 활용한 서버/백엔드 개발 업무를 맡을 가능성이 높습니다.", "공고의 요구사항에 따라 API 개발, 데이터 처리, 서비스 운영 업무가 포함될 수 있습니다."], "requiredSkills": ["Java", "Node.js", "GoLang", "AWS"], "possibleTasks": []}',
  '{"archiveFileName": "[(주)마크베이스] Machbase 백엔드 개발자 모집 신입_경력 (D-5) - 사람인.html", "detailFileName": "view-detail.html", "metaDescription": "(주)마크베이스, Machbase 백엔드 개발자 모집 신입/경력, 경력:신입/경력, 학력:대학졸업(2,3년)이상, 면접 후 결정, 마감일:2026-07-15, 홈페이지:http://machbase.com", "parsedAt": "2026-07-10T15:37:39"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
  company_name = VALUES(company_name),
  title = VALUES(title),
  source_url = VALUES(source_url),
  job_category = VALUES(job_category),
  experience_level = VALUES(experience_level),
  education_level = VALUES(education_level),
  salary_text = VALUES(salary_text),
  deadline_at = VALUES(deadline_at),
  role_keywords_text = VALUES(role_keywords_text),
  description_raw = VALUES(description_raw),
  ai_analysis_json = VALUES(ai_analysis_json),
  raw_payload = VALUES(raw_payload),
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('Java', 'Node.js', 'GoLang', 'AWS')
WHERE j.external_notice_id = '54347399';

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
) VALUES (
  '54379324',
  '(주)무브먼츠',
  '서버/백엔드 개발자 채용(주니어 신입~4년이하)',
  'https://www.saramin.co.kr/zf_user/jobs/view?rec_idx=54379324',
  'BACKEND',
  NULL,
  '신입/경력',
  NULL,
  '대학교졸업(4년)이상',
  '3,600 만원',
  NULL,
  'Spring, JPA, Docker, AWS, Kotlin',
  '채용공고 상세
서버/백엔드 개발자 채용(주니어 신입~4년이하)
모집분야
서버개발자
📋 주요업무
• GIS솔루션 개발 유지 및 보수
• 신규 솔루션 서버 개발
📋 자격요건
• 신입 / 경력 1년 이상 ~ 4년 이하
• 대학교졸업(4년)이상
-Kotlin + Spring Boot 기반 백엔드 개발 및 운영 경험이 있으신 분
-실서비스를 개발하고 운영해본 경험이 있으신 분
-REST API 설계 및 개발 경험이 있으신 분
-JPA, Querydsl, SQL 등 데이터 처리에 익숙하신 분
-AWS 등 클라우드 환경에서 서비스를 운영해본 경험이 있으신 분
-서비스 운영 환경에서 예외 처리, 성능, 장애 대응을 경험해보신 분
-협업 과정에서 요구사항을 정리하고 책임감 있게 실행할 수 있는 분
-AI 도구를 활용해 개발 생산성을 높여본 경험이 있으신 분
📋 우대사항
-GIS 및 공간정보 데이터에 대한 이해 또는 관련 서비스 개발 경험
-대용량 데이터, 동시성, 트랜잭션 처리에 대한 이해
-Docker, CI/CD, 모니터링 환경 구축 또는 운영 경험
-모바일 앱 백엔드 또는 B2B/B2G 서비스 경험
-위치 기반 서비스, 공간 데이터 처리, 측량/지도 연동 경험
-AI를 활용한 코드 리뷰, 테스트 작성, 장애 분석, 반복 작업 자동화 경험
-LLM/AI 기능을 제품이나 운영 프로세스에 접목해본 경험
🏠 근무조건
• 고용형태 :
정규직
(수습 3개월)
• 급여 :
연봉 3,600만원
• 근무지 :
서울 강남구 테헤란로 151 역삼하이츠빌딩
• 근무일수/시간 :
🎁 복지 및 혜택
🚀 채용절차
접수기간 :
2026-07-06 12시 ~ 채용시
제출서류 :
사람인 온라인 이력서
접수방법 :
사람인 입사지원
전형절차 :
서류전형 → 1차면접 → 2차면접 → 최종합격
🛎️ 유의사항
• 10월 중순 경 신논현(혹은 신사역)으로 사무실 이전 계획이 있습니다. 지원시 참고 부탁드립니다.
• 신입 기준 연봉 3,600만원이며, 경력에 따라 협의.
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.',
  '{"taskSummary": ["Spring, JPA, Docker, AWS, Kotlin를 활용한 서버/백엔드 개발 업무를 맡을 가능성이 높습니다.", "공고의 요구사항에 따라 API 개발, 데이터 처리, 서비스 운영 업무가 포함될 수 있습니다."], "requiredSkills": ["Spring", "JPA", "Docker", "AWS", "Kotlin"], "possibleTasks": []}',
  '{"archiveFileName": "[(주)무브먼츠] 서버_백엔드 개발자 채용(주니어 신입~4년이하) (채용시 마감) - 사람인.html", "detailFileName": "view-detail.html", "metaDescription": "(주)무브먼츠, 서버/백엔드 개발자 채용(주니어 신입~4년이하), 경력:신입/경력, 학력:대학교졸업(4년)이상, 연봉:3,600 만원, 마감일:채용시, 홈페이지:www.movements.kr", "parsedAt": "2026-07-10T15:37:39"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
  company_name = VALUES(company_name),
  title = VALUES(title),
  source_url = VALUES(source_url),
  job_category = VALUES(job_category),
  experience_level = VALUES(experience_level),
  education_level = VALUES(education_level),
  salary_text = VALUES(salary_text),
  deadline_at = VALUES(deadline_at),
  role_keywords_text = VALUES(role_keywords_text),
  description_raw = VALUES(description_raw),
  ai_analysis_json = VALUES(ai_analysis_json),
  raw_payload = VALUES(raw_payload),
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('Spring', 'JPA', 'Docker', 'AWS', 'Kotlin')
WHERE j.external_notice_id = '54379324';

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
) VALUES (
  '54322347',
  '(주)아랑소프트',
  '[아랑소프트]SI개발&웹개발&백엔드/서버개발 외 정규직 채용',
  'https://www.saramin.co.kr/zf_user/jobs/view?rec_idx=54322347',
  'BACKEND',
  NULL,
  '신입',
  NULL,
  '학력무관',
  '면접 후 결정',
  '2026-07-30 23:59:59',
  NULL,
  '채용공고 상세
[아랑소프트]SI개발&웹개발&백엔드/서버개발 외 정규직 채용
모집분야
정규직 Web Programmer 채용
(5명)
📋 주요업무
• 소프트웨어 개발 및 운영
•
• 개발팀 부서 소속으로 함께할 예정이에요.
📋 자격요건
• 신입
• 학력무관
🏠 근무조건
• 고용형태 :
정규직
,
프리랜서
• 급여 :
면접 후 결정
• 근무지 :
서울 구로구 디지털로 242, 한화비즈메트로 1차 1005호
• 근무요일/시간 : 09:00~18:00
🎁 복지 및 혜택
🚀 채용절차
접수기간 :
2026-06-30 13시 ~ 2026-07-30 24시
제출서류 :
사람인 온라인 이력서
접수방법 :
사람인 입사지원
전형절차 :
서류전형 → 기술테스트 → 기술면접 및 인성면접 → 최종합격
🛎️ 유의사항
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.
• 모집분야별로 마감일이 상이할 수 있으니 유의하시길 바랍니다.',
  '{"taskSummary": ["공고 본문 기반 기술를 활용한 서버/백엔드 개발 업무를 맡을 가능성이 높습니다.", "공고의 요구사항에 따라 API 개발, 데이터 처리, 서비스 운영 업무가 포함될 수 있습니다."], "requiredSkills": [], "possibleTasks": []}',
  '{"archiveFileName": "[(주)아랑소프트] [아랑소프트]SI개발&웹개발&백엔드_서버개발 외 정규직 채용 .html", "detailFileName": "view-detail.html", "metaDescription": "(주)아랑소프트, [아랑소프트]SI개발&웹개발&백엔드/서버개발 외 정규직 채용, 경력:신입, 학력:학력무관, 면접 후 결정, 마감일:2026-07-30, 홈페이지:", "parsedAt": "2026-07-10T15:37:39"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
  company_name = VALUES(company_name),
  title = VALUES(title),
  source_url = VALUES(source_url),
  job_category = VALUES(job_category),
  experience_level = VALUES(experience_level),
  education_level = VALUES(education_level),
  salary_text = VALUES(salary_text),
  deadline_at = VALUES(deadline_at),
  role_keywords_text = VALUES(role_keywords_text),
  description_raw = VALUES(description_raw),
  ai_analysis_json = VALUES(ai_analysis_json),
  raw_payload = VALUES(raw_payload),
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

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
) VALUES (
  '54224161',
  '(주)인텍에프에이',
  '2026년도 각 부문 신입 및 경력사원 채용',
  'https://www.saramin.co.kr/zf_user/jobs/view?rec_idx=54224161',
  'DEVOPS',
  NULL,
  '신입/경력',
  NULL,
  '고등학교졸업이상',
  '면접 후 결정',
  '2026-07-12 23:59:59',
  NULL,
  '채용공고 상세
인텍에프에이는 전력전자와 제어기술을 바탕으로 에너지ㆍ제어솔루션의 새로운 가치를 창출하며
미래 에너지 전환을 책임지는 스마트 전력시스템 선도기업입니다.
신재생에너지 장비(ESS)를 중심으로 PCS 및 전력계통 운영ㆍ제어 시스템 역량을 보유하고 있으며,
자동화기기, 로봇제어기, 환경시스템 분야에서 전력전자ㆍ제어ㆍ통신 기술 기반의
독자적인 Core 기술 경쟁력을 확보하고 있습니다.
한전, LSE, LG전자, 삼성전자, 현대엘리베이터 등 국내외 주요 기업에
산업용 전력변환장치를 안정적으로 공급하여 기술력과 신뢰성을 인정받고 있습니다.
최근에는 전력계통 안정화(FR) 및 장주기 ESS 분야에 역량을 집중하며,
고출력ㆍ고신뢰성 전력변환 기술을 기반으로 에너지 저장 솔루션 사업을 지속적으로 확장하고 있습니다.
인텍에프에이와 함께 지속가능한 미래를 설계하고, 새로운 도약을 준비할 열정적인 인재를 기다립니다.
모집부문 및 업무
모집분야
구분
경력
업무내용
자격요건
SW개발
정규직
신입 및
경력
ㆍ시스템 네트워크 설계
ㆍSW 개발
[자격요건]
ㆍ학력 : 학사 이상
ㆍ전공 : 컴퓨터공학과, 컴퓨터 소프트웨어
학과 등 관련 학위 소지자
[우대사항]
ㆍ영어 가능자
전력전자
ㆍ제어 개발
(PCS)
정규직
경력
ㆍ대용량 PCS 시스템 개발
(2, 3 Level)
ㆍMotor 제어 인버터 개발
(유도기, PM)
ㆍ제어 알고리즘 설계 및
제어기(F/W, FPGA) 개발
ㆍ실증시험, 계통 연계 시험
및 인증 대응
[자격요건]
ㆍ학력 : 학사 이상
ㆍ전공 : 전력전자, 전기ㆍ전자, 제어공학 등
관련 전공
ㆍ경력 : 전력변환장비 개발 3년 이상
[우대사항]
ㆍ전력변환 회로 설계 및 해석 능력 보유
ㆍMATLAB/Simulink, PSIM, Hils 등
사용 가능자
ㆍ500kW 이상급 전력변환기 개발 경험
ㆍ현장 Troubleshooting 및 커미셔닝 경험자
ㆍUL/CSA/CE 등 해외 인증 대응 경험
ㆍ영어 또는 일본어 기술문서 해석 가능자
전력전자
ㆍ제어 개발
(모터
드라이브)
정규직
신입
또는 경력
ㆍ모터드라이브 전력회로 및
전력변환 토폴로지 설계
ㆍBLDC, PMSM, IM 등
모터제어 알고리즘 설계
ㆍ제어기(DSP / MCU / FPGA)
개발
ㆍ실증시험 및 인증 대응
[자격요건]
ㆍ학력 : 학사 이상
ㆍ전공 : 전력전자, 전기ㆍ전자, 제어공학 등
관련 전공
ㆍ신입 : 경력 무관
ㆍ경력 : 모터제어 어플리케이션 또는
전력변환장비 개발 3년 이상
[우대사항]
ㆍ모터제어 알고리즘, 시스템 이해 보유
ㆍ전력변환 회로 설계 및 해석 능력 보유
ㆍMATLAB/Simulink, PSIM, 등
사용 가능자
ㆍ석박사(전력전자 전공) 우대
전기
ㆍ시스템
설계
정규직
경력
ㆍPCS 전기 설계 및 시스템 구성
ㆍ배전, 보호, 계통 연계 설계
및 기술검토
ㆍMW급 대용량 전력변환
시스템 설계
ㆍ실증 프로젝트 및 계통
연계 시험 기술 지원
[자격요건]
ㆍ학력 : 학사 이상
ㆍ전공 : 전력전자, 전기ㆍ전자, 제어공학 등
관련 전공
ㆍ경력
- PCS/ 인버터/ 컨버터 개발
실무경력 3년 이상
- 양산 또는 실증 프로젝트 수행 경험
[우대사항]
ㆍPCS, 인버터 개발 경험자
ㆍ인증 또는 대규모 실증 프로젝트 경험자
제품설계
정규직
신입
또는 경력
[경력]
제품 설계 및 관리업무
ㆍ시작품 제작, 양산성 검토
ㆍ기능검사 및 관련설비 제작
ㆍ전장, 하네스 도면 설계
ㆍBOM 설계, ERP 등록/관리
ㆍ제품 승인원 작성/관리
[신입]
제품 제작 지원업무
ㆍ부품 구매 및 자재관리
ㆍ제품 제작지원
[자격요건]
[경력]
ㆍ학력 : 학사 이상
ㆍ전공 : 전기, 전자 관련계열 전공자
[신입]
ㆍ학력 : 고졸 이상
ㆍ전공 : 무관
[우대사항]
ㆍ관련분야 유경험자
ㆍDraftsight(Auto CAD) 사용 가능자
ㆍ엑셀, ERP 사용 가능자
영업관리
정규직
신입 및
경력
ㆍERP 기반 수주ㆍ매출 관리
및 영업 데이터 정리
ㆍ사업 관련 행정 및 프로젝트
운영 실무 지원
ㆍ정부지원사업 및 관련
프로젝트 운영ㆍ관리
[자격요건]
ㆍ학력 : 전문학사 이상
ㆍ전공 : 경영, 경제, 무역 등 상경계열
(또는 이에 준하는 역량 보유자)
ㆍ엑셀, 워드 등 문서작성 활용 가능자
[우대사항]
ㆍ영어 또는 일본어 가능자
ㆍERP(더존 Amaranth) 사용 경험
ㆍ문서 기획ㆍ작성 및 PPT 자료
작성 능력 우수자
품질관리
정규직
신입
또는 경력
품질관리 실무
ㆍ수입검사 및 Data 집계
ㆍ임가공품 공정 리턴 부적합품
후속 처리
ㆍ부적합 등급판정 및 외주업체
개선 요청
ㆍUL 공장심사 관련 임가공품
증빙자료 관리 등 인증관리 실무
ㆍ계측기 관리 및 팀 교육 관리
[자격요건]
ㆍ학력 : 고졸 이상
ㆍ전공 : 무관 (전기 관련 전공자 우대)
[우대사항]
ㆍ전기전자 관련 임가공품 검사 실무 경력자
ㆍ전기전자 관련 자격증 소지자
근무처
ㆍ주소 : 경기도 용인시 기흥구 탑실로35번길 63(코스트코 용인공세점 인근)
㈜인텍에프에이의 복리후생
연구직 석사 이상의 경우 전문연구요원
병역특례 편입 및 전직 가능
동종업계 중견기업 수준 급여 지급
PS/PI 성과급 지급
휴가
주5일제, 연차, 정기휴가, 경조휴가,
리프레쉬 휴가
회사식당 운영(조,중,석식 무료제공)
기숙사 운영
유연근무제
시차출퇴근제(8시∙9시∙10시)운영
교육
계층/직무 교육, 어학교육 기회 제공
선물
신규입사자 웰컴키트 및 회사점퍼 지급
명절, 근로자의날, 창립기념일 선물 지급
생활
회사식당 운영(조,중,석식 무료제공)
기숙사 운영
지원/보험
복지포인트 지급
사내 동호회 활동 지원금
자녀 학자금 지원
4대보험 외 근로자재해보험 별도 가입
전형절차
※ 서류전형 합격자에게 개별통지
제출서류
ㆍ이력서, 자기소개서
- 입사지원양식 : 회사양식 or 사람인 양식 or 자율양식 가능(회사 홈페이지 다운로드 가능)
- 이력서 우측 상단에 반드시 입사지원분야 기재 요망
제출방법 및 제출처
ㆍ접수기간 :
2026년 6월 22일~ 2026년 7월 12일 24시까지
ㆍ접수방법 :
이메일 또는 사람인 접수
접수처 : recruit@intech-fa.co.kr
- 문의 : 인사담당자 031-218-4883
- 홈페이지 :
www.intech-fa.co.kr
유의사항
ㆍ입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.',
  '{"taskSummary": ["공고 본문 기반 기술를 활용한 인프라/운영 자동화 업무를 맡을 가능성이 높습니다.", "배포, 모니터링, 서버 환경 관리 업무가 포함될 수 있습니다."], "requiredSkills": [], "possibleTasks": []}',
  '{"archiveFileName": "[(주)인텍에프에이] 2026년도 각 부문 신입 및 경력사원 채용 (D-2) - 사람인.html", "detailFileName": "view-detail.html", "metaDescription": "(주)인텍에프에이, 2026년도 각 부문 신입 및 경력사원 채용, 경력:신입/경력, 학력:고등학교졸업이상, 면접 후 결정, 마감일:2026-07-12, 홈페이지:www.intech-fa.co.kr", "parsedAt": "2026-07-10T15:37:39"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
  company_name = VALUES(company_name),
  title = VALUES(title),
  source_url = VALUES(source_url),
  job_category = VALUES(job_category),
  experience_level = VALUES(experience_level),
  education_level = VALUES(education_level),
  salary_text = VALUES(salary_text),
  deadline_at = VALUES(deadline_at),
  role_keywords_text = VALUES(role_keywords_text),
  description_raw = VALUES(description_raw),
  ai_analysis_json = VALUES(ai_analysis_json),
  raw_payload = VALUES(raw_payload),
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

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
) VALUES (
  '54364342',
  '(주)퍼스트밸류',
  '핀테크 스타트업] Java 서버/백엔드 개발자 채용',
  'https://www.saramin.co.kr/zf_user/jobs/view?rec_idx=54364342',
  'BACKEND',
  NULL,
  '신입/경력',
  NULL,
  '학력무관',
  '면접 후 결정',
  NULL,
  'Java',
  '채용공고 상세',
  '{"taskSummary": ["Java를 활용한 서버/백엔드 개발 업무를 맡을 가능성이 높습니다.", "공고의 요구사항에 따라 API 개발, 데이터 처리, 서비스 운영 업무가 포함될 수 있습니다."], "requiredSkills": ["Java"], "possibleTasks": []}',
  '{"archiveFileName": "[(주)퍼스트밸류] 핀테크 스타트업] Java 서버_백엔드 개발자 채용 (채용시 마감) - 사람인.html", "detailFileName": "view-detail.html", "metaDescription": "(주)퍼스트밸류, 핀테크 스타트업] Java 서버/백엔드 개발자 채용, 경력:신입/경력, 학력:학력무관, 면접 후 결정, 마감일:채용시, 홈페이지:https://firstvaluecorp.com", "parsedAt": "2026-07-10T15:37:39"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
  company_name = VALUES(company_name),
  title = VALUES(title),
  source_url = VALUES(source_url),
  job_category = VALUES(job_category),
  experience_level = VALUES(experience_level),
  education_level = VALUES(education_level),
  salary_text = VALUES(salary_text),
  deadline_at = VALUES(deadline_at),
  role_keywords_text = VALUES(role_keywords_text),
  description_raw = VALUES(description_raw),
  ai_analysis_json = VALUES(ai_analysis_json),
  raw_payload = VALUES(raw_payload),
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('Java')
WHERE j.external_notice_id = '54364342';

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
) VALUES (
  '54420034',
  '글로벌주식회사',
  '[글로벌주식회사] 기술 운영 지원 Technical Ops Assistant 채용',
  'https://www.saramin.co.kr/zf_user/jobs/view?rec_idx=54420034',
  'BACKEND',
  NULL,
  '경력무관',
  NULL,
  '대학교졸업(4년)이상',
  '면접 후 결정',
  NULL,
  'HTML, Python, Git',
  '채용공고 상세
[글로벌주식회사]
기술 운영 지원
Tech Ops Assistant
모집분야
기술 운영 지원 Tech Ops Assistant
📋 주요업무
- ERP 운영 이슈 접수 및 분석
- Python/SQL/HTML 수정
- API 데이터 확인
- SaaS 운영 지원
- 리서치 및 문서화
- 기타 행정 지원
📋 자격요건
• 경력 무관 (신입 지원 가능)
• 대학교졸업(4년)이상, 졸업 예정자 지원가능
- Either exceptionally smart or a tech nerd
- 동종업계 개발 경험 보유
- IT 운영 지원 업무 수행
- 기본 네트워크·서버 이해 있으신 분
- 이슈 트래킹 도구 활용 가능하신 분
- 문서화 및 커뮤니케이션 능력 있으신 분
- 책임감 있게 일정 준수 가능하신 분
📋 우대사항
- 영어 혹은 독어 구사자 혹은 Kanye west 팬
- 해외대 졸업
근무조건
• 고용형태 :
파트
,
계약직
3개월(정규직 전환 가능),
인턴직
3개월(정규직 전환 가능) ㄷ
• 급여 :
면접 후 결정
• 근무지 :
서울 서초구 반포대로14길 71
• 근무일수/시간 :
복지 및 혜택
높은 성과와 성장 역량에 따라 정규직 전환 및 핵심 기술 리더 역할로 성장할 수 있는 기회를 제공합니다.
빠른 성장 환경에서 제품 개발 및 회사 운영 전반에 참여할 수 있습니다.
체계적인 온보딩 및 직무 교육을 제공합니다.
성과 기반의 보상 체계를 운영합니다.
채용절차
접수기간 :
2026-07-09 14시 ~ 채용시
제출서류 :
자유양식 이력서,
Cover Letter , Resume, Portfolio (GitHub, website or relevant project)
이력서, 자기소개서, 포트폴리오
접수방법 :
사람인 입사지원
전형절차 :
서류전형 → 1차면접 → 2차면접 → 최종합격
유의사항
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.',
  '{"taskSummary": ["HTML, Python, Git를 활용한 서버/백엔드 개발 업무를 맡을 가능성이 높습니다.", "공고의 요구사항에 따라 API 개발, 데이터 처리, 서비스 운영 업무가 포함될 수 있습니다."], "requiredSkills": ["HTML", "Python", "Git"], "possibleTasks": []}',
  '{"archiveFileName": "[글로벌주식회사] 기술운영지원.html", "detailFileName": "view-detail.html", "metaDescription": "글로벌주식회사, [글로벌주식회사] 기술 운영 지원 Technical Ops Assistant 채용, 경력:경력무관, 학력:대학교졸업(4년)이상, 면접 후 결정, 마감일:채용시, 홈페이지:", "parsedAt": "2026-07-10T15:37:39"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
  company_name = VALUES(company_name),
  title = VALUES(title),
  source_url = VALUES(source_url),
  job_category = VALUES(job_category),
  experience_level = VALUES(experience_level),
  education_level = VALUES(education_level),
  salary_text = VALUES(salary_text),
  deadline_at = VALUES(deadline_at),
  role_keywords_text = VALUES(role_keywords_text),
  description_raw = VALUES(description_raw),
  ai_analysis_json = VALUES(ai_analysis_json),
  raw_payload = VALUES(raw_payload),
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('HTML', 'Python', 'Git')
WHERE j.external_notice_id = '54420034';

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
) VALUES (
  '54190689',
  '이데아텍(주)',
  '[신입/경력] 백엔드 개발자 채용',
  'https://www.saramin.co.kr/zf_user/jobs/view?rec_idx=54190689',
  'BACKEND',
  NULL,
  '경력무관',
  NULL,
  '대학교졸업(4년)이상',
  '면접 후 결정',
  '2026-07-16 23:59:59',
  'Java, Spring, Docker, Kubernetes, Kafka',
  '채용공고 상세
[신입/경력]
백엔드 개발자 채용
모집분야
백엔드 개발자
Enterprise Integration Platform 및 iPaaS의 핵심 기능과 아키텍처를 설계·개발하는 시니어 포지션입니다.
단순 기능 구현을 넘어 기술 방향, 플랫폼 구조, 개발 표준 및 제품화를 주도합니다.
경력과 역량에 따라
Senior Backend Developer, Tech Lead, Principal Engineer, Software Architect, Platform Architect
로 성장할 수 있습니다.
📋 주요업무
1. Enterprise Integration Platform 핵심 개발
•
Enterprise Integration Platform 및 iPaaS 백엔드 핵심 기능 설계·개발
•
Java·Spring 기반 플랫폼 및 백엔드 서비스 개발
•
MQ, Pub/Sub 기반 메시지 아키텍처 설계 및 구현
•
대용량 트래픽 처리를 위한 비동기 처리 구조 설계
•
멀티스레딩 및 동시성 제어 구조 설계·개발
•
다양한 시스템 및 데이터 간 통합·연계 기능 개발
•
플랫폼 API 및 내부 서비스 인터페이스 설계
2. 플랫폼 아키텍처 설계 및 기술 리딩
•
플랫폼 전체 시스템 아키텍처 설계
•
기술 스택 선정 및 주요 기술적 의사결정 주도
•
플랫폼 구조, 개발 표준 및 확장성 설계
•
통합 연계 표준 및 인터페이스 구조 설계
•
SDK 및 내부 프레임워크 설계·개발
•
기존 시스템의 기술 부채 분석 및 구조 개선
•
성능, 확장성, 안정성을 고려한 기술 로드맵 수립
3. PoC 및 제품화 리딩
•
신규 기술 및 기능에 대한 PoC 수행
•
PoC 결과 분석 및 제품화 가능성 검토
•
PoC 산출물의 제품 코드 전환 및 안정화
•
실제 고객 환경을 고려한 기능 고도화
•
성능, 확장성 및 운영 관점의 품질 기준 수립
•
제품 장애와 성능 이슈의 원인 분석 및 개선
4. 코드 품질 및 개발문화 리딩
•
코드 리뷰 및 백엔드 개발 표준 수립
•
테스트 전략 및 소프트웨어 품질 기준 정의
•
공통 모듈 및 재사용 가능한 개발 구조 설계
•
주니어·미들급 개발자 기술 멘토링
•
기술 문서 및 시스템 아키텍처 문서 작성
•
개발팀 및 유관 부서와의 기술 커뮤니케이션
📋 자격요건
• 경력 무관 (신입 지원 가능)
•
대학교졸업(4년)이상, 졸업 예정자 지원가능
•
Java·Spring 기반 백엔드 개발 경력 8년 이상
•
Spring Framework 또는 Spring Boot 기반 서비스 개발 경험
•
메시지 기반 아키텍처인 MQ, Pub/Sub에 대한 실무 경험 또는 높은 이해도
•
멀티스레딩, 비동기 처리 및 동시성 제어 경험
•
시스템 또는 플랫폼 아키텍처 설계 경험
•
기술 스택 선정 및 기술적 의사결정 경험
•
코드 리뷰 및 개발 품질 기준 수립 경험
•
REST API 및 백엔드 서비스 설계·개발 경험
•
복잡한 시스템 구조를 논리적으로 설명할 수 있는 커뮤니케이션 역량
•
기술 문제를 분석하고 개선방안을 주도적으로 제시할 수 있는 분
📋 우대사항
•
Spring Integration 실무 경험
•
Apache NiFi 또는 Kafka 기반 시스템 개발 경험
•
iPaaS, EAI, ESB 또는 미들웨어 개발 경험
•
데이터 파이프라인 및 시스템 통합·연계 구조 설계 경험
•
SDK, API 플랫폼 또는 플랫폼 제품 개발 경험
•
대용량 트래픽 처리 시스템 개발 경험
•
고가용성 및 분산 시스템 아키텍처 설계 경험
•
CI/CD 환경 구축 및 운영 경험
•
Docker 및 Kubernetes 기반 개발·운영 경험
•
클라우드 또는 컨테이너 기반 서비스 개발 경험
•
기술 문서 및 아키텍처 설계 문서 작성 경험
•
테크리드, 개발리드 또는 시스템 아키텍트 경험
•
PoC부터 상용 제품 출시까지 전 과정을 경험한 분
🏠 근무조건
• 고용형태 :
정규직
(수습 3개월)
• 급여 :
면접 후 결정
• 근무지 :
서울 서초구 서운로6길 21-6
🎁 복지 및 혜택
• 교육/생활 : 우수사원시상식, 워크샵, 직무능력향상교육, 도서구입비지원, 자격증취득지원, 간식 제공, 식비 지원, 음료제공(차,커피)
• 리프레시 : 연차, 여름휴가, 경조휴가제, 반차, Refresh휴가, 포상휴가, 공휴일 휴무, 산전 후 휴가, 육아휴직, 남성출산휴가
• 급여제도 : 상여금, 장기근속자 포상, 우수사원포상, 장기근속수당, 4대 보험
• 지원금/보험 : 각종 경조사 지원, 복지카드/포인트
• 조직 문화 : 수평적 조직문화, 회식강요 안함, 야근강요 안함, 자유복장, 자유로운 연차사용, 출산 장려
• 선물 : 명절선물/귀향비, 도서 무제한 제공
• 근무 환경 : 휴게실, 회의실, 공기청정기, 카페테리아, 전용사옥, 노트북, 사원증, 사무용품 지급, 최고 성능 컴퓨터, 안마실/안마의자
• 출퇴근 : 야간교통비지급, 탄력근무제
🚀 채용절차
접수기간 :
2026-06-16 13시 ~ 2026-07-16 24시
제출서류 :
사람인 온라인 이력서
접수방법 :
사람인 입사지원
전형절차 :
서류전형 → 1차면접 → 2차면접 → 최종합격
🛎️ 유의사항
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.',
  '{"taskSummary": ["Java, Spring, Docker, Kubernetes, Kafka를 활용한 서버/백엔드 개발 업무를 맡을 가능성이 높습니다.", "공고의 요구사항에 따라 API 개발, 데이터 처리, 서비스 운영 업무가 포함될 수 있습니다."], "requiredSkills": ["Java", "Spring", "Docker", "Kubernetes", "Kafka"], "possibleTasks": []}',
  '{"archiveFileName": "[이데아텍(주)] [신입_경력] 백엔드 개발자 채용 (D-6) - 사람인.html", "detailFileName": "view-detail.html", "metaDescription": "이데아텍(주), [신입/경력] 백엔드 개발자 채용, 경력:경력무관, 학력:대학교졸업(4년)이상, 면접 후 결정, 마감일:2026-07-16, 홈페이지:www.ideatec.co.kr", "parsedAt": "2026-07-10T15:37:39"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
  company_name = VALUES(company_name),
  title = VALUES(title),
  source_url = VALUES(source_url),
  job_category = VALUES(job_category),
  experience_level = VALUES(experience_level),
  education_level = VALUES(education_level),
  salary_text = VALUES(salary_text),
  deadline_at = VALUES(deadline_at),
  role_keywords_text = VALUES(role_keywords_text),
  description_raw = VALUES(description_raw),
  ai_analysis_json = VALUES(ai_analysis_json),
  raw_payload = VALUES(raw_payload),
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('Java', 'Spring', 'Docker', 'Kubernetes', 'Kafka')
WHERE j.external_notice_id = '54190689';

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
) VALUES (
  '54017558',
  '컨클라우드',
  '[가산디지털단지역/정규직] 웹 개발자 모집 (경력)',
  'https://www.saramin.co.kr/zf_user/jobs/view?rec_idx=54017558',
  'ETC',
  NULL,
  '경력 1년 이상',
  NULL,
  '대학교졸업(4년)이상',
  '면접 후 결정',
  NULL,
  NULL,
  '채용공고 상세',
  '{"taskSummary": ["[가산디지털단지역/정규직] 웹 개발자 모집 (경력)의 주요 요구사항을 바탕으로 관련 개발/운영 업무를 맡을 가능성이 높습니다.", "상세 업무는 공고 원문과 요구 기술을 함께 확인해야 합니다."], "requiredSkills": [], "possibleTasks": []}',
  '{"archiveFileName": "[컨클라우드] [가산디지털단지역_정규직] 웹 개발자 모집 (경력) .html", "detailFileName": "view-detail.html", "metaDescription": "컨클라우드, [가산디지털단지역/정규직] 웹 개발자 모집 (경력), 경력:경력 1년 이상, 학력:대학교졸업(4년)이상, 면접 후 결정, 마감일:상시채용, 홈페이지:https://www.concloud.co.kr/", "parsedAt": "2026-07-10T15:37:39"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
  company_name = VALUES(company_name),
  title = VALUES(title),
  source_url = VALUES(source_url),
  job_category = VALUES(job_category),
  experience_level = VALUES(experience_level),
  education_level = VALUES(education_level),
  salary_text = VALUES(salary_text),
  deadline_at = VALUES(deadline_at),
  role_keywords_text = VALUES(role_keywords_text),
  description_raw = VALUES(description_raw),
  ai_analysis_json = VALUES(ai_analysis_json),
  raw_payload = VALUES(raw_payload),
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

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
) VALUES (
  '54071195',
  '한국쓰리엠(주)',
  '[3M] 한국쓰리엠 신입/경력사원 모집 안내',
  'https://www.saramin.co.kr/zf_user/jobs/view?rec_idx=54071195',
  'DEVOPS',
  NULL,
  '신입/경력',
  NULL,
  '대학교졸업(4년)이상',
  '면접 후 결정',
  '2026-08-07 23:59:59',
  NULL,
  '채용공고 상세
3M
은 과학을 활용하여 우리의 일상을 더욱 편리하고 풍요롭게 만듭니다
한국쓰리엠
은 무슨일을 할까?
3M은 100년 이상 지속적으로 성장, 발전해 온 다국적 기업입니다.
지금도 비약적인 발전을 위해 끊임없이 투자하고 있습니다.
3M의 성공과 발전에 함께 하실 재능과 열정을 가진 여러분은 3M의 소중한 자산입니다.
3M의 성장은 여러분에게 성공을 위한 여러 가지 기회를 제공할 것입니다.
3M과 함께 성공을 위한 도전을 하시기 바랍니다.
당사는 우수한 인재 채용을 위해 모집 중입니다. 많은 관심과 지원 바랍니다.
모집
부문
연구소
포지션
담당업무
자격요건
근무지
지원하기
데이터
엔지니어
ㆍ데이터 아키텍처·거버넌스
구축 /데이터 통합
ㆍ디지털 도구와 데이터
파이프라인 운영
ㆍ학사 이상
ㆍ경력 2년 이상
ㆍ화학제조분야 경력자 우대
동탄
바로가기
Senior
Research
Engineer
ㆍ
FEA Modeling
ㆍ유한요소해석(FEA) 모델링 및
시뮬레이션
ㆍ석사 이상/ 박사 우대
ㆍ학위취득 후 경력 3년 이상
15년 이내
동탄
바로가기
Senior
Research
Specialist
ㆍ
Polymer Mechanics
ㆍ연성소재, 폴리머, 접착제
연구개발
ㆍ석사 이상/ 박사 우대
ㆍ학위취득 후 경력 3년 이상
15년 이내
동탄
바로가기
테크니션
(반도체연구실)
ㆍ반도체 및 CMP 공정 기술
교육 및 훈련
ㆍ제품 평가를 위한 CMP 공정
셋업 설비 정비
ㆍ전문학사, 혹은 고졸 이상
ㆍ경력자 우대
ㆍ계약직 근무(2년) 가능한 자
동탄
바로가기
제조물류본부
포지션
담당업무
자격요건
근무지
지원하기
안전기사
ㆍ환경/안전/보건 관련 법규 및
3M 규정 준수
ㆍ안전 보건 환경 경영 시스템
운영 및 관리
ㆍ학사 이상
ㆍ산업안전기사 자격증
보유한 자
화성
바로가기
안전기사
ㆍ환경/안전/보건 관련 법규 및
3M 규정 준수
ㆍ안전 보건 환경 경영 시스템
운영 및 관리
ㆍ학사 이상
ㆍ산업안전기사 자격증
보유한 자
나주
바로가기
영업& 마케팅
포지션
담당업무
자격요건
근무지
지원하기
영업
ㆍ연마재 사업부 영업
ㆍ고객 개발 및 매출 성장 주도
ㆍ학사 이상
ㆍ대졸신입 지원 가능
서울
바로가기
공통
조건
ㆍ업무상 영어 활용 가능자
ㆍ장애인은 관련법규에 따라 우대
ㆍ국가유공자/보훈대상자는 관련 법규에 따라 우대
ㆍ해외여행에 결격사유가 없어야 함
ㆍ공인영어점수 기재 필수
근무
조건
01
근무지
02
채용형태
ㆍ서울 : 서울시 영등포구 의사당대로 82
ㆍ동탄 : 경기도 화성시 삼성1로5길 7
ㆍ나주 : 전남 나주시 문평면 다시로 93
ㆍ화성 : 경기 화성시 장안면 장안공단1길 18
* 나주/화성 공장은 출퇴근 버스 운행 중
ㆍ정규직 or 계약직 (상세 공고 확인 必)
복리
후생
지원금/보험
건강검진,
의료비지원(본인),
각종 경조사 지원,
본인학자금,
업무활동비 지급,
자녀학자금
급여제도
인센티브제,
장기근속자 포상,
우수사원포상,
퇴직금,
4대 보험
선물
명절선물/귀향비
교육/생활
교육비 지원,
사내동호회 운영,
우리사주제도
근무 환경
사원증,
콘도/리조트 이용권,
사무용품 지급
출퇴근
통근버스 운행,
재택근무
한국쓰리엠
의 전형절차
* 최종 지원을 완료하셔야 서류 지원 접수가 완료됩니다.
ㆍ접수기간 :
2026년 08월 07일 까지
ㆍ접수방법 :
홈페이지 지원
바로가기
더
궁금한 것 있으신가요?
ㆍ모든 지원자에게 결과를 안내해 드리고 있습니다.
ㆍ다만, 각 전형별로 합격자에게 우선 연락드리는 점 양해 부탁드립니다.
ㆍ입사지원서 내 허위사실 기재 시 입사 취소됩니다.
ㆍ지원서 내 이메일/핸드폰번호로 연락이 되니 정확하게 기재해 주십시오.
ㆍ채용과정 중에 제출하신 서류에 대한 반환을 청구하실 수 있습니다.
(단, 온라인접수/전자메일로 제출된 경우나, 구인자의 요구없이
자발적으로 제출한 경우에는 제외됩니다.)',
  '{"taskSummary": ["공고 본문 기반 기술를 활용한 인프라/운영 자동화 업무를 맡을 가능성이 높습니다.", "배포, 모니터링, 서버 환경 관리 업무가 포함될 수 있습니다."], "requiredSkills": [], "possibleTasks": []}',
  '{"archiveFileName": "[한국쓰리엠(주)] [3M] 한국쓰리엠 신입_경력사원 모집 안내 .html", "detailFileName": "view-detail.html", "metaDescription": "한국쓰리엠(주), [3M] 한국쓰리엠 신입/경력사원 모집 안내, 경력:신입/경력, 학력:대학교졸업(4년)이상, 면접 후 결정, 마감일:2026-08-07, 홈페이지:www.3m.co.kr", "parsedAt": "2026-07-10T15:37:39"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
  company_name = VALUES(company_name),
  title = VALUES(title),
  source_url = VALUES(source_url),
  job_category = VALUES(job_category),
  experience_level = VALUES(experience_level),
  education_level = VALUES(education_level),
  salary_text = VALUES(salary_text),
  deadline_at = VALUES(deadline_at),
  role_keywords_text = VALUES(role_keywords_text),
  description_raw = VALUES(description_raw),
  ai_analysis_json = VALUES(ai_analysis_json),
  raw_payload = VALUES(raw_payload),
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;


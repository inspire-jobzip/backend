-- Processed Saramin job notice text data
-- Source: /Users/hyun/Downloads/공고텍스트.json
-- Stores raw extracted text plus secondary processed sections.
-- Run after 01_schema.sql and 02_seed_skills.sql.

USE dejavu;

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-001',
  '엠에스솔루션',
  '[이천] 반도체 Test OP 제조/생산 정규직 사원모집',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-001',
  'MANUFACTURING',
  '경기 이천',
  '경력무관',
  '정규직',
  '고등학교졸업이상',
  '월 350~370만원 수준',
  NULL,
  'MANUFACTURING, 모집인원, Test, 반도체 자동화설비 조작, 반도체 소형 칩 테스트',
  '채용공고 상세
엠에스솔루션
[이천] 반도체 Test op 제조 생산 정규직 사원모집
고객사 요청으로 기업명은 비공개로 진행되며 서류전형 합격하신분들 한해서 진행 도와드립니다
모집부분
모집부문
담당업무
자격요건
모집인원
Test
ㆍ반도체 자동화설비 조작
ㆍ반도체 소형 칩 테스트
ㆍ경력 무관 (신입 지원 가능)
ㆍ고등학교졸업이상
ㆍ관련학과 (전자,기계,반도체,항공 등)
0명
근무조건
ㆍ고용형태 : 정규직(수습 3개월)
ㆍ근무형태 : 2조2교대 A조 : 06:00 ~ 18:00 B조 : 18:00 ~ 06:00 휴게시간 2hr
ㆍ급여 : 1호봉 : 11,050 원 연장/주휴/야간 수당 별도
* 월 350 ~370 수준 (근무일수에 따른 변동있음)
* 2조2교대 근무 후 채용 완료시 3조2교대로 전환예정
복리후생
ㆍ경영 이익에 따른 성과금 (작년기준 기본금 100%)
ㆍ기숙사 1인실 제공
ㆍ직원식당 운영 ( 조 중 석 야식,특식 제공)
ㆍ각종수당 및 경조사 지원
ㆍ생일축하선물/명절선물 및 귀향비
ㆍ장기근속포상 휴가 및 포상금
전형절차
접수방법 및 기간
ㆍ접수기간 :
(채용시 마감)
ㆍ접수방법 :
사람인 온라인 입사지원
ㆍ제출서류 : 사람인 온라인 이력서
유의사항
ㆍ입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.',
  '{"taskSummary":["[이천] 반도체 Test OP 제조/생산 정규직 사원모집 포지션은 서비스 운영 및 트러블슈팅를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":[],"possibleTasks":["서비스 운영 및 트러블슈팅","제조/생산 설비 조작 및 품질 확인"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":1,"archiveFolder":"[엠에스솔루션] [이천]1인기숙사 반도체 Test 제조_생산 정규직 사원모집 (D-1) - 사람인_files","detailFileName":"view-detail(1).html","extractionMethod":"html-text","images":["03_c3_b_topt_250204.png","03_c03_step03_250204.png","watermark_white.png"],"processedSections":{"tasks":[],"requirements":["모집인원","Test","반도체 자동화설비 조작","반도체 소형 칩 테스트","경력 무관 (신입 지원 가능)","고등학교졸업이상","관련학과 (전자,기계,반도체,항공 등)","0명"],"preferred":[],"workConditions":["고용형태 : 정규직(수습 3개월)","근무형태 : 2조2교대 A조 : 06:00 ~ 18:00 B조 : 18:00 ~ 06:00 휴게시간 2hr","급여 : 1호봉 : 11,050 원 연장/주휴/야간 수당 별도","월 350 ~370 수준 (근무일수에 따른 변동있음)","2조2교대 근무 후 채용 완료시 3조2교대로 전환예정"],"benefits":["경영 이익에 따른 성과금 (작년기준 기본금 100%)","기숙사 1인실 제공","직원식당 운영 ( 조 중 석 야식,특식 제공)","각종수당 및 경조사 지원","생일축하선물/명절선물 및 귀향비","장기근속포상 휴가 및 포상금"],"process":["(채용시 마감)","사람인 온라인 입사지원","입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."],"notes":["엠에스솔루션","[이천] 반도체 Test op 제조 생산 정규직 사원모집","고객사 요청으로 기업명은 비공개로 진행되며 서류전형 합격하신분들 한해서 진행 도와드립니다"]},"detectedSkills":[],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-002',
  '(주)인텍에프에이',
  '2026년도 각 부문 신입 및 경력사원 채용',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-002',
  'MULTI',
  '경기 용인/화성/동탄 등',
  '신입/경력',
  '정규직',
  '학사 이상',
  '중견기업 수준 급여',
  '2026-07-12 23:59:59',
  'Matlab, MULTI, 모집분야, 구분, 경력, SW개발, 정규직, 신입 및',
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
ㆍ시스템 네트워크 설계
ㆍSW 개발
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
ㆍERP(더존 Amaranth) 사용 경험
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
  '{"taskSummary":["2026년도 각 부문 신입 및 경력사원 채용 포지션은 Matlab 기반으로 데이터 모델링 및 처리를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":["Matlab"],"possibleTasks":["데이터 모델링 및 처리","서비스 운영 및 트러블슈팅","웹 프론트엔드 기능 개발","운영 지원 및 문서화"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":2,"archiveFolder":"[(주)인텍에프에이] 2026년도 각 부문 신입 및 경력사원 채용 (D-2) - 사람인_files","detailFileName":"view-detail.html","extractionMethod":"html-text","images":["06_intech_tit_260619.png","29_icon_15_230309.png","29_icon_05_230309.png","29_icon_07_230309.png","29_icon_11_230309.png"],"processedSections":{"tasks":["모집분야","구분","경력"],"requirements":["SW개발","정규직","신입 및","경력","시스템 네트워크 설계","SW 개발","[자격요건]","학력 : 학사 이상","전공 : 컴퓨터공학과, 컴퓨터 소프트웨어","학과 등 관련 학위 소지자","[우대사항]","영어 가능자"],"preferred":[],"workConditions":["주소 : 경기도 용인시 기흥구 탑실로35번길 63(코스트코 용인공세점 인근)","㈜인텍에프에이의 복리후생","연구직 석사 이상의 경우 전문연구요원","병역특례 편입 및 전직 가능","동종업계 중견기업 수준 급여 지급","PS/PI 성과급 지급","휴가","주5일제, 연차, 정기휴가, 경조휴가,","리프레쉬 휴가","회사식당 운영(조,중,석식 무료제공)","기숙사 운영","유연근무제"],"benefits":["신규입사자 웰컴키트 및 회사점퍼 지급","명절, 근로자의날, 창립기념일 선물 지급","생활","회사식당 운영(조,중,석식 무료제공)","기숙사 운영","지원/보험","사내 동호회 활동 지원금","자녀 학자금 지원","4대보험 외 근로자재해보험 별도 가입"],"process":["※ 서류전형 합격자에게 개별통지","이력서, 자기소개서","입사지원양식 : 회사양식 or 사람인 양식 or 자율양식 가능(회사 홈페이지 다운로드 가능)","이력서 우측 상단에 반드시 입사지원분야 기재 요망","2026년 6월 22일~ 2026년 7월 12일 24시까지","이메일 또는 사람인 접수","접수처 : recruit@intech-fa.co.kr","문의 : 인사담당자 031-218-4883","홈페이지 :","www.intech-fa.co.kr","입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."],"notes":["인텍에프에이는 전력전자와 제어기술을 바탕으로 에너지ㆍ제어솔루션의 새로운 가치를 창출하며","미래 에너지 전환을 책임지는 스마트 전력시스템 선도기업입니다.","신재생에너지 장비(ESS)를 중심으로 PCS 및 전력계통 운영ㆍ제어 시스템 역량을 보유하고 있으며,","자동화기기, 로봇제어기, 환경시스템 분야에서 전력전자ㆍ제어ㆍ통신 기술 기반의","독자적인 Core 기술 경쟁력을 확보하고 있습니다.","한전, LSE, LG전자, 삼성전자, 현대엘리베이터 등 국내외 주요 기업에","산업용 전력변환장치를 안정적으로 공급하여 기술력과 신뢰성을 인정받고 있습니다.","최근에는 전력계통 안정화(FR) 및 장주기 ESS 분야에 역량을 집중하며,","고출력ㆍ고신뢰성 전력변환 기술을 기반으로 에너지 저장 솔루션 사업을 지속적으로 확장하고 있습니다.","인텍에프에이와 함께 지속가능한 미래를 설계하고, 새로운 도약을 준비할 열정적인 인재를 기다립니다."]},"detectedSkills":["Matlab"],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('Matlab')
WHERE j.external_notice_id = 'TEXT-20260713-002';

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-003',
  '글로벌주식회사',
  '기술 운영 지원 Tech Ops Assistant',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-003',
  'DEVOPS',
  '서울 서초구',
  '경력무관',
  '계약직/인턴',
  '대학교졸업(4년)이상',
  '면접 후 결정',
  NULL,
  'SQL, Git, Python, HTML, SaaS, DEVOPS',
  '채용공고 상세
[글로벌주식회사]
기술 운영 지원
Tech Ops Assistant
모집분야
기술 운영 지원 Tech Ops Assistant
📋 주요업무
- ERP 운영 이슈 접수 및 분석
- Python/SQL/HTML 수정
- API 데이터 확인
- SaaS 운영 지원
- 리서치 및 문서화
- 기타 행정 지원
📋 자격요건
• 경력 무관 (신입 지원 가능)
• 대학교졸업(4년)이상, 졸업 예정자 지원가능
- Either exceptionally smart or a tech nerd
- 동종업계 개발 경험 보유
- IT 운영 지원 업무 수행
- 기본 네트워크·서버 이해 있으신 분
- 이슈 트래킹 도구 활용 가능하신 분
- 문서화 및 커뮤니케이션 능력 있으신 분
- 책임감 있게 일정 준수 가능하신 분
📋 우대사항
- 영어 혹은 독어 구사자 혹은 Kanye west 팬
- 해외대 졸업
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
높은 성과와 성장 역량에 따라 정규직 전환 및 핵심 기술 리더 역할로 성장할 수 있는 기회를 제공합니다.
빠른 성장 환경에서 제품 개발 및 회사 운영 전반에 참여할 수 있습니다.
체계적인 온보딩 및 직무 교육을 제공합니다.
성과 기반의 보상 체계를 운영합니다.
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
  '{"taskSummary":["기술 운영 지원 Tech Ops Assistant 포지션은 SQL, Git, Python, HTML, SaaS 기반으로 API 설계 및 개발를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":["SQL","Git","Python","HTML","SaaS"],"possibleTasks":["API 설계 및 개발","데이터 모델링 및 처리","서비스 운영 및 트러블슈팅","웹 프론트엔드 기능 개발","운영 지원 및 문서화"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":3,"archiveFolder":"[글로벌주식회사] 기술운영지원_files","detailFileName":"view-detail.html","extractionMethod":"html-text","images":["it2.webp"],"processedSections":{"tasks":[],"requirements":[],"preferred":[],"workConditions":["고용형태 :","파트","계약직","3개월(정규직 전환 가능),","인턴직","3개월(정규직 전환 가능) ㄷ","급여 :","면접 후 결정","서울 서초구 반포대로14길 71","근무일수/시간 :"],"benefits":["높은 성과와 성장 역량에 따라 정규직 전환 및 핵심 기술 리더 역할로 성장할 수 있는 기회를 제공합니다.","빠른 성장 환경에서 제품 개발 및 회사 운영 전반에 참여할 수 있습니다.","체계적인 온보딩 및 직무 교육을 제공합니다.","성과 기반의 보상 체계를 운영합니다."],"process":["2026-07-09 14시 ~ 채용시","자유양식 이력서,","Cover Letter , Resume, Portfolio (GitHub, website or relevant project)","이력서, 자기소개서, 포트폴리오","사람인 입사지원","서류전형 → 1차면접 → 2차면접 → 최종합격","입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."],"notes":["[글로벌주식회사]","기술 운영 지원","Tech Ops Assistant","모집분야","기술 운영 지원 Tech Ops Assistant","📋 주요업무","ERP 운영 이슈 접수 및 분석","Python/SQL/HTML 수정","API 데이터 확인","SaaS 운영 지원","리서치 및 문서화","기타 행정 지원"]},"detectedSkills":["SQL","Git","Python","HTML","SaaS"],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('SQL', 'Git', 'Python', 'HTML', 'SaaS')
WHERE j.external_notice_id = 'TEXT-20260713-003';

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-004',
  '컨클라우드',
  '[가산디지털단지역/정규직] 웹 개발자 모집',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-004',
  'FULLSTACK',
  '서울 금천구',
  '경력 1~2년 이상',
  '정규직',
  NULL,
  NULL,
  NULL,
  'Spring Boot, Spring, REST API, React, AWS, Python, FULLSTACK, 클라우드 환 경 (아마존, NCP 등 ) 에 서 제품 배포, 운영, 관리, LLM 토큰 사용 최적화 관리 경험, 크 롤링, API 연계 환경 변 화 에 따른 대응 역량 필수',
  'ri] | | | = “ge
~“ | | = | l, =) ast
| Hescit
Hk | 겨 러지 채용
7 Hl — i omnmn7t So
컨 클 라 우 드 는 중소기업 및 스 타 트 업 을 위한
Build / Scale / Value-UP2| 단계별 프 로 젝 트 를 제 공 하는
전문 경영 컨설팅 기 반 의 플랫폼 기 업 입니다.
각 부 문 별 전 문 가 들 과 협 업 하고 있으며,
차 별 화 된 사업 영 역 을 구 축 하여 업계 내 에 서 지 속 적 으로 성 장 하고 있습니다.
저 희 와 함께 더 나은 웹 서 비 스 를 만 들 어 갈 개 발 자 를 모 집 합니다!
다다 O1O
mo HT
플랫폼 유 지 보수 서버 운영 관리 커뮤니케이션
신규 기능 개발 시스템 모니터링 개발 일정 수립
오류 수정 및 개선 DB 관리 및 백업 결과물 검수
콘텐츠 관리 보안 점검 운영 이슈 대응
모 집 대 상
경력 (1~2 년 이상)
기본 기술 스택
ㆍ 백 엔드 java / spring boot
+ ZZE TS / React
+ 파이썬
필수 역량
ㆍ 클라우드 환 경 (아마존, NCP 등 ) 에 서 제품 배포, 운영, 관리
* LLM 토큰 사용 최적화 관리 경험
ㆍ 크 롤링, API 연계 환경 변 화 에 따른 대응 역량 필수
필수 역량
ㆍ 클라우드 환 경 (아마존, NCP 등 ) 에 서 제품 배포, 운영, 관리
> LLM 토큰 사용 최적화 관리 경험
ㆍ 크롤링, ^ 미 연계 환경 변 화 에 따른 대응 역량 필수
우 대 사항
+ BAH 개발 3 년 이상
ㆍ 시 기 반 의 서비스 개발 및 운영 경험
ㆍ 엔터프라이즈 서비스 레 벨 에 서 의 바이브 코 딩 을 활 용 한
(Claude Code, Codex 등) 기 획 부 터 배 포 (보안), 운 영 까 지 의 경험
코 기 으 드 느 지오 oO
컨 클 라 우 드 는 직 원 이 최우선
=
oor
ES & iol
눈치 보지 말고 자유롭게 고 생 한 만큼 성과 보상 급여 외 식대 제공
연차 및 BEAL 지급 성과금 지급 중식 지원
. 222
+
양 A 무겁게 고 향 으로 고 생 한 자 편 히 쉬 어라 、 종류별 간 식 : 음 료 무제한
명 절 선물 지급 여 름 휴가 제공 커피 및 다과 제공
채용 프로세스
01 ) 03 04
서 류 전형 1 차 면접 2 차 면접 최종 합격
(실무진) (대표자) |
KAS 3 개 월 후 정규직 전환 검 토 (업무 평 가 에 따라 수 습 기간 조정 가능)
서류 제출
ㆍ 필 수 제출
- 이력서 (플랫폼 내 형식 가능)
ㅜ 1 ㅋ | A MILD
서류 제출
ㆍ 필 수 제출
- 이력서 (플랫폼 내 형식 가능)
- 자 기 소 개서
+ MEH 제출
- 포트폴리오
근무 장소
서울 금천구 벗 꽃 로 36 길 30, 201 호 ( 가 산 <S 타 워 )
e CU
e
팩 토 리 아울렛 ABTS
2 번 출구 ; 국 민 은행 롯데
팩 토 리 아울렛
가 산 디 지 털 단 지 역 Seen
6 번 출구
이메일 holywater@concloud.co.kr
연락처 010-8706-3352',
  '{"taskSummary":["[가산디지털단지역/정규직] 웹 개발자 모집 포지션은 Spring Boot, Spring, REST API, React, AWS 기반으로 API 설계 및 개발를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":["Spring Boot","Spring","REST API","React","AWS","Python"],"possibleTasks":["API 설계 및 개발","데이터 모델링 및 처리","서비스 운영 및 트러블슈팅","클라우드 배포 및 인프라 운영","웹 프론트엔드 기능 개발"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":4,"archiveFolder":"[컨클라우드] [가산디지털단지역_정규직] 웹 개발자 모집 (경력) _files","detailFileName":"view-detail.html","extractionMethod":"image-ocr","images":[{"file":"2b3554_916f-77a507_recruit.png","width":860,"height":4393}],"processedSections":{"tasks":[],"requirements":["클라우드 환 경 (아마존, NCP 등 ) 에 서 제품 배포, 운영, 관리","LLM 토큰 사용 최적화 관리 경험","크 롤링, API 연계 환경 변 화 에 따른 대응 역량 필수","클라우드 환 경 (아마존, NCP 등 ) 에 서 제품 배포, 운영, 관리","> LLM 토큰 사용 최적화 관리 경험","크롤링, ^ 미 연계 환경 변 화 에 따른 대응 역량 필수","우 대 사항","+ BAH 개발 3 년 이상","시 기 반 의 서비스 개발 및 운영 경험","엔터프라이즈 서비스 레 벨 에 서 의 바이브 코 딩 을 활 용 한","(Claude Code, Codex 등) 기 획 부 터 배 포 (보안), 운 영 까 지 의 경험","코 기 으 드 느 지오 oO"],"preferred":[],"workConditions":["서울 금천구 벗 꽃 로 36 길 30, 201 호 ( 가 산 <S 타 워 )","e CU","팩 토 리 아울렛 ABTS","2 번 출구 ; 국 민 은행 롯데","팩 토 리 아울렛","가 산 디 지 털 단 지 역 Seen","6 번 출구","이메일 holywater@concloud.co.kr","연락처 010-8706-3352"],"benefits":[],"process":["01 ) 03 04","서 류 전형 1 차 면접 2 차 면접 최종 합격","(실무진) (대표자) |","KAS 3 개 월 후 정규직 전환 검 토 (업무 평 가 에 따라 수 습 기간 조정 가능)","서류 제출","필 수 제출","이력서 (플랫폼 내 형식 가능)","ㅜ 1 ㅋ | A MILD","서류 제출","필 수 제출","이력서 (플랫폼 내 형식 가능)","자 기 소 개서"],"notes":["ri] | | | = “ge","~“ | | = | l, =) ast","| Hescit","Hk | 겨 러지 채용","7 Hl — i omnmn7t So","컨 클 라 우 드 는 중소기업 및 스 타 트 업 을 위한","Build / Scale / Value-UP2| 단계별 프 로 젝 트 를 제 공 하는","전문 경영 컨설팅 기 반 의 플랫폼 기 업 입니다.","각 부 문 별 전 문 가 들 과 협 업 하고 있으며,","차 별 화 된 사업 영 역 을 구 축 하여 업계 내 에 서 지 속 적 으로 성 장 하고 있습니다.","저 희 와 함께 더 나은 웹 서 비 스 를 만 들 어 갈 개 발 자 를 모 집 합니다!","다다 O1O"]},"detectedSkills":["Spring Boot","Spring","REST API","React","AWS","Python"],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('Spring Boot', 'Spring', 'REST API', 'React', 'AWS', 'Python')
WHERE j.external_notice_id = 'TEXT-20260713-004';

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-005',
  '한국쓰리엠(주)',
  '[3M] 한국쓰리엠 신입/경력사원 모집 안내',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-005',
  'MULTI',
  '서울/동탄/화성/나주',
  '신입/경력',
  '정규직/계약직',
  '학사 이상',
  '면접 후 결정',
  '2026-08-07 23:59:59',
  'MULTI',
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
영업& 마케팅
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
  '{"taskSummary":["[3M] 한국쓰리엠 신입/경력사원 모집 안내 포지션은 데이터 모델링 및 처리를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":[],"possibleTasks":["데이터 모델링 및 처리","서비스 운영 및 트러블슈팅"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":5,"archiveFolder":"[한국쓰리엠(주)] [3M] 한국쓰리엠 신입_경력사원 모집 안내 _files","detailFileName":"view-detail.html","extractionMethod":"html-text","images":["03_3m02_260130.png","03_3mlogo_260130.png","38_11red_subtitle07_251105.png","38_11red_subtitle01_251105.png","38_11red_subtitle01_251105.png"],"processedSections":{"tasks":[],"requirements":[],"preferred":[],"workConditions":["데이터","엔지니어","데이터 아키텍처·거버넌스","구축 /데이터 통합","디지털 도구와 데이터","파이프라인 운영","학사 이상","경력 2년 이상","화학제조분야 경력자 우대","동탄","Senior","Research"],"benefits":["건강검진,","의료비지원(본인),","각종 경조사 지원,","본인학자금,","업무활동비 지급,","자녀학자금","인센티브제,","장기근속자 포상,","우수사원포상,","퇴직금,","4대 보험","명절선물/귀향비"],"process":["2026년 08월 07일 까지","홈페이지 지원","궁금한 것 있으신가요?","모든 지원자에게 결과를 안내해 드리고 있습니다.","다만, 각 전형별로 합격자에게 우선 연락드리는 점 양해 부탁드립니다.","입사지원서 내 허위사실 기재 시 입사 취소됩니다.","지원서 내 이메일/핸드폰번호로 연락이 되니 정확하게 기재해 주십시오.","채용과정 중에 제출하신 서류에 대한 반환을 청구하실 수 있습니다.","(단, 온라인접수/전자메일로 제출된 경우나, 구인자의 요구없이","자발적으로 제출한 경우에는 제외됩니다.)"],"notes":["3M","은 과학을 활용하여 우리의 일상을 더욱 편리하고 풍요롭게 만듭니다","한국쓰리엠","은 무슨일을 할까?","3M은 100년 이상 지속적으로 성장, 발전해 온 다국적 기업입니다.","지금도 비약적인 발전을 위해 끊임없이 투자하고 있습니다.","3M의 성공과 발전에 함께 하실 재능과 열정을 가진 여러분은 3M의 소중한 자산입니다.","3M의 성장은 여러분에게 성공을 위한 여러 가지 기회를 제공할 것입니다.","3M과 함께 성공을 위한 도전을 하시기 바랍니다.","당사는 우수한 인재 채용을 위해 모집 중입니다. 많은 관심과 지원 바랍니다.","모집","부문"]},"detectedSkills":[],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-006',
  '이데아텍(주)',
  '[신입/경력] 백엔드 개발자 채용',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-006',
  'BACKEND',
  '서울 강남구',
  '신입/경력',
  '정규직',
  NULL,
  '연봉 3,600만원',
  NULL,
  'Spring Boot, Spring, REST API, Docker, Kubernetes, Kafka, BACKEND',
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
1. Enterprise Integration Platform 핵심 개발
•
Enterprise Integration Platform 및 iPaaS 백엔드 핵심 기능 설계·개발
•
Java·Spring 기반 플랫폼 및 백엔드 서비스 개발
•
MQ, Pub/Sub 기반 메시지 아키텍처 설계 및 구현
•
대용량 트래픽 처리를 위한 비동기 처리 구조 설계
•
멀티스레딩 및 동시성 제어 구조 설계·개발
•
다양한 시스템 및 데이터 간 통합·연계 기능 개발
•
플랫폼 API 및 내부 서비스 인터페이스 설계
2. 플랫폼 아키텍처 설계 및 기술 리딩
•
플랫폼 전체 시스템 아키텍처 설계
•
기술 스택 선정 및 주요 기술적 의사결정 주도
•
플랫폼 구조, 개발 표준 및 확장성 설계
•
통합 연계 표준 및 인터페이스 구조 설계
•
SDK 및 내부 프레임워크 설계·개발
•
기존 시스템의 기술 부채 분석 및 구조 개선
•
성능, 확장성, 안정성을 고려한 기술 로드맵 수립
3. PoC 및 제품화 리딩
•
신규 기술 및 기능에 대한 PoC 수행
•
PoC 결과 분석 및 제품화 가능성 검토
•
PoC 산출물의 제품 코드 전환 및 안정화
•
실제 고객 환경을 고려한 기능 고도화
•
성능, 확장성 및 운영 관점의 품질 기준 수립
•
제품 장애와 성능 이슈의 원인 분석 및 개선
4. 코드 품질 및 개발문화 리딩
•
코드 리뷰 및 백엔드 개발 표준 수립
•
테스트 전략 및 소프트웨어 품질 기준 정의
•
공통 모듈 및 재사용 가능한 개발 구조 설계
•
주니어·미들급 개발자 기술 멘토링
•
기술 문서 및 시스템 아키텍처 문서 작성
•
개발팀 및 유관 부서와의 기술 커뮤니케이션
📋 자격요건
• 경력 무관 (신입 지원 가능)
•
대학교졸업(4년)이상, 졸업 예정자 지원가능
•
Java·Spring 기반 백엔드 개발 경력 8년 이상
•
Spring Framework 또는 Spring Boot 기반 서비스 개발 경험
•
메시지 기반 아키텍처인 MQ, Pub/Sub에 대한 실무 경험 또는 높은 이해도
•
멀티스레딩, 비동기 처리 및 동시성 제어 경험
•
시스템 또는 플랫폼 아키텍처 설계 경험
•
기술 스택 선정 및 기술적 의사결정 경험
•
코드 리뷰 및 개발 품질 기준 수립 경험
•
REST API 및 백엔드 서비스 설계·개발 경험
•
복잡한 시스템 구조를 논리적으로 설명할 수 있는 커뮤니케이션 역량
•
기술 문제를 분석하고 개선방안을 주도적으로 제시할 수 있는 분
📋 우대사항
•
Spring Integration 실무 경험
•
Apache NiFi 또는 Kafka 기반 시스템 개발 경험
•
iPaaS, EAI, ESB 또는 미들웨어 개발 경험
•
데이터 파이프라인 및 시스템 통합·연계 구조 설계 경험
•
SDK, API 플랫폼 또는 플랫폼 제품 개발 경험
•
대용량 트래픽 처리 시스템 개발 경험
•
고가용성 및 분산 시스템 아키텍처 설계 경험
•
CI/CD 환경 구축 및 운영 경험
•
Docker 및 Kubernetes 기반 개발·운영 경험
•
클라우드 또는 컨테이너 기반 서비스 개발 경험
•
기술 문서 및 아키텍처 설계 문서 작성 경험
•
테크리드, 개발리드 또는 시스템 아키텍트 경험
•
PoC부터 상용 제품 출시까지 전 과정을 경험한 분
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
  '{"taskSummary":["[신입/경력] 백엔드 개발자 채용 포지션은 Spring Boot, Spring, REST API, Docker, Kubernetes 기반으로 API 설계 및 개발를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":["Spring Boot","Spring","REST API","Docker","Kubernetes","Kafka"],"possibleTasks":["API 설계 및 개발","데이터 모델링 및 처리","서비스 운영 및 트러블슈팅","클라우드 배포 및 인프라 운영","운영 지원 및 문서화"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":6,"archiveFolder":"[이데아텍(주)] [신입_경력] 백엔드 개발자 채용 (D-6) - 사람인_files","detailFileName":"view-detail.html","extractionMethod":"html-text","images":["it2.webp"],"processedSections":{"tasks":[],"requirements":[],"preferred":[],"workConditions":["서울 서초구 서운로6길 21-6","🎁 복지 및 혜택"],"benefits":["리프레시 : 연차, 여름휴가, 경조휴가제, 반차, Refresh휴가, 포상휴가, 공휴일 휴무, 산전 후 휴가, 육아휴직, 남성출산휴가","조직 문화 : 수평적 조직문화, 회식강요 안함, 야근강요 안함, 자유복장, 자유로운 연차사용, 출산 장려","🚀 채용절차"],"process":["2026-06-16 13시 ~ 2026-07-16 24시","사람인 온라인 이력서","사람인 입사지원","서류전형 → 1차면접 → 2차면접 → 최종합격","🛎️ 유의사항","입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."],"notes":["[신입/경력]","백엔드 개발자 채용","모집분야","백엔드 개발자","Enterprise Integration Platform 및 iPaaS의 핵심 기능과 아키텍처를 설계·개발하는 시니어 포지션입니다.","단순 기능 구현을 넘어 기술 방향, 플랫폼 구조, 개발 표준 및 제품화를 주도합니다.","경력과 역량에 따라","Senior Backend Developer, Tech Lead, Principal Engineer, Software Architect, Platform Architect","로 성장할 수 있습니다.","📋 주요업무","1. Enterprise Integration Platform 핵심 개발","Enterprise Integration Platform 및 iPaaS 백엔드 핵심 기능 설계·개발"]},"detectedSkills":["Spring Boot","Spring","REST API","Docker","Kubernetes","Kafka"],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('Spring Boot', 'Spring', 'REST API', 'Docker', 'Kubernetes', 'Kafka')
WHERE j.external_notice_id = 'TEXT-20260713-006';

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-007',
  '(주)무브먼츠',
  '서버/백엔드 개발자 채용(주니어 신입~4년이하)',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-007',
  'BACKEND',
  '서울 강남구',
  '신입/경력 1~4년',
  '정규직',
  '대학교졸업(4년)이상',
  '연봉 3,600만원',
  NULL,
  'Spring Boot, Spring, REST API, JPA, SQL, AWS, Docker, Kotlin, BACKEND',
  '채용공고 상세
서버/백엔드 개발자 채용(주니어 신입~4년이하)
모집분야
서버개발자
📋 주요업무
• GIS솔루션 개발 유지 및 보수
• 신규 솔루션 서버 개발
📋 자격요건
• 신입 / 경력 1년 이상 ~ 4년 이하
• 대학교졸업(4년)이상
-Kotlin + Spring Boot 기반 백엔드 개발 및 운영 경험이 있으신 분
-실서비스를 개발하고 운영해본 경험이 있으신 분
-REST API 설계 및 개발 경험이 있으신 분
-JPA, Querydsl, SQL 등 데이터 처리에 익숙하신 분
-AWS 등 클라우드 환경에서 서비스를 운영해본 경험이 있으신 분
-서비스 운영 환경에서 예외 처리, 성능, 장애 대응을 경험해보신 분
-협업 과정에서 요구사항을 정리하고 책임감 있게 실행할 수 있는 분
-AI 도구를 활용해 개발 생산성을 높여본 경험이 있으신 분
📋 우대사항
-GIS 및 공간정보 데이터에 대한 이해 또는 관련 서비스 개발 경험
-대용량 데이터, 동시성, 트랜잭션 처리에 대한 이해
-Docker, CI/CD, 모니터링 환경 구축 또는 운영 경험
-모바일 앱 백엔드 또는 B2B/B2G 서비스 경험
-위치 기반 서비스, 공간 데이터 처리, 측량/지도 연동 경험
-AI를 활용한 코드 리뷰, 테스트 작성, 장애 분석, 반복 작업 자동화 경험
-LLM/AI 기능을 제품이나 운영 프로세스에 접목해본 경험
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
• 10월 중순 경 신논현(혹은 신사역)으로 사무실 이전 계획이 있습니다. 지원시 참고 부탁드립니다.
• 신입 기준 연봉 3,600만원이며, 경력에 따라 협의.
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.',
  '{"taskSummary":["서버/백엔드 개발자 채용(주니어 신입~4년이하) 포지션은 Spring Boot, Spring, REST API, JPA, SQL 기반으로 API 설계 및 개발를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":["Spring Boot","Spring","REST API","JPA","SQL","AWS","Docker","Kotlin"],"possibleTasks":["API 설계 및 개발","데이터 모델링 및 처리","서비스 운영 및 트러블슈팅","클라우드 배포 및 인프라 운영"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":7,"archiveFolder":"[(주)무브먼츠] 서버_백엔드 개발자 채용(주니어 신입~4년이하) (채용시 마감) - 사람인_files","detailFileName":"view-detail.html","extractionMethod":"html-text","images":["it3.webp"],"processedSections":{"tasks":[],"requirements":[],"preferred":[],"workConditions":["서울 강남구 테헤란로 151 역삼하이츠빌딩","근무일수/시간 :","🎁 복지 및 혜택","🚀 채용절차"],"benefits":[],"process":["2026-07-06 12시 ~ 채용시","사람인 온라인 이력서","사람인 입사지원","서류전형 → 1차면접 → 2차면접 → 최종합격","🛎️ 유의사항","10월 중순 경 신논현(혹은 신사역)으로 사무실 이전 계획이 있습니다. 지원시 참고 부탁드립니다.","신입 기준 연봉 3,600만원이며, 경력에 따라 협의.","입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."],"notes":["서버/백엔드 개발자 채용(주니어 신입~4년이하)","모집분야","서버개발자","📋 주요업무","GIS솔루션 개발 유지 및 보수","신규 솔루션 서버 개발","📋 자격요건","신입 / 경력 1년 이상 ~ 4년 이하","대학교졸업(4년)이상","Kotlin + Spring Boot 기반 백엔드 개발 및 운영 경험이 있으신 분","실서비스를 개발하고 운영해본 경험이 있으신 분","REST API 설계 및 개발 경험이 있으신 분"]},"detectedSkills":["Spring Boot","Spring","REST API","JPA","SQL","AWS","Docker","Kotlin"],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('Spring Boot', 'Spring', 'REST API', 'JPA', 'SQL', 'AWS', 'Docker', 'Kotlin')
WHERE j.external_notice_id = 'TEXT-20260713-007';

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-008',
  '(주)마크베이스',
  'Machbase 백엔드 개발자 모집 신입/경력',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-008',
  'BACKEND',
  '서울 구로구',
  '신입/경력 2~7년',
  '정규직',
  '초대졸 이상',
  '면접 후 결정',
  NULL,
  'Node.js, AWS, Go, HTML, BACKEND, 클라우드 서비스 백엔드 개발 (신입/경력), 백엔드개발 지원자격, Java / Go 언어중 한 가지 이상 자신있게 사용 가능하신 분, 시스템 프로그래밍 / 네트워크 프로그래밍 지식을 보유하신분, 학력 : 초대졸 이상, 나이/성별 : 무관, 백엔드, 경력 2년이상 7년이하, golang 경력자, node.js 사용이 가능한 사람, WEB/APP 서비스 개발 경험, 클라우드 환경 개발 경험, AWS 사용 및 프로젝트 경험',
  '채용공고 상세
백엔드개발 신입/경력 모집
(주)마크베이스
는 산업 loT 데이터처리를 위한 시계열 DBMS를 만들고 있는 소프트웨어 전문기업으로 현재 loT 데이터베이스 표준으로 TPC에 의해 선정되었으며,
세계 성능랭킹 Top 1, 2, 3위
를 기록하고 있는 차세대 혁신 벤처기업입니다.
마크베이스는 이런 회사 입니다.
☞ 2026
.04
마크베이스, AI 실행형 DBMS "Machbase NEO V8.5" 출시
☞ 2025.11 "마크베이스-LS ELECTRIC, 전략적 제휴를 위한 MOU 체결
☞ 2024.04 "마크베이스 네오" 조달청 디지털 서비스몰 등록
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
"마크베이스, 차세대 데이터 플랫폼 NEO V8.5 출시 (전자신문 / 2026.04.27일자)
(https://www.etnews.com/20260427000260)
효율적인 업무를 위한 근무 환경
▶
업무는 장비빨! 최고 성능의 컴퓨터와 듀얼 모니터 지급
▶ 365일, 24시간 동안 돌아가는 공기청정기로 쾌적한 업무환경을 제공
▶ 동전 없이도 가능한 게임기, 업무로 인한 스트레스 해소~
▶ 언제든 편히 쉴 수 있는 안마의자 제공
▶ 직무에 도움이 되는 서적 제공
▶ 지하철2호선 구로디지털역에서 도보 7분 거리로 편리한 출퇴근이 가능
▶ 신규 입사자에게 welcome kit 제공
아낌없이 주는 포상 및 지원 제도
▶ 입사시 점심회식을 통해 축하파티 제공
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
- 클라우드 환경 개발 경험, AWS 사용 및 프로젝트 경험
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
  '{"taskSummary":["Machbase 백엔드 개발자 모집 신입/경력 포지션은 Node.js, AWS, Go, HTML 기반으로 데이터 모델링 및 처리를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":["Node.js","AWS","Go","HTML"],"possibleTasks":["데이터 모델링 및 처리","서비스 운영 및 트러블슈팅","클라우드 배포 및 인프라 운영","웹 프론트엔드 기능 개발"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":8,"archiveFolder":"[(주)마크베이스] Machbase 백엔드 개발자 모집 신입_경력 (D-5) - 사람인_files","detailFileName":"view-detail.html","extractionMethod":"html-text","images":[],"processedSections":{"tasks":["클라우드 서비스 백엔드 개발 (신입/경력)","백엔드개발 지원자격","Java / Go 언어중 한 가지 이상 자신있게 사용 가능하신 분","시스템 프로그래밍 / 네트워크 프로그래밍 지식을 보유하신분"],"requirements":["학력 : 초대졸 이상","나이/성별 : 무관","백엔드","경력 2년이상 7년이하","신입 지원가능"],"preferred":["golang 경력자","node.js 사용이 가능한 사람","WEB/APP 서비스 개발 경험","클라우드 환경 개발 경험, AWS 사용 및 프로젝트 경험","하나의 기술에 얽매여 있지 않고 새로운 기술 습득에 거부감이 없으신 분"],"workConditions":["근무형태","정규직(수습기간)-","3개월","근무일시","주 5일(월~금) 09:30 ~ 18:30","(08380) 서울 구로구 디지털로33길11 에이스테크노타워8차 501호"],"benefits":["입사시 점심회식을 통해 축하파티 제공","행복은 두배로, 슬픔은 반으로 줄여주는 탄탄한 경조휴가와 경조금을 지원","생일 축하합니다! 생일날 생일케이크와 열렬한 축하","종합건강검진 지원으로 임직원의 건강 지킴이","4대보험 제공, 임직원의 안정적인 회사생활을 보장","갈 땐 가더라도 받고 가세요! 퇴직금 제공","장기근속자에게 포상, 장기 근속할수록 점점 늘어나는 혜택","우수직원에게는 특별한 혜택을 제공","자유로운 연차사용, 휴식권을 보장해드립니다","복장에 제한을 두지 않아, 편한 복장으로 출근 가능","업무에 관련하여 자유롭게 어필 할 수 있는 분위기","대체 공휴일, 법정 공휴일에는 당연히 쉽니다!"],"process":["서류전형","1차면접","2차면접","최종합격","채용시 마감","사람인 입사지원 또는 담당자 이메일 접수","이력서양식","사람인 온라인 이력서 또는 자유양식","학력, 성별, 연령을 보지않는 블라인드 채용입니다.","입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.","모집분야별로 마감일이 상이할 수 있으니 유의하시길 바랍니다."],"notes":["백엔드개발 신입/경력 모집","(주)마크베이스","는 산업 loT 데이터처리를 위한 시계열 DBMS를 만들고 있는 소프트웨어 전문기업으로 현재 loT 데이터베이스 표준으로 TPC에 의해 선정되었으며,","세계 성능랭킹 Top 1, 2, 3위","를 기록하고 있는 차세대 혁신 벤처기업입니다.","마크베이스는 이런 회사 입니다.","2026",".04","마크베이스, AI 실행형 DBMS \\"Machbase NEO V8.5\\" 출시","2025.11 \\"마크베이스-LS ELECTRIC, 전략적 제휴를 위한 MOU 체결","2024.04 \\"마크베이스 네오\\" 조달청 디지털 서비스몰 등록","2023.12 시계열 DBMS \\"마크베이스 네오 V8\\" GS 인증 1등급 획득"]},"detectedSkills":["Node.js","AWS","Go","HTML"],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('Node.js', 'AWS', 'Go', 'HTML')
WHERE j.external_notice_id = 'TEXT-20260713-008';

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-009',
  '(주)아랑소프트',
  'SI개발/웹개발/백엔드 서버개발 정규직 채용',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-009',
  'BACKEND',
  '서울 구로구',
  '신입',
  '정규직/프리랜서',
  '학력무관',
  '면접 후 결정',
  '2026-07-30 23:59:59',
  'BACKEND',
  '채용공고 상세
[아랑소프트]SI개발&웹개발&백엔드/서버개발 외 정규직 채용
모집분야
정규직 Web Programmer 채용
(5명)
📋 주요업무
• 소프트웨어 개발 및 운영
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
  '{"taskSummary":["SI개발/웹개발/백엔드 서버개발 정규직 채용 포지션은 서비스 운영 및 트러블슈팅를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":[],"possibleTasks":["서비스 운영 및 트러블슈팅"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":9,"archiveFolder":"[(주)아랑소프트] [아랑소프트]SI개발&웹개발&백엔드_서버개발 외 정규직 채용 _files","detailFileName":"view-detail.html","extractionMethod":"html-text","images":["blank.png"],"processedSections":{"tasks":[],"requirements":[],"preferred":[],"workConditions":["서울 구로구 디지털로 242, 한화비즈메트로 1차 1005호","근무요일/시간 : 09:00~18:00","🎁 복지 및 혜택","🚀 채용절차"],"benefits":[],"process":["2026-06-30 13시 ~ 2026-07-30 24시","사람인 온라인 이력서","사람인 입사지원","서류전형 → 기술테스트 → 기술면접 및 인성면접 → 최종합격","🛎️ 유의사항","입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.","모집분야별로 마감일이 상이할 수 있으니 유의하시길 바랍니다."],"notes":["[아랑소프트]SI개발&웹개발&백엔드/서버개발 외 정규직 채용","모집분야","정규직 Web Programmer 채용","(5명)","📋 주요업무","소프트웨어 개발 및 운영","개발팀 부서 소속으로 함께할 예정이에요.","📋 자격요건","신입","학력무관","🏠 근무조건","고용형태 :"]},"detectedSkills":[],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-010',
  '(주)퍼스트밸류',
  '핀테크 스타트업 Java 서버/백엔드 개발자 채용',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-010',
  'BACKEND',
  NULL,
  '경력 1년 이상',
  '정규직',
  '전문학사 이상',
  NULL,
  NULL,
  'Spring Boot, Spring, JavaScript, MySQL, MariaDB, Docker, Linux, HTML, CSS, C, BACKEND',
  '| |
x= Ker Q www irstvaluecorp.com C= |
Java 백엔 =
|
— 개발자 Ki ¢ ) ~
로 o $$
퍼 스 트 밸 류 에 서 열 정 적 인 인 재 를 기 다 립니다.
x WASHES | 는
때
이 런 일 을 합 니다 &
느 르르 버 ai
공 급 망 금 융 (5) 핀 테 크 기업
퍼 스 트 밸 류 는 공급망 금 융 (Supply-Chain Finance; SF) 과 IT 기 술 을 통해
기존 금융 서 비 스 와는 다른 새로운 자 금 조달 솔 루 션 을 제 공 하는 핀 테크 기 업 입니다.
자 금 의 흐 름 과 데이터 SMS 통해 기존 금융 서 비 스 에 개 소외 대 상 이었던 중 소 상 공 인 에게
보다 쉽고 간편한 직접 자금 조달 SSMS 제 공 합니다.
퍼 스 트 밸 류 의 기 업 비 전
금융 소외 계 층 인 @ 커 머스 플랫폼 판 매 자 들은
담 보 력 부 쪽 과 신용 등급 제한 등 으로 인해 금융 기관 대 출 을 받기 어려운 경 우 가 많습니다.
이에 우 리 는 온 라 인 을 기 반 으로 초기 소 상 공 인 부터 중 소 기 업 까지 안정적인 자금 유동화
서 비 스 를 제 공 하며 새로운 자금 조달 창 구 로서의 역 할 을 하고자 합니다.
주 요 연혁
2026.04 -BNK Bt{24! CHAIN-G 3 기 최 종 선정
하 나 금 융 696 더 블 임팩트 매 칭 펀드 선정
2025.12 ㆍ 핀 버 서비스 누적 지급액 114 억 달성
2025.08 ㆍ 핀 버 정 식 서 비 스 론칭
2025.05 ㆍ 경 기 콘 텐 츠 진흥원 NRP 기 업 육성 프로그램 최종 선정
2025.04 ㆍ 중 소 기 업 벤 처 기 업 부 혁 신 성장형 벤 처 기 업 인 증
창 업 진흥원 주관 2025 초 기 창 업 패 키지 최 종 선정
2025.03 ㆍ ( 쥐 퍼 스 트 밸 류 기 업 부 설 연 구 소 설 립
ㆍ 기 술 보 증 기금 주관 기술력 우 수 기업 Kibo-Starwel 선정
2025.04 . 중 소 기 업 벤 처 기 업 부 혁 신 성장형 벤 처 기 업 인 증
ARIES! 주관 2025 초 기 창 업 패키지 최 종 선정
2025.03 ㆍ ( 쥐 퍼 스 트 밸 류 기 업 부설 연구소 설립
- 기 술 보 증 기금 주관 기술력 우 수 기업 Kibo-Starwlel 선정
모 집 내용
모 집 분야 자 격 요건
107 부 개 발 팀 팀 원 - 전 문 학 사 이 상 졸 업자
Java 서 버 / 백 엔드 개발자 - Java Ht B24 1A 이상
RED 연 구 원 겸 직 가 능 인력
- Spring Ee Spring Boot 개 발 경험
MySQL, MariaDB & DB 사 용 경험
+ Java 기반 서버 및 백 엔 드 개발 + HTML, CSS, JavaScript 기본 이해
- 핀 버 (6166) 서비스 기능 개발 및 유 지 보수 -6t 사 용 경험
-^ 미 개 발 및 외 부 시스템 연동
- 관 리 자 페 이지 및 내부 운영 시스템 개발
- 간 단 한 화 면 수정 및 퍼블리싱 업무
- 기 업 부 설 연구소 RED 과제 및 기술 고도화 업무 참여
우 대 사항 근 무 조건
. 컴 퓨 터 공학, 소 프 트 웨 어 공학, 정 보 통 신 공 학 , 근 무 부서 107 부
데 이 터 / 시 등 관 련 학 과 전공자 직 급 / 직 책 팀원
HELE, 금융, 결제 정산 이 커 머스 서비스 개발 경험자 경력 1 년 이상
- 웹 크롤링 또는 스 크 래 핑 개발 경험자 학력 전 문 학 사 이상
- Docker ££ Container Service AKS Ei 근무지 퍼 스 트 밸 류 본사
-4 미 연 동 및 백 오 피 스 개 발 경험자
+ Linux Mb 흰 경 에 대 한 기본 이 해 가 있 는 분
- 기 업 부 설 연구소 또는 정부 RED 과제 참여 경험자
- 서 버 개 발 과 간 단 한 퍼 블 리 싱 을 함께 수행 가능한 분
우 리 는 직 원 의 가
복 리 후생 도 중 요 해 요
ae. "
지 원 & 휴 가 제 공 Sy 선 물 & 조 기 퇴근 ce
요 여 그 무제 식 ㅅ 가 시 저
x ae at
각 종 경 조사 (73 생 일 자 y
지 원 & 휴 가 제 공 wy 선 물 & 조 기 퇴근 wi
유 연 근 무 제 실 시 간 식 제공
(9 시 ~10 시 자 율 출 근 ) (자유롭게 구매)
© ne
음 료 제공 + >. 장 기 근속 <
eX) ue + Bs
명절 자유로운
선 물 & 귀 향 비 술 근 복 장
oe
자유로운 <4 퇴직금 |
연 차 시용 ani 연 차 수 당 지 급 4 €
함께하는 | 식 /0 븐
스 트 밸류 | Ol 함께
핀 테 크 의 미 래 를 만 늘 어 보세
핀 테 크 의 미 래 를 만 들 어 보 세요
퍼 스 트 밸 류 는 BH (Finbe)S 중 심 으로 정산 데이터 기반 핀 테크 서 비 스 를 운 영 하 고 있으며,
관련 기술 고 도 화 를 위한 REDE 함께 추진하고 있습니다. Java 서 버 / 백 엔드 개 발 을 중 심 으 로
실제 서비스 개 발 과 연 구 개발 업 무 를 함께 경 험 하고 싶은 분 들 의 많은 지 원 을 바랍니다.',
  '{"taskSummary":["핀테크 스타트업 Java 서버/백엔드 개발자 채용 포지션은 Spring Boot, Spring, JavaScript, MySQL, MariaDB 기반으로 데이터 모델링 및 처리를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":["Spring Boot","Spring","JavaScript","MySQL","MariaDB","Docker","Linux","HTML","CSS","C"],"possibleTasks":["데이터 모델링 및 처리","서비스 운영 및 트러블슈팅","클라우드 배포 및 인프라 운영","웹 프론트엔드 기능 개발"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":10,"archiveFolder":"[(주)퍼스트밸류] 핀테크 스타트업] Java 서버_백엔드 개발자 채용 (채용시 마감) - 사람인_files","detailFileName":"view-detail.html","extractionMethod":"image-ocr","images":[{"file":"0e869c_6e4a-b316e4_recruit.jpg","width":860,"height":4636}],"processedSections":{"tasks":[],"requirements":[],"preferred":[],"workConditions":[],"benefits":[],"process":[],"notes":["| |","x= Ker Q www irstvaluecorp.com C= |","Java 백엔 =","— 개발자 Ki ¢ ) ~","로 o $$","퍼 스 트 밸 류 에 서 열 정 적 인 인 재 를 기 다 립니다.","x WASHES | 는","이 런 일 을 합 니다 &","느 르르 버 ai","공 급 망 금 융 (5) 핀 테 크 기업","퍼 스 트 밸 류 는 공급망 금 융 (Supply-Chain Finance; SF) 과 IT 기 술 을 통해","기존 금융 서 비 스 와는 다른 새로운 자 금 조달 솔 루 션 을 제 공 하는 핀 테크 기 업 입니다."]},"detectedSkills":["Spring Boot","Spring","JavaScript","MySQL","MariaDB","Docker","Linux","HTML","CSS","C"],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('Spring Boot', 'Spring', 'JavaScript', 'MySQL', 'MariaDB', 'Docker', 'Linux', 'HTML', 'CSS', 'C')
WHERE j.external_notice_id = 'TEXT-20260713-010';

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-011',
  '(주)로브로스',
  'Backend Engineer',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-011',
  'BACKEND',
  '서울 성동구',
  '경력 2년 이상',
  '정규직',
  NULL,
  NULL,
  '2026-08-06 23:59:59',
  'TypeScript, REST API, Node.js, React, AWS, Docker, Linux, Git, C++, C, BACKEND, 수행합니다., 백엔드 시스템 설계·개발, Node.js(TypeScript) 기반 로봇 운영 웹 플랫폼의 백엔드 아키텍처 설계 및 구현, REST API, WebSocket 등 서비스 인터페이스 설계 및 개발, 백엔드 개발 실무 경력 2년 이상 또는 그에 준하는 역량, Node.js, TypeScript 기반 서버 개발 경험, 서버 애플리케이션 설계 및 개발 역량 (REST API, WebSocket 등), Linux 환경에서의 개발 및 운영 경험, NestJS 등 Node.js 서버 프레임워크 실무 경험, React 기반 프론트엔드 개발 실무 경험, C++ 등 시스템 프로그래밍 언어 기반 백엔드 개발 경험, 실시간 데이터 스트리밍 또는 대용량 데이터 처리 시스템 개발 경험',
  '채용공고 상세
로브로스를 소개합니다.
로브로스는 인공지능 기반 휴머노이드를 개발하며 빠르게 성장하고 있는 기술 중심 기업입니다.
실제 로봇에서 안정적으로 동작하도록 만드는 로봇 제어 전문가를 찾고 있습니다.
본 포지션은 로봇 운영 웹 플랫폼의 백엔드 시스템을 설계·구현하고,
로봇에서 발생하는 데이터의 수집·처리부터 소프트웨어 배포·운영 기능까지,
로봇 제품을 서비스로 완성하는 핵심 역할을 담당합니다.
백엔드를 중심으로 하되, 필요에 따라 웹 프론트엔드 기능 개발에도 함께 참여합니다.
함께 할 직무, 지금
모집 중
입니다!
[소프트웨어팀] Backend Engineer
이런 업무를
수행합니다.
백엔드 시스템 설계·개발
ㆍNode.js(TypeScript) 기반 로봇 운영 웹 플랫폼의 백엔드 아키텍처 설계 및 구현
ㆍREST API, WebSocket 등 서비스 인터페이스 설계 및 개발
ㆍ로봇 온보드 소프트웨어와 상위 서비스 간 연동 구조 개발
ㆍ인증·권한 관리 등 서비스 공통 기능 개발
데이터 수집·처리 시스템 개발
ㆍ로봇 상태·로그·텔레메트리 데이터의 수집 및 처리 파이프라인 구축
ㆍ실시간 데이터 스트리밍 및 다중 로봇 모니터링 시스템 개발
ㆍ데이터 저장·조회 구조 설계 및 성능 최적화
서비스 인프라 연동 및 운영
ㆍ사내 인프라(NAS 등) 및 클라우드 스토리지 연동 시스템 개발
ㆍ소프트웨어 업데이트(OTA) 등 원격 배포·운영 기능 설계 및 구현
ㆍ서비스 품질 확보를 위한 로깅·진단 기능 개발 및 개선
웹 프론트엔드 개발 참여
ㆍ로봇 운영 웹 플랫폼의 프론트엔드(React 기반) 기능 개발 및 개선
ㆍ모니터링 대시보드 등 백엔드 기능과 연계된 UI 개발
이런 분들을
찾고 있어요.
ㆍ백엔드 개발 실무 경력 2년 이상 또는 그에 준하는 역량
ㆍNode.js, TypeScript 기반 서버 개발 경험
ㆍ서버 애플리케이션 설계 및 개발 역량 (REST API, WebSocket 등)
ㆍLinux 환경에서의 개발 및 운영 경험
ㆍ데이터베이스 설계 및 활용 능력
ㆍ웹 프론트엔드 개발에 대한 이해 또는 개발 경험
ㆍ협업 및 커뮤니케이션 역량 (Git 등 협업 툴 사용, 다양한 직군과의 기술적 협업)
이런 경험이
있으시면
더욱 좋아요.
ㆍNestJS 등 Node.js 서버 프레임워크 실무 경험
ㆍReact 기반 프론트엔드 개발 실무 경험
ㆍC++ 등 시스템 프로그래밍 언어 기반 백엔드 개발 경험
ㆍ실시간 데이터 스트리밍 또는 대용량 데이터 처리 시스템 개발 경험
ㆍ온프레미스 인프라(NAS 등) 또는 AWS 등 클라우드 환경 연동 개발 경험
ㆍ소프트웨어 배포·업데이트 시스템(OTA 등) 설계·운영 경험
ㆍDocker 등 컨테이너 기반 개발·배포 환경 경험
ㆍ로봇, IoT 등 하드웨어 연동 서비스 개발 경험
우리는 이렇게
근무
해요.
근무조건
ㆍ고용 형태 : 정규직 (수습기한 3개월)
ㆍ근무지 주소 : 서울특별시 성동구 연무장5가길 25, 605호
우리의
전형절차
를 확인해주세요.
우리의
접수방법 및 기간
을 확인하세요.
접수방법 및 기간
접수기간
2026년 08월 06일 마감
접수방법
사람인 온라인 입사지원
꼭 확인해주세요!
ㆍ입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.',
  '{"taskSummary":["Backend Engineer 포지션은 TypeScript, REST API, Node.js, React, AWS 기반으로 API 설계 및 개발를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":["TypeScript","REST API","Node.js","React","AWS","Docker","Linux","Git","C++","C"],"possibleTasks":["API 설계 및 개발","데이터 모델링 및 처리","서비스 운영 및 트러블슈팅","클라우드 배포 및 인프라 운영","웹 프론트엔드 기능 개발"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":11,"archiveFolder":"[(주)로브로스] Backend Engineer (D-27) - 사람인_files","detailFileName":"view-detail.html","extractionMethod":"html-text","images":["03_B05_toptextbg06_250203.png","05_robros_title_260708.png","06_robros_step_260619.png","03_a_2_day_250103.gif","watermark_match_basic.png"],"processedSections":{"tasks":["수행합니다.","백엔드 시스템 설계·개발","Node.js(TypeScript) 기반 로봇 운영 웹 플랫폼의 백엔드 아키텍처 설계 및 구현","REST API, WebSocket 등 서비스 인터페이스 설계 및 개발","로봇 온보드 소프트웨어와 상위 서비스 간 연동 구조 개발","인증·권한 관리 등 서비스 공통 기능 개발","데이터 수집·처리 시스템 개발","로봇 상태·로그·텔레메트리 데이터의 수집 및 처리 파이프라인 구축","실시간 데이터 스트리밍 및 다중 로봇 모니터링 시스템 개발","데이터 저장·조회 구조 설계 및 성능 최적화","서비스 인프라 연동 및 운영","사내 인프라(NAS 등) 및 클라우드 스토리지 연동 시스템 개발"],"requirements":["백엔드 개발 실무 경력 2년 이상 또는 그에 준하는 역량","Node.js, TypeScript 기반 서버 개발 경험","서버 애플리케이션 설계 및 개발 역량 (REST API, WebSocket 등)","Linux 환경에서의 개발 및 운영 경험","데이터베이스 설계 및 활용 능력","웹 프론트엔드 개발에 대한 이해 또는 개발 경험","협업 및 커뮤니케이션 역량 (Git 등 협업 툴 사용, 다양한 직군과의 기술적 협업)","이런 경험이","있으시면"],"preferred":["NestJS 등 Node.js 서버 프레임워크 실무 경험","React 기반 프론트엔드 개발 실무 경험","C++ 등 시스템 프로그래밍 언어 기반 백엔드 개발 경험","실시간 데이터 스트리밍 또는 대용량 데이터 처리 시스템 개발 경험","온프레미스 인프라(NAS 등) 또는 AWS 등 클라우드 환경 연동 개발 경험","소프트웨어 배포·업데이트 시스템(OTA 등) 설계·운영 경험","Docker 등 컨테이너 기반 개발·배포 환경 경험","로봇, IoT 등 하드웨어 연동 서비스 개발 경험","우리는 이렇게","근무","해요."],"workConditions":["고용 형태 : 정규직 (수습기한 3개월)","우리의"],"benefits":[],"process":["를 확인해주세요.","우리의","을 확인하세요.","2026년 08월 06일 마감","사람인 온라인 입사지원","꼭 확인해주세요!","입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."],"notes":["로브로스를 소개합니다.","로브로스는 인공지능 기반 휴머노이드를 개발하며 빠르게 성장하고 있는 기술 중심 기업입니다.","실제 로봇에서 안정적으로 동작하도록 만드는 로봇 제어 전문가를 찾고 있습니다.","본 포지션은 로봇 운영 웹 플랫폼의 백엔드 시스템을 설계·구현하고,","로봇에서 발생하는 데이터의 수집·처리부터 소프트웨어 배포·운영 기능까지,","로봇 제품을 서비스로 완성하는 핵심 역할을 담당합니다.","백엔드를 중심으로 하되, 필요에 따라 웹 프론트엔드 기능 개발에도 함께 참여합니다.","함께 할 직무, 지금","모집 중","입니다!","[소프트웨어팀] Backend Engineer"]},"detectedSkills":["TypeScript","REST API","Node.js","React","AWS","Docker","Linux","Git","C++","C"],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('TypeScript', 'REST API', 'Node.js', 'React', 'AWS', 'Docker', 'Linux', 'Git', 'C++', 'C')
WHERE j.external_notice_id = 'TEXT-20260713-011';

INSERT INTO job_notices (
  external_notice_id, company_name, title, source_url, job_category, location_text,
  experience_level, employment_type, education_level, salary_text, deadline_at,
  role_keywords_text, description_raw, ai_analysis_json, raw_payload, fetched_at, is_active
) VALUES (
  'TEXT-20260713-012',
  '(주)크리스천메이트',
  '풀스택 개발자 채용',
  'https://www.saramin.co.kr/zf_user/jobs/view?sample=TEXT-20260713-012',
  'FULLSTACK',
  '서울 강남구/서초구/송파구',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'JavaScript, TypeScript, REST API, Node.js, React, Django, Flask, HTML, CSS, FULLSTACK',
  '채용공고 상세
(주)크리스천메이트 | 풀스택 개발자 채용
웨딩·장례·이벤트 > 결혼정보회사
IT개발·데이터 > 직무·직업 > 백엔드/서버개발
IT개발·데이터 > 직무·직업 > 프론트엔드
IT개발·데이터 > 전문분야 > 반응형웹
IT개발·데이터 > 전문분야 > API
IT개발·데이터 > 기술스택 > 풀스택
IT개발·데이터 > 기술스택 > Angular
IT개발·데이터 > 기술스택 > CSS
IT개발·데이터 > 기술스택 > Django
IT개발·데이터 > 기술스택 > Flask
IT개발·데이터 > 기술스택 > HTML
IT개발·데이터 > 기술스택 > Javascript
IT개발·데이터 > 기술스택 > Node.js
IT개발·데이터 > 기술스택 > React
IT개발·데이터 > 기술스택 > RestAPI
IT개발·데이터 > 기술스택 > TypeScript
(06233) 서울 강남구 테헤란로 120, 12층(역삼동,상경빌딩)
서울 > 강남구, 서울 > 서초구, 서울 > 송파구',
  '{"taskSummary":["풀스택 개발자 채용 포지션은 JavaScript, TypeScript, REST API, Node.js, React 기반으로 API 설계 및 개발를 담당할 가능성이 높습니다.","공고 원문에서 추출한 담당업무, 자격요건, 우대사항, 복리후생 정보를 함께 저장해 상세 분석과 이력서 비교에 활용할 수 있습니다."],"requiredSkills":["JavaScript","TypeScript","REST API","Node.js","React","Django","Flask","HTML","CSS"],"possibleTasks":["API 설계 및 개발","데이터 모델링 및 처리","웹 프론트엔드 기능 개발"],"source":"RULE_BASED_FROM_EXTRACTED_TEXT"}',
  '{"sourceProvider":"SARAMIN_EXTRACTED_TEXT_SAMPLE","sourceJsonIndex":12,"archiveFolder":"[(주)크리스천메이트] 풀스택 개발자 채용 (D-20) - 사람인_files","detailFileName":"view-detail.html","extractionMethod":"html-text","images":["04_christianmate_img_260402.png"],"processedSections":{"tasks":[],"requirements":[],"preferred":[],"workConditions":[],"benefits":[],"process":[],"notes":["(주)크리스천메이트 | 풀스택 개발자 채용","웨딩·장례·이벤트 > 결혼정보회사","IT개발·데이터 > 직무·직업 > 백엔드/서버개발","IT개발·데이터 > 직무·직업 > 프론트엔드","IT개발·데이터 > 전문분야 > 반응형웹","IT개발·데이터 > 전문분야 > API","IT개발·데이터 > 기술스택 > 풀스택","IT개발·데이터 > 기술스택 > Angular","IT개발·데이터 > 기술스택 > CSS","IT개발·데이터 > 기술스택 > Django","IT개발·데이터 > 기술스택 > Flask","IT개발·데이터 > 기술스택 > HTML"]},"detectedSkills":["JavaScript","TypeScript","REST API","Node.js","React","Django","Flask","HTML","CSS"],"processedAt":"2026-07-13T00:00:00+09:00"}',
  CURRENT_TIMESTAMP,
  TRUE
) ON DUPLICATE KEY UPDATE
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
  fetched_at = CURRENT_TIMESTAMP,
  is_active = TRUE;

INSERT IGNORE INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name IN ('JavaScript', 'TypeScript', 'REST API', 'Node.js', 'React', 'Django', 'Flask', 'HTML', 'CSS')
WHERE j.external_notice_id = 'TEXT-20260713-012';


-- Saramin IT job notice live crawl data
-- Collected from Saramin job-category pages on 2026-07-15.
-- Run after 01_schema.sql and 02_seed_skills.sql.

USE dejavu;
SET NAMES utf8mb4;
START TRANSACTION;

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
  '54464435',
  '풀림',
  '웹 스크래핑 엔지니어 2년 이상',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54464435',
  'BACKEND',
  '서울 강남구',
  'EXPERIENCED',
  '정규직',
  '대학교(4년)↑',
  NULL,
  '2026-08-13 23:59:59',
  '백엔드/서버개발, 웹개발, SE(시스템엔지니어), 크롤링, Docker, PostgreSQL, Node.js, MongoDB, Docker, Python, Linux, MySQL, Redis',
  '2026 — 상반기 the pu®im
풀림 Mn
— 별
[모집분야 /경력년이샤] /// / (
웹스크래핑 개발자(명) // 1
풀림은 애드테크 기업입니다.
200펑대 규모의 업무 공간을 마련하며,
더욱 밀도 높은 협업과 성장을 위한 최적의 환경을 구축했습니다.
기존 사업 바운더리를 넘어 중고명품 리커머스, 온라인 교육사업,
종합마케팅, 외화 환전 플랫폼, 건강기능식품 브랜드 등
다양한 신사업으로 확장을 진행하고 있습니다.
혼자보다 함께의 가치를 더 중요하게 생각하며,
서로의 성장을 진심으로 응원하는 문화 속에서 의미 있는 도전을 이어가고 있습니다.
정해진 테두리 안에 스스로를 가두지 않고, 자신과 비즈니스를 함께
성장시킬 수 있는 인재라면 풀림에서 그 여정을 함께해 보셨으면 합니다.
POSITION [경력] 웹스크래핑개발자채용공고 _ (도집인원명)
-국내 플랫폼 환경을 고려한 자동화 시스템 개발
-대량요청처리 및 비동기 작업 기반 백엔드 시스템 개발
- 2/94 구조 변경, API 변경, 보안 로직 변경에
따른 자동화 로직 유지보수
브라우저 자동화 기반작업 실행 환경 운영

주요업무
계정, 세션, 쿠키, 작업 상태, 요청 이력, 오류 로그 관리
-프록시/『『 등 네트워크 환경을 고려한
작업 분산 및 실행 안정성 개선
-자동화 작업의 성공률, 실패율, 재시도율,
제한 이슈 모니터링 및 개선
-운영팀이 사용할 수 있는 관리자 페이지, 리포트, 알림 기능 개발
- Python = Node js 기반 백엔드 개발 경험
-웹크롤링/스크래핑 또는 브라우저 자동화 개발 경험
- Playwright, Selenium, Puppeteer 중 하나 이상의 사용 경험
-11101105, 쿠키, 세션, 헤더, 46하-4960에대한 이해
- MySQL, PostgreSQL, MongoDB S DB 설계및 운영경험
- Redis, Celery, BulMQ, 83866/ㅇ등큐/비동기작업처리 경험
- Linux, Docker, Git 기반 개발 및 운영 경험
-로그 기반으로 오류 원인을 분석하고 개선해본 경험
-국내 플랫폼 관련 자동화 또는 데이터 수집 경험
- Anti-bot / Anti-scraping £22 고려한 수집 전략 설계 경험
- Browser fingerprinting, device fingerprinting,
-프록시, IP, 네트워크 품질, 세션 유지에 대한 운영 경험
- 다계정 상태 관리 및 작업 분산 처리 경험
- CAPTCHA, 추가인증, 로그인만료, 요청제한 등
예외 상황 처리 경험
-스케줄러 기반 반복 작업 운영 경험
-로그/모니터링 도구 및 운영 대시보드 개발 경험
-근무형태: 정규직
-근무일시: 주 5일
-급여조건 : 회사 내규에 따르나 협의 가능
- 근무장소: 서울특별시 강남구 삼성동143-11, 가 풀림

채용절차
서류전형 1차면접 2차면접 처우협의 최종합격
(직무적합성) (조직적합성)
CED 복리 후생
유연 근무제도 8~10시 출근

생일 및 명절 선물 지원금

경조사 지원금 및 휴가 제공

선릉역 10번 출구 도보 5분

쾌적한 업무 환경 제공

자율복장

간식 및 음료 제공

넉넉한 휴게시간 1시간 20분

자기개발 비용 지원

여름휴가 제공

업무 효율을 위한 소프트웨어 적극 지원
지원방법
채용 플랫폼 또는 이메일을 통해 지원해 주세요.
자기소개서, 이력서, 직무별 포트폴리오와 함께 제출 부탁드립니다.
접수된 MRE 순차적으로 검토되며, 합격자에 한해 개별 안내드립니다.
담당자 : 인사담당자
이메일 : hr@the-pullim. co. kr',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"84","name":"백엔드/서버개발"},"listSummary":{"sectors":["백엔드/서버개발","웹개발","SE(시스템엔지니어)","크롤링","Docker"],"careerText":"경력 2년↑ · 정규직","deadlineText":"~08.13(목)"},"processedSections":{"주요업무":"계정, 세션, 쿠키, 작업 상태, 요청 이력, 오류 로그 관리 -프록시/『『 등 네트워크 환경을 고려한 작업 분산 및 실행 안정성 개선 -자동화 작업의 성공률, 실패율, 재시도율, 제한 이슈 모니터링 및 개선 -운영팀이 사용할 수 있는 관리자 페이지, 리포트, 알림 기능 개발 - Python = Node js 기반 백엔드 개발 경험 -웹크롤링/스크래핑 또는 브라우저 자동화 개발 경험 - Playwright, Selenium, Puppeteer 중 하나 이상의 사용 경험 -11101105, 쿠키, 세션, 헤더, 46하-4960에대한 이해 - MySQL, PostgreSQL, MongoDB S DB 설계및 운영경험 - Redis, Celery, BulMQ, 83866/ㅇ등큐/비동기작업처리 경험 - Linux, Docker, Git 기반 개발 및 운영 경험 -로그 기반으로 오류 원인을 분석하고 개선해본 경험 -국내 플랫폼 관련 자동화 또는 데이터 수집 경험 - Anti-bot / Anti-scraping £22 고려한 수집 전략 설계 경험 - Browser fingerprinting, device fingerprinting, WebRTC fingerprinting0i| Cit OfsH -프록시, IP, 네트워크 품질, 세션 유지에 대한 운영 경험 - 다계정 상태 관리 및 작업 분산 처리 경험 - CAPTCHA, 추가인증, 로그인만료, 요청제한 등 예외 상황 처리 경험 -스케줄러 기반 반복 작업 운영 경험 -로그/모니터링 도구 및 운영 대시보드 개발 경험 -근무형태: 정규직 -근무일시: 주 5일 -급여조건 : 회사 내규에 따르나 협의 가능 - 근무장소: 서울특별시 강남구 삼성동143-11, 가 풀림","채용절차":"서류전형 1차면접 2차면접 처우협의 최종합격 (직무적합성) (조직적합성) CED 복리 후생 뿔” 유핀2세도8~10시출근 {ff 생일및명절선물지원금 68 2조사지원금및휴가장… § 선릉역10번출구도보 5분 8 314한임무환경지공 을 8952 를 간식및음료제공 =7] Hust 휴게시간1시간 202 틴7 자기개발 비용지원 & 여름휴가제공 업무 효율을 위한 소프트웨어적극지원 a (노트북, 듀얼 DUE, DUE 받침대, 무선 키보드. 마우스 지원} ~ sea NN NOR) ser 23. (에 가라 격 —— Pg — ir — - 는 글 개 To 개 기 I''s | 내 eh 드는 같/ E 4) @, a mo °8 A py be TS 5% iF | 1 , i | J ~ Wn | 한 SO \\ i JERE 시실래 a vg \" 더 Pe | | po — EL] “i il = ET a Je <It i 8 개스. oN 그 6 =k 기 LN. n_ 3 LB nay = 빠빠 이 / 들 숙소 T T i ] ] bo] 1 — Ea [YP———-——— 1 == 0 — BR ie 밸=-개수백 = 으. | 들 은 Zr EE re = = hh ~ Te — BS 커 [A = NU fee = aa thepullim - =: = = - i Pp = = a ㅣ 7 몰 ㅋㅋ 두 — EN | EE 블래 고 = == [32512 그거 y Sst ; M.| =i. 라 . | 5 지원방법 채용 플랫폼 또는 이메일을 통해 지원해 주세요. 자기소개서, 이력서, 직무별 포트폴리오와 함께 제출 부탁드립니다. 접수된 MRE 순차적으로 검토되며, 합격자에 한해 개별 안내드립니다. 문의 담당자 : 인사담당자 이메일 : hr@the-pullim. co. kr"},"detectedSkills":["PostgreSQL","Node.js","MongoDB","Docker","Python","Linux","MySQL","Redis"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://webpds.saramin.co.kr/pds/united_company/logo/77952_logo.jpg","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://www.saraminimage.co.kr/recruit/os_hk_26/08_pullim_img_260615_01.png","https://www.saraminimage.co.kr/recruit/os_hk_26/08_pullim_img_260615_02.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":true,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://www.saraminimage.co.kr/recruit/os_hk_26/08_pullim_img_260615_01.png","text":"2026 — 상반기 the pu®im\n풀림 Mn\n— 별\n[모집분야 /경력년이샤] /// / (\n웹스크래핑 개발자(명) // 1\n풀림은 애드테크 기업입니다.\n200펑대 규모의 업무 공간을 마련하며,\n더욱 밀도 높은 협업과 성장을 위한 최적의 환경을 구축했습니다.\n기존 사업 바운더리를 넘어 중고명품 리커머스, 온라인 교육사업,\n종합마케팅, 외화 환전 플랫폼, 건강기능식품 브랜드 등\n다양한 신사업으로 확장을 진행하고 있습니다.\n혼자보다 함께의 가치를 더 중요하게 생각하며,\n서로의 성장을 진심으로 응원하는 문화 속에서 의미 있는 도전을 이어가고 있습니다.\n정해진 테두리 안에 스스로를 가두지 않고, 자신과 비즈니스를 함께\n성장시킬 수 있는 인재라면 풀림에서 그 여정을 함께해 보셨으면 합니다.\nPOSITION [경력] 웹스크래핑개발자채용공고 _ (도집인원명)\n-국내 플랫폼 환경을 고려한 자동화 시스템 개발\n-대량요청처리 및 비동기 작업 기반 백엔드 시스템 개발\n- 2/94 구조 변경, API 변경, 보안 로직 변경에\n따른 자동화 로직 유지보수\n브라우저 자동화 기반작업 실행 환경 운영\n\n주요업무\n계정, 세션, 쿠키, 작업 상태, 요청 이력, 오류 로그 관리\n-프록시/『『 등 네트워크 환경을 고려한\n작업 분산 및 실행 안정성 개선\n-자동화 작업의 성공률, 실패율, 재시도율,\n제한 이슈 모니터링 및 개선\n-운영팀이 사용할 수 있는 관리자 페이지, 리포트, 알림 기능 개발\n- Python = Node js 기반 백엔드 개발 경험\n-웹크롤링/스크래핑 또는 브라우저 자동화 개발 경험\n- Playwright, Selenium, Puppeteer 중 하나 이상의 사용 경험\n-11101105, 쿠키, 세션, 헤더, 46하-4960에대한 이해\n- MySQL, PostgreSQL, MongoDB S DB 설계및 운영경험\n- Redis, Celery, BulMQ, 83866/ㅇ등큐/비동기작업처리 경험\n- Linux, Docker, Git 기반 개발 및 운영 경험\n-로그 기반으로 오류 원인을 분석하고 개선해본 경험\n-국내 플랫폼 관련 자동화 또는 데이터 수집 경험\n- Anti-bot / Anti-scraping £22 고려한 수집 전략 설계 경험\n- Browser fingerprinting, device fingerprinting,\n-프록시, IP, 네트워크 품질, 세션 유지에 대한 운영 경험\n- 다계정 상태 관리 및 작업 분산 처리 경험\n- CAPTCHA, 추가인증, 로그인만료, 요청제한 등\n예외 상황 처리 경험\n-스케줄러 기반 반복 작업 운영 경험\n-로그/모니터링 도구 및 운영 대시보드 개발 경험\n-근무형태: 정규직\n-근무일시: 주 5일\n-급여조건 : 회사 내규에 따르나 협의 가능\n- 근무장소: 서울특별시 강남구 삼성동143-11, 가 풀림\n\n채용절차\n서류전형 1차면접 2차면접 처우협의 최종합격\n(직무적합성) (조직적합성)\nCED 복리 후생\n뿔” 유핀2세도8~10시출근 {ff 생일및명절선물지원금\n68 2조사지원금및휴가장… § 선릉역10번출구도보 5분\n8 314한임무환경지공 을 8952\n를 간식및음료제공 =7] Hust 휴게시간1시간 202\n틴7 자기개발 비용지원 & 여름휴가제공\n업무 효율을 위한 소프트웨어적극지원\na (노트북, 듀얼 DUE, DUE 받침대, 무선 키보드. 마우스 지원}"},{"imageUrl":"https://www.saraminimage.co.kr/recruit/os_hk_26/08_pullim_img_260615_02.png","text":"(에 가라 격 ——\nPg — ir — -\n는 글 개 To 개 기 I''s |\n내 eh 드는\n같/ E 4) @, a mo\n°8 A py be TS 5%\n한 SO \\ i\nJERE 시실래 a vg \"\n더 Pe | | po —\nEL] “i il =\n개스. oN 그 6\n=k 기\n= 빠빠 이 /\n들 숙소 T T i ] ]\n== 0 — BR\nie 밸=-개수백 = 으.\n| 들 은\n— BS 커\n몰 ㅋㅋ 두\n— EN | EE 블래\n고 = == [32512 그거\n지원방법\n채용 플랫폼 또는 이메일을 통해 지원해 주세요.\n자기소개서, 이력서, 직무별 포트폴리오와 함께 제출 부탁드립니다.\n접수된 MRE 순차적으로 검토되며, 합격자에 한해 개별 안내드립니다.\n담당자 : 인사담당자\n이메일 : hr@the-pullim. co. kr"}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54271343',
  '풀림',
  '백엔드 엔지니어 (Python) 2년 이상',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54271343',
  'BACKEND',
  '서울 강남구',
  'EXPERIENCED',
  '정규직',
  '대학교(4년)↑',
  NULL,
  '2026-07-24 23:59:59',
  '백엔드/서버개발, 인프라, Python, Python',
  '2026 — 상반기 the pu®im
[모집분야 /경력 2년이상]
파이썬 개발자 EST (1명)
풀림은 애드테크 기업입니다.
200평대 규모의 업무 공간을 마련하며,
더욱 밀도 높은 협업과 성장을 위한 최적의 환경을 구축했습니다.
기존 사업 바운더리를 넘어 중고명품 리커머스, 온라인 교육사업,
종합마케팅, 외화 환전 플랫폼, 건강기능식품 브랜드 등
다양한 신사업으로 확장을 진행하고 있습니다.
혼자보다 함께의 가치를 더 중요하게 생각하며,
서로의 성장을 진심으로 응원하는 문화 속에서 의미 있는 도전을 이어가고 있습니다.
정해진 테두리 안에 스스로를 가두지 않고, 자신과 비즈니스를 함께
성장시킬 수 있는 인재라면 풀림에서 그 여정을 함께해 보셨으면 합니다.
 [경력 2년 이상] 파이썬 개발자채용공고 (모짐인원1명)

주요업무
국내 플랫폼 환경을 고려한 자동화 시스템 개발

대량 요청 처리 및 비동기 작업 기반 백엔드 시스템 개발

웹/앱 구조 변경, API 변경, 보안 로직 변경에 따른 자동화 로직 유지보수

Playwright, Selenium 등 브라우저 자동화 기반 작업 실행 환경 운영

계정, 세션, 쿠키, 작업 상태, 요청 이력, 오류 로그 관리

프록시/IP 등 네트워크 환경을 고려한 작업 분산 및 실행 안정성 개선

자동화 작업의 성공률, 실패율, 재시도율, 제한 이슈 모니터링 및 개선

운영팀이 사용할 수 있는 관리자 페이지, 리포트, 알림 기능 개발
자격요건
Python 또는 Node.js 기반 백엔드 개발 경험

웹 크롤링/스크래핑 또는 브라우저 자동화 개발 경험

Playwright, Selenium, Puppeteer 중 하나 이상의 사용 경험

HTTP/HTTPS, 쿠키, 세션, 헤더, User-Agent에 대한 이해

MySQL, PostgreSQL, MongoDB 등 DB 설계 및 운영 경험

Redis, Celery, BullMQ, RabbitMQ 등 큐/비동기 작업 처리 경험

Linux, Docker, Git 기반 개발 및 운영 경험

로그 기반으로 오류 원인을 분석하고 개선해본 경험
우대사항
국내 플랫폼 관련 자동화 또는 데이터 수집 경험

Anti-bot / Anti-scraping 환경을 고려한 수집 전략 설계 경험

Browser fingerprinting, device fingerprinting, WebRTC fingerprinting에 대한 이해

프록시, IP, 네트워크 품질, 세션 유지에 대한 운영 경험

다계정 상태 관리 및 작업 분산 처리 경험

CAPTCHA, 추가 인증, 로그인 만료, 요청 제한 등 예외 상황 처리 경험

스케줄러 기반 반복 작업 운영 경험

로그/모니터링 도구 및 운영 대시보드 개발 경험

  근무 조건
-근무형태: 정규직
- 근무일시: 주 5일
- 급여조건 : 회사 내규에 따르나 협의 가능
-근무장소 : 서울특별시 강남구 삼성동143-11, 2F 풀림

채용절차
서류전형 1차면접 2차면접 처우협의 최종합격
(직무적합성) (조직적합성)
BENEFIT 복리 후생
유연 근무제도 8~10시 출근

생일 및 명절 선물 지원금

경조사 지원금 및 휴가 제공

선릉역 10번 출구 도보 5분

쾌적한 업무 환경 제공

자율복장

간식 및 음료 제공

넉넉한 휴게시간 1시간 20분

자기개발 비용 지원

여름휴가 제공

업무 효율을 위한 소프트웨어 적극 지원

(노트북, 듀얼 모니터, 모니터 받침대, 무선 키보드·마우스 지원)
지원방법
채용 플랫폼 또는 이메일을 통해 지원해 주세요.
자기소개서, 이력서, 직무별 포트폴리오와 함께 제출 부탁드립니다.
접수된 서류는 순차적으로 검토되며, 합격자에 한해 개별 안내드립니다.
담당자 : 인사담당자
이메일 : hr@the-pullim. co. kr',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"84","name":"백엔드/서버개발"},"listSummary":{"sectors":["백엔드/서버개발","인프라","Python"],"careerText":"경력 2년↑ · 정규직","deadlineText":"~07.24(금)"},"processedSections":{"주요업무":"계정, 세션, 쿠키, 작업 상태, 요청 이력, 오류 로그 관리 -프록시/『등네트워크 환경을 고려한 작업분산및 실행 안정성 개선 -자동화 작업의 성공률, 실패율, 재시도율, 제한 이슈 모니터링 및 개선 - 운영팀이 사용할 수 있는 관리자페이지, 리포트, 알림 기능 개발 - Python = Node js 기반 백엔드 개발 경험 -웹크롤링/스크래핑 또는 브라우저자동화개발 경험 - Playwright, Selenium, Puppeteer 중 하나 이상의 사용 경험 -11101105, 쿠키, 세션, 헤더, 46하-4960에대한 이해 - MySQL, PostgreSQL, MongoDB S DB 설계및 운영경험 - Redis, Celery, BUMQ, 83660/ㅇ등큐/비동기작업처리 경험 - Linux, Docker, Git 기반 개발 및 운영 경험 -로그 기반으로 오류 원인을 분석하고 개선해본 경험 - 국내 플랫폼관련 자동화 또는 데이터 수집 경험 - Anti-bot / Anti-scraping £22 고려한 수집 전략 설계 경험 - Browser fingerprinting, device fingerprinting, WebRTC fingerprinting0i| Cit OfsH -프록시, IP, 네트워크 품질, 세션 유지에 대한 운영 경험 - 다계정 상태 관리 및 작업 분산 처리 경험 - CAPTCHA, 추가인증, 로그인 만료, 요청제한등 예외 상황 처리 경험 - 스케줄러 기반 반복작업 운영 경험 -로그/모니터링 도구 및 운영 대시보드 개발 경험 -근무형태: 정규직 - 근무일시: 주 5일 - 급여조건 : 회사 내규에 따르나 협의 가능 -근무장소 : 서울특별시 강남구 삼성동143-11, 2F 풀림","채용절차":"서류전형 1차면접 2차면접 처우협의 최종합격 (직무적합성) (조직적합성) CED 복리 후생 뿔” 유핀2세도8~10시출근 {ff 생일및명절선물지원금 68 2조사지원금및휴가장… § 선릉역10번출구도보 5분 8 314한임무환경지공 8 n= 를 간식및음료제공 =7] Hugh 휴게시간1시간 202 틴7 자기개발 비용지원 & 여름휴가 제공 업무효율을 위한 소프트웨어적극지원 (노트북, 듀얼 모니터, 모니터 받침대, 무선 키보드-마우스 지원) 근무환령 는 NON) ; = St bs EY = = 는“ 귀 _ LL UE [개 을 5 ㅣ A = _—t | ie i : | \\ po | _— EN | A rr Is — h = \\ 1 EW br . 0 — ¥ 13 a | po — 5 ETS |]. 별 Je <iH iH y= i 7 = 닫는 ~ 델 = = 에 SSE } nen oy FE NENET - 006 / —- LY ~ - ~ - = 이 : een FY 대 _ = Ete Em I= 1 0 | ee |. 은 2 = rahi | SAY 누르 ~ | 09 Hai” 크레 [= 해 = aa thepullim - Se » 026 = “= 알아 7 = IE a ㅣ i hy ERR 좁 > 캐는 ST hi) Bn © M, ~_ㅡ=. = = B os el 지원방법 채용 플랫폼 또는 이메일을 통해 지원해 주세요. 자기소개서, 이력서, 직무별 포트폴리오와 함께 제출 부탁드립니다. 접수된 서류는 순차적으로 검토되며, 합격자에 한해 개별 안내드립니다. 문의 담당자 : 인사담당자 이메일 : hr@the-pullim. co. kr"},"detectedSkills":["Python"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://webpds.saramin.co.kr/pds/united_company/logo/77952_logo.jpg","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://www.saraminimage.co.kr/recruit/os_hk_26/05_pulim_img_260615_01.png","https://www.saraminimage.co.kr/recruit/os_hk_26/05_pulim_img_260615_02.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":true,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://www.saraminimage.co.kr/recruit/os_hk_26/05_pulim_img_260615_01.png","text":"2026 — 상반기 the pu®im\n뉴 \\\n풀림 Mn\n[모집분야 /경력 2년이삼] /// / (\n파이썬 개발자 EST (1%) //\n풀림은 애드테크 기업입니다.\n200평대 규모의 업무 공간을 마련하며,\n더욱 밀도 높은 협업과 성장을 위한 최적의 환경을 구축했습니다.\n기존 사업 바운더리를 넘어 중고명품 리커머스, 온라인 교육사업,\n종합마케팅, 외화 환전 플랫폼, 건강기능식품 브랜드 등\n다양한 신사업으로 확장을 진행하고 있습니다.\n혼자보다 함께의 가치를 더 중요하게 생각하며,\n서로의 성장을 진심으로 응원하는 문화 속에서 의미 있는 도전을 이어가고 있습니다.\n정해진 테두리 안에 스스로를 가두지 않고, 자신과 비즈니스를 함께\n성장시킬 수 있는 인재라면 풀림에서 그 여정을 함께해 보셨으면 합니다.\nposmoN [경력 2년 이상] 파이썬 개발자채용공고 (모짐인원1명)\n- 국내플랫폼환경을고려한자동화 시스템개발\n- 대량요청처리 및 비동기 작업기반 백엔드 시스템개발\n- 50/94 구조 변경, API 변경, 보안 로직 변경에\n따른자동화 로직 유지보수\n브라우저 자동화 기반작업 실행 환경 운영\n\n주요업무\n계정, 세션, 쿠키, 작업 상태, 요청 이력, 오류 로그 관리\n-프록시/『등네트워크 환경을 고려한\n작업분산및 실행 안정성 개선\n-자동화 작업의 성공률, 실패율, 재시도율,\n제한 이슈 모니터링 및 개선\n- 운영팀이 사용할 수 있는 관리자페이지, 리포트, 알림 기능 개발\n- Python = Node js 기반 백엔드 개발 경험\n-웹크롤링/스크래핑 또는 브라우저자동화개발 경험\n- Playwright, Selenium, Puppeteer 중 하나 이상의 사용 경험\n-11101105, 쿠키, 세션, 헤더, 46하-4960에대한 이해\n- MySQL, PostgreSQL, MongoDB S DB 설계및 운영경험\n- Redis, Celery, BUMQ, 83660/ㅇ등큐/비동기작업처리 경험\n- Linux, Docker, Git 기반 개발 및 운영 경험\n-로그 기반으로 오류 원인을 분석하고 개선해본 경험\n- 국내 플랫폼관련 자동화 또는 데이터 수집 경험\n- Anti-bot / Anti-scraping £22 고려한 수집 전략 설계 경험\n- Browser fingerprinting, device fingerprinting,\n-프록시, IP, 네트워크 품질, 세션 유지에 대한 운영 경험\n- 다계정 상태 관리 및 작업 분산 처리 경험\n- CAPTCHA, 추가인증, 로그인 만료, 요청제한등\n예외 상황 처리 경험\n- 스케줄러 기반 반복작업 운영 경험\n-로그/모니터링 도구 및 운영 대시보드 개발 경험\n-근무형태: 정규직\n- 근무일시: 주 5일\n- 급여조건 : 회사 내규에 따르나 협의 가능\n-근무장소 : 서울특별시 강남구 삼성동143-11, 2F 풀림\n\n채용절차\n서류전형 1차면접 2차면접 처우협의 최종합격\n(직무적합성) (조직적합성)\nCED 복리 후생\n뿔” 유핀2세도8~10시출근 {ff 생일및명절선물지원금\n68 2조사지원금및휴가장… § 선릉역10번출구도보 5분\n8 314한임무환경지공 8 n=\n를 간식및음료제공 =7] Hugh 휴게시간1시간 202\n틴7 자기개발 비용지원 & 여름휴가 제공\n업무효율을 위한 소프트웨어적극지원\n(노트북, 듀얼 모니터, 모니터 받침대, 무선 키보드-마우스 지원)"},{"imageUrl":"https://www.saraminimage.co.kr/recruit/os_hk_26/05_pulim_img_260615_02.png","text":"근무환령\n는 NON) ; = St bs\n는“ 귀 _ LL UE [개 을 5\nA rr Is —\nEW br . 0 —\n¥ 13 a | po —\n5 ETS |]. 별 Je <iH iH\n= 닫는 ~ 델\n이 :\neen FY 대 _ =\nee |. 은 2\n= rahi | SAY 누르\nHai” 크레 [= 해\n» 026 =\n“= 알아 7\n= IE a ㅣ i\nhy ERR 좁\n> 캐는 ST\nhi) Bn © M,\n지원방법\n채용 플랫폼 또는 이메일을 통해 지원해 주세요.\n자기소개서, 이력서, 직무별 포트폴리오와 함께 제출 부탁드립니다.\n접수된 서류는 순차적으로 검토되며, 합격자에 한해 개별 안내드립니다.\n담당자 : 인사담당자\n이메일 : hr@the-pullim. co. kr"}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54340223',
  '풀림',
  '풀스택 엔지니어(Next.js) 3년 이상',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54340223',
  'BACKEND',
  '서울 강남구',
  'EXPERIENCED',
  '정규직',
  '대학교(4년)↑',
  NULL,
  '2026-07-30 23:59:59',
  '백엔드/서버개발, 프론트엔드, 풀스택, Fullstack',
  '2026 - 상반기 the pu2im B
풀림은 애드테크 기업입니다.
200평대 규모의 업무 공간을 마련하며,
더욱 밀도 높은 협업과 성장을 위한 최적의 환경을 구축했습니다.
기존 사업 바운더리를 넘어 중고명품 리커머스, 온라인 교육사업,
종합마케팅, 외화 환전 플랫폼, 건강기능식품 브랜드 등
다양한 신사업으로 확장을 진행하고 있습니다.
혼자보다 함께의 가치를 더 중요하게 생각하며,
서로의 성장을 진심으로 응원하는 문화 속에서 의미 있는 도전을 이어가고 있습니다.
정해진 테두리 안에 스스로를 가두지 않고, 자신과 비즈니스를 함께
성장시킬 수 있는 인재라면 풀림에서 그 여정을 함께해 보셨으면 합니다.
POSITION [경력] EAE 개발자 (Next. js) (모집인원 1명 )

  1. 주요업무
Next.js 기반 자사 마케팅 플랫폼 프론트엔드/백엔드 개발 및 운영

Prisma + RDB 스키마 설계 및 API 개발

마케팅 데이터 수집·정제·시각화 기능 구현

(광고 성과, 전환, 고객 세그먼트 등)

CRM / 정산·회계 관련 내부 운영 툴 개발

디자인 시스템 기반 공통 UI 컴포넌트 구축 및 유지보수

기획·마케팅 팀과 협업해 요구사항을 빠르게 기능으로 구현
2. 자격요건
경력 3년 이상

Next.js 기반 서비스 개발 및 운영 경험

TypeScript 능숙

Prisma 등 ORM을 활용한 DB 설계·쿼리 경험

Tailwind CSS 기반 UI 구현 경험

REST API 설계 및 연동 경험

Git 기반 협업 경험

3. 우대사항
디자인 시스템 구축·운영 경험

(공통 컴포넌트, 토큰화, Storybook 등)

마케팅 도메인 서비스 개발 경험

(광고 성과 분석, 전환 추적, GA4/Meta·Google Ads API 등)

CRM 프로젝트 경험

(고객 세그먼트, 마케팅 자동화, 메시지 발송 등)

회계 / 정산 관련 프로젝트 경험

(결제 연동, 정산 로직, 데이터 정합성 처리)

클라우드 환경 배포·운영 경험 (Vercel, AWS 등)

상태관리 라이브러리 사용 경험

(TanStack Query, Zustand 등)

데이터 시각화 경험 (Recharts, D3 등)

0 ➡️ 1 제품을 직접 만들어본 경험

작은 팀에서 주도적으로 일해본 경험

4. 근무조건
근무형태 : 정규직

근무일시 : 주 5일

급여조건 : 회사 내규에 따르나 협의 가능

근무장소 : 서울특별시 강남구 삼성동 143-11, 2F 풀림

채용절차
서류전형 1차면접 2차면접 처우협의 최종합격
(직무 적합성) (조직 적합성)
BENEFIT 복리 후생
유연 근무제도 8~10시 출근
생일 및 명절 선물 지원금
경조사 지원금 및 휴가 제공
선릉역 10번 출구 도보 5분
쾌적한 업무 환경 제공
자율복장
간식 및 음료 제공
넉넉한 휴게시간 1시간 20분
자기개발 비용 지원
여름휴가 제공
업무 효율을 위한 소프트웨어 적극 지원
(노트북, 듀얼 모니터, 모니터 받침대, 무선 키보드·마우스 지원)
채용 플랫폼 또는 이메일을 통해 지원해 주세요.
자기소개서, 이력서, 직무별 포트폴리오와 함께 제출 부탁드립니다.
접수된 서류는 순차적으로 검토되며, 합격자에 한해 개별 안내드립니다.
담당자 : 인사담당자
이메일 : hr@the-pullim. co. kr',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"84","name":"백엔드/서버개발"},"listSummary":{"sectors":["백엔드/서버개발","프론트엔드","풀스택"],"careerText":"경력 3년↑ · 정규직","deadlineText":"~07.30(목)"},"processedSections":{"주요업무":"(광고성과,전환, 고객 세그먼트 등) -CRM/ Eta] 관련 내부 운영 툴 개발 ~ CIRfRl AJARL 7|ot BE UI HEE 725 9 RR|4 - 기획''마케팅 팀과 협업해 요구사항을 빠르게 기능으로 구현 -ZE au oly - Next. js 기반 서비스 개발 및 운영 경험 - TypeScript 5% - Prisma & ORM2 활용한ㅁ6 설계쿼리 경험 - Tailwind CSS 기반니구현경험 -REST API | A &i5 28 -Git7[gh el 2 - 디자인시스템구축운영경험 (공통 컴포넌트, E338} Storybook 등) - 마케팅 도메인 서비스 개발 경험 (광고 성과 분석, 전환 추적, GA4/Meta-Google Ads API 등) -ㅇ0프로젝트경험 (고객 세그먼트, 마케팅 자동화, 메시지 발송 등) -회계/정산관련 프로젝트 경험 (결제 연동, 정산 로직, 데이터 정합성 처리) -클라우드 환경 배포-운영 경험 (Vercel, AWS 등) - 상태관리 라이브러리 사용 경험 (TanStack Query, Zustand 등) -데이터 시각화 FE (Recharts, D3 등) -아2제복응숙펄미는이비 공홈 작은 팀에서 주도적으로 일해본 경험 -근무형태: 정규직 - 근무일시: 주 5일 - 급여조건 : 회사 내규에 따르나 협의 가능 - 근무장소: 서울특별시강님구삼성동143-11, 2F 풀림","채용절차":"서류전형 1차면접 2차면접 처우협의 최종합격 (직무 적합성) (조직 적합성) CED 복리 후생 8 유인9제도8~10시출근 ff 생일및명절선물지원금 Bd zzumzzawing § 선릉역10번출구도보5분 8 :14한임무환경지공 8 r= 。 8 간식및음료제공 & 닉닉한휴게시간1시간20분 A 글 자기개발 비용지원 \"내 여름휴가 제공 AR 58 gist Ameo HI Xgl (노트북, 듀얼 모니터, 모니터 받침대, 무선 키보드. 마우스 지원) JE— WORKSPACE = 그무화경 1 = > -궁> > = == | | 1 — ~ i ye | 토 ) 무5 붕을55 55 = = i Ni CIN Emm —s mT = 17 ZN 떼 、1 Sl 0 Li | . fg: ~~ I) & = 1 ㅋ 기 IX ~ | | 새 A NX \\Y; 3 Lo o Ly . ~ EO St : oo 로트 6. ㅣ . 세 Toa \" > Faas PO; : % [4 4 LS 삐 개 x = \" ay 4 SAL 00. 브. , A | ” an WRN, THT 1 7 Ld - - = > 멜 -- ee GE ¥ | [ | A ) a => res ry en i - = TF. =” rg - ㅣ: farm = |== = the pullim Sg | 그 1003 = - = so ; = = 1 , 나 6 = pj sme | i ㅋㅋ 몰 = es \" > i fa 3 APPLICATION [고니 채용 플랫폼 또는 이메일을 통해 지원해 주세요. 자기소개서, 이력서, 직무별 포트폴리오와 함께 제출 부탁드립니다. 접수된 서류는 순차적으로 검토되며, 합격자에 한해 개별 안내드립니다. [Nas 20] 담당자 : 인사담당자 이메일 : hr@the-pullim. co. kr"},"detectedSkills":["Fullstack"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://webpds.saramin.co.kr/pds/united_company/logo/77952_logo.jpg","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://www.saraminimage.co.kr/recruit/os_hk_26/02_pullim_img_260701.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":true,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://www.saraminimage.co.kr/recruit/os_hk_26/02_pullim_img_260701.png","text":"2026 - 상반기 the pu2im B\n푸리 IA\n사바 \\\n<Q 1'' (해\nL 모 ㅣ \\\n[모집분야] (\n풀스택 개발자 (Next) // |\n7] 4 ”\nthe pu®im\n풀림은 애드테크 기업입니다.\n200평대 규모의 업무 공간을 마련하며,\n더욱 밀도 높은 협업과 성장을 위한 최적의 환경을 구축했습니다.\n기존 사업 바운더리를 넘어 중고명품 리커머스, 온라인 교육사업,\n종합마케팅, 외화 환전 플랫폼, 건강기능식품 브랜드 등\n다양한 신사업으로 확장을 진행하고 있습니다.\n혼자보다 함께의 가치를 더 중요하게 생각하며,\n서로의 성장을 진심으로 응원하는 문화 속에서 의미 있는 도전을 이어가고 있습니다.\n정해진 테두리 안에 스스로를 가두지 않고, 자신과 비즈니스를 함께\n성장시킬 수 있는 인재라면 풀림에서 그 여정을 함께해 보셨으면 합니다.\nPOSITION [경력] EAE 개발자 (Next. js) (모집인원 1명 )\n~Next. js 7 ISH AHAHOIAIE) BE IEC Mois sir ol of\n- Prisma + RDB 스키마 설계 및 미개발\n- 마케팅 데이터 수집-정제시각화 기능 구현\n\n주요업무 (광고성과,전환, 고객 세그먼트 등)\n-CRM/ Eta] 관련 내부 운영 툴 개발\n- 기획''마케팅 팀과 협업해 요구사항을 빠르게 기능으로 구현\n- Next. js 기반 서비스 개발 및 운영 경험\n- Prisma & ORM2 활용한ㅁ6 설계쿼리 경험\n- Tailwind CSS 기반니구현경험\n-REST API | A &i5 28\n- 디자인시스템구축운영경험\n(공통 컴포넌트, E338} Storybook 등)\n- 마케팅 도메인 서비스 개발 경험\n(광고 성과 분석, 전환 추적, GA4/Meta-Google Ads API 등)\n-ㅇ0프로젝트경험\n(고객 세그먼트, 마케팅 자동화, 메시지 발송 등)\n-회계/정산관련 프로젝트 경험\n(결제 연동, 정산 로직, 데이터 정합성 처리)\n-클라우드 환경 배포-운영 경험 (Vercel, AWS 등)\n- 상태관리 라이브러리 사용 경험\n(TanStack Query, Zustand 등)\n-데이터 시각화 FE (Recharts, D3 등)\n-아2제복응숙펄미는이비 공홈\n작은 팀에서 주도적으로 일해본 경험\n-근무형태: 정규직\n- 근무일시: 주 5일\n- 급여조건 : 회사 내규에 따르나 협의 가능\n- 근무장소: 서울특별시강님구삼성동143-11, 2F 풀림\n\n채용절차\n서류전형 1차면접 2차면접 처우협의 최종합격\n(직무 적합성) (조직 적합성)\nCED 복리 후생\n8 유인9제도8~10시출근 ff 생일및명절선물지원금\nBd zzumzzawing § 선릉역10번출구도보5분\n8 :14한임무환경지공 8 r=\n8 간식및음료제공 & 닉닉한휴게시간1시간20분\n글 자기개발 비용지원 \"내 여름휴가 제공\n(노트북, 듀얼 모니터, 모니터 받침대, 무선 키보드. 마우스 지원)\nJE—\nWORKSPACE = 그무화경\ni ye | 토 ) 무5 붕을55 55 = =\ni Ni CIN Emm —s mT =\n17 ZN 떼 、1 Sl 0 Li\n1 ㅋ 기 IX ~ | |\n새 A NX \\Y; 3\noo 로트 6. ㅣ . 세 Toa \"\nLS 삐 개 x = \" ay 4\nSAL 00. 브. ,\nA | ” an WRN, THT 1 7 Ld - -\nee GE ¥ | [ |\n그 1003 = - =\n, 나 6 = pj sme | i\nAPPLICATION [고니\n채용 플랫폼 또는 이메일을 통해 지원해 주세요.\n자기소개서, 이력서, 직무별 포트폴리오와 함께 제출 부탁드립니다.\n접수된 서류는 순차적으로 검토되며, 합격자에 한해 개별 안내드립니다.\n담당자 : 인사담당자\n이메일 : hr@the-pullim. co. kr"}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54470782',
  '(주)스피링크',
  'AICC 프론트엔드 개발자(JAVA 경험자 우대)',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54470782',
  'FRONTEND',
  '서울 영등포구',
  'EXPERIENCED',
  '계약직',
  '대학교(4년)↑',
  NULL,
  '2026-08-14 23:59:59',
  '프론트엔드, 챗봇, AI(인공지능), Java, AICC, JavaScript, HTML, Java, CSS',
  '채용공고 상세
회사명: (주)스피링크
공고 제목: AICC 프론트엔드 개발자(JAVA 경험자 우대)
직무/태그: 프론트엔드, 챗봇, AI(인공지능), Java, AICC
근무지: 서울 영등포구
경력/고용형태: 경력 5년↑ · 계약직
학력: 대학교(4년)↑
채용공고 상세 AICC 프론트엔드 개발자(JAVA 경험자 우대) AICC 프론트엔드 개발자 📋 주요업무 · Java 기반 AICC Builder 프론트엔드 연동 개발 · 화면 기능 구현을 위한 비즈니스 로직 및 데이터 처리 · 고객사 테스트 대응 및 결함 수정 📋 자격요건 · 경력 5년 이상 · 대학교졸업(4년)이상 · 프론트엔드 개발 경력 5년 이상 · Java 기반 개발 경력 보유 · 고객사 프로젝트 수행 경험 📋 근무조건 · 근무 형태: 고객사 상주 프리랜서 · 프로젝트 기간: 6개월 (일정 연장 및 변동 가능) · 근무 장소: 서울 영등포구 여의도역 부근 · 투입 예정일: 7월 중 예정 · 업무 환경: 고객사 제공 개발 환경 및 형상관리 환경 사용 · 제출 자료: 경력기술서, 수행 프로젝트 목록, HTML/CSS/JavaScript 또는 프론트엔드 포트폴리오 📋 우대사항 · 챗봇, AICC, CRM, 상담 시스템, 업무 시스템 구축 경험 · AICC Builder, Low-code/No-code Builder, Script 기반 화면 개발 경험
• 근무일수/시간 : 🎁 복지 및 혜택 (본사 기준) "프로답게 일하는 구성원들의 자율성을 존중합니다, 최적의 근무환경"• 유연근무제 시행으로 출퇴근 시간이 자유롭습니다.• 무제한 커피, 간식을 제공합니다.• 반바지, 모자 등 자유로운 복장으로 출근 가능합니다. "회사가 크는 만큼 나의 역량도 자랍니다, 성장 지원 제도" 계약직 6개월(기간제)• 직무 관련 도서 구입비를 지원합니다.• 더 나은 업무 성과를 위해 필요한 사항을 지원합니다. "때로는 휴식이 더 큰 임팩트를 만듭니다, 자유로운 휴가 제도"• 휴가 일수에 제한이 없습니다.• 생일자에게 생일 휴가를 제공하고 있습니다.• 급 여주 금요일 2시간 조기 퇴근 제도를 운영하고 있습니다.• 반차, 반반차 제도로 유연하게 휴가를 사용할 수 있습니다. " 일상이 즐거워야 일에도 몰입할 수 있습니다, 다양한 사내 지원 제도"• 입사시 웰컴키트를 지급합니다.• 사무실 출근 시 점심식사를 제공합니다
• 생일에 선물을 드립니다.• 최대 150만원의 사내 인재 추천 포상 제도를 운영합니다. 🚀 채용절차 접수기간 : 2026-07-15 09시 ~ 2026-08-14 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원 전형절차 : 서류전형 → 1차면접 → 최종합격 서류전형 이후 일정은 합격자에 한해 개별 안내 드릴 예정입니다. 해당 절차는 각 포지션 및 후보자에 따라 변동이 있을 수 있습니다. 🛎️ 유의사항
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.

### 섹션별 정리

| 구분 | 내용 |
|---|---|
| 주요업무 | 주요업무 · Java 기반 AICC Builder 프론트엔드 연동 개발 · 화면 기능 구현을 위한 비즈니스 로직 및 데이터 처리 · 고객사 테스트 대응 및 결함 수정 📋 |
| 자격요건 | 자격요건 · 경력 5년 이상 · 대학교졸업(4년)이상 · 프론트엔드 개발 경력 5년 이상 · Java 기반 개발 경력 보유 · 고객사 프로젝트 수행 경험 📋 |
| 근무조건 | 근무조건 · 근무 형태: 고객사 상주 프리랜서 · 프로젝트 기간: 6개월 (일정 연장 및 변동 가능) · 근무 장소: 서울 영등포구 여의도역 부근 · 투입 예정일: 7월 중 예정 · 업무 환경: 고객사 제공 개발 환경 및 형상관리 환경 사용 · 제출 자료: 경력기술서, 수행 프로젝트 목록, HTML/CSS/JavaScript 또는 프론트엔드 포트폴리오 📋 |
| 우대사항 | 우대사항 · 챗봇, AICC, CRM, 상담 시스템, 업무 시스템 구축 경험 · AICC Builder, Low-code/No-code Builder, Script 기반 화면 개발 경험<br>• 근무일수/시간 : 🎁 복지 및 혜택 (본사 기준) "프로답게 일하는 구성원들의 자율성을 존중합니다, 최적의 근무환경"• 유연근무제 시행으로 출퇴근 시간이 자유롭습니다.• 무제한 커피, 간식을 제공합니다.• 반바지, 모자 등 자유로운 복장으로 출근 가능합니다. "회사가 크는 만큼 나의 역량도 자랍니다, 성장 지원 제도" 계약직 6개월(기간제)• 직무 관련 도서 구입비를 지원합니다.• 더 나은 업무 성과를 위해 필요한 사항을 지원합니다. "때로는 휴식이 더 큰 임팩트를 만듭니다, 자유로운 휴가 제도"• 휴가 일수에 제한이 없습니다.• 생일자에게 생일 휴가를 제공하고 있습니다.• 급 여주 금요일 2시간 조기 퇴근 제도를 운영하고 있습니다.• 반차, 반반차 제도로 유연하게 휴가를 사용할 수 있습니다. " 일상이 즐거워야 일에도 몰입할 수 있습니다, 다양한 사내 지원 제도"• 입사시 웰컴키트를 지급합니다.• 사무실 출근 시 점심식사를 제공합니다<br>• 생일에 선물을 드립니다.• 최대 150만원의 사내 인재 추천 포상 제도를 운영합니다. 🚀 |
| 채용절차 | 채용절차 |
| 접수기간 | 접수기간 : 2026-07-15 09시 ~ 2026-08-14 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원 |
| 전형절차 | 전형절차 : 서류전형 → 1차면접 → 최종합격 서류전형 이후 일정은 합격자에 한해 개별 안내 드릴 예정입니다. 해당 절차는 각 포지션 및 후보자에 따라 변동이 있을 수 있습니다. 🛎️ 유의사항<br>• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다. |',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"92","name":"프론트엔드"},"listSummary":{"sectors":["프론트엔드","챗봇","AI(인공지능)","Java","AICC"],"careerText":"경력 5년↑ · 계약직","deadlineText":"~08.14(금)"},"processedSections":{"주요업무":"주요업무 · Java 기반 AICC Builder 프론트엔드 연동 개발 · 화면 기능 구현을 위한 비즈니스 로직 및 데이터 처리 · 고객사 테스트 대응 및 결함 수정 📋","자격요건":"자격요건 · 경력 5년 이상 · 대학교졸업(4년)이상 · 프론트엔드 개발 경력 5년 이상 · Java 기반 개발 경력 보유 · 고객사 프로젝트 수행 경험 📋","근무조건":"근무조건 · 근무 형태: 고객사 상주 프리랜서 · 프로젝트 기간: 6개월 (일정 연장 및 변동 가능) · 근무 장소: 서울 영등포구 여의도역 부근 · 투입 예정일: 7월 중 예정 · 업무 환경: 고객사 제공 개발 환경 및 형상관리 환경 사용 · 제출 자료: 경력기술서, 수행 프로젝트 목록, HTML/CSS/JavaScript 또는 프론트엔드 포트폴리오 📋","우대사항":"우대사항 · 챗봇, AICC, CRM, 상담 시스템, 업무 시스템 구축 경험 · AICC Builder, Low-code/No-code Builder, Script 기반 화면 개발 경험\n• 근무일수/시간 : 🎁 복지 및 혜택 (본사 기준) \"프로답게 일하는 구성원들의 자율성을 존중합니다, 최적의 근무환경\"• 유연근무제 시행으로 출퇴근 시간이 자유롭습니다.• 무제한 커피, 간식을 제공합니다.• 반바지, 모자 등 자유로운 복장으로 출근 가능합니다. \"회사가 크는 만큼 나의 역량도 자랍니다, 성장 지원 제도\" 계약직 6개월(기간제)• 직무 관련 도서 구입비를 지원합니다.• 더 나은 업무 성과를 위해 필요한 사항을 지원합니다. \"때로는 휴식이 더 큰 임팩트를 만듭니다, 자유로운 휴가 제도\"• 휴가 일수에 제한이 없습니다.• 생일자에게 생일 휴가를 제공하고 있습니다.• 급 여주 금요일 2시간 조기 퇴근 제도를 운영하고 있습니다.• 반차, 반반차 제도로 유연하게 휴가를 사용할 수 있습니다. \" 일상이 즐거워야 일에도 몰입할 수 있습니다, 다양한 사내 지원 제도\"• 입사시 웰컴키트를 지급합니다.• 사무실 출근 시 점심식사를 제공합니다\n• 생일에 선물을 드립니다.• 최대 150만원의 사내 인재 추천 포상 제도를 운영합니다. 🚀","채용절차":"채용절차","접수기간":"접수기간 : 2026-07-15 09시 ~ 2026-08-14 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원","전형절차":"전형절차 : 서류전형 → 1차면접 → 최종합격 서류전형 이후 일정은 합격자에 한해 개별 안내 드릴 예정입니다. 해당 절차는 각 포지션 및 후보자에 따라 변동이 있을 수 있습니다. 🛎️ 유의사항\n• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."},"detectedSkills":["JavaScript","HTML","Java","CSS"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/202106/10/qugsvx_db3v-gyzlyd_logo.jpg","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://static.saraminimage.co.kr/static/hiring/images/template/toptype/it3.webp"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":false,"cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"}}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '51067805',
  '(주)코딧',
  '프론트엔드 개발자 (리더, React.js 5년 이상)',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=51067805',
  'FRONTEND',
  '서울 영등포구',
  'EXPERIENCED',
  '정규직',
  '학력무관',
  NULL,
  NULL,
  '앱개발, 웹개발, 프론트엔드, TypeScript, TypeScript, React',
  '2026 월
프론트엔드 개발자 :
(React. js 5년 이상)채용 .
CODIT은 입법-규제 데이터를 실시간으로 분석하는 AI 기반 GovTech 플랫폼입니다.
한국과 미국에서 총 16건의 특허를 보유하고 있으며 LLM 기반 법안 분석 및 맞춤형
법안 인사이트 제공 기술 관련 특허를 확보했습니다.
한국-미국-일본 등 주요 시장의 입법-규제 데이터를 기반으로, 국내외 이해관계자가
글로벌 규제 리스크를 체계적으로 관리하고 전략적 의사결정을 내릴 수 있도록 맞춤형
정책 인사이트를 제공합니다. 또한 대한민국 중앙부처 및 국책 연구기관과 협력하며
다양한 정책 프로젝트를 수행하고 있습니다.
CODIT 글로벌정책실증연구원은 입법-행정. 산업 전반의 정책 전문성을 바탕으로
기업의 정책 대응을 지원하는 민간 정책 연구기관입니다. 씨, 656, 헬스케어제약,
외교통상 등 주요 정책 현안에 대한 이슈페이퍼 발간과 정책 간담회를 통해 공공과
민간의 협력을 촉진하고 있습니다. 현재 대만, 미국, 일본, 싱가포르, 홍콩 등 주요
글로벌 시장에서 빠르게 사업을 확장하고 있으며, 성장하는 60160) 플랫폼에서
정책과 기술이 만나는 지점의 변화를 함께 만들어갈 분을 기다립니다.

CODIT의 Core Value
Solve Problems 문제를 발견하고 끝까지 해결합니다
High Ownership 일을 맡는 것을 넘어 스스로 이끌어갑니다
Transparency 숨기지않고 투명하게 공유합니다

Persistence 쉽게 포기하지 않고, 집요하게 한번 더 파고듭니다
Collaboration across Boundaries 경계를 넘는 협업을 만듭니다
Customer Centric 고객의 문제를 우리의 문제처럼 대합니다

프론트엔드 개발자 
인재를 지급 모집중입니다!

CODIT 프론트엔드팀에 대하여

IN 플랫폼의 웹-모바일-앰 서비스를 개발하며 사용자에게 안정적이고 효율적인 서비스 경험을 제공
하는 역할을 합니다. ReactJS 기반으로 FSIMA| 웹 서비스와 내부 관리자 페이지를 개발하고, 서비스
운영 과정에서의 개선과 고도화에 지속적으로 참여합니다. 또한 프론트엔드 구조와 성능을 발전시켜
서비스의 안정성과 운영 효율을 높이며, IX 플랫폼이 원활하게 작동할 수 있도록 제품 완성도를
높이는 데 기여하는 팀입니다.
담당업무
- 프론트엔드팀 관리 및 리드
- 코딧서치 웹 서비스 개발 (React js)
- 내부에서 사용하는 관리자 페이지 개발
- 안정적이고 효율적인 서비스 운영 및 개선
자격 조건
- 4년제 대학 졸업(학사) 이상의 학력을 보유하신 분
- React js 또는 Next jsE 이용한 프론트엔드 개발 경험 5년 이상이신 분
- JavasScript(ES6 이상), Typescript, CSS, 111[에 대한 이해가 깊으신 분
- JavaScript, Typescript, React, Webpack, Vite, Babel, redux,
Zustand, react-query 등에 대한 실무 업무 경험이 있으신 분
- Git과 Jira를 사용하고 이를 통한 협업에 능숙하신 분

우대조건 
- 원활한 의사소통 역량을 갖추신 분
- 적극적으로 서비스 개선에 필요한 업무를 찾고 실행하실 수 있는 분
- TypeScript 사용 및 테스트 코드(Jest, Jasmine, Mocha 등) 작성 경험이 있으신 분
- 코드 품질 향상을 위한 최적화와 리팩토링을 고민하시는 분
- 프론트엔드 성능 최적화 경험이나 여러 환경의 크로스 브라우징 경험이 있으신 분
- 생산성과 서비스 퍼포먼스 향상을 위한 개발 언어-도구에 관심과 적응력이 있으신 분
- 영어로 작성된 개발 문서를 읽고 이해하실 수 있으신 분

제출 서류 
- 이력서 및 자기소개서 (필수)
- 포트폴리오 (선택)

참고 사항 
- 코딧과 장기적으로 함께할 분을 찾고 있습니다.

채용절차
서류전형 >> 코딩 및 과제 테스트 >> 온라인 면접 >> 대면면접 >> 최종합격

ㆍ 포지션에 따라 전화 인터뷰가 진행될 수 있습니다.
ㆍ 필요 시, 레퍼런스 체크가 진행될 수 있습니다.
ㆍ 경력직 지원자 대상으로 처우 협의가 진행됩니다.

복리후생 및 근무환경
4대 보험
자유로운 복장
시간 단위 연차
무제한 간식 제공
사내 행사 진행
수평적 ''님'' 문화
중식·석식 지원
',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"92","name":"프론트엔드"},"listSummary":{"sectors":["앱개발","웹개발","프론트엔드","TypeScript"],"careerText":"경력 5년↑ · 정규직","deadlineText":"채용시"},"processedSections":{"복리후생":"및 근무환경 EE ES / = = I 기 | | | or | io | gv 5 | A | 1 He [— . a = Ww EN 080","채용절차":"ㆍ 포지션에 따라 전화 인터뷰가 진행될 수 있습니다.ㆍ 필요 시, 레퍼런스 체크가 진행될 수 있습니다.ㆍ 경력직 지원자 대상으로 처우 협의가 진행됩니다. 송새ㅁ os 복리후생 및 근무환경 EE ES / = = I 기 | | | or | io | gv 5 | A | 1 He [— . a = Ww EN 080"},"detectedSkills":["TypeScript","React"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/202309/01/s0ao08_g76o-v9cl36_logo.png","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://image.rivers.co.kr/files/2026-03-10/1773122408072/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EA%B0%9C%EB%B0%9C%EC%9E%90_5%EB%85%84-%EC%9D%B4%EC%83%81_-001%20%281%29.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":true,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://image.rivers.co.kr/files/2026-03-10/1773122408072/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EA%B0%9C%EB%B0%9C%EC%9E%90_5%EB%85%84-%EC%9D%B4%EC%83%81_-001%20%281%29.png","text":"2026 월\n[고 J ui :\nReact. js 54 이상 .\nCODITE 입법-규제 데이터를 실시간으로 분석하는 AI 기반 GovTech 플랫폼입니다.\n한국과 미국에서 총 16건의 특허를 보유하고 있으며 LLM 기반 법안 분석 및 맞춤형\n법안 인사이트 제공 기술 관련 특허를 확보했습니다.\n한국-미국-일본 등 주요 시장의 입법-규제 데이터를 기반으로, 국내외 이해관계자가\n글로벌 규제 리스크를 체계적으로 관리하고 전략적 의사결정을 내릴 수 있도록 맞춤형\n정책 인사이트를 제공합니다. 또한 대한민국 중앙부처 및 국책 연구기관과 협력하며\n다양한 정책 프로젝트를 수행하고 있습니다.\nCODIT 글로벌정책실증연구원은 입법-행정. 산업 전반의 정책 전문성을 바탕으로\n기업의 정책 대응을 지원하는 민간 정책 연구기관입니다. 씨, 656, 헬스케어제약,\n외교통상 등 주요 정책 현안에 대한 이슈페이퍼 발간과 정책 간담회를 통해 공공과\n민간의 협력을 촉진하고 있습니다. 현재 대만, 미국, 일본, 싱가포르, 홍콩 등 주요\n글로벌 시장에서 빠르게 사업을 확장하고 있으며, 성장하는 60160) 플랫폼에서\n정책과 기술이 만나는 지점의 변화를 함께 만들어갈 분을 기다립니다.\n00017ㅠ의 Core Value\nSolve Problems High Ownership Transparency\n문제를 발견하고 일을 Y= 것을 넘어 숨기지않고\n끝까지 해결합니다 스스로 이끌어갑니다 투명하게 공유합니다\nPersistence Collaboration Customer Centric\n침게 포기하지 않고, across Boundaries 고객의 문제를\n집요하게 한번 더 파고듭니다 경계를 넘는 협업을 만듭니다 우리의 문제처럼 대합니다\nㅇ 재를 |금 Xl 주인 | h\n인 들 시급 모 HSH LICH\nCODIT 프론트엔드팀에 대하여\nIN 플랫폼의 웹-모바일-앰 서비스를 개발하며 사용자에게 안정적이고 효율적인 서비스 경험을 제공\n하는 역할을 합니다. ReactJS 기반으로 FSIMA| 웹 서비스와 내부 관리자 페이지를 개발하고, 서비스\n운영 과정에서의 개선과 고도화에 지속적으로 참여합니다. 또한 프론트엔드 구조와 성능을 발전시켜\n서비스의 안정성과 운영 효율을 높이며, IX 플랫폼이 원활하게 작동할 수 있도록 제품 완성도를\n높이는 데 기여하는 팀입니다.\n다다 언드 3S 프론트엔드팀 관리 및 리드\nOo 브ㅜㅠㅜ\n- ASIMK| 웹 서비스 JHE (React js)\n+ 내부에서 사용하는 관리자 페이지 개발\nㆍ 안정적이고 효율적인 서비스 운영 및 개선\n자격 조건\nㆍ 4년제 대학 졸업(학사) 이상의 학력을 보유하신 분\n- React js 또는 Next jsE 이용한 프론트엔드 개발 경험 5년 이상이신 분\n- JavasScript(ES6 이상), Typescript, CSS, 111[에 대한 이해가 깊으신 분\n- JavaScript, Typescript, React, Webpack, Vite, Babel, redux,\nZustand, react-query 등에 대한 실무 업무 경험이 있으신 분\nㆍ 과 JiraS 사용하고 이를 통한 협업에 능숙하신 분\n으 원활한 의사소통 역량을 갖추신 분\n우대조건 oe 08 Et 엄무를 HL A 웠는분\nㆍ 적극적으로 서비스 개선에 필요한 업무를 찾고 실행하실 수 있는 분\n- TypeScript 사용 및 테스트 J = (Jest, Jasmine, Mocha 등) 작성 경험이 있으신 분\nㆍ 코드 품질 향상을 위한 최적화와 리팩토링을 고민하시는 분\nㆍ 프론트엔드 성능 최적화 경험이나 여러 환경의 크로스 브라우징 경험이 있으신 분\nㆍ 생산성과 서비스 퍼포먼스 향상을 위한 개발 언어-도구에 관심과 적응력이 있으신 분\nㆍ 영어로 작성된 개발 문서를 읽고 이해하실 수 있으신 분\nx 이력서 및 자기소개서 (필수:\n제출 서류 |력서 및 자기소개서 (필수)\nㆍ 포트폴리오 (선택)\n참고 사항 IHW 장기적으로 함께할 분을 찾고 있습니다.\n\n채용절차\nㆍ 포지션에 따라 전화 인터뷰가 진행될 수 있습니다.\nㆍ 필요 시, 레퍼런스 체크가 진행될 수 있습니다.\nㆍ 경력직 지원자 대상으로 처우 협의가 진행됩니다.\n송새ㅁ os\n복리후생 및 근무환경"}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54389622',
  '(주)대흥정보',
  '[대흥정보] 웹개발자(Full stack) 경력 채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54389622',
  'FULLSTACK',
  '서울 영등포구',
  'EXPERIENCED',
  '정규직',
  '대학(2,3년)↑',
  NULL,
  '2026-08-06 23:59:59',
  '웹개발, SI개발, Spring Boot, PostgreSQL, MyBatis, MariaDB, Spring, Kafka, Redis, Java, WAS, SQL, JPA',
  '대흥정보와 함께할 새로운 인재는 바로 당신입니다
2026년 대흥정보
웹개발자 (Full stack) 채용공고
대흥정보가 꿈꾸는
미래입니다. 
대흥정보는 공공기관을 위한혁신적인
주차 관리시스템을 제공하는 
IT 소프트웨어 기업입니다.
대흥정보만의 기술력을 바탕으로 )
대한민국 대표 주차 관리 시스템으로
자리 잡고 있습니다.
매년 꾸준히 성장하고 있는 
대흥정보와 함께할 인재를 구합니다. 
MISSION
고객과 함께하는 주차관리시스템의 창의 열정 신뢰
VISION
주차관리시스템의 새로운 패러다임 
SLOGAN
창의, 열정, 신뢰
채용 공고 상세 안내
대흥정보와 함께할 입니다
구분 상세내용
2026년 07월 02일(목) ~ 채용시

직무
- 웹개발 (FULL STACK)

주요업무
- 현재 솔루션화되어있는 프로젝트 개발, 구축 및 유지보수
- Frontend (Vue. js, React. js, jsp) / Back end (java)
요구사항 분석 및 설계 가능/ API 설계 및 연동 경험 /장애 분석 및 원인 파악 가능
Git 사용 가능 / Linux Aft 환경 경험

자격요건
- Java 개발 경력 3년 이상
- Spring Framework 또는 Spring Boot 기반 개발 경험
- 웹서비스 개발 및 운영 경험
- RDBMS(Oracle, PostgreSQL, MariaDB 등) 사용 경험
- SQL 작성 및 성능 개선 경험

우대사항
- 공공기관 프로젝트 경험
- 전자정부프레임워크 경험
-주차,교통, 관제시스템경험
- JPA/MyBatis 경험
- Nginx, WAS 운영 경험
- Redis, Kafka 등 미들웨어 경험
( #서류전형 ) ( #인터뷰전형 ) ( #최종합격 )
대흥정보 채용절차
-접수기간: 20263 078 02일(목) ~ 채용시마감
-점수방법:사람인입사지원
-제출서류 : 이력서(필수) 및 포트폴리오(선택)
1차인터뷰 
-실무진대면인터뷰
인적성검사 
-1차 인터뷰 합격자에 한 해 실시(온라인)
2차인터뷰 
-임원대면인터뷰
최종 합격
- 처우 협의, 입사 일정 조용, 채용검진 진행
- 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도
 채용이 취소될 수 있습니다.',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"87","name":"웹개발"},"listSummary":{"sectors":["웹개발","SI개발"],"careerText":"경력 3년↑ · 정규직","deadlineText":"~08.06(목)"},"processedSections":{},"detectedSkills":["Spring Boot","PostgreSQL","MyBatis","MariaDB","Spring","Kafka","Redis","Java","WAS","SQL","JPA"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/201707/07/ospezv_cbq4-g83c9y_logo.JPG","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://dhicc.synology.me:5002/SP_20260702.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":true,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://dhicc.synology.me:5002/SP_20260702.png","text":"대흥정보와 함께할 새로운 인재는 바로 당신입니다\n2026년 대릉정보\n위 |\nYo &\nQP 대흥정보\n00 대흥정보\n대흥정보가 꿈꾸는 Body\nSo — ( VAR i )\n미래입니다. WV),\n대흥정보는 공공기관을 위한혁신적인\n주차 관리시스템을제공하는 /\nIT 소프트웨어 기업입니다.\n대흥정보만의 기술력을 바탕으로 )\n대한민국 대표 주차 관리 시스템으로\n자리 잡고 있습니다.\n매년 꾸준히 성장하고 있는 » - .\n대흥정보와 함께할 인재를 구합니다. J -_ =\n2，7 ^0200990 ㄴ /\n고객과 함께하는 주차관리시스템의 창의 열정 신뢰\n성장 새로운 패러다임 SESE\nN E—\n채용 공고 상세 안내\n대흥정보와 함께할 입니다\n구분 상세내용\n2026년 07월 02일(목) ~ 채용시\n17/개발\n웹개발『내56800\n- 현재 솔루션화되어있는 프로젝트 개발, 구축 및 유지보수\n- Frontend (Vue. js, React. js, jsp) / Back end (java)\n요구사항 분석 및 설계 가능/ API 설계 및 연동 경험 /장애 분석 및 원인 파악 가능\nGit 사용 7H / Linux Aft 환경 경험\n- Java Zid 22 3년 이상\n- Spring Framework += Spring Boot 713 개발 경험\n-웹서비스 TH 2 경험\n- RDBMS(Oracle, PostgreSQL, MariaDB 등) 사용 경험\n- SQL AY YU 성능 개선 경험\n- 공공기관 프로젝트 경험\n- 전자정부프레임워크 경험\n-주차,교통, 관제시스템경험\n- JPA/MyBatis 경험\n- Nginx, WAS 운영 경험\n- Redis, Kafka 등 미들웨어 경험\n(. #써류전형 ) ( #인터뷰전형 ) (wizard)\nCH So [J —|\nN -접수기간: 20263 078 02일(목) ~ 채용시마감\n서류전형 _ -점수방법:사람인입사지원\n일으 -제출서류 : 이력서(필수) 및 포트폴리오(선택)\n1차인터뷰 -실두진대면인터뷰\n® 인적성검사 -1xtolein smo sof uAI=ztel)\n2차인터뷰 -임원대면인터뷰\n- 처우 협의, 입사 일정 조용, 채용검진 진행\n{ i 0 최종 합격 - 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도\n10 채용이 취소될 수 있습니다."}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54464320',
  '(주)에이블아이앤씨',
  '전자정부프레임워크 기반 웹개발자 (8-12년) 채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54464320',
  'FULLSTACK',
  '인천 연수구',
  'ANY',
  '정규직',
  '대학(2,3년)↑',
  NULL,
  NULL,
  '백엔드/서버개발, 웹개발, Java, Spring Boot, Eclipse, MariaDB, Docker, jQuery, Spring, Tomcat, Node.js, React, Java, WAS, JSP',
  '채용공고 상세
회사명: (주)에이블아이앤씨
공고 제목: 전자정부프레임워크 기반 웹개발자 (8-12년) 채용
직무/태그: 백엔드/서버개발, 웹개발, Java
근무지: 인천 연수구
경력/고용형태: 8 ~ 12년 · 정규직
학력: 대학(2,3년)↑
채용공고 상세 전자정부프레임워크 기반 웹개발자 (8-12년) 채용 모집분야 JAVA 백엔드 개발자, 웹개발 📋 담당업무
ㆍ 웹개발 / 프로세스 설계 / IA 및 기능정의 외
ㆍ 전자정부프레임워크(eGovFrame) 기반 시스템의 유지보수 및 신규 개발, 배포
ㆍ 내부망 환경에서의 WAS 서버 접근이 필요한 업무 수행
ㆍ 홈페이지 프론트엔드 및 백엔드 신규 개발, 운영 및 유지보수
ㆍ spring, spring boot, nodejs 프로젝트 개발
ㆍ App 개발 (크로스 플랫폼 포함) 📋 스킬
ㆍ eGovFramework, Spring, Spring Boot, JAVA, JSP, jQuery, XML
ㆍ SQL(MariaDB, Oracle, CUBRID 등)ㆍ WAS(Tomcat, JBOSS 등)ㆍ SVN, Git, Eclipse, Docker, Node. js 활용
ㆍ Python, React, ASP, PHP, LLM 등 📋 자격요건
• 경력 8년 이상 ~ 12년 이하
• 대학졸업(2,3년)이상
ㆍ 학력 : 초대졸이상
ㆍ 경력 : 웹개발 경력 8~12년
ㆍ CMS 구축 경험자 📋 우대사항
ㆍ 공공 / 대형 민간사업 수행 경험자
ㆍ 웹개발 관련 자격증 보유자
ㆍ 컴퓨터공학 등 관련 전공자
ㆍ 웹취약점, 시큐어코딩 등을 고려한 웹개발 유경험자 🏠 근무조건
• 고용형태 : 정규직 (수습 3개월)• 급여 : 면접 후 결정
• 근무지 : 인천 연수구 갯벌로 12 미추홀타워(본관) 1609B호
• 근무요일/시간 : 주 5일 (월~금) 09:00~06:00 🎁 복지 및 혜택
ㆍ 금요일 조기 퇴근 (매주 금요일 16시 퇴근)ㆍ 중식 제공 (점심 식사 지원)ㆍ 도서 지원 제도 (전자책 포함 대여 및 구매 지원)ㆍ 생일 축하 쿠폰 지급
ㆍ 자기계발비 지원
ㆍ 관련 자격증 취득 지원 🚀 채용절차 접수기간 : 2026-07-14 17시 ~ 상시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원 전형절차 : 서류전형 → 1차면접 → 2차면접 → 최종합격 🛎️ 유의사항
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.

### 섹션별 정리

| 구분 | 내용 |
|---|---|
| 담당업무 | 담당업무<br>ㆍ 웹개발 / 프로세스 설계 / IA 및 기능정의 외<br>ㆍ 전자정부프레임워크(eGovFrame) 기반 시스템의 유지보수 및 신규 개발, 배포<br>ㆍ 내부망 환경에서의 WAS 서버 접근이 필요한 업무 수행<br>ㆍ 홈페이지 프론트엔드 및 백엔드 신규 개발, 운영 및 유지보수<br>ㆍ spring, spring boot, nodejs 프로젝트 개발<br>ㆍ App 개발 (크로스 플랫폼 포함) 📋 스킬<br>ㆍ eGovFramework, Spring, Spring Boot, JAVA, JSP, jQuery, XML<br>ㆍ SQL(MariaDB, Oracle, CUBRID 등)ㆍ WAS(Tomcat, JBOSS 등)ㆍ SVN, Git, Eclipse, Docker, Node. js 활용<br>ㆍ Python, React, ASP, PHP, LLM 등 📋 |
| 자격요건 | 자격요건<br>• 경력 8년 이상 ~ 12년 이하<br>• 대학졸업(2,3년)이상<br>ㆍ 학력 : 초대졸이상<br>ㆍ 경력 : 웹개발 경력 8~12년<br>ㆍ CMS 구축 경험자 📋 |
| 우대사항 | 우대사항<br>ㆍ 공공 / 대형 민간사업 수행 경험자<br>ㆍ 웹개발 관련 자격증 보유자<br>ㆍ 컴퓨터공학 등 관련 전공자<br>ㆍ 웹취약점, 시큐어코딩 등을 고려한 웹개발 유경험자 🏠 |
| 근무조건 | 근무조건<br>• 고용형태 : 정규직 (수습 3개월)• 급여 : 면접 후 결정<br>• 근무지 : 인천 연수구 갯벌로 12 미추홀타워(본관) 1609B호<br>• 근무요일/시간 : 주 5일 (월~금) 09:00~06:00 🎁 복지 및 혜택<br>ㆍ 금요일 조기 퇴근 (매주 금요일 16시 퇴근)ㆍ 중식 제공 (점심 식사 지원)ㆍ 도서 지원 제도 (전자책 포함 대여 및 구매 지원)ㆍ 생일 축하 쿠폰 지급<br>ㆍ 자기계발비 지원<br>ㆍ 관련 자격증 취득 지원 🚀 |
| 채용절차 | 채용절차 |
| 접수기간 | 접수기간 : 2026-07-14 17시 ~ 상시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원 |
| 전형절차 | 전형절차 : 서류전형 → 1차면접 → 2차면접 → 최종합격 🛎️ 유의사항<br>• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다. |',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"87","name":"웹개발"},"listSummary":{"sectors":["백엔드/서버개발","웹개발","Java"],"careerText":"8 ~ 12년 · 정규직","deadlineText":"상시채용"},"processedSections":{"담당업무":"담당업무\nㆍ 웹개발 / 프로세스 설계 / IA 및 기능정의 외\nㆍ 전자정부프레임워크(eGovFrame) 기반 시스템의 유지보수 및 신규 개발, 배포\nㆍ 내부망 환경에서의 WAS 서버 접근이 필요한 업무 수행\nㆍ 홈페이지 프론트엔드 및 백엔드 신규 개발, 운영 및 유지보수\nㆍ spring, spring boot, nodejs 프로젝트 개발\nㆍ App 개발 (크로스 플랫폼 포함) 📋 스킬\nㆍ eGovFramework, Spring, Spring Boot, JAVA, JSP, jQuery, XML\nㆍ SQL(MariaDB, Oracle, CUBRID 등)ㆍ WAS(Tomcat, JBOSS 등)ㆍ SVN, Git, Eclipse, Docker, Node. js 활용\nㆍ Python, React, ASP, PHP, LLM 등 📋","자격요건":"자격요건\n• 경력 8년 이상 ~ 12년 이하\n• 대학졸업(2,3년)이상\nㆍ 학력 : 초대졸이상\nㆍ 경력 : 웹개발 경력 8~12년\nㆍ CMS 구축 경험자 📋","우대사항":"우대사항\nㆍ 공공 / 대형 민간사업 수행 경험자\nㆍ 웹개발 관련 자격증 보유자\nㆍ 컴퓨터공학 등 관련 전공자\nㆍ 웹취약점, 시큐어코딩 등을 고려한 웹개발 유경험자 🏠","근무조건":"근무조건\n• 고용형태 : 정규직 (수습 3개월)• 급여 : 면접 후 결정\n• 근무지 : 인천 연수구 갯벌로 12 미추홀타워(본관) 1609B호\n• 근무요일/시간 : 주 5일 (월~금) 09:00~06:00 🎁 복지 및 혜택\nㆍ 금요일 조기 퇴근 (매주 금요일 16시 퇴근)ㆍ 중식 제공 (점심 식사 지원)ㆍ 도서 지원 제도 (전자책 포함 대여 및 구매 지원)ㆍ 생일 축하 쿠폰 지급\nㆍ 자기계발비 지원\nㆍ 관련 자격증 취득 지원 🚀","채용절차":"채용절차","접수기간":"접수기간 : 2026-07-14 17시 ~ 상시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원","전형절차":"전형절차 : 서류전형 → 1차면접 → 2차면접 → 최종합격 🛎️ 유의사항\n• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."},"detectedSkills":["Spring Boot","Eclipse","MariaDB","Docker","jQuery","Spring","Tomcat","Node.js","React","Java","WAS","JSP"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://static.saraminimage.co.kr/static/hiring/images/template/toptype/it4.webp"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":false,"cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"}}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54462189',
  '주식회사 벨로크',
  '주식회사 벨로크 연구소 WEB/AI 개발자 충원(아이오브젝트팀)',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54462189',
  'FULLSTACK',
  '서울 금천구 외',
  'ANY',
  '정규직',
  '대학교(4년)↑',
  NULL,
  '2026-08-13 23:59:59',
  '백엔드/서버개발, 웹개발, 유지보수, QA/테스터, 솔루션, PostgreSQL, REST API, Node.js, PyTorch, Docker, OpenCV, Python, Redis, Flask, Java',
  '채용공고 상세
회사명: 주식회사 벨로크
공고 제목: 주식회사 벨로크 연구소 WEB/AI 개발자 충원(아이오브젝트팀)
직무/태그: 백엔드/서버개발, 웹개발, 유지보수, QA/테스터, 솔루션
근무지: 서울 금천구 외
경력/고용형태: 3 ~ 12년 · 정규직
학력: 대학교(4년)↑
채용공고 상세 주식회사 벨로크 연구소 WEB/AI 개발자 충원(아이오브젝트팀) 모집분야 📋 직무별 채용 모집 인원 WEB 애플리케이션 및 AI 영상분석 및 생성형 AI 개발자 : 3명(WEB 1명, AI 2명) 📋 주요업무 [WEB 애플리케이션 부문] 1. 주요업무 - 정보보안 분야 WEB 애플리케이션 및 AI 영상분석 개발 2. 자격요건 - Javasc ript 및 Java, Python 등으로 실무에서 최소 7년 이상 경력을 가진 분 - 프런트-엔드, 백-엔드에서 모두 개발이 가능한 분 - 개발 언어 및 프레임워크 전환에 문제가 없는 분 - 프로젝트 협업 및 의사소통에 장애가 없는 3. 기술요건 - 개발언어: Java, Javasc ript, Python, 기타 웹개발 언어 - 개발툴: VS Code - 형상관리 : GitLab - 기타 : SpingBoot, Rest API 등 [AI 영상분석 및 생성형 AI 부문] 1. 주요업무 1.1 영상분석(Computer Vision) AI 엔지니어 - CCTV·현장 영상 데이터를 활용한 객체/행동/이벤트 인식 기능 구현 - 기존 오픈소스/사전학습 모델(YOLO 등)을 활용한 모델 적용 및 튜닝 - 단일/소수 채널 기준 실시간·준실시간 인퍼런스 파이프라인 구현 - Edge/서버(NVIDIA GPU, NPU 등) 환경에서 모델 배포·테스트 및 모니터링 1.2 생성형 · RAG AI 엔지니어 - LLM 기반 기능(요약·질의응답·보고서/캡션 생성 등) 설계 및 웹 제품 탑재 - RAG 파이프라인(문서 전처리·임베딩·검색설계/최적화) 구성 - 프롬프트 엔지니어링, 경량 미세조정(LoRA 등), 비용/지연시간 최적화 2. 자격요건 2.1 영상분석(Computer Vision) AI 엔지니어 (아래 요건 중 최소 1개 이상 경험) - PyTorch 기반 CV 모델 학습·튜닝 경험 (Detection/Tracking/Segmentation 등) - 실시간 스트리밍(예: RTSP), OpenCV/GStreamer 활용 경험 - 모델 경량화/최적화(ONNX/TensorRT, FP16/INT8) 실무 경험 - Python 숙련 및 API 서버(FastAPI/Flask 등) 구현 경험 2.2 생성형 · RAG AI 엔지니어 (아래 요건 중 최소 1개 이상 경험) - LLM 활용 프로덕션 기능 개발 경험 - RAG 구성 요소 경험: 임베딩, 벡터DB(FAISS/Milvus/PGVector 등)), 재순위 - Python 숙련 및 서비스 연동(FastAPI/Node. js 백엔드 협업) 경험 2.3 신입의 경우 관련 학과 및 교육 이수자에 한함. 3. 기술요건 아래 기술들은 모두 필수는 아니며, 일부 항목에 대한 경험이 있거나 빠르게 학습할 수 있는 분. - AI/모델: PyTorch, TorchVision/MMDetection/Ultralytics, Transformers - 최적화/서빙: ONNX Runtime, TensorRT, NVIDIA Triton/TorchServe, CUDA - RAG/LLM: LangChain/LlamaIndex, FAISS/Milvus/PGVector, OpenAI/Bedrock 등 LLM API - 백엔드: Python(FastAPI), Node. js(Express/Nest), gRPC/REST/WebSocket - MLOps: MLflow/W&B, DVC, Airflow, Docker/K8s, GitHub Actions - 데이터/검색: PostgreSQL, Redis, S3, Elasticsearch/OpenSearch - 스트리밍/미디어: OpenCV, GStreamer, FFmpeg, RTSP 📋 우대사항 [WEB 애플리케이션 부문] - 정보보안 분야 웹기반 애플리케이션 유 경험자 - 자체 프레임워크 및 공통 라이브러리 개발 유 경험자 - Java, Javascrip, Python 능숙자 [AI 영상분석 및 생성형 AI 부문] - Multi-object tracking, ReID, Action Recognition, Multimodal(비디오+텍스트) 경험 - CUDA 커널/프로파일링, 고성능 I/O, Zero-copy 파이프라인 구성 경험 - 대규모 데이터 관리 및 Auto-labeling/Active Learning 파이프라인 경험 - LangChain/LlamaIndex 실전 적용, 하이브리드 검색(BM25+Dense), Re-ranking - 사내 프라이빗 LLM/온프레미스 배포, 권한/보안이슈 처리 경험 - 멀티모달(RAG+이미지/비디오 캡션, OCR, ASR) 파이프라인 경험 📋 자격요건
• WEB 부문(7~15년), AI 부문(0~15년)• 4년제 학사 학위 이상 🏠 근무조건
• 고용형태 : 정규직 (수습 3개월)• 급여 : 면접 후 결정
• 근무지 : 서울 금천구 가산디지털1로 149 신한이노플렉스
• 근무일수/시간 : 주 5일(월~금) 09:30~18:30 🎁 복지 및 혜택
• 교육/생활 : 우수사원시상식, 워크샵, 신규 입사자 교육(OJT), 자격증취득지원, 교육비 지원, 저녁식사 제공, 해외 워크샵
• 리프레시 : 연차, 경조휴가제, 근로자의날 휴무, 육아휴직
• 급여제도 : 퇴직연금, 인센티브제, 장기근속자 포상, 우수사원포상, 퇴직금, 휴일(특근)수당, 자격증수당, 4대 보험
• 지원금/보험 : 건강검진, 각종 경조사 지원, 문화생활비
• 조직 문화 : 회식강요 안함, 자유로운 연차사용
• 선물 : 명절선물/귀향비
• 근무 환경 : 회의실, 전용사옥, 노트북, 사무용품 지급 🚀 채용절차 접수기간 : 2026-07-14 14시 ~ 2026-08-13 24시 제출서류 : 사람인 온라인 이력서, 온라인 입사지원 접수방법 : 사람인 입사지원 전형절차 : 서류전형 → 1차면접 → 최종합격 🛎️ 유의사항
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.

### 섹션별 정리

| 구분 | 내용 |
|---|---|
| 주요업무 | 주요업무 [WEB 애플리케이션 부문] 1. 주요업무 - 정보보안 분야 WEB 애플리케이션 및 AI 영상분석 개발 2. |
| 자격요건 | 자격요건 - Javasc ript 및 Java, Python 등으로 실무에서 최소 7년 이상 경력을 가진 분 - 프런트-엔드, 백-엔드에서 모두 개발이 가능한 분 - 개발 언어 및 프레임워크 전환에 문제가 없는 분 - 프로젝트 협업 및 의사소통에 장애가 없는 3. 기술요건 - 개발언어: Java, Javasc ript, Python, 기타 웹개발 언어 - 개발툴: VS Code - 형상관리 : GitLab - 기타 : SpingBoot, Rest API 등 [AI 영상분석 및 생성형 AI 부문] 1. 주요업무 1.1 영상분석(Computer Vision) AI 엔지니어 - CCTV·현장 영상 데이터를 활용한 객체/행동/이벤트 인식 기능 구현 - 기존 오픈소스/사전학습 모델(YOLO 등)을 활용한 모델 적용 및 튜닝 - 단일/소수 채널 기준 실시간·준실시간 인퍼런스 파이프라인 구현 - Edge/서버(NVIDIA GPU, NPU 등) 환경에서 모델 배포·테스트 및 모니터링 1.2 생성형 · RAG AI 엔지니어 - LLM 기반 기능(요약·질의응답·보고서/캡션 생성 등) 설계 및 웹 제품 탑재 - RAG 파이프라인(문서 전처리·임베딩·검색설계/최적화) 구성 - 프롬프트 엔지니어링, 경량 미세조정(LoRA 등), 비용/지연시간 최적화 2. 자격요건 2.1 영상분석(Computer Vision) AI 엔지니어 (아래 요건 중 최소 1개 이상 경험) - PyTorch 기반 CV 모델 학습·튜닝 경험 (Detection/Tracking/Segmentation 등) - 실시간 스트리밍(예: RTSP), OpenCV/GStreamer 활용 경험 - 모델 경량화/최적화(ONNX/TensorRT, FP16/INT8) 실무 경험 - Python 숙련 및 API 서버(FastAPI/Flask 등) 구현 경험 |
| 우대사항 | 우대사항 [WEB 애플리케이션 부문] - 정보보안 분야 웹기반 애플리케이션 유 경험자 - 자체 프레임워크 및 공통 라이브러리 개발 유 경험자 - Java, Javascrip, Python 능숙자 [AI 영상분석 및 생성형 AI 부문] - Multi-object tracking, ReID, Action Recognition, Multimodal(비디오+텍스트) 경험 - CUDA 커널/프로파일링, 고성능 I/O, Zero-copy 파이프라인 구성 경험 - 대규모 데이터 관리 및 Auto-labeling/Active Learning 파이프라인 경험 - LangChain/LlamaIndex 실전 적용, 하이브리드 검색(BM25+Dense), Re-ranking - 사내 프라이빗 LLM/온프레미스 배포, 권한/보안이슈 처리 경험 - 멀티모달(RAG+이미지/비디오 캡션, OCR, ASR) 파이프라인 경험 📋 자격요건<br>• WEB 부문(7~15년), AI 부문(0~15년)• 4년제 학사 학위 이상 🏠 |
| 근무조건 | 근무조건<br>• 고용형태 : 정규직 (수습 3개월)• 급여 : 면접 후 결정<br>• 근무지 : 서울 금천구 가산디지털1로 149 신한이노플렉스<br>• 근무일수/시간 : 주 5일(월~금) 09:30~18:30 🎁 복지 및 혜택<br>• 교육/생활 : 우수사원시상식, 워크샵, 신규 입사자 교육(OJT), 자격증취득지원, 교육비 지원, 저녁식사 제공, 해외 워크샵<br>• 리프레시 : 연차, 경조휴가제, 근로자의날 휴무, 육아휴직<br>• 급여제도 : 퇴직연금, 인센티브제, 장기근속자 포상, 우수사원포상, 퇴직금, 휴일(특근)수당, 자격증수당, 4대 보험<br>• 지원금/보험 : 건강검진, 각종 경조사 지원, 문화생활비<br>• 조직 문화 : 회식강요 안함, 자유로운 연차사용<br>• 선물 : 명절선물/귀향비<br>• 근무 환경 : 회의실, 전용사옥, 노트북, 사무용품 지급 🚀 |
| 채용절차 | 채용절차 |
| 접수기간 | 접수기간 : 2026-07-14 14시 ~ 2026-08-13 24시 제출서류 : 사람인 온라인 이력서, 온라인 입사지원 접수방법 : 사람인 입사지원 |
| 전형절차 | 전형절차 : 서류전형 → 1차면접 → 최종합격 🛎️ 유의사항 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다. |',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"87","name":"웹개발"},"listSummary":{"sectors":["백엔드/서버개발","웹개발","유지보수","QA/테스터","솔루션"],"careerText":"3 ~ 12년 · 정규직","deadlineText":"~08.13(목)"},"processedSections":{"주요업무":"주요업무 [WEB 애플리케이션 부문] 1. 주요업무 - 정보보안 분야 WEB 애플리케이션 및 AI 영상분석 개발 2.","자격요건":"자격요건 - Javasc ript 및 Java, Python 등으로 실무에서 최소 7년 이상 경력을 가진 분 - 프런트-엔드, 백-엔드에서 모두 개발이 가능한 분 - 개발 언어 및 프레임워크 전환에 문제가 없는 분 - 프로젝트 협업 및 의사소통에 장애가 없는 3. 기술요건 - 개발언어: Java, Javasc ript, Python, 기타 웹개발 언어 - 개발툴: VS Code - 형상관리 : GitLab - 기타 : SpingBoot, Rest API 등 [AI 영상분석 및 생성형 AI 부문] 1. 주요업무 1.1 영상분석(Computer Vision) AI 엔지니어 - CCTV·현장 영상 데이터를 활용한 객체/행동/이벤트 인식 기능 구현 - 기존 오픈소스/사전학습 모델(YOLO 등)을 활용한 모델 적용 및 튜닝 - 단일/소수 채널 기준 실시간·준실시간 인퍼런스 파이프라인 구현 - Edge/서버(NVIDIA GPU, NPU 등) 환경에서 모델 배포·테스트 및 모니터링 1.2 생성형 · RAG AI 엔지니어 - LLM 기반 기능(요약·질의응답·보고서/캡션 생성 등) 설계 및 웹 제품 탑재 - RAG 파이프라인(문서 전처리·임베딩·검색설계/최적화) 구성 - 프롬프트 엔지니어링, 경량 미세조정(LoRA 등), 비용/지연시간 최적화 2. 자격요건 2.1 영상분석(Computer Vision) AI 엔지니어 (아래 요건 중 최소 1개 이상 경험) - PyTorch 기반 CV 모델 학습·튜닝 경험 (Detection/Tracking/Segmentation 등) - 실시간 스트리밍(예: RTSP), OpenCV/GStreamer 활용 경험 - 모델 경량화/최적화(ONNX/TensorRT, FP16/INT8) 실무 경험 - Python 숙련 및 API 서버(FastAPI/Flask 등) 구현 경험","우대사항":"우대사항 [WEB 애플리케이션 부문] - 정보보안 분야 웹기반 애플리케이션 유 경험자 - 자체 프레임워크 및 공통 라이브러리 개발 유 경험자 - Java, Javascrip, Python 능숙자 [AI 영상분석 및 생성형 AI 부문] - Multi-object tracking, ReID, Action Recognition, Multimodal(비디오+텍스트) 경험 - CUDA 커널/프로파일링, 고성능 I/O, Zero-copy 파이프라인 구성 경험 - 대규모 데이터 관리 및 Auto-labeling/Active Learning 파이프라인 경험 - LangChain/LlamaIndex 실전 적용, 하이브리드 검색(BM25+Dense), Re-ranking - 사내 프라이빗 LLM/온프레미스 배포, 권한/보안이슈 처리 경험 - 멀티모달(RAG+이미지/비디오 캡션, OCR, ASR) 파이프라인 경험 📋 자격요건\n• WEB 부문(7~15년), AI 부문(0~15년)• 4년제 학사 학위 이상 🏠","근무조건":"근무조건\n• 고용형태 : 정규직 (수습 3개월)• 급여 : 면접 후 결정\n• 근무지 : 서울 금천구 가산디지털1로 149 신한이노플렉스\n• 근무일수/시간 : 주 5일(월~금) 09:30~18:30 🎁 복지 및 혜택\n• 교육/생활 : 우수사원시상식, 워크샵, 신규 입사자 교육(OJT), 자격증취득지원, 교육비 지원, 저녁식사 제공, 해외 워크샵\n• 리프레시 : 연차, 경조휴가제, 근로자의날 휴무, 육아휴직\n• 급여제도 : 퇴직연금, 인센티브제, 장기근속자 포상, 우수사원포상, 퇴직금, 휴일(특근)수당, 자격증수당, 4대 보험\n• 지원금/보험 : 건강검진, 각종 경조사 지원, 문화생활비\n• 조직 문화 : 회식강요 안함, 자유로운 연차사용\n• 선물 : 명절선물/귀향비\n• 근무 환경 : 회의실, 전용사옥, 노트북, 사무용품 지급 🚀","채용절차":"채용절차","접수기간":"접수기간 : 2026-07-14 14시 ~ 2026-08-13 24시 제출서류 : 사람인 온라인 이력서, 온라인 입사지원 접수방법 : 사람인 입사지원","전형절차":"전형절차 : 서류전형 → 1차면접 → 최종합격 🛎️ 유의사항\n• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."},"detectedSkills":["PostgreSQL","REST API","Node.js","PyTorch","Docker","OpenCV","Python","Redis","Flask","Java"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/202312/04/s547yh_8d8p-gdkm0a_logo.jpg","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://static.saraminimage.co.kr/static/hiring/images/blank.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":false,"cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"}}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54458887',
  '(주)온투원',
  '(주)온투원 Low-code Platform 풀스택 개발자 경력 채용 공고입니다',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54458887',
  'FULLSTACK',
  '서울 영등포구',
  'EXPERIENCED',
  '정규직',
  '대학교(4년)↑',
  NULL,
  '2026-08-13 23:59:59',
  '백엔드/서버개발, 웹개발, 유지보수, 프론트엔드, SE(시스템엔지니어), PostgreSQL, JavaScript, Kubernetes, TypeScript, REST API, Node.js, Jenkins, GraphQL, Docker, Ubuntu, Linux, MySQL',
  '채용공고 상세
회사명: (주)온투원
공고 제목: (주)온투원 Low-code Platform 풀스택 개발자 경력 채용 공고입니다
직무/태그: 백엔드/서버개발, 웹개발, 유지보수, 프론트엔드, SE(시스템엔지니어)
근무지: 서울 영등포구
경력/고용형태: 경력 8년↑ · 정규직
학력: 대학교(4년)↑
채용공고 상세 (주)온투원 Low-code Platform 풀스택 개발자 경력 채용 공고입니다 모집분야 Low-code Platform 풀스택 개발자 📋 주요업무
• 백엔드/서버개발, 웹개발, 프론트엔드 등을 개발합니다.• 웹 프론트·백엔드 개발을 수행합니다
• API 연동 및 데이터 흐름을 구현합니다
• 배포 자동화와 운영 환경을 개선합니다
• 품질 기준 수립 및 코드리뷰를 진행합니다
• NestJS 또는 Node. js 기반 Backend API 개발
• PostgreSQL 기반 데이터 모델과 스키마 설계
• 위젯과 데이터소스 간 바인딩 구조 개발
• 외부 REST API와 기존 시스템 연동 기능 개발
• 데이터소스, 커넥터 및 API 설정 관리
• 프론트엔드 렌더링 엔진과 Backend API 연계
• 플랫폼 환경설정, 배포 및 운영 기능 개발
• Docker 기반 애플리케이션 패키징
• 시스템 성능, 보안, 장애 대응 구조 개선 📋 자격요건
• 경력 8년 이상
• 대학교졸업(4년)이상
• 풀스택 서비스 개발 경험 있으신 분
• 웹 표준 기반 UI 구현 가능하신 분
• REST API 설계·개발 경험 있으신 분
• DB 모델링 및 쿼리 작성 가능하신 분
• 협업 도구 기반 개발 가능하신 분 필수 기술 스택 풀스택 Node. js TypeScript Javasc ript PostgreSQL SQL REST API Git Docker 📋 우대사항 React 기반 프론트엔드 개발 경험 JSON Schema 설계 및 검증 경험 Redis를 활용한 캐시 또는 세션 관리 경험 WebSocket 또는 Server-Sent Events 기반 실시간 통신 경험 화면, 문서 또는 워크플로 버전관리 기능 개발 경험 RBAC 또는 ABAC 기반 권한관리 경험 Audit Log 및 변경이력 관리 기능 개발 경험 Low-code, No-code, BPM, Workflow 플랫폼 개발 경험 Form Builder, Dashboard Builder, Report Builder 개발 경험 외부 API 또는 레거시 시스템 커넥터 개발 경험 Kubernetes 기반 운영 경험 폐쇄망 또는 망분리 환경의 소프트웨어 구축 경험 CI/CD 파이프라인 구축 경험 우대 기술 스택 React Redux HTML5 CSS3 Redis GraphQL Linux Ubuntu Kubernetes AWS Jenkins Nginx MySQL NoSQL 🏠 근무조건
• 고용형태 : 정규직
• 급여 : 면접 후 결정
• 근무지 : 서울 영등포구 은행로 29, 9층 8호
• 근무일수/시간 : 09:00~18:00 🎁 복지 및 혜택
• 업무 장비를 지원합니다
• 교육·세미나 참여를 지원합니다
• 성과에 따른 보상을 제공합니다
• 자유로운 연차 사용을 지원합니다 🚀 채용절차 접수기간 : 2026-07-14 10시 ~ 2026-08-13 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원 전형절차 : 서류전형 → 1차면접 → 최종합격 🛎️ 유의사항
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.

### 섹션별 정리

| 구분 | 내용 |
|---|---|
| 주요업무 | 주요업무<br>• 백엔드/서버개발, 웹개발, 프론트엔드 등을 개발합니다.• 웹 프론트·백엔드 개발을 수행합니다<br>• API 연동 및 데이터 흐름을 구현합니다<br>• 배포 자동화와 운영 환경을 개선합니다<br>• 품질 기준 수립 및 코드리뷰를 진행합니다<br>• NestJS 또는 Node. js 기반 Backend API 개발<br>• PostgreSQL 기반 데이터 모델과 스키마 설계<br>• 위젯과 데이터소스 간 바인딩 구조 개발<br>• 외부 REST API와 기존 시스템 연동 기능 개발<br>• 데이터소스, 커넥터 및 API 설정 관리<br>• 프론트엔드 렌더링 엔진과 Backend API 연계<br>• 플랫폼 환경설정, 배포 및 운영 기능 개발<br>• Docker 기반 애플리케이션 패키징<br>• 시스템 성능, 보안, 장애 대응 구조 개선 📋 |
| 자격요건 | 자격요건<br>• 경력 8년 이상<br>• 대학교졸업(4년)이상<br>• 풀스택 서비스 개발 경험 있으신 분<br>• 웹 표준 기반 UI 구현 가능하신 분<br>• REST API 설계·개발 경험 있으신 분<br>• DB 모델링 및 쿼리 작성 가능하신 분<br>• 협업 도구 기반 개발 가능하신 분 필수 기술 스택 풀스택 Node. js TypeScript Javasc ript PostgreSQL SQL REST API Git Docker 📋 |
| 우대사항 | 우대사항 React 기반 프론트엔드 개발 경험 JSON Schema 설계 및 검증 경험 Redis를 활용한 캐시 또는 세션 관리 경험 WebSocket 또는 Server-Sent Events 기반 실시간 통신 경험 화면, 문서 또는 워크플로 버전관리 기능 개발 경험 RBAC 또는 ABAC 기반 권한관리 경험 Audit Log 및 변경이력 관리 기능 개발 경험 Low-code, No-code, BPM, Workflow 플랫폼 개발 경험 Form Builder, Dashboard Builder, Report Builder 개발 경험 외부 API 또는 레거시 시스템 커넥터 개발 경험 Kubernetes 기반 운영 경험 폐쇄망 또는 망분리 환경의 소프트웨어 구축 경험 CI/CD 파이프라인 구축 경험 우대 기술 스택 React Redux HTML5 CSS3 Redis GraphQL Linux Ubuntu Kubernetes AWS Jenkins Nginx MySQL NoSQL 🏠 |
| 근무조건 | 근무조건<br>• 고용형태 : 정규직<br>• 급여 : 면접 후 결정<br>• 근무지 : 서울 영등포구 은행로 29, 9층 8호<br>• 근무일수/시간 : 09:00~18:00 🎁 복지 및 혜택<br>• 업무 장비를 지원합니다<br>• 교육·세미나 참여를 지원합니다<br>• 성과에 따른 보상을 제공합니다<br>• 자유로운 연차 사용을 지원합니다 🚀 |
| 채용절차 | 채용절차 |
| 접수기간 | 접수기간 : 2026-07-14 10시 ~ 2026-08-13 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원 |
| 전형절차 | 전형절차 : 서류전형 → 1차면접 → 최종합격 🛎️ 유의사항<br>• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다. |',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"87","name":"웹개발"},"listSummary":{"sectors":["백엔드/서버개발","웹개발","유지보수","프론트엔드","SE(시스템엔지니어)"],"careerText":"경력 8년↑ · 정규직","deadlineText":"~08.13(목)"},"processedSections":{"주요업무":"주요업무\n• 백엔드/서버개발, 웹개발, 프론트엔드 등을 개발합니다.• 웹 프론트·백엔드 개발을 수행합니다\n• API 연동 및 데이터 흐름을 구현합니다\n• 배포 자동화와 운영 환경을 개선합니다\n• 품질 기준 수립 및 코드리뷰를 진행합니다\n• NestJS 또는 Node. js 기반 Backend API 개발\n• PostgreSQL 기반 데이터 모델과 스키마 설계\n• 위젯과 데이터소스 간 바인딩 구조 개발\n• 외부 REST API와 기존 시스템 연동 기능 개발\n• 데이터소스, 커넥터 및 API 설정 관리\n• 프론트엔드 렌더링 엔진과 Backend API 연계\n• 플랫폼 환경설정, 배포 및 운영 기능 개발\n• Docker 기반 애플리케이션 패키징\n• 시스템 성능, 보안, 장애 대응 구조 개선 📋","자격요건":"자격요건\n• 경력 8년 이상\n• 대학교졸업(4년)이상\n• 풀스택 서비스 개발 경험 있으신 분\n• 웹 표준 기반 UI 구현 가능하신 분\n• REST API 설계·개발 경험 있으신 분\n• DB 모델링 및 쿼리 작성 가능하신 분\n• 협업 도구 기반 개발 가능하신 분 필수 기술 스택 풀스택 Node. js TypeScript Javasc ript PostgreSQL SQL REST API Git Docker 📋","우대사항":"우대사항 React 기반 프론트엔드 개발 경험 JSON Schema 설계 및 검증 경험 Redis를 활용한 캐시 또는 세션 관리 경험 WebSocket 또는 Server-Sent Events 기반 실시간 통신 경험 화면, 문서 또는 워크플로 버전관리 기능 개발 경험 RBAC 또는 ABAC 기반 권한관리 경험 Audit Log 및 변경이력 관리 기능 개발 경험 Low-code, No-code, BPM, Workflow 플랫폼 개발 경험 Form Builder, Dashboard Builder, Report Builder 개발 경험 외부 API 또는 레거시 시스템 커넥터 개발 경험 Kubernetes 기반 운영 경험 폐쇄망 또는 망분리 환경의 소프트웨어 구축 경험 CI/CD 파이프라인 구축 경험 우대 기술 스택 React Redux HTML5 CSS3 Redis GraphQL Linux Ubuntu Kubernetes AWS Jenkins Nginx MySQL NoSQL 🏠","근무조건":"근무조건\n• 고용형태 : 정규직\n• 급여 : 면접 후 결정\n• 근무지 : 서울 영등포구 은행로 29, 9층 8호\n• 근무일수/시간 : 09:00~18:00 🎁 복지 및 혜택\n• 업무 장비를 지원합니다\n• 교육·세미나 참여를 지원합니다\n• 성과에 따른 보상을 제공합니다\n• 자유로운 연차 사용을 지원합니다 🚀","채용절차":"채용절차","접수기간":"접수기간 : 2026-07-14 10시 ~ 2026-08-13 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원","전형절차":"전형절차 : 서류전형 → 1차면접 → 최종합격 🛎️ 유의사항\n• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."},"detectedSkills":["PostgreSQL","JavaScript","Kubernetes","TypeScript","REST API","Node.js","Jenkins","GraphQL","Docker","Ubuntu","Linux","MySQL"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/202605/13/teyqay83_n2z5-1crlfs5_logo.jpg","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://static.saraminimage.co.kr/static/hiring/images/template/toptype/it5.webp"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":false,"cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"}}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54463666',
  '(주)라비홀딩스',
  'AI Agent & LLM 풀스택 개발자 채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54463666',
  'FULLSTACK',
  '세종 세종특별자치시',
  'ANY',
  '정규직',
  '학력무관',
  NULL,
  '2026-08-13 23:59:59',
  '웹개발, 프론트엔드, 검색엔진, 딥러닝, 머신러닝, PostgreSQL, REST API, Docker, MySQL, AWS, Fullstack',
  '채용공고 상세
회사명: (주)라비홀딩스
공고 제목: AI Agent & LLM 풀스택 개발자 채용
직무/태그: 웹개발, 프론트엔드, 검색엔진, 딥러닝, 머신러닝
근무지: 세종 세종특별자치시
경력/고용형태: 경력무관 · 정규직 외
학력: 학력무관
채용공고 상세 AI Agent & LLM 풀스택 개발자 채용 모집분야 AI Agent & LLM 풀스택 개발자 채용 📋 주요업무 주요 업무 -AI 기반 웹서비스 개발 -자사 쇼핑몰 기능 개발 및 고도화 -AI Agent를 활용한 업무 자동화 시스템 개발 -관리자(Admin) 페이지 개발 -OpenAI, Claude 등 AI API 연동 -REST API 설계 및 개발 -데이터베이스 설계 및 관리 -신규 서비스 기획 및 개발 참여 -서비스 운영 및 기능 개선 ⭐ 우대사항 Claude Code, Cursor, GitHub Copilot 등 AI 개발 도구 활용 경험 OpenAI API, Claude API 등 LLM 활용 경험 AI를 활용한 개발 워크플로우 경험 MySQL, PostgreSQL 등 데이터베이스 설계 경험 Docker, AWS 등 배포 경험 웹 자동화(Puppeteer, Playwright 등) 경험 SEO(검색엔진 최적화)에 대한 기본적인 이해 개인 프로젝트 또는 실제 서비스 개발 경험 📋 자격요건
• 경력 무관 (신입 지원 가능)• 학력 무관, 졸업 예정자 지원가능 🏠 근무조건
• 고용형태 : 정규직 (수습 3개월), 계약직 3개월(정규직 전환 가능)• 급여 : 면접 후 결정
• 근무지 : 세종 나성북1로 22 디펠리체 601호, 601-1호
• 근무일수/시간 : 🎁 복지 및 혜택 🚀 채용절차 접수기간 : 2026-07-14 16시 ~ 2026-08-13 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원 전형절차 : 서류전형 → 1차면접 → 2차면접 → 최종합격 🛎️ 유의사항
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.

### 섹션별 정리

| 구분 | 내용 |
|---|---|
| 주요업무 | 주요업무 주요 업무 -AI 기반 웹서비스 개발 -자사 쇼핑몰 기능 개발 및 고도화 -AI Agent를 활용한 업무 자동화 시스템 개발 -관리자(Admin) 페이지 개발 -OpenAI, Claude 등 AI API 연동 -REST API 설계 및 개발 -데이터베이스 설계 및 관리 -신규 서비스 기획 및 개발 참여 -서비스 운영 및 기능 개선 ⭐ |
| 우대사항 | 우대사항 Claude Code, Cursor, GitHub Copilot 등 AI 개발 도구 활용 경험 OpenAI API, Claude API 등 LLM 활용 경험 AI를 활용한 개발 워크플로우 경험 MySQL, PostgreSQL 등 데이터베이스 설계 경험 Docker, AWS 등 배포 경험 웹 자동화(Puppeteer, Playwright 등) 경험 SEO(검색엔진 최적화)에 대한 기본적인 이해 개인 프로젝트 또는 실제 서비스 개발 경험 📋 |
| 자격요건 | 자격요건<br>• 경력 무관 (신입 지원 가능)• 학력 무관, 졸업 예정자 지원가능 🏠 |
| 근무조건 | 근무조건<br>• 고용형태 : 정규직 (수습 3개월), 계약직 3개월(정규직 전환 가능)• 급여 : 면접 후 결정<br>• 근무지 : 세종 나성북1로 22 디펠리체 601호, 601-1호<br>• 근무일수/시간 : 🎁 복지 및 혜택 🚀 |
| 채용절차 | 채용절차 |
| 접수기간 | 접수기간 : 2026-07-14 16시 ~ 2026-08-13 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원 |
| 전형절차 | 전형절차 : 서류전형 → 1차면접 → 2차면접 → 최종합격 🛎️ 유의사항<br>• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다. |',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"2232","name":"풀스택"},"listSummary":{"sectors":["웹개발","프론트엔드","검색엔진","딥러닝","머신러닝"],"careerText":"경력무관 · 정규직 외","deadlineText":"~08.13(목)"},"processedSections":{"주요업무":"주요업무 주요 업무 -AI 기반 웹서비스 개발 -자사 쇼핑몰 기능 개발 및 고도화 -AI Agent를 활용한 업무 자동화 시스템 개발 -관리자(Admin) 페이지 개발 -OpenAI, Claude 등 AI API 연동 -REST API 설계 및 개발 -데이터베이스 설계 및 관리 -신규 서비스 기획 및 개발 참여 -서비스 운영 및 기능 개선 ⭐","우대사항":"우대사항 Claude Code, Cursor, GitHub Copilot 등 AI 개발 도구 활용 경험 OpenAI API, Claude API 등 LLM 활용 경험 AI를 활용한 개발 워크플로우 경험 MySQL, PostgreSQL 등 데이터베이스 설계 경험 Docker, AWS 등 배포 경험 웹 자동화(Puppeteer, Playwright 등) 경험 SEO(검색엔진 최적화)에 대한 기본적인 이해 개인 프로젝트 또는 실제 서비스 개발 경험 📋","자격요건":"자격요건\n• 경력 무관 (신입 지원 가능)• 학력 무관, 졸업 예정자 지원가능 🏠","근무조건":"근무조건\n• 고용형태 : 정규직 (수습 3개월), 계약직 3개월(정규직 전환 가능)• 급여 : 면접 후 결정\n• 근무지 : 세종 나성북1로 22 디펠리체 601호, 601-1호\n• 근무일수/시간 : 🎁 복지 및 혜택 🚀","채용절차":"채용절차","접수기간":"접수기간 : 2026-07-14 16시 ~ 2026-08-13 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원","전형절차":"전형절차 : 서류전형 → 1차면접 → 2차면접 → 최종합격 🛎️ 유의사항\n• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."},"detectedSkills":["PostgreSQL","REST API","Docker","MySQL","AWS","Fullstack"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/202411/15/smz0f7_z10v-v8xztz_logo.jpg","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://static.saraminimage.co.kr/static/hiring/images/blank.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":false,"cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"}}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54463604',
  '(주)엠에이치퓨처스',
  '풀스택 웹 프로그램 개발자(경력)',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54463604',
  'FULLSTACK',
  '서울 서초구',
  'ANY',
  '정규직',
  '대학(2,3년)↑',
  NULL,
  '2026-09-12 23:59:59',
  '웹개발, 핀테크, MariaDB, Python, RestAPI, REST API, MariaDB, Vue.js, Python, SQL, Fullstack',
  '채용공고 상세
회사명: (주)엠에이치퓨처스
공고 제목: 풀스택 웹 프로그램 개발자(경력)
직무/태그: 웹개발, 핀테크, MariaDB, Python, REST API
근무지: 서울 서초구
경력/고용형태: 7 ~ 10년 · 정규직
학력: 대학(2,3년)↑
채용공고 상세 풀스택 웹 프로그램 개발자 모집 (경력) 2000년 04월 26일에 설립된 그 외 기타 금융 지원 서비스업업종의 그 외 기타 금융 지원 서비스업,통신 판매업,데이터베이스 및 온라인 정보 제공업사업을 하는 중소기업, 주식회사기업 입니다. 엠에이치퓨처스는 2005년에 전자어음 기술사업자로 선정되어 금융결제원과 함께 전자어음 서비스를 20년간 수행하고 있습니다. 전자어음 시스템 운영 경험을 바탕으로 PG 사업을 추진하는 전자금융 시스템 전문 기업입니다. 모집부문 및 상세내용 모집부문 상세내용 풀스택 웹 프로그램 개발 1명 [담당업무]ㆍ PG 웹 프로그램 개발
ㆍ PG 시스템 유지보수 [자격요건]ㆍ Python / Vue. js 개발에 능숙하신 분
ㆍ 풀스택 개발 경험이 있는 분
ㆍ SQL, Oracle 등 DB 활용에 능숙하신 분 [우대사항]ㆍ PG 시스 템 개발 및 유지보수 경험 있는 분
ㆍ PM / PL 경험이 있는 분
ㆍ Claude code 를 사용한 바이브 코딩 경험 있는 분
ㆍ 커뮤니케이션과 관계를 소중히 생각하시는 분 [지원자격]ㆍ 경력 : 경력 7년 이상 주요업무 담당업무
ㆍ ㆍ 기타 필수 사항 우대사항 근무조건
ㆍ 근무형태 : 정규직(수습기간) - 3개월
ㆍ 근무일시 : 09:00~18:00
ㆍ 근무지역 : 서울 서초구 나루터로10길 20, 무학빌딩 2층 전형절차 서류전형 1차면접 2차면접 최종합격 접수기간 및 방법
ㆍ 접수기간 : 2026년 7월 14일 (화) ~ 2026년 09월 13일 (일)ㆍ 접수방법 : 사람인 입사지원
ㆍ 이력서양식 : 사람인 온라인 이력서
ㆍ 제출서류 : 유의사항
ㆍ 학력, 성별, 연령을 보지않는 블라인드 채용입니다.ㆍ 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.ㆍ 모집분야별로 마감일이 상이할 수 있으니 유의하시길 바랍니다.

### 섹션별 정리

| 구분 | 내용 |
|---|---|
| 담당업무 | 담당업무]ㆍ PG 웹 프로그램 개발<br>ㆍ PG 시스템 유지보수 [ |
| 자격요건 | 자격요건]ㆍ Python / Vue. js 개발에 능숙하신 분<br>ㆍ 풀스택 개발 경험이 있는 분<br>ㆍ SQL, Oracle 등 DB 활용에 능숙하신 분 [ |
| 우대사항 | 우대사항]ㆍ PG 시스 템 개발 및 유지보수 경험 있는 분<br>ㆍ PM / PL 경험이 있는 분<br>ㆍ Claude code 를 사용한 바이브 코딩 경험 있는 분<br>ㆍ 커뮤니케이션과 관계를 소중히 생각하시는 분 [ |
| 지원자격 | 지원자격]ㆍ 경력 : 경력 7년 이상 |
| 주요업무 | 주요업무 담당업무<br>ㆍ ㆍ 기타 필수 사항 우대사항 |
| 근무조건 | 근무조건<br>ㆍ 근무형태 : 정규직(수습기간) - 3개월<br>ㆍ 근무일시 : 09:00~18:00<br>ㆍ 근무지역 : 서울 서초구 나루터로10길 20, 무학빌딩 2층 |
| 전형절차 | 전형절차 서류전형 1차면접 2차면접 최종합격 |
| 접수기간 | 접수기간 및 방법<br>ㆍ 접수기간 : 2026년 7월 14일 (화) ~ 2026년 09월 13일 (일)ㆍ 접수방법 : 사람인 입사지원<br>ㆍ 이력서양식 : 사람인 온라인 이력서<br>ㆍ 제출서류 : 유의사항<br>ㆍ 학력, 성별, 연령을 보지않는 블라인드 채용입니다.ㆍ 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.ㆍ 모집분야별로 마감일이 상이할 수 있으니 유의하시길 바랍니다. |',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"2232","name":"풀스택"},"listSummary":{"sectors":["웹개발","핀테크","MariaDB","Python","RestAPI"],"careerText":"7 ~ 10년 · 정규직","deadlineText":"~09.12(토)"},"processedSections":{"담당업무":"담당업무]ㆍ PG 웹 프로그램 개발\nㆍ PG 시스템 유지보수 [","자격요건":"자격요건]ㆍ Python / Vue. js 개발에 능숙하신 분\nㆍ 풀스택 개발 경험이 있는 분\nㆍ SQL, Oracle 등 DB 활용에 능숙하신 분 [","우대사항":"우대사항]ㆍ PG 시스 템 개발 및 유지보수 경험 있는 분\nㆍ PM / PL 경험이 있는 분\nㆍ Claude code 를 사용한 바이브 코딩 경험 있는 분\nㆍ 커뮤니케이션과 관계를 소중히 생각하시는 분 [","지원자격":"지원자격]ㆍ 경력 : 경력 7년 이상","주요업무":"주요업무 담당업무\nㆍ ㆍ 기타 필수 사항 우대사항","근무조건":"근무조건\nㆍ 근무형태 : 정규직(수습기간) - 3개월\nㆍ 근무일시 : 09:00~18:00\nㆍ 근무지역 : 서울 서초구 나루터로10길 20, 무학빌딩 2층","전형절차":"전형절차 서류전형 1차면접 2차면접 최종합격","접수기간":"접수기간 및 방법\nㆍ 접수기간 : 2026년 7월 14일 (화) ~ 2026년 09월 13일 (일)ㆍ 접수방법 : 사람인 입사지원\nㆍ 이력서양식 : 사람인 온라인 이력서\nㆍ 제출서류 : 유의사항\nㆍ 학력, 성별, 연령을 보지않는 블라인드 채용입니다.ㆍ 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.ㆍ 모집분야별로 마감일이 상이할 수 있으니 유의하시길 바랍니다."},"detectedSkills":["REST API","MariaDB","Vue.js","Python","SQL","Fullstack"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/202506/10/sxm86f51_q4ru-gyrnmu_logo.png","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://www.saraminimage.co.kr/sri/vix/template/toptype/design2.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":false,"cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"}}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54407178',
  '(주)제이케이데이터시스템즈',
  '풀스택 개발자 (React)  정규직 모십니다. (중급,고급이상)',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54407178',
  'FULLSTACK',
  '서울 금천구',
  'EXPERIENCED',
  '정규직',
  '학력무관',
  NULL,
  '2026-08-07 23:59:59',
  '풀스택, REST API, React, SQL, Fullstack',
  '채용공고 상세
회사명: (주)제이케이데이터시스템즈
공고 제목: 풀스택 개발자 (React) 정규직 모십니다. (중급,고급이상)
직무/태그: 풀스택
근무지: 서울 금천구
경력/고용형태: 경력(년수무관) · 정규직
학력: 학력무관
채용공고 상세 풀스택 개발자 (React) 정규직 모십니다. (중급,고급이상) 모집분야 풀스택개발자(React)_ 정규직_중,고급이상 📋 주요업무
• 웹 서비스 프론트엔드 개발합니다
• 백엔드 API 설계 및 구현합니다
• 데이터 연동 기능 개발 및 운영합니다
• 서비스 성능 개선과 장애 대응합니다
• 배포 자동화 및 운영환경 관리합니다 📋 자격요건
• 경력 (연수 무관)• 학력무관
• 풀스택 실무 개발 경험 보유하신 분
• REST API 설계 경험 있으신 분
• RDB 설계 및 SQL 활용 가능하신 분
• 형상관리 도구 활용 가능하신 분
• 운영 이슈 분석 및 해결 가능하신 분 📋 우대사항
• 클라우드 환경 구축 경험 있으신 분
• CI/CD 파이프라인 경험 있으신 분
• 보안 취약점 점검 경험 있으신 분
• 대용량 트래픽 대응 경험 있으신 분
• 데이터 처리 파이프라인 경험 있으신 분 🏠 근무조건
• 고용형태 : 정규직
• 급여 : 면접 후 결정
• 근무지 : 서울 금천구 디지털로9길 65 백상스타타워1차 1501호
• 근무일수/시간 : 🎁 복지 및 혜택 🚀 채용절차 접수기간 : 2026-07-08 13시 ~ 2026-08-07 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원 전형절차 : 서류전형 → 1차면접 → 2차면접 → 최종합격 🛎️ 유의사항
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.

### 섹션별 정리

| 구분 | 내용 |
|---|---|
| 주요업무 | 주요업무<br>• 웹 서비스 프론트엔드 개발합니다<br>• 백엔드 API 설계 및 구현합니다<br>• 데이터 연동 기능 개발 및 운영합니다<br>• 서비스 성능 개선과 장애 대응합니다<br>• 배포 자동화 및 운영환경 관리합니다 📋 |
| 자격요건 | 자격요건<br>• 경력 (연수 무관)• 학력무관<br>• 풀스택 실무 개발 경험 보유하신 분<br>• REST API 설계 경험 있으신 분<br>• RDB 설계 및 SQL 활용 가능하신 분<br>• 형상관리 도구 활용 가능하신 분<br>• 운영 이슈 분석 및 해결 가능하신 분 📋 |
| 우대사항 | 우대사항<br>• 클라우드 환경 구축 경험 있으신 분<br>• CI/CD 파이프라인 경험 있으신 분<br>• 보안 취약점 점검 경험 있으신 분<br>• 대용량 트래픽 대응 경험 있으신 분<br>• 데이터 처리 파이프라인 경험 있으신 분 🏠 |
| 근무조건 | 근무조건<br>• 고용형태 : 정규직<br>• 급여 : 면접 후 결정<br>• 근무지 : 서울 금천구 디지털로9길 65 백상스타타워1차 1501호<br>• 근무일수/시간 : 🎁 복지 및 혜택 🚀 |
| 채용절차 | 채용절차 |
| 접수기간 | 접수기간 : 2026-07-08 13시 ~ 2026-08-07 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원 |
| 전형절차 | 전형절차 : 서류전형 → 1차면접 → 2차면접 → 최종합격 🛎️ 유의사항<br>• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다. |',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"2232","name":"풀스택"},"listSummary":{"sectors":["풀스택"],"careerText":"경력(년수무관) · 정규직","deadlineText":"~08.07(금)"},"processedSections":{"주요업무":"주요업무\n• 웹 서비스 프론트엔드 개발합니다\n• 백엔드 API 설계 및 구현합니다\n• 데이터 연동 기능 개발 및 운영합니다\n• 서비스 성능 개선과 장애 대응합니다\n• 배포 자동화 및 운영환경 관리합니다 📋","자격요건":"자격요건\n• 경력 (연수 무관)• 학력무관\n• 풀스택 실무 개발 경험 보유하신 분\n• REST API 설계 경험 있으신 분\n• RDB 설계 및 SQL 활용 가능하신 분\n• 형상관리 도구 활용 가능하신 분\n• 운영 이슈 분석 및 해결 가능하신 분 📋","우대사항":"우대사항\n• 클라우드 환경 구축 경험 있으신 분\n• CI/CD 파이프라인 경험 있으신 분\n• 보안 취약점 점검 경험 있으신 분\n• 대용량 트래픽 대응 경험 있으신 분\n• 데이터 처리 파이프라인 경험 있으신 분 🏠","근무조건":"근무조건\n• 고용형태 : 정규직\n• 급여 : 면접 후 결정\n• 근무지 : 서울 금천구 디지털로9길 65 백상스타타워1차 1501호\n• 근무일수/시간 : 🎁 복지 및 혜택 🚀","채용절차":"채용절차","접수기간":"접수기간 : 2026-07-08 13시 ~ 2026-08-07 24시 제출서류 : 사람인 온라인 이력서 접수방법 : 사람인 입사지원","전형절차":"전형절차 : 서류전형 → 1차면접 → 2차면접 → 최종합격 🛎️ 유의사항\n• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다."},"detectedSkills":["REST API","React","SQL","Fullstack"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/201902/26/pniw2o_qa88-0_logo.jpg","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://static.saraminimage.co.kr/static/hiring/images/template/toptype/it4.webp"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":false,"cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"}}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54205846',
  '(주)써로마인드',
  '(주)써로마인드 AI플랫폼팀 풀스택 개발자',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54205846',
  'FULLSTACK',
  '서울 강동구 외',
  'EXPERIENCED',
  '정규직',
  '학력무관',
  NULL,
  '2026-07-17 23:59:59',
  '백엔드/서버개발, 프론트엔드, API, OCR, AI(인공지능), JavaScript, TypeScript, REST API, Angular, Docker, React, HTML, CSS, Git, Vue.js, Fullstack',
  '1. 메인 타이틀 및 기업 소개
SURROMIND (써로마인드)

전직군 상시채용 중

도전이 일상이 되고, 실패는 배움이 되는 곳, 써로마인드와 함께, 진짜 성장을 꿈꾸는 써로인을 찾습니다.

#Join our team_2026

Making AI, Your future starts here.
써로마인드는 국내 최고의 인공지능 핵심기술을 보유한 AI 전문 기업입니다. 좋아하는 것을 하는 것이 가장 큰 경력입니다. 써로마인드와 함께 인공지능의 꿈을 가지고 AI라는 혁신의 시대를 함께 나아갈 동료를 기다리고 있습니다.

써로마인드는?
국내 최고의 인공지능 핵심기술을 보유한 AI 전문기업으로, 다양한 파트너사와 다양한 R&D 과제 협력 등 AI 분야에서 활발히 성과를 내며 성장하고 있습니다.

어떻게 일하나요?
AI를 리딩하는 회사지만 사람이 먼저라는 기본 가치를 추구합니다. 잡담도 경쟁력이죠. 잡담을 통해 건강한 조직문화를 만들어가며 변화를 지향하면서 변하지 않는 본질에 집중합니다. 의사결정은 수직, 소통은 수평, 논의는 사실에 기반합니다. 내가 틀렸음을 인정할 때 조직은 발전한다고 생각합니다. 함께 일한 땐 일의 목적과 기간, 다른 업무에 대한 영향을 고민해요. 맥락을 공유하는 수고로움을 받아들여요.

어떤 사람을 원하나요?
인공지능에 대한 꿈을 가지고 계신 분도 좋지만, 인공지능의 한계를 느끼고 좌절해 본 경험이 있으신 분을 더 좋아합니다. 인공지능 전문가를 꿈꾸는 분도 좋지만, 인공지능도 쓸 줄 아는 개발자가 되고 싶으신 분을 더 좋아합니다. 시키는 대로 열심히 하는 분도 좋지만, 왜 이렇게 하는지에 대해서 생각하는 분을 더 좋아합니다. 특정 분야를 깊게 알고 계신 분도 좋지만, 넓게 알고 계신 분을 더 좋아합니다.

2. AI 플랫폼팀 소개
우리 팀은 이렇게 일해요!
우리는 AI 모델의 데이터 수집부터 학습, 평가, 배포, 모니터링까지 자동화하며 AI 모델 개발에 시간과 비용을 획기적으로 줄이는 시스템을 개발합니다. 단순한 자동화를 넘어, 지속적으로 성능을 개선하고 운영 효율을 극대화할 수 있는 인프라를 만들며, 다양한 AI 프로젝트를 빠르게 실험하고 제품화하는데 집중하고 있습니다. 새로운 기술을 빠르게 도입하고, 협업과 공유를 중시하는 팀 문화 속에서 함께 성장할 분을 찾고 있습니다.

우리는 이런분과 함께 일하고 싶어요!

관련 분야 실무 경력 10년 이상 또는 이에 준하는 개발 역량을 보유하신 분

웹 서비스, 업무 시스템, 플랫폼 또는 솔루션 개발 경험이 많으신 분

개발 산출물 문서화 및 운영 이슈 대응 경험이 있으신 분

Git 기반 협업 개발 및 이슈 관리 경험이 있으신 분

데이터 관리, 접근 권한, 로그, 보안에 대한 기본 이해가 높으신 분

운영 환경에서 발생하는 문제를 분석하고 개선한 경험이 있으신 분

3. 풀 스택 개발 (모집 직무 상세)
경력: 웹 화면, API 연동, 관리자 기능, 운영 화면 개발, 10년 이상 또는 이에 준하는 역량

업무내용

웹 기반 관리 콘솔 화면 개발

프로젝트 관리, 설정 관리, 등록/조회 화면 개발

프론트엔드와 백엔드 API 연동

입력 검증, 상태 표시, 결과 화면 구성

대시보드, 관리자 화면, 사용자 편의 기능 개선

지원자격 (★필수)

React, Vue, Angular 등 프론트엔드 프레임워크 개발 경험이 있으신 분

JavaScript 또는 TypeScript 개발 경험이 있으신 분

REST API 연동 및 화면 상태 관리 경험이 있으신 분

관리자 페이지, 대시보드, 업무 시스템 개발 경험이 있으신 분

HTML, CSS 기반 화면 구현 및 반응형 UI 개발 경험이 있으신 분

백엔드 API 구조와 데이터 흐름에 대한 이해도가 높으신 분

우대사항

공공기관 프로젝트 수행 경험이 있으신 분

솔루션 제품 개발 또는 상용화 경험이 있으신 분

제조, 의료, 품질 검사, 관제, 문서 인식 분야 프로젝트 경험이 있으신 분

대시보드, 관리자 시스템, 업무 자동화 시스템 개발 경험이 있으신 분

AI 모델을 실제 서비스 또는 업무 시스템에 적용한 경험이 있으신 분

Docker 기반 개발, 테스트, 배포 경험이 있으신 분

4. 근무 환경
근무형태: 정규직 (수습 2개월)

업무시간: 주 5일, 유연 근무제, 코어타임 중심 (10:00 ~ 17:00)

회사위치: 서울특별시 관악구 남부순환로 1802, 2층 (2호선 서울대입구역 4번출구, 도보 3분)

근무위치: 서울특별시 강동구 상일로 6길 51, 3층

5. 복리후생
코어타임 중심 자율 근무제: 써로마인드는 구성원의 일상을 존중하여 코어타임 중심(10:00 ~ 17:00)의 자율 근무제를 운영하고 있습니다.

Self-Motivated: 스스로 각 프로젝트의 주체가 되어 권한 내에서 자율적으로 판단하여 주도적으로 업무를 이끌어 나갈 수 있습니다.

점심 & 저녁 식사 제공: 점심과 저녁 식사 제공됩니다. 저녁 식사는 야근자에 한해(식사 이후 1시간 이상) 제공합니다.

자유로운 연차 사용: 눈치보지 않고 언제든 사용할 수 있습니다.

[기타 지원 항목]
휴일 특근 연차 지원 / 포상 재량 휴가 지원 / 프리미엄 런치(화요일) / 안마의자 및 운동기구 / 교육비 지원

수평적인 분위기 / 자유로운 복장 / 사내 동호회 지원 / 애완동물 친화 / 창립기념일 휴무

카페테리아 & 휴게실 운영 / 무제한 간식 제공 / 정직원 전환 선물 / 생일 선물 / 출산 선물

자녀 초등학교 입학 선물 / 웰컴키트 제공 / 경조사 지원 / 워크샵 활동

6. 전형 절차 및 접수 방법
전형 절차
Step 1 서류전형 ➡️ Step 2 기술 면접 ➡️ Step 3 컬처핏 면접 ➡️ Step 4 최종 합격
** 포트폴리오, GitHub 링크 제출 시 가산점 **

제출서류 및 접수방법
접수처: 채용사이트 온라인 접수

제출서류

이력서 (자유양식)

경력기술서

참여 프로젝트 상세 내역

본인 담당 역할 및 사용 기술 명시

포트폴리오 또는 GitHub 링크 선택 제출

일정: 상시 채용

결과발표: 합격자 개별 공지
＊ 합격자개별 공지
© 면접일정은 서류 합격자에한해 수시로 개별 연락드립니다.
© 서류전형시 제출하신 자료는 반남되지 않습니다.
+ 허위사실이 발견될 경우 채용이 취소됩니다.',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"2232","name":"풀스택"},"listSummary":{"sectors":["백엔드/서버개발","프론트엔드","API","OCR","AI(인공지능)"],"careerText":"경력 10년↑ · 정규직","deadlineText":"D-2"},"processedSections":{},"detectedSkills":["JavaScript","TypeScript","REST API","Angular","Docker","React","HTML","CSS","Git","Vue.js","Fullstack"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/202201/27/r6d8xs_1uoc-1crpops_logo.png","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://pds.saramin.co.kr/recruit/recruit/202606/17/09eca9_e402-e0643f_recruit.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":true,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://pds.saramin.co.kr/recruit/recruit/202606/17/09eca9_e402-e0643f_recruit.png","text":"~—= SURROMIND FEZ MAINE 중\nPS 익사 | | 고\n도전이 일상이 도 ,\n와 함께\n진짜 성장을 꿈꾸는\n으 차스 니 다\n= 즈브 .\n써로마인드는 국내 최고의 인공지능 핵심기술을 보유한 AI 전문 기업입니다.\n좋아하는 것을 하는 것이 가장 큰 경력입니다.\n써로마인드와 함께 인공지능의 꿈을 가지고 시라는 혁신의 시대를 함께 나아갈 동료를 기다리고 있습니다.\n국내 최고의 인공지능 핵심기술을 보유한 AI 전문기업으로, 다양한 파트너사와 다양한 8800 과제 협력 등 시 분야에서\n활발히 성과를 내며 성장하고 있습니다.\nAE 리딩하는 회사지만 사람이 먼저라는 기본 가치를 추구합니다.\n잡담도 경쟁력이죠. 잡담을 통해 건강한 조직문화를 만들어가며 변화를 지향하면서 변하지 않는 본질에 집중합니다.\n의사결정은 수직, 소통은 수평, 논의는 사실에 기반합니다. 내가 틀렸음을 인정할 때 조직은 발전한다고 생각합니다.\n함께 일한 땐 일의 목적과 기간, 다른 업무에 대한 영향을 고민해요. 맥락을 공유하는 수고로움을 받아들여요.\n인공지능에 대한 꿈을 가지고 계신 분도 좋지만, 인공지능의 한계를 느끼고 좌절해 본 경험이 있으신 분을 더 좋아합니다.\n인공지능 전문가를 꿈꾸는 분도 좋지만, 인공지능도 쓸 줄 아는 개발자가 되고 싶으신 분을 더 좋아합니다.\n시키는 대로 열심히 하는 분도 좋지만, 왜 이렇게 하는지에 대해서 생각하는 분을 더 좋아합니다.\n특정 분야를 깊게 알고 계시는 분도 좋지만, 넓게 알고 계시는 분을 더 좋아합니다.\n시플릿독님 880900008데데데테테테티테테리어\n우리팀은 이렇게 ZR!\n우리는 시 모델의 데이터 수집부터 학습, 평가, 배포, 모니터링까지 자동화하며 시 모델 개발에 시간과 비용을 획기적으로 Fol\n는시스템을 개발합니다. 단순한 자동화를 넘어, 지속적으로 성능을 개선하고 운영 효율을 극대화할 수 있는 인프라를 만들며.\n다양한 시 프로젝트를 빠르게 실험하고 제품화하는데 집중하고 있습니다. 새로운 기술을 빠르게 도입하고, 협업과 BRE 중시\n하는 팀 문화 속에서 함께 성장할 분을 찾고 있습니다.\n우리는 이런분과 함께 일하고 싶어요!\nㆍ 관련분야실무 경력 10년 이상 또는 이에 준하는 개발 역량을 보유하신 분\nㆍ 웹서비스, 업무시스템, 플랫폼 또는 솔루션 개발 경험이 많으신 분\nㆍ 개발산출물 문서화 및 운영 이슈 대응 경험이 있으신 분\n+ 6기반협업개발 및 이슈 관리 경험이 있으신 분\n+ 데이터 관리, 접근 권한, 로그, 보안에 대한 기본 이해가 높으신 분\n+ 운영 환경에서 발생하는 문제를 분석하고 개선한 경험이 있으신 분\nIx 바\nㆍ 웹화면, API 215, 관리자 기능, 운영 화면 개발, 10년 이상 또는 이에 준하는 역량\nㆍ 웹 기반 관리 콘솔 화면 개발\n* 프로젝트 관리, 설정 관리, 등록/조회 화면 개발\nㆍ 프론트엔드와 백엔드 API IE\nㆍ 입력 검증, 상태 표시, 결과 화면 구성\n+ 대시보드, 관리자화면, 사용자 편의 기능 개선\n62피 …\n* React, Vue, Angular § 프론트엔드 프레임워크 개발 경험이 있으신 분\n+ 13035010[또는 TypeScript Hg 경험이 있으신 분\n+ REST API 95 및 화면 상태 관리 경험이 있으신 분\nㆍ 관리자페이지, 대시보드, 업무 시스템 개발 경험이 있으신 분\n+ HTML, 655 기반 화면 구현 및 반응형 니 개발 경험이 있으신 분\nㆍ 백엔드 API 구조와데이터 흐름에 대한 이해도가 높으신 분\n* 공공기관프로젝트 수행 경험이 있으신 분\nㆍ 솔루션제품개발또는 상용화 경험이 있으신 분\nㆍ 제조, 의료, 품질 검사, 관제, 문서 인식 분야 프로젝트 경험이 있으신 분\n+ 대시보드, 관리자 시스템, 업무 자동화 시스템 개발 경험이 있으신 분\nㆍ 시모델을 실제 서비스 또는 업무 시스템에 적용한 경험이 있으신 분\n+ Docker 기반 개발, 테스트, 배포 경험이 있으신 분\n＊ 데이터 보안, 접근 권한, 감사 로그 관련 개발 경험이 있으신 분\n+ 제안서, RTA 정의서, 설계서 등 프로젝트 산출물 작성 경험이 있으신 분\nㆍ 운영중인 서비스의 장애 대응 및 성능 개선 경험이 있으신 분\n* 정규직 (수습 2개월)\nㆍ 주5일\nㆍ 유연근무제\n+ 코어타임중심(10:00 ~ 17:00)\n© 서울특별시 관악구 남부순환로 1802, 2충 (2호선 서울대입구역 4번출구, 도보 3분)\n© 서울특별시 강동구 상일로 6길 51, 3층\n… 괴 바ㅠ\n> | i 베 | 3뱅레\n4 Tod | 【 가 이\nTT 「\n| k 고 : Eo\na 비 . 이 ~~ - al 할 이\n| 」 a IS pees\n\\1 ad 는 ey gm 개\n써로마인드는 구성원의 일상을 존중하여 코어타임 중심(10:00~ 17:00)의 자율 근무제를 운영하고 있습니다.\n스스로 각 프로젝트의 주체가 되어 권한 내에서 자율적으로 판단하여 주도적으로 업무를 이끌어 나갈 수 있습니다\n점심과 저녁 식사 제공됩니다. 저녁 식사는 야근자에 한해(식사 이후 1시간 이상) 제공합니다.\n눈치보지 않고 언제든 사용할 수 있습니다.\n서류전형 기술면접 컬처핏 면접 최종합격\n** 포트폴리오, GitHub 링크 제출시 가산점 **\nㆍ 채용사이트 온라인 접수\n* 이력서 (자유양식)\n© 경력기술서\nㆍ 참여프로젝트상세내역\n© 본인담당역할 및 사용 기술 명시\nㆍ 포트폴리오 또는 GitHub 링크 선택 제출\n* 상시채용\n＊ 합격자개별 공지\n© 면접일정은 서류 합격자에한해 수시로 개별 연락드립니다.\n© 서류전형시 제출하신 자료는 반남되지 않습니다.\n+ 허위사실이 발견될 경우 채용이 취소됩니다."}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54206219',
  '(주)써로마인드',
  '(주)써로마인드 AI플랫폼팀 개발자 및 비전모델러 채용 공고',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54206219',
  'FULLSTACK',
  '서울 관악구 외',
  'EXPERIENCED',
  '정규직',
  '학력무관',
  NULL,
  '2026-07-17 23:59:59',
  '백엔드/서버개발, 프론트엔드, API, OCR, AI(인공지능), PostgreSQL, JavaScript, TensorFlow, TypeScript, REST API, Node.js, MongoDB, Angular, PyTorch, Docker, OpenCV, Python',
  '1. 메인 타이틀 및 기업 소개
SURROMIND (써로마인드)

전직군 상시채용 중

도전이 일상이 되고, 실패는 배움이 되는 곳, 써로마인드와 함께, 진짜 성장을 꿈꾸는 써로인을 찾습니다.

#Join our team_2026

Making AI, Your future starts here.
써로마인드는 국내 최고의 인공지능 핵심기술을 보유한 AI 전문 기업입니다. 좋아하는 것을 하는 것이 가장 큰 경력입니다. 써로마인드와 함께 인공지능의 꿈을 가지고 AI라는 혁신의 시대를 함께 나아갈 동료를 기다리고 있습니다.

써로마인드는?
국내 최고의 인공지능 핵심기술을 보유한 AI 전문기업으로, 다양한 파트너사와 다양한 R&D 과제 협력 등 AI 분야에서 활발히 성과를 내며 성장하고 있습니다.

어떻게 일하나요?
AI를 리딩하는 회사지만 사람이 먼저라는 기본 가치를 추구합니다. 잡담도 경쟁력이죠. 잡담을 통해 건강한 조직문화를 만들어가며 변화를 지향하면서 변하지 않는 본질에 집중합니다. 의사결정은 수직, 소통은 수평, 논의는 사실에 기반합니다. 내가 틀렸음을 인정할 때 조직은 발전한다고 생각합니다. 함께 일한 땐 일의 목적과 기간, 다른 업무에 대한 영향을 고민해요. 맥락을 공유하는 수고로움을 받아들여요.

어떤 사람을 원하나요?
인공지능에 대한 꿈을 가지고 계신 분도 좋지만, 인공지능의 한계를 느끼고 좌절해 본 경험이 있으신 분을 더 좋아합니다. 인공지능 전문가를 꿈꾸는 분도 좋지만, 인공지능도 쓸 줄 아는 개발자가 되고 싶으신 분을 더 좋아합니다. 시키는 대로 열심히 하는 분도 좋지만, 왜 이렇게 하는지에 대해서 생각하는 분을 더 좋아합니다. 특정 분야를 깊게 알고 계신 분도 좋지만, 넓게 알고 계신 분을 더 좋아합니다.

1. 메인 타이틀 및 기업 소개
SURROMIND (써로마인드)

전직군 상시채용 중

도전이 일상이 되고, 실패는 배움이 되는 곳, 써로마인드와 함께, 진짜 성장을 꿈꾸는 써로인을 찾습니다.

#Join our team_2026

Making AI, Your future starts here.
써로마인드는 국내 최고의 인공지능 핵심기술을 보유한 AI 전문 기업입니다. 좋아하는 것을 하는 것이 가장 큰 경력입니다. 써로마인드와 함께 인공지능의 꿈을 가지고 AI라는 혁신의 시대를 함께 나아갈 동료를 기다리고 있습니다.

써로마인드는?
국내 최고의 인공지능 핵심기술을 보유한 AI 전문기업으로, 다양한 파트너사와 다양한 R&D 과제 협력 등 AI 분야에서 활발히 성과를 내며 성장하고 있습니다.

어떻게 일하나요?
AI를 리딩하는 회사지만 사람이 먼저라는 기본 가치를 추구합니다. 잡담도 경쟁력이죠. 잡담을 통해 건강한 조직문화를 만들어가며 변화를 지향하면서 변하지 않는 본질에 집중합니다. 의사결정은 수직, 소통은 수평, 논의는 사실에 기반합니다. 내가 틀렸음을 인정할 때 조직은 발전한다고 생각합니다. 함께 일한 땐 일의 목적과 기간, 다른 업무에 대한 영향을 고민해요. 맥락을 공유하는 수고로움을 받아들여요.

어떤 사람을 원하나요?
인공지능에 대한 꿈을 가지고 계신 분도 좋지만, 인공지능의 한계를 느끼고 좌절해 본 경험이 있으신 분을 더 좋아합니다. 인공지능 전문가를 꿈꾸는 분도 좋지만, 인공지능도 쓸 줄 아는 개발자가 되고 싶으신 분을 더 좋아합니다. 시키는 대로 열심히 하는 분도 좋지만, 왜 이렇게 하는지에 대해서 생각하는 분을 더 좋아합니다. 특정 분야를 깊게 알고 계신 분도 좋지만, 넓게 알고 계신 분을 더 좋아합니다.

1. AI 플랫폼팀 소개 및 인재상 (수정됨)
우리 팀은 이렇게 일해요!
우리는 AI 모델의 데이터 수집부터 학습, 평가, 배포, 모니터링까지 자동화하며 AI 모델 개발에 시간과 비용을 획기적으로 줄이는 시스템을 개발합니다. 단순한 자동화를 넘어, 지속적으로 성능을 개선하고 운영 효율을 극대화할 수 있는 인프라를 만들며, 다양한 AI 프로젝트를 빠르게 실험하고 제품화하는데 집중하고 있습니다. 새로운 기술을 빠르게 도입하고, 협업과 공유를 중시하는 팀 문화 속에서 함께 성장할 분을 찾고 있습니다.

우리는 이런 분과 함께 일하고 싶어요! (인재상 변경)
우리는 기술보다 사람을 먼저 봅니다. 문제를 정확히 정의하고, 복잡한 것을 단순하게 풀어낼 줄 아는 개발자와 함께하고 싶습니다. 좋은 시스템은 한번에 완성되지 않습니다. 우리는 작은 결정 하나하나를 쌓아가며, 더 단단한 구조와 흐름을 만들어갑니다.

빠르게 변화는 트렌드 속에서도 제품의 본질과 구조를 꿰뚫는 시야를 갖고 계신 분

기술 스택보다 문제 해결 방식에 집중하시는 분

코드 한 줄이 시스템 전체에 미치는 영향을 생각하며 개발하시는 분

팀의 목표를 함께 고민하고, 더 나은 결정을 통해 함께 성장할 수 있으신 분

2. [직무] 풀 스택 개발
경력: 웹 화면, API 연동, 관리자 기능, 운영 화면 개발, 10년 이상 또는 이에 준하는 역량

업무내용

웹 기반 관리 콘솔 화면 개발

프로젝트 관리, 설정 관리, 등록/조회 화면 개발

프론트엔드와 백엔드 API 연동

입력 검증, 상태 표시, 결과 화면 구성

대시보드, 관리자 화면, 사용자 편의 기능 개선

지원자격 (★필수)

React, Vue, Angular 등 프론트엔드 프레임워크 개발 경험이 있으신 분

JavaScript 또는 TypeScript 개발 경험이 있으신 분

REST API 연동 및 화면 상태 관리 경험이 있으신 분

관리자 페이지, 대시보드, 업무 시스템 개발 경험이 있으신 분

HTML, CSS 기반 화면 구현 및 반응형 UI 개발 경험이 있으신 분

백엔드 API 구조와 데이터 흐름에 대한 이해도가 높으신 분

우대사항 (항목 추가)

공공기관 프로젝트 수행 경험이 있으신 분

솔루션 제품 개발 또는 상용화 경험이 있으신 분

제조, 의료, 품질 검사, 관제, 문서 인식 분야 프로젝트 경험이 있으신 분

대시보드, 관리자 시스템, 업무 자동화 시스템 개발 경험이 있으신 분

AI 모델을 실제 서비스 또는 업무 시스템에 적용한 경험이 있으신 분

Docker 기반 개발, 테스트, 배포 경험이 있으신 분

데이터 보안, 접근 권한, 감사 로그 관련 개발 경험이 있으신 분 (추가)

제안서, 요구사항 정의서, 설계서 등 프로젝트 산출물 작성 경험이 있으신 분 (추가)

운영 중인 서비스의 장애 대응 및 성능 개선 경험이 있으신 분 (추가)

3. [직무] 백엔드 개발 (신규 추가)
경력: 서버 API, 데이터베이스, 파일 관리, 실행 이력 관리 기능 개발, 10년 이상 또는 이에 준하는 역량

업무내용

서비스 API 및 서버 기능 개발

사용자, 프로젝트, 설정, 파일, 실행 이력 관리 기능 구현

데이터베이스 설계 및 쿼리 최적화

파일 업로드, 저장, 버전 관리 기능 구현

테스트 실행, 결과 저장, 로그 관리 기능 개발

배포 환경 구성 및 운영 안정화

지원자격 (★필수)

Java, Python, Node.js, Go 중 하나 이상 백엔드 개발 경험이 있으신 분

PostgreSQL, MySQL, MongoDB 등 데이터베이스 사용 경험이 있으신 분

REST API 설계 및 개발 경험이 있으신 분

파일 저장소, 배치 작업, 비동기 처리 경험이 있으신 분

Docker 등 컨테이너 기반 개발 또는 운영 경험이 있으신 분

Linux 서버 환경에서 서비스 운영 경험이 있으신 분

우대사항

공공기관 프로젝트 수행 경험이 있으신 분

솔루션 제품 개발 또는 상용화 경험이 있으신 분

제조, 의료, 품질 검사, 관제, 문서 인식 분야 프로젝트 경험이 있으신 분

대시보드, 관리자 시스템, 업무 자동화 시스템 개발 경험이 있으신 분

AI 모델을 실제 서비스 또는 업무 시스템에 적용한 경험이 있으신 분

Docker 기반 개발, 테스트, 배포 경험이 있으신 분

데이터 보안, 접근 권한, 감사 로그 관련 개발 경험이 있으신 분

제안서, 요구사항 정의서, 설계서 등 프로젝트 산출물 작성 경험이 있으신 분

운영 중인 서비스의 장애 대응 및 성능 개선 경험이 있으신 분

4. [직무] 프론트엔드 개발 (신규 추가)
경력: 웹 화면, 사용자 인터페이스, 대시보드, 화면 상태 관리 기능 개발, 10년 이상 또는 이에 준하는 역량

업무내용

웹 기반 관리 콘솔 및 대시보드 화면 개발

프로젝트, 설정, 등록, 조회, 결과 확인 화면 구현

사용자 입력 폼, 검증, 상태 표시, 알림 기능 개발

백엔드 API 연동 및 화면 데이터 흐름 구성

반응형 UI 및 운영자 중심의 사용성 개선

디자인 요구사항을 실제 화면 컴포넌트로 구현

지원자격 (★필수)

React, Vue, Angular 등 프론트엔드 프레임워크 개발 경험이 있으신 분

JavaScript 또는 TypeScript 기반 개발 경험이 있으신 분

HTML, CSS 기반 화면 구현 및 반응형 UI 개발 경험이 있으신 분

REST API 연동 및 비동기 데이터 처리 경험이 있으신 분

상태 관리, 폼 처리, 테이블, 필터, 대시보드 화면 개발 경험이 있으신 분

관리자 페이지 또는 업무 시스템 화면 개발 경험이 있으신 분

우대사항

공공기관 프로젝트 수행 경험이 있으신 분

솔루션 제품 개발 또는 상용화 경험이 있으신 분

제조, 의료, 품질 검사, 관제, 문서 인식 분야 프로젝트 경험이 있으신 분

대시보드, 관리자 시스템, 업무 자동화 시스템 개발 경험이 있으신 분

AI 모델을 실제 서비스 또는 업무 시스템에 적용한 경험이 있으신 분

Docker 기반 개발, 테스트, 배포 경험이 있으신 분

데이터 보안, 접근 권한, 감사 로그 관련 개발 경험이 있으신 분

제안서, 요구사항 정의서, 설계서 등 프로젝트 산출물 작성 경험이 있으신 분

운영 중인 서비스의 장애 대응 및 성능 개선 경험이 있으신 분

5. [직무] 비전 모델러 (신규 추가)
경력: 이미지 기반 모델 개발, 검증, 성능 개선, 운영 적용 지원, 10년 이상 또는 이에 준하는 역량

업무내용

이미지 기반 모델 개발 및 성능 개선

학습 데이터 구성, 전처리, 검증, 평가 수행

분류, 객체 탐지, 세그멘테이션, OCR 등 다양한 비전 모델 개발

서비스 적용을 고려한 모델 경량화 및 추론 속도 개선

모델 결과 분석 및 개선 방안 도출

개발된 모델의 운영 적용을 위한 입력/출력 기준 정리

개발팀과 협업하여 모델 적용 및 테스트 지원

지원자격 (★필수)

컴퓨터 비전 모델 개발 경험이 있으신 분

Python 기반 데이터 처리 및 모델 학습 경험이 있으신 분

PyTorch, TensorFlow, OpenCV 등 사용 경험이 있으신 분

이미지 분류, 객체 탐지, 세그멘테이션, OCR 중 하나 이상 경험이 있으신 분

모델 경량화, 최적화 또는 추론 성능 개선 경험이 있으신 분

여러 유형의 비전 모델을 목적에 맞게 비교·선정해본 경험이 있으신 분

학습 데이터 구성, 라벨링 기준, 성능 평가 지표에 대한 이해도가 높으신 분

모델 성능 저하 원인을 분석하고 개선한 경험이 있으신 분

우대사항

공공기관 프로젝트 수행 경험이 있으신 분

솔루션 제품 개발 또는 상용화 경험이 있으신 분

제조, 의료, 품질 검사, 관제, 문서 인식 분야 프로젝트 경험이 있으신 분

대시보드, 관리자 시스템, 업무 자동화 시스템 개발 경험이 있으신 분

AI 모델을 실제 서비스 또는 업무 시스템에 적용한 경험이 있으신 분

Docker 기반 개발, 테스트, 배포 경험이 있으신 분

데이터 보안, 접근 권한, 감사 로그 관련 개발 경험이 있으신 분

제안서, 요구사항 정의서, 설계서 등 프로젝트 산출물 작성 경험이 있으신 분

운영 중인 서비스의 장애 대응 및 성능 개선 경험이 있으신 분

6. 공통 사항 (신규 추가)
이런 분을 찾습니다!

관련 분야 실무 경력 10년 이상 또는 이에 준하는 개발 역량을 보유하신 분

웹 서비스, 업무 시스템, 플랫폼 또는 솔루션 개발 경험이 많으신 분

요구사항 분석, 기능 설계, 구현, 테스트, 배포 경험이 있으신 분

개발 산출물 문서화 및 운영 이슈 대응 경험이 있으신 분

Git 기반 협업 개발 및 이슈 관리 경험이 있으신 분

데이터 관리, 접근 권한, 로그, 보안에 대한 기본 이해가 높으신 분

운영 환경에서 발생하는 문제를 분석하고 개선한 경험이 있으신 분
4. 근무 환경
근무형태: 정규직 (수습 2개월)

업무시간: 주 5일, 유연 근무제, 코어타임 중심 (10:00 ~ 17:00)

회사위치: 서울특별시 관악구 남부순환로 1802, 2층 (2호선 서울대입구역 4번출구, 도보 3분)

근무위치: 서울특별시 강동구 상일로 6길 51, 3층

5. 복리후생
코어타임 중심 자율 근무제: 써로마인드는 구성원의 일상을 존중하여 코어타임 중심(10:00 ~ 17:00)의 자율 근무제를 운영하고 있습니다.

Self-Motivated: 스스로 각 프로젝트의 주체가 되어 권한 내에서 자율적으로 판단하여 주도적으로 업무를 이끌어 나갈 수 있습니다.

점심 & 저녁 식사 제공: 점심과 저녁 식사 제공됩니다. 저녁 식사는 야근자에 한해(식사 이후 1시간 이상) 제공합니다.

자유로운 연차 사용: 눈치보지 않고 언제든 사용할 수 있습니다.

[기타 지원 항목]
휴일 특근 연차 지원 / 포상 재량 휴가 지원 / 프리미엄 런치(화요일) / 안마의자 및 운동기구 / 교육비 지원

수평적인 분위기 / 자유로운 복장 / 사내 동호회 지원 / 애완동물 친화 / 창립기념일 휴무

카페테리아 & 휴게실 운영 / 무제한 간식 제공 / 정직원 전환 선물 / 생일 선물 / 출산 선물

자녀 초등학교 입학 선물 / 웰컴키트 제공 / 경조사 지원 / 워크샵 활동

6. 전형 절차 및 접수 방법
전형 절차
Step 1 서류전형 ➡️ Step 2 기술 면접 ➡️ Step 3 컬처핏 면접 ➡️ Step 4 최종 합격
** 포트폴리오, GitHub 링크 제출 시 가산점 **

제출서류 및 접수방법
접수처: 채용사이트 온라인 접수

제출서류

이력서 (자유양식)

경력기술서

참여 프로젝트 상세 내역

본인 담당 역할 및 사용 기술 명시

포트폴리오 또는 GitHub 링크 선택 제출

일정: 상시 채용

결과발표: 합격자 개별 공지
4. 근무 환경
근무형태: 정규직 (수습 2개월)

업무시간: 주 5일, 유연 근무제, 코어타임 중심 (10:00 ~ 17:00)

회사위치: 서울특별시 관악구 남부순환로 1802, 2층 (2호선 서울대입구역 4번출구, 도보 3분)

근무위치: 서울특별시 강동구 상일로 6길 51, 3층

5. 복리후생
코어타임 중심 자율 근무제: 써로마인드는 구성원의 일상을 존중하여 코어타임 중심(10:00 ~ 17:00)의 자율 근무제를 운영하고 있습니다.

Self-Motivated: 스스로 각 프로젝트의 주체가 되어 권한 내에서 자율적으로 판단하여 주도적으로 업무를 이끌어 나갈 수 있습니다.

점심 & 저녁 식사 제공: 점심과 저녁 식사 제공됩니다. 저녁 식사는 야근자에 한해(식사 이후 1시간 이상) 제공합니다.

자유로운 연차 사용: 눈치보지 않고 언제든 사용할 수 있습니다.

[기타 지원 항목]
휴일 특근 연차 지원 / 포상 재량 휴가 지원 / 프리미엄 런치(화요일) / 안마의자 및 운동기구 / 교육비 지원

수평적인 분위기 / 자유로운 복장 / 사내 동호회 지원 / 애완동물 친화 / 창립기념일 휴무

카페테리아 & 휴게실 운영 / 무제한 간식 제공 / 정직원 전환 선물 / 생일 선물 / 출산 선물

자녀 초등학교 입학 선물 / 웰컴키트 제공 / 경조사 지원 / 워크샵 활동

6. 전형 절차 및 접수 방법
전형 절차
Step 1 서류전형 ➡️ Step 2 기술 면접 ➡️ Step 3 컬처핏 면접 ➡️ Step 4 최종 합격
** 포트폴리오, GitHub 링크 제출 시 가산점 **

제출서류 및 접수방법
접수처: 채용사이트 온라인 접수

제출서류

이력서 (자유양식)

경력기술서

참여 프로젝트 상세 내역

본인 담당 역할 및 사용 기술 명시

포트폴리오 또는 GitHub 링크 선택 제출

일정: 상시 채용

결과발표: 합격자 개별 공지
ㆍ 합격자개별 공지
+ 면접일정은 서류 합격자에 한해 수시로 개별 연락드립니다.
© MF HY A 제출하신 자료는 반납되지 않습니다.
+ 허위사실이 발견될 경우 채용이 취소됩니디',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"2232","name":"풀스택"},"listSummary":{"sectors":["백엔드/서버개발","프론트엔드","API","OCR","AI(인공지능)"],"careerText":"경력 10년↑ · 정규직","deadlineText":"D-2"},"processedSections":{},"detectedSkills":["PostgreSQL","JavaScript","TensorFlow","TypeScript","REST API","Node.js","MongoDB","Angular","PyTorch","Docker","OpenCV","Python"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/202201/27/r6d8xs_1uoc-1crpops_logo.png","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://pds.saramin.co.kr/recruit/recruit/202606/11/3880ae_2bb3-058d27_recruit.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":true,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://pds.saramin.co.kr/recruit/recruit/202606/11/3880ae_2bb3-058d27_recruit.png","text":"전직군상시채용 중\n도 선이 르 상이 El,\n실패는 배움이 되는 곳\nBERRIES | 함께 |\n진짜 서자으 꿈꾸는\n써로인\n써로마인드는 국내 최고의 인공지능 핵심기술을 보유한 AI 전문 기업입니다.\n좋아하는 것을 하는 것이 가장 큰 경력입니다.\n써로마인드와 함께 인공지능의 꿈을 가지고 시라는 혁신의 시대를 함께 나아갈 동료를 기다리고 있습니다.\n국내최고의 인공지능 핵심기술을 보유한 AI 전문기업으로, 다양한 파트너사와 다양한 RED 과제 협력 등 시 분야에서\n활발히 성과를 내며 성장하고 있습니다.\n어떻게 일하나요?\n세를 리딩하는 회사지만 사람이 먼저라는 기본 가치를 추구합니다.\n잡담도 경쟁력이죠. 잡담을 통해 건강한 조직문화를 만들어가며 변화를 지향하면서 변하지 않는 본질에 집중합니다.\n의사결정은 수직, 소통은 수평, 논의는 사실에 기반합니다. 내가 틀렸음을 인정할 때 조직은 발전한다고 생각합니다.\n함께 일한 땐 일의 목적과 기간, 다른 업무에 대한 영향을 고민해요. 맥락을 공유하는 수고로움을 받아들여요.\n어떤 ARE 원하나요?\n인공지능에 대한 BE 가지고 계신 분도 좋기만, 인공지능의 한계를 느끼고 좌절해 본 경험이 있으신 분을 더 좋아합니다.\n인공지능 전문가를 꿈꾸는 분도 좋지만, 인공지능도 쓸 줄 아는 개발자가 되고 싶으신 분을 더 좋아합니다\n시키는 대로 열심히 하는 분도 좋지만, 왜 이렇게 하는지에 대해서 생각하는 분을 더 좋아합니다.\n특정 분야를 깊게 알고 계시는 분도 좋지만, 넓게 알고 계시는 분을 더 좋아합니다.\n우리팀은 이렇게 wha!\n우리는시 모델의 데이터 수집부터 학습, 평가, 배포, 모니터링까지 자동화하며 시 모델 개발에 시간과 비용을 획기적으로 줄이\n는 시스템을 개발합니다. 단순한 자동화를 넘어, 지속적으로 성능을 개선하고 운영 효율을 극대화할 수 있는 인프라를 만들며,\n다양한 시 프로젝트를 빠르게 실험하고 제품화하는데 집중하고 있습니다. 새로운 기술을 빠르게 도입하고, UAH BRE 중시\n하는 팀 문화 속에서 함께 성장할 분을 찾고 있습니다.\n우리는 이런분과 함께 일하고 싶어요!\n우리는 기술보다 사람을 먼저 봅니다. 문제를 정확히 정의하고, 복잡한 것을 단순하게 풀어낼 줄 아는 개발자와 함께하고 싶습니\n다. 좋은 시스템은 한번에 완성되지 않습니다. 우리는 작은 결정 하나하나를 쌓아가며, 더 단단한 구조와 흐름을 만들어갑니다.\nㆍ 빠르게 변하는 트렌드 속에서도 제품의 본질과 구조를 WEE 시야를 갖고 계신 분\n+ 기술 스택보다문제 해결 방식에 집중하시는 분\n+ 코드한줄이 시스템 전체에 미치는 영향을 생각하며 개발하시는 분\n+ 팀의 SEE 함께 고민하고, 더 나은 결정을 통해 함께 성장할 수 있으신 분\nㆍ 웹화면, 연동, 관리자 기능, 운영 화면 개발, 10년 이상 또는 이에 준하는 역량\n* 웹 기반 관리 콘솔 화면 개발\nㆍ 프로젝트 관리, 설정 관리, 등록/조회 화면 개발\n* 프론트엔드와 백엔드 API US\n© 입력 검증, 상태 표시, 결과 화면 구성\n+ CHALE, 관리자 화면, 사용자 편의 기능 개선\n＊ React, Vue, Angular 등 프론트엔드 프레임워크 개발 경험이 있으신 분\n+ JavaScript E= TypeScript 7H 20] 있으신 분\nㆍ REST API 915 9 화면 상태 관리 경험이 있으신 분\n+ 관리자페이지, 대시보드, 업무 시스템 개발 경험이 있으신 분\n＊ HTML, CSS 기반화면 구현 및 반응형 니 개발 경험이 있으신 분\n+ 백엔드 API 구조와 데이터 흐름에 대한 이해도가 높으신 분\n+ 공공기관 프로젝트 수행 경험이 있으신 분\n+ 솔루션제품개발또는 상용화 경험이 있으신 분\n+ 제조, 의료, 품질 검사, 관제, 문서 인식 분야 프로젝트 경험이 있으신 분\n+ 대시보드, 관리자 시스템, 업무 자동화 시스템 개발 경험이 있으신 분\n© 시모델을 실제 서비스 또는 업무 시스템에 적용한 경험이 있으신 분\nㆍ Docker 기반 개발, 테스트, 배포 경험이 있으신 분\n+ 데이터 보안, 접근 권한, 감사 로그 관련 개발 경험이 있으신 분\n+ 제안서, 요구사항 정의서, 설계서 등 프로젝트 산출물 작성 경험이 있으신 분\n+ 운영중인 서비스의 장애대응 및 성능 개선 경험이 있으신 분\n+ 서버 API, 데이터베이스, 파일 관리, 실행 이력 관리 기능 개발, 10년 이상 또는 이에 준하는 역량\n+ 서비스 API 서버 기능 개발\n+ 사용자, 프로젝트, 설정,파일, 실행 이력 관리 기능 구현\nㆍ 데이터베이스 설계 및 쿼리 최적화\n* 파일 업로드, 저장, 버전 관리 기능 구현\nㆍ 테스트 실행, 결과 저장, 로그 관리 기능 개발\nㆍ 배포환경 구성 및 운영 안정화\n+ Java, Python, Node js, Go 중 하나 이상 백엔드 개발 경험이 있으신 분\n+ PostgreSQL, MySQL, MongoDB 등 데이터베이스 사용 경험이 있으신 분\n＊ REST API 207 및 개발 경험이 있으신 분\nㆍ 파일 저장소, 배치 작업, 비동기 처리 경험이 있으신 분\nㆍ Docker 등 컨테이너 기반 개발 또는 운영 경험이 있으신 분\n+ Linux Ae] 21014 서비스 운영 경험이 있으신 분\n* 공공기관 프로젝트 수행 경험이 있으신 분\nㆍ 솔루션제품개발또는 상용화 경험이 있으신 분\n+ 제조,의료,품질 검사, 관제, 문서 인식 분야 프로젝트 경험이 있으신 분\n+ 대시보드, 관리자 시스템, 업무 자동화 시스템 개발 경험이 있으신 분\n＊ 시모델을 실제 서비스 또는 업무 시스템에 적용한 경험이 있으신 분\n＊ Docker 기반 개발, 테스트, HIE 경험이 있으신 분\n+ 데이터 보안, 접근 권한, 감사 로그 관련 개발 경험이 있으신 분\n+ 제안서, 요구사항 정의서, 설계서 등 프로젝트 산출물 작성 경험이 있으신 분\n+ 운영중인서비스의장애대응 및 성능 개선 경험이 있으신 분\nㆍ 웹화면, 사용자 인터페이스, 대시보드, 화면 상태 관리 기능 개발, 10년 이상 또는 이에 준하는 역량\n＊ 웹기반관리콘솔 및 대시보드 화면 개발\nㆍ 프로젝트, 설정, 등록, 조회, 결과 확인 화면 구현\n＊ 사용자입력 폼, 검증, 상태 표시, 알림 기능 개발\n+ 백엔드 API 연동 및 화면 데이터 흐름 구성\n+ 반응형니및 운영자 중심의 사용성 개선\n+ 디자인 요구사항을 실제 화면 컴포넌트로 구현\n* React, Vue, Angular § 프론트엔드 프레임워크 개발 경험이 있으신 분\n+ 1843501[(또는 7/0650110기반 개발 경험이 있으신 분\n+ HTML, 655 기반 화면 구현 및 반응현 니 개발 경험이 있으신 분\n+ REST API 215 및 비동기 데이터처리 경험이 있으신 분\n+ 상태관리,폼처리, 테이블, 필터, 대시보드 화면 개발 경험이 있으신 분\n+ 관리자페이지 또는 업무 시스템화면 개발 경험이 있으신 분\n+ 공공기관 프로젝트 수행 경험이 있으신 분\n© 솔루션제품개발 또는 상용화 경험이 있으신 분\n* 제조, 의료, 품질 검사, 관제, 문서 인식 분야 프로젝트 경험이 있으신 분\n+ 대시보드, 관리자 시스템, 업무 자동화 시스템 개발 경험이 있으신 분\n© 시모델을 실제 서비스 또는 업무 시스템에 적용한 경험이 있으신 분\nㆍ Docker 기반 개발, 테스트, 배포 경험이 있으신 분\n+ 데이터 보안, 접근 권한, 감사 로그 관련 개발 경험이 있으신 분\n+ 제안서, 요구사항정의서, 설계서 등 프로젝트 산출물 작성 경험이 있으신 분\n+ 운영중인서비스의 장애대응 및 성능 개선 경험이 있으신 분\n+ 이미지 기반 모델 개발, 검증, 성능 개선, 운영 적용 지원, 10년 이상 또는 이에 준하는 역량\n+ 이미지 기반 모델 개발 및 성능 개선\n+ 학습데이터 구성, 전처리, 검증,평가 수행\n* 분류,객체탐지,세그맨테이션, OCR 등 다양한 비전 모델 개발\nㆍ 서비스 적용을 고려한 모델 경량화 및 추론 속도 개선\n＊ 모델 결과 분석 및 개선 방안 도출\n+ 개발된 모델의 운영 적용을 위한 입력/출력 기준 정리\n+ 개발팀과 협업하여 모델 적용 및 테스트 지원\n* 컴퓨터 비전 모델 개발 경험이 있으신 분\n+ Python 기반데이터처리 및 모델 학습 경험이 있으신 분\n+ PyTorch, TensorFlow, OpenCV 5 사용 경험이 있으신 분\n+ 이미지분류,객체탐지, 세그맨테이션, OCR 3 하나 이상 경험이 있으신 분\nㆍ 모델 경량화, 최적화 또는 추론 성능 개선 경험이 있으신 분\n+ 여러 유형의 비전 모델을 목적에 맞게 비교\nㆍ 선정해본 경험이 있으신 분\n+ 학습데이터 구성, 라벨링 기준, 성능 평가 지표에 대한 이해도가 높으신 분\n+ 모델성능저하원인을 분석하고 개선한 경험이 있으신 분\n+ 공공기관프로젝트 수행 경험이 있으신 분\nㆍ 솔루션제품 개발 또는 상용화 경험이 있으신 분\n+ 제조, 의료, 품질 검사, 관제, 문서 인식 분야 프로젝트 경험이 있으신 분\n+ 대시보드, 관리자 시스템, 업무 자동화 시스템 개발 경험이 있으신 분\n© 시모델을 실제서비스 또는 업무 시스템에 적용한 경험이 있으신 분\nㆍ Docker 기반 개발, 테스트, 배포 경험이 있으신 분\n+ 데이터 보안, 접근 권한, 감사 로그 관련 개발 경험이 있으신 분\n+ 제안서, 요구사항 정의서, 설계서 등 프로젝트 산출물 작성 경험이 있으신 분\n+ 운영중인서비스의장애대응 및 성능 개선 경험이 있으신 분\n+ 관련분야실무 경력 10년 OJ FE 이에 준하는 개발 역량을 보유하신 분\n© 웹서비스, 업무 시스템, 플랫폼 또는 솔루션 개발 경험이 많으신 분\n+ 요구사항분석,기능 설계, 구현, 테스트, 배포 경험이 있으신 분\n* 개발산출물문서화 및 운영 이슈 대응 경험이 있으신 분\n+ 야기반협업개발및 이슈관리 경험이 있으신 분\n+ 데이터 관리, 접근 권한, 로그, 보안에 대한 기본 이해가 높으신 분\n+ 운영 환경에서 발생하는 문제를 분석하고 개선한 경험이 있으신 분\n＊ 정규직 (수습 2개월)\nㆍ 주5일\nㆍ 유연근무제\n＊ 코어타임 중심 (10:00 ~ 17:00)\nLal Cc 서울특별시 관악구 남부순환로 1802, 2충 (2호선 서울대입구역 4번출구, 도보 3분)\nfs ” 17 \\ ck Sy\nT= |\" — i/o. ay TS 두 A 3\n탭 YC Pi i 말이 Vg\n“이 cg] —_ { 0 나가 고\n) hb RE’; J\n텔 = - hades (108\n| [1 | h— = ara hms iT\n3 ~ -…… 로 나서\n코어타임 중심 자율 근무제\n써로마인드는 구성원의 일상을 존중하여 코어타임 중심(10:00~ 17:00)의 자율 근무제를 운영하고 있습니다.\n스스로 각 프로젝트의 주체가 되어 권한 내에서 ABHOR 판단하여 주도적으로 업무를 이끌어 나갈 수 있습니다.\n점심 & 저녁 식사 제공\n점심과 저녁 식사 제공됩니다. 저녁 식사는 야근자에 한해(식사 이후 1시간 이상) 제공합니다.\n자유로운 연차 사용\n눈치보지 않고 언제든 사용할 수 있습니다.\n휴일 52 연차 지원 | 포상 자량 휴가지원 [ll 프리미엄 런치(화요일) [ll 안마의자 및 운동기구\n수평적인 분위기 사내 동호회 지원 [ll 애완동물친화 Jl 창립기념일 휴무\n카페테리아 & 휴게실 운영 |를 무제한 간식 제공 [를 정직원 전환 선물 [를 생일 선물 를 출산 선물\n자녀 초등학교 입학 선물 [를 웰컴키트 제공 를 경조사 지원 를 워크샵 활동\n» > Bo» 즐\n서류전형 기술면접 컬처핏 면접 최종 합격\n** 포트폴리오, GitHub 링크 제출시 가산점 **\n축서류 및 접스방법\n제출서류 및 접수방법 _———\nㆍ 채용사이트 온라인 접수\nGLA. 이력서(자유양식)\nㆍ 경력기술서\nㆍ 참여프로젝트 상세 내역\n© 본인담당역할및 사용 기술 명시\nㆍ 포트폴리오 또는 GitHub 링크 선택 제출\nㆍ 합격자개별 공지\n+ 면접일정은 서류 합격자에 한해 수시로 개별 연락드립니다.\n© MF HY A 제출하신 자료는 반납되지 않습니다.\n+ 허위사실이 발견될 경우 채용이 취소됩니디"}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54421882',
  '(주)씨넷',
  '[부산] 연구소 개발자 채용(C++ 응용SW/Java·Spring 웹 풀스택)',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54421882',
  'FULLSTACK',
  '부산 영도구',
  'EXPERIENCED',
  '정규직',
  '대학교(4년)↑',
  NULL,
  NULL,
  '백엔드/서버개발, 웹개발, C++, Java, MFC, Spring, Linux, Java, MFC, C++, Git, Fullstack',
  '부산]연구소 개발자 채용 /
C++ 응용 SW / Java-Spring 웹 풀스택 /

모집분야 (1)

담당업무 | 응용소프트웨어개발
지원자격 | 
C++ 개발경력(2년이삼)
멀티쓰레드,비동기처리경험
소켓통신,시리얼통신경험
4년제 대졸이삼
우대사항 | 
MFC 개발경험
Git 등을 통한 협업 가능하신 분
Linux DS 환경에서 개발 경험이 있으신 분
컴퓨터공학(4년제)전공하신 분
정보처리기사 자격증 보유
운전 가능자

모집분야 (2)

담당업무 | 조선-해양도메인 데이터 플랫폼 및 웹 서비스 풀스택개발
지원자격 | 
웹 개발 실무 경력 2년 이상(혹은 그에 준하는 역량 보유자)
Java, Spring Boot 기반의 RESTful API 설계 및 개발 능력
프론트엔드 프레임워크를 활용한 화면 개발 경험(React, Vue.js 등)
RDBMS(예:PostgreSQL, MySQL)에 대한 이해와 SQL 활용 능력
Git을 활용한 브랜치 관리 &코드 리뷰 기반의 협업 경험
4년제 대졸 이상(또는 그에 준하는 실무 경력)
우대사항 | 
A를 활용한 생산성 향상에 관심이 많으신 분
Linux DS& Docker 환경에서의 개발/운영 경험이 있으신 분
DevOps, CI/CO 파이프라인 구축 및 운영 경험이 있으신분
Cloud(예: Azure, AWS, GCP) 컴퓨팅 서비스 경험이 있으신 분
대용량 데이터 처리나 성능개선의 경험이 있으신 분
운전 가능자

근무조건
ㆍ 근무형타(점규직(수습기간-3개월)
ㆍ 근무일시:주5일(월~금)오전8시30 ~ 오후5시 30] 30(팀별 일부 상이)
ㆍ 급여:회사내규에따름 (섬과급:경영상황 및 개인섬과에따라차등지급)
ㆍ 근무쟈 부산시 영도구 절영로 542 (주)씨넷

채용 절차
서류전형 >> 면접진행 >> 처우협의 >> 최종합격
접수 방법 
ㆍ 접수기간:하기접수기간참고 /
ㆍ 접수방법: 사람인 입사지원 /
ㆍ 이력서양식: 사람인 온라인 이력서
기타 사항
-입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될수 있습니다.
-채용 조건은 채용전형 과정에서 협의에따라 변경될수 있습니다.
-문의처: management@sea—net.co.kr

복리후생 /
사내급식 : 사내급식 및 중공업 식사 지원 
축하금지급 : 생일 축하금 / 칭찬 사원 / 모범사원 축하금  
교육비지원 : 사내외 교육비,도서, 온라인 교육지원
자유로운 연차 : 30분단위조퇴 가능, 짐검다리휴일눈치 NO
  
육아지원 : 자녀입학및돌축하금 육아보조금,육아휴직
사내동호회 :  풋살,골프, 볼링 등 동호회 홀동비 지급
장기근속자 : 장기근속 5년부터 포상금 및 포상휴가 지원
경조사지원 : 결혼, 상(喪), 칠순 등 경조사비 및 경조휴가 지원

SEANET 은
인성, 도전, 봉사, 글로벌한
여러분을 기다립니다.
“EVERYTHING WE SEE” “EVERYTHING WE SECURE" “EVERYTHING WE TALK”
스마트하고친환령적이며 경제적인 스마트십 솔루션 /
원격선박관리 통합솔루션
선박정보 모니터링 솔루션

" EVERYTHING WE SECURE”
가장안전하고완벽한 사이버 보안 솔루션
사이버보안 Solution 공급
시스템 사이버보안 컨설팅
신조선 사이버보안 용역
운항선 보안취약점 진단

"EVERYTHING WE TALK”
선박함해 통신 전문가들이 제안하는 최적의 솔루션
항해통신솔루션 SEATALK을 통해 우리는 소통의 벽을 극복할 수 있습니다.
UHF Y-Solution, VSAT, IRIDIUM, GMDSS 등
극복할수있습니다 들 ~ 모든통신 솔루션을 선박 내·외부로의 모든 통신 솔루션을 제공합니다.',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"2232","name":"풀스택"},"listSummary":{"sectors":["백엔드/서버개발","웹개발","C++","Java","MFC"],"careerText":"경력 2년↑ · 정규직","deadlineText":"채용시"},"processedSections":{"담당업무":"*＊조선-해양도메인 데이터 플랫폼 및 웹 서비스 풀스택개발 *웹개발 실무 겸력근년 이상(축은 그에준하는 역량 보유자) « Java, Spring Boot 7|812] RESTful API 41H] 2 JHE 58 지원자격 *프론트엔드 프레임워크를 활용한 화면 JL HE(React, Vue js 등) + ROBMS(0ik PostgreSQL, MySQL CHS! jolie} SOL 활룡능력 - GitS 활용한 브랜치 22] s TE 리뷰 기반의 Sg HE *＊4년제대졸이상(또는 그에준하는 실무 경력) *시를활용한 생산성 향삼에관심이많으신분 *니00ㅁ6680ㅁ0ㅁㅁ<6「환경에서의 개발/문영경험이있으신분 우대사항 ＊ㅁ8\\ㅁ65,미/0ㅁ0파이프라인구축및운영겸험이있으신분 *미048(야스2466,^0/55 GCP) 컴퓨팅 서비스 경험이있으신분 *대용량 데이터 처리나 성능개선의 경험이 있으신분 *문전가능자 / 33 J) 7] “| | 내","근무조건":"ㆍ 근무형타(점규직(수습기간-3개월)ㆍ 근무일시:주5일(월~금)오전8시30 ~ 2S 5A] 30(팀별 일부 상이)ㆍ 급여:회사내규에따름 (섬과급:경영상황 및 개인섬과에따라차등지급)ㆍ 근무쟈 부산시 SET HEE 542 FM 채용 절차 서류전형 처우협의 최종합격 접수 방법 /ㆍ","복리후생":"/ jo! 9 & = / =: 사내급식 축하금지급 교육비지원 자유로운 연차 99 사내급식및 생일 축하금 / 칭찬 사원 / 사내외 교육비, 30분단위조퇴 가능, < 중공업식사지원 모범사원 축하금 도서, 온라인 교육지원 짐검다리휴일눈치비이 4 d ㅇ 86 ; 000 A & 스스 % 육아지원 사내동호회 장기근속자 경조사지원 자녀입학및돌축하금 풋살, ZO EAS 잠기근속5년부터 결혼 aE) Ess 육이보조금,육아휴직 동호회 출동비 지급 포상금 및 포상휴가 지원 경조사비 및 경조휴가지원 SEANET 은 인성, 도전, 봉사, 글로벌한 여러분을 기다립니다. Pa a {sees Games sea N= ~— = “EVERYTHING WE SEE” “EVERYTHING WE SECURE\" “EVERYTHING WE TALK” \"EVERYTHING WE SEE\" / 스마트하고친환령적이며 경제적인 스마트십 솔루션 / = ow, / 33 원격선박관리 2 은술 선박정보 ou 통합솔루션 \\, SE ES 모니터링 솔루션 이 Veg po ATT 300 이 NN ㅣ (7 | A * EVERYTHING WE SECURE” 가장안전하고완벽한 사이버 보안 솔루션 사이버보안 Pe pa Solution 22 oni = SEACURE =e ~ A menses ~ 사이버보안 ~~ a 사이버보안 컨설팅 용역 \"EVERYTHING WE TALK” 선박함해 통신 전문가들이 제안하는 최적의 솔루션 UHF Y-Solution, 항해통신솔루션 VSAT, IRIDIUM, SEATALKE =i GMDSSE 우미는소통의벽을 seal 선박내외부로의 극복할수있습니다 들 ~ 모든통신 솔루션을 제공합니다. Onshore Control Center / 26555. )6 r= / FR 하지 . 기 si = / \" 622 Ta 계통 i — ㅣ| [ — Ce Gl ㅣ 4 는 | / 9 en 0 aS oy 이 “TS 2 CX] | \\ — A 2 를 2, i 2 Offshore Simulation Center pis 3 | J Fal I} Ea ee ede EE | — — | = \"은 Es = =_=ㅡ->-에 { | =m) El 3 » = -= , | SE Cy ae 무기 po = 1 수 7 A - ~ 3 | MARINEPLANET 가"},"detectedSkills":["Spring","Linux","Java","MFC","C++","Git","Fullstack"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/201608/23/occcxb_164w-1evz2yg_logo.png","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://i.ifh.cc/R1zB72.jpg"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":true,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://i.ifh.cc/R1zB72.jpg","text":"부산]연구소 개발자 채용 /\nC++ 3&8 5SW / Java-Spring &l SAEH /\n> 모집분야 (1)\n| == *응용소프트웨어개발\n« C++ 개발경력(ㅇ년이삼)\n지원자격 *멀티쓰레드,비동기처리경험\n*소켓통신,시리얼통신경험\n*4년제대졸이삼\n«MFC HL ES\n*＊등을통한협업가능하신분\n- « Linux 0S 환경에서 개발경험이있으신분\n*정보처리기사자격증보유\n*문전가능자\n모집분야 (2)\n\n담당업무 *＊조선-해양도메인 데이터 플랫폼 및 웹 서비스 풀스택개발\n*웹개발 실무 겸력근년 이상(축은 그에준하는 역량 보유자)\n« Java, Spring Boot 7|812] RESTful API 41H] 2 JHE 58\n지원자격 *프론트엔드 프레임워크를 활용한 화면 JL HE(React, Vue js 등)\n+ ROBMS(0ik PostgreSQL, MySQL CHS! jolie} SOL 활룡능력\n- GitS 활용한 브랜치 22] s TE 리뷰 기반의 Sg HE\n*＊4년제대졸이상(또는 그에준하는 실무 경력)\n*시를활용한 생산성 향삼에관심이많으신분\n*니00ㅁ6680ㅁ0ㅁㅁ<6「환경에서의 개발/문영경험이있으신분\n\n우대사항 ＊ㅁ8\\ㅁ65,미/0ㅁ0파이프라인구축및운영겸험이있으신분\n*미048(야스2466,^0/55 GCP) 컴퓨팅 서비스 경험이있으신분\n*대용량 데이터 처리나 성능개선의 경험이 있으신분\n*문전가능자 /\n내 근무조건\nㆍ 근무형타(점규직(수습기간-3개월)\nㆍ 근무일시:주5일(월~금)오전8시30 ~ 2S 5A] 30(팀별 일부 상이)\nㆍ 급여:회사내규에따름 (섬과급:경영상황 및 개인섬과에따라차등지급)\nㆍ 근무쟈 부산시 SET HEE 542 FM\n채용 절차\n서류전형 처우협의 최종합격\n접수 방법 /\nㆍ 접수기간:하기접수기간참고 /\nㆍ 접수방법: 사람인 입사지원 /\n2\nㆍ 이력서양식: 사람인 온라인 이력서\n9 기타 사항\n“ 0\n-입사지원 서류에 허위사실이 발견될 경우, HSE 이후라도 채룡이 취소될수 있습니다.\n-채용 조건은 MEE 과정에서 협의에따라 변경될수 있습니다.\n-29IA;: management{@sea—net. cokr\n복리후생 /\n=: 사내급식 축하금지급 교육비지원 자유로운 연차\n99 사내급식및 생일 축하금 / 칭찬 사원 / 사내외 교육비, 30분단위조퇴 가능,\n< 중공업식사지원 모범사원 축하금 도서, 온라인 교육지원 짐검다리휴일눈치비이\nd ㅇ 86 ;\nA & 스스 %\n육아지원 사내동호회 장기근속자 경조사지원\n자녀입학및돌축하금 풋살, ZO EAS 잠기근속5년부터 결혼 aE) Ess\n육이보조금,육아휴직 동호회 출동비 지급 포상금 및 포상휴가 지원 경조사비 및 경조휴가지원\nSEANET 은\n인성, 도전, 봉사, 글로벌한\n여러분을 기다립니다.\n“EVERYTHING WE SEE” “EVERYTHING WE SECURE\" “EVERYTHING WE TALK”\n스마트하고친환령적이며 경제적인 스마트십 솔루션 /\n33 원격선박관리 2 은술 선박정보\nou 통합솔루션 \\, SE ES 모니터링 솔루션\n이 Veg po ATT 300\n이 NN\n* EVERYTHING WE SECURE”\n가장안전하고완벽한 사이버 보안 솔루션\n사이버보안 Pe pa\n사이버보안 ~~ a 사이버보안\n컨설팅 용역\n\"EVERYTHING WE TALK”\n선박함해 통신 전문가들이 제안하는 최적의 솔루션\n항해통신솔루션 VSAT, IRIDIUM,\n우미는소통의벽을 seal 선박내외부로의\n극복할수있습니다 들 ~ 모든통신 솔루션을\n제공합니다.\nFR 하지 . 기 si = /\n\" 622 Ta 계통 i —\n이 “TS 2\nA 2 를 2, i 2\nee ede EE | — —\n| = \"은 Es = =_=ㅡ->-에 { | =m) El\n무기 po\n= 1 수 7"}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '51067920',
  '(주)코딧',
  '앱 개발자 (React Native, 2년 이상)',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=51067920',
  'MOBILE',
  '서울 영등포구',
  'EXPERIENCED',
  '정규직',
  '학력무관',
  NULL,
  NULL,
  '앱개발, CSS, HTML, Javascript, React, React Native, JavaScript, React, HTML, CSS',
  '2026 
  앱개발자
(React Native, 2년 이상) 채용
CODIT 입법-규제 데이터를 실시간으로 분석하는 AI 기반 Gov Tech 플랫폼입니다.
한국과 미국에서 총 16건의 특허를 보유하고 있으며 LLM 기반 법안 분석 및 맞춤형
법안 인사이트 제공 기술 관련 특허를 확보했습니다.
한국-미국. 일본 등 주요 시장의 입법-규제 데이터를 기반으로, 국내외 이해관계자가
글로벌 규제 리스크를 체계적으로 관리하고 전략적 의사결정을 내릴 수 있도록 맞춤형
정책 인사이트를 제공합니다. 또한 대한민국 중앙부처 및 국책 연구기관과 협력하며
다양한 정책 프로젝트를 수행하고 있습니다.
CODIT 글로벌정책실증연구원은 입법-행정. 산업 전반의 정책 전문성을 바탕으로
기업의 정책 대응을 지원하는 민간 정책 연구기관입니다. AI, ESG, 헬스케어·제약,
외교통상 등 주요 정책 현안에 대한 이슈페이퍼 발간과 정책 간담회를 통해 공공과
민간의 협력을 촉진하고 있습니다. 현재 대만, 미국, 일본, 싱가포르, 홍콩 등 주요
글로벌 시장에서 빠르게 사업을 확장하고 있으며, 성장하는 GovTech 플랫폼에서
정책과 기술이 만나는 지점의 변화를 함께 만들어갈 분을 기다립니다.

CODIT의 Core Value
Solve Problems 문제를 발견하고 끝까지 해결합니다
High Ownership 일을 Y= 것을 넘어 스스로 이끌어 갑니다
Transparency 숨기지않고 투명하게 공유합니다
Persistence 쉽게 포기하지 않고, 짐요하게 한번 더 파고듭니다
Collaboration across Boundaries 경계를 넘는 협업을 만듭니다 
Customer Centric 고객의 문제를 우리의 문제처럼 대합니다

프론트엔드 개발자
인재를 지금 모집 중입니다!

CODIT 프론트엔드팀에 대하여
코딧 플랫폼의 웹-모바일-앰 서비스를 개발하며 사용자에게 안정적이고 효율적인 서비스 경험을 제공
하는 역할을 합니다. ReactJS 기반으로 코딧서치 웹 서비스와 내부 관리자 페이지를 개발하고, 서비스
운영 과정에서의 개선과 고도화에 지속적으로 참여합니다. 또한 프론트엔드 구조와 성능을 발전시켜
서비스의 안정성과 운영 효율을 높이며, 코딧 플랫폼이 원활하게 작동할 수 있도록 제품 완성도를
높이는 데 기여하는 팀입니다.

담당 업무
코딧 앱을 React Native, Expo로 개발
코딧 서치(Web)를 React로 개발
Framer, Storybook 등의 최신 플랫폼을 이용한 Codit Design System 개발

자격 조건
React Native를 이용한 앱개발 경험 2년 이상이신 분
· JavasScript(ES6 이상), CSS, HTML에 대한 이해가 깊으신 분
·Javascript, Typescript, React, Webpack, Babel, Recoil 등에 대한
실무 업무 경험이 있으신 분
· Git를 사용하고 이를 통한 협업에 능숙하신 분

우대 조건 
4년제 대학 졸업(학사) 이상의 학력을 보유하신 분
Expo를 이용해서 React Native 앱을 빌드하고 론칭한 경험이 있으신
원활한 의사소통 역량을 갖추신 분
적극적으로 서비스 개선에 필요한 업무를 찾고 실행하실 수 있는 분
TypeScript 사용 및 테스트 코드(Jest, Jasmine, Mocha 등) 작성 경험이 있으신 분
코드 품질 향상을 위한 최적화와 리팩토링을 고민하시는 분
프론트엔드 성능 최적화 경험이 있으신 분
생산성과 서비스 퍼포먼스 향상을 위한 개발 언어-도구에 관심과 적응력이 있으신 분
영어로 작성된 개발 문서를 읽고 이해하실 수 있으신 분

제출 서류 
- 이력서 및 자기소개서 (필수)
- 포트폴리오 (선택)

참고 사항 
- 코딧과 장기적으로 함께할 분을 찾고 있습니다.

채용절차
서류전형 >> 코딩 및 과제 테스트 >> 온라인 면접 >> 대면면접 >> 최종합격

ㆍ 포지션에 따라 전화 인터뷰가 진행될 수 있습니다.
ㆍ 필요 시, 레퍼런스 체크가 진행될 수 있습니다.
ㆍ 경력직 지원자 대상으로 처우 협의가 진행됩니다.

복리후생 및 근무환경
4대 보험
자유로운 복장
시간 단위 연차
무제한 간식 제공
사내 행사 진행
수평적 ''님'' 문화
중식·석식 지원
',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"86","name":"앱개발"},"listSummary":{"sectors":["앱개발","CSS","HTML","Javascript","React"],"careerText":"경력 2년↑ · 정규직","deadlineText":"채용시"},"processedSections":{"복리후생":"및 근무환경 EES 개 BE 는 [SE / / — > sl: - 해 | ㅣ Lr ay 1 i’ | ㅣ ad por 1: = |: LS EN lS","채용절차":"ㆍ 포지션에 따라 전화 인터뷰가 진행될 수 있습니다. 필요 시, 레퍼런스 체크가 진행될 수 있습니다.ㆍ 경력직 지원자 대상으로 처우 협의가 진행됩니다. =H DO os 복리후생 및 근무환경 EES 개 BE 는 [SE / / — > sl: - 해 | ㅣ Lr ay 1 i’ | ㅣ ad por 1: = |: LS EN lS"},"detectedSkills":["React Native","JavaScript","React","HTML","CSS"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/202309/01/s0ao08_g76o-v9cl36_logo.png","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://image.rivers.co.kr/files/2026-03-10/1773123525168/%EC%95%B1-%EA%B0%9C%EB%B0%9C%EC%9E%90-_2%EB%85%84-%EC%9D%B4%EC%83%81_-001.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":true,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://image.rivers.co.kr/files/2026-03-10/1773123525168/%EC%95%B1-%EA%B0%9C%EB%B0%9C%EC%9E%90-_2%EB%85%84-%EC%9D%B4%EC%83%81_-001.png","text":"2026 “eo\n본 개릴^\ni 녀 이삼 ]\n(React Native, 2년 이상) ''\nCODITE 입법-규제 데이터를 실시간으로 분석하는 시 기반 60ㅠ60!\" 플랫폼입니다.\n한국과 미국에서 총 16건의 특허를 보유하고 있으며 LLM 기반 법안 분석 및 맞춤형\n법안 인사이트 제공 기술 관련 특허를 확보했습니다.\n한국-미국. 일본 등 주요 시장의 입법-규제 데이터를 기반으로, 국내외 이해관계자가\n글로벌 규제 리스크를 체계적으로 관리하고 전략적 의사결정을 내릴 수 있도록 맞춤형\n정책 인사이트를 제공합니다. 또한 대한민국 중앙부처 및 국책 연구기관과 협력하며\n다양한 정책 프로젝트를 수행하고 있습니다.\nCODIT 글로벌정책실증연구원은 입법-행정. 산업 전반의 정책 전문성을 바탕으로\n기업의 정책 대응을 지원하는 민간 정책 연구기관입니다. 씨, 656, 헬스케어제약,\n외교통상 등 주요 정책 현안에 대한 이슈페이퍼 발간과 정책 간담회를 통해 공공과\n민간의 협력을 촉진하고 있습니다. 현재 대만, 미국, 일본, 싱가포르, 홍콩 등 주요\n글로벌 시장에서 빠르게 사업을 확장하고 있으며, 성장하는 60/160) 플랫폼에서\n정책과 기술이 만나는 지점의 변화를 함께 만들어갈 분을 기다립니다.\n어 - ㅡ 덜\nSolve Problems High Ownership Transparency\n문제를 발견하고 일을 Y= 것을 넘어 숨기지않고\n끝까지 해결합니다 스스로 이끌어 갑니다 투명하게 공유합니다\nPersistence Collaboration Customer Centric\n쉽게 포기하지 않고, across Boundaries 고객의 문제를\n짐요하게 한번 더 파고듭니다 경계를 넘는 협업을 만듭니다 우리의 문제처럼 대합니다\nㅇ 재를 |금 Xl 주인 | h\n인 들 시급 모 HSH LICH\nCODIT 프론트엔드팀에 대하여\nIN 플랫폼의 웹-모바일-앰 서비스를 개발하며 사용자에게 안정적이고 효율적인 서비스 경험을 제공\n하는 역할을 합니다. 8630[25 기반으로 FGIMK| 웹 서비스와 내부 관리자 페이지를 개발하고, 서비스\n운영 과정에서의 개선과 고도화에 지속적으로 참여합니다. 또한 프론트엔드 구조와 성능을 발전시켜\n서비스의 안정성과 운영 BES 높이며, IX 플랫폼이 원활하게 작동할 수 있도록 제품 완성도를\n높이는 데 기여하는 팀입니다.\n다다 업무 35 YE React Native, ExpoZ 개발\nOo 브ㅜㅠㅜ\nIS MX|(Web)E 863아로 개발\nFramer, Storybook 등의 최신 플랫폼을 이용한 000#2065190 System 개발\n자격 조거 -ReactNativeS 이용한 Het 경험 2년 이상이신 분\n+ JavasScript(ES6 이상), CSS, HTMLO] 대한 이해가 깊으신 분\n- JavaScript, Typescript, React, Webpack, Babel, Recoil 등에 대한\n실무 업무 경험이 있으신 분\n- GitE 사용하고 이를 통한 협업에 능숙하신 분\n우대 조건 . 4년제대학 졸업(학사) 이상의 학력을 보유하신 분 N\n- ExpoE O0|83liA React Native 2S 빌드하고 론칭한 경험이 있으신\n원활한 의사소통 역량을 갖추신 분\nㆍ 적극적으로 서비스 개선에 필요한 업무를 찾고 실행하실 수 있는 분\nㆍ TypeScript 사용 및 테스트 FE (Jest, Jasmine, Mocha 등) 작성 경험이 있으신 분\nㆍ 코드 품질 향상을 위한 최적화와 리팩토링을 고민하시는 분\nㆍ 프론트엔드 성능 최적화 경험이 있으신 분\nㆍ 생산성과 서비스 퍼포먼스 향상을 위한 개발 언어-도구에 관심과 적응력이 있으신 분\nㆍ 영어로 작성된 개발 EME 읽고 이해하실 수 있으신 분\n제출 서류 이력서 및 자기소개서 (필수)\n포트폴리오 (선택)\n참고 사항 IRI 장기적으로 함께할 분을 찾고 있습니다.\n\n채용절차\nㆍ 포지션에 따라 전화 인터뷰가 진행될 수 있습니다.\n필요 시, 레퍼런스 체크가 진행될 수 있습니다.\nㆍ 경력직 지원자 대상으로 처우 협의가 진행됩니다.\n복리후생 및 근무환경\nEES 개\nBE 는 [SE / /\n- 해 | ㅣ Lr ay 1 i’\n| ㅣ ad"}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54470743',
  '(주)예지솔루션',
  '데이터베이스 관리자/엔지니어 모집',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54470743',
  'DATA',
  '서울 금천구 외',
  'EXPERIENCED',
  '정규직',
  '학력무관',
  NULL,
  '2026-07-31 23:59:59',
  '데이터분석가, 데이터엔지니어, MySQL, SQL, 데이터 사이언티스트, MySQL, SQL',
  '데이터 엔지니어채용
예지 솔루션은 광고주, 광고 계정, 매체별 실적, 매출 통계 등 다양한 광고 데이터를 기반으로 사내 시스템을 운영하고 있습니다
현재 데이터 규모가 지속적으로 증가함에 뛰라 MySQL 기반 대용량 데이터를 안정적으로 처리하고, 쿼리 성능 및 데이터구조
를 개선할 수 있는 데이터 엔지니어를 모집합니다.
모집분야 데이터엔지니어(MySQL/SQL 튜닝/대용량 데이터 처리/NCP 운영)

주요업무 MySQL 기반 대용량데이터 처리 및 관리
광고주, 광고계정, 매체별 실적 데이터집계 및통계
SQL 쿼리 튜닝및 성능개선
인덱스 설계, 데이터 수집, 가공, 적재 프로세스 관리
배치성 데이터 처리 및 재처리 구조 관리
사내 데이터 시스템의 안정성 및 처리 속도 개선
NCP 기반서버및 DB운영

자격요건 관련경력 3년이상
대용량 데이터 처리 및 SQL 쿼리 작성 및 튜닝 가능자
인덱스 설계 및 실행계획 분석 경험자
Linux 서버 기본 사용 가능자
서버 로그 확인 및 기본장애 분석 가능자

우대사항 MySQL DBA 또는 DBA 성향의 업무 경험
대용량테이블 성능 개선 경험
배치 처리, 스케줄링, 데이터 재처리 구조 경험
광고, 커머스, CRM, ERP, 정산, 통계 시스템 데이터처리 경험
Python, PHP, Node.js 중 1개이상사용경험
관리자 페이지, 통계 대시보드, 리포트 시스템 개발 경험
데이터 정합성 검증 및 오류 데이터 보정 경험
사내 업무시스템 운영 및 개선 경험

사용환경 Database: MySQL
Data: 광고주 데이터, 광고계정 데이터, 매체별 실적 데이터, 매출 통계 데이터
개발/운영: SQL, 배치 처리, 데이터 집계, 서버 로그 확인, DB 성능 개선

근무조건 [고용형태] 정규직
[근무부서] 개발팀
[근무지] 서울특별시 금천구 가산디지털2로 166 3층(에이스1 K1타워}
[경력] 3년이상
[급여] 경력 및 역량에 따라 협의(접수 시 희망연봉 기재 필수)
[근무시간] 09:30~17:30(주 5일, 35시간)

제출서류 이력서, 경력기술서, 포트폴리오(선택), 희망연봉 기재필수
경력기술서에는 아래 경험을 중심으로 작성해 주시면 좋습니다.
- MySQL 쿼리 튜닝경험
- 대용량데이터처리경험
- 인덱스설계경험
- 통계/집계데이터처리 경험
- NCP 또는 클라우드 서버운영경험
- 장애분석및성능개선사례

채용절차 서류전형 > 실무면접 > 최종합격

### 섹션별 정리

| 구분 | 내용 |
|---|---|
| 주요업무 | MySQL 기반 대용량데이터 처리 및 관리 광고주, 광고계정, 매체별 실적 데이터집계 및통계 SQL 쿼리 튜닝및 성능개선 인덱스 설계, 데이터 수집, 가공, 적재 프로세스 관리 배치성 데이터 처리 및 재처리 구조 관리 사내 데이터 시스템의 안정성 및 처리 속도 개선 NCP 기반 서버 및 Linux 운영 |
| 자격요건 | 관련경력 3년이상 대용량 데이터 처리 및 SQL 쿼리 작성 및 튜닝 가능자 인덱스 설계 및 실행계획 분석 경험자 Linux 서버 사용 가능자 서버로그확인및 기본장애 분석가능자 |
| 우대사항 | MySQL DBA SEi= DBA 성향의 업무 경험 대용량테이블 성능 개선 경험 배치 처리, 스케줄링, 데이터 재처리 구조 경험 광고, 커머스, CRM, ERP, 정산, 통계 시스템 데이터처리 경험 NCP Cloud DB for MySQL Python, PHP, Node.js 중 1개이상사용경험 관리자 페이지, 통계 대시보드, 리포트 시스템 개발 경험 데이터 정합성 검증 및 오류 데이터 보정 경험 사내 업무시스템 운영 및 개선 경험 사용환경 Database: MySQL Infra: NCP 0S: Linux Data: 광고주 데이터, 광고계정 데이터, 매체별 실적 데이터, 매출 통계 데이터 개발/운영: SQL, 배치 처리, 데이터 집계, 서버 로그 확인, DB 성능 개선 |
| 근무조건 | [고용형태] 정규직 [근무부서] 개발팀 [근무지] 서울특별시 금천구 가산디지털2로 166 3층(에이스1 K1타워} [경력] 3년이상 [급여] 경력 및 역량에 따라 협의(접수 시 희망연봉 기재 필수) [근무시간] 09:30~17:30(주 5일, 35시간) 제출서류 이력서, 경력기술서, 포트폴리오(선택), 희망연봉 기재필수 경력기술서에는 아래 경험을 중심으로 작성해 주시면 좋습니다. - MySQL 쿼리 튜닝경험 - 대용량데이터처리경험 - 인덱스설계경험 - 통계/집계데이터처리 경험 - NCP 또는 클라우드 서버운영경험, 장애분석및성능개선사례 |
| 채용절차 | 서류전형 > 실무면접 > 최종합격 |',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"83","name":"데이터엔지니어"},"listSummary":{"sectors":["데이터분석가","데이터엔지니어","MySQL","SQL","데이터 사이언티스트"],"careerText":"경력 3년↑ · 정규직","deadlineText":"~07.31(금)"},"processedSections":{"주요업무":"MySQL 기반 대용량데이터 처리 및 관리 광고주, 광고계정, 매체별 실적 데이터집계 및통계 50! 쿼리 튜닝및 성능개선 인덱스 설계, 데이터 수집, 가공, 적재 프로세스 관리 배치성 데이터 처리 및 재처리 구조 관리 사내 데이터 시스템의 안정성 및 처리 속도 개선 NCP 기반서버및08운영","자격요건":"관련경력 3년이상 대용량 데이터 처리 및 SQL 쿼리 작성 및 튜닝 가능자 인덱스 설계 및 실행계획 분석 경험자 Linux A] 712 사용 가능자 서버로그확인및 기본장애 분석가능자","우대사항":"MySQL DBA SEi= DBA 성향의 업무 경험 대용량테이블 성능 개선 경험 배치 처리, 스케줄링, 데이터 재처리 구조 경험 광고, 커머스, CRM, ERP, 정산, 통계 시스템 데이터처리 경험 NCP Cloud DB for MySQL 2% 2g Python, PHP, Node js Z 1개이상사용경험 관리자 페이지, 통계 대시보드, 리포트 시스템 개발 경험 데이터 정합성 검증 및 오류 데이터 보정 경험 사내 업무시스템 운영 및 개선 경험 사용환경 Database: MySQL Infra: NCP 0S: Linux Data: 2115 데이터, 광고계정 데이터, 매체별 실적 데이터, 매출 통계 데이터 개발/운영: SQL, 배치 처리, 데이터 집계, 서버 로그 확인, DB 성능 개선","근무조건":"[고용형태] 정규직 [근무부서] 개발팀 [근무지] 서울특별시 금천구 가산디지털2로166 3층(에이스1<1타워} [경력] 3년이상 [B01] 경력 및 역량에 따라 협의(접수 시 희망연봉 기재 필수) [근무시간] 09:30~17.30(주 5일, 35시간) 제출서류 이력서, 경력기술서, 포트폴리오(선택), 희망연봉 기재필수 경력기술서에는 아래 경험을 SHOR 작성해 주시면 좋습니다.ㆍ MySQL 쿼리 튜닝경험 + 대용량데이터처리경험 - 인덱스설계경험 * 통계/집계데이터처리 경험 ＊ NCP 또는 클라우드 서버운영경험\nㆍ 장애분석및성능개선사례","채용절차":"서류전형 > 실무면접 > 최종합격 ee"},"detectedSkills":["MySQL","SQL"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/200807/31/1217489209_logo.jpg","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://pds.saramin.co.kr/recruit/recruit/202606/18/5f5a83_477d-cc74bc_recruit.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":true,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://pds.saramin.co.kr/recruit/recruit/202606/18/5f5a83_477d-cc74bc_recruit.png","text":"데이터 엔지니어채용\n예지솔루션은 광고주, 광고 계정,매체별 실적,매출통계등 다양한 광고 데이터를 기반으로 사내 시스템을 운영하고 있습니다\n현재데이터규모가지속적으로증가함에띠라\\/5@기반대용량데이터를안정적으로처리하고, 쿼리성능및 데이터구조\n를개선할수있는데이터엔지니어를 모집합니다.\n모집분야 데이터엔지니어(/80ㄴ/50튜닝/대용량데이터처리/40『 운영)\n\n주요업무 MySQL 기반 대용량데이터 처리 및 관리\n광고주, 광고계정, 매체별 실적 데이터집계 및통계\n50! 쿼리 튜닝및 성능개선\n인덱스 설계, 데이터 수집, 가공, 적재 프로세스 관리\n배치성 데이터 처리 및 재처리 구조 관리\n사내 데이터 시스템의 안정성 및 처리 속도 개선\nNCP 기반서버및08운영\n\n자격요건 관련경력 3년이상\n대용량 데이터 처리 및 SQL 쿼리 작성 및 튜닝 가능자\n인덱스 설계 및 실행계획 분석 경험자\nLinux A] 712 사용 가능자\n서버로그확인및 기본장애 분석가능자\n\n우대사항 MySQL DBA SEi= DBA 성향의 업무 경험\n대용량테이블 성능 개선 경험\n배치 처리, 스케줄링, 데이터 재처리 구조 경험\n광고, 커머스, CRM, ERP, 정산, 통계 시스템 데이터처리 경험\nPython, PHP, Node js Z 1개이상사용경험\n관리자 페이지, 통계 대시보드, 리포트 시스템 개발 경험\n데이터 정합성 검증 및 오류 데이터 보정 경험\n사내 업무시스템 운영 및 개선 경험\n사용환경 Database: MySQL\nData: 2115 데이터, 광고계정 데이터, 매체별 실적 데이터, 매출 통계 데이터\n개발/운영: SQL, 배치 처리, 데이터 집계, 서버 로그 확인, DB 성능 개선\n\n근무조건 [고용형태] 정규직\n[근무부서] 개발팀\n[근무지] 서울특별시 금천구 가산디지털2로166 3층(에이스1<1타워}\n[경력] 3년이상\n[B01] 경력 및 역량에 따라 협의(접수 시 희망연봉 기재 필수)\n[근무시간] 09:30~17.30(주 5일, 35시간)\n제출서류 이력서, 경력기술서, 포트폴리오(선택), 희망연봉 기재필수\n경력기술서에는 아래 경험을 SHOR 작성해 주시면 좋습니다.\nㆍ MySQL 쿼리 튜닝경험\n+ 대용량데이터처리경험\n- 인덱스설계경험\n* 통계/집계데이터처리 경험\n＊ NCP 또는 클라우드 서버운영경험\nㆍ 장애분석및성능개선사례\n\n채용절차 서류전형 > 실무면접 > 최종합격"}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54325930',
  '(주)위세아이텍',
  '엔드투엔드 AI·데이터 플랫폼 기업, 각 부문별 채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54325930',
  'DATA',
  '경기 과천시 외',
  'ANY',
  '정규직',
  '대학교(4년)↑',
  NULL,
  '2026-07-21 23:59:59',
  '데이터분석가, 데이터엔지니어, SI개발, 딥러닝, 머신러닝, JavaScript, Kubernetes, TensorFlow, TypeScript, OracleDB, PyTorch, Docker, jQuery, Spring, Vue.js, Linux, MySQL',
  '(주)위세아이텍
위세아이텍 신입 및 경력사원 모집
엔드투엔드 AI 데이터 플랫폼 기업, 각 부문별 인재 채용
1990년 설립된 (주)위세아이텍은 엔드투엔드 AI 데이터 플랫폼 기업으로 AI 데이터 거버넌스 시장을 주도하고 있습니다.
독보적인 기술력을 바탕으로 기업과 기관의 인공지능 전환(AX) 및 디지털 전환(DX)을 선도하는 국내 최고의 데이터 전문
파트너입니다.
1998년 BI 제품 개발을 시작으로 메타데이터 관리 솔루션 ''와이즈메타(//WiseMeta)'' 데이터품질 관리 솔루션 ''와이즈디큐
(WiseDQ)'' 등 데이터 거버넌스 분야 독자적인 라인업을 구축하였습니다. 최근에는 엔드투엔드 MLOps 플랫폼
''와이즈에이아이옵스(//WiseAIOps)''와 AI 개발 플랫폼 ''와이즈프로핏(WiseProphet)''을 비롯해 시각화 솔루션
''와이즈인텔리전스(WiseIntelligence)'' 무역 문서 정보 추출 자동화 서비스 ''아이도큐(iDocu)'' 등 인공지능 분야의 라인업을
확장하며 AI 전문 솔루션 리더로 성장하고 있습니다.
2020년 코스닥 시장 상장 이후, 200여 명의 정예 인력과 함께 36년간 다져진 탄탄한 기술력을 바탕으로 글로벌 무대를
향해 끝없이 도전하고 있습니다. 위세아이텍에서 미래를 함께 그려나갈 인재를 찾습니다.

모집부문
Java 개발자

담당 업무 
- 자체 AI 및 데이터 거버넌스 솔루션(WiseDQ, WiseMeta 등) 커스터마이징 및 구축
- Java / 전자정부 프레임워크 기반 SI 및 플랫폼 구축 개발
- 클라우드 환경 기반의 데이터 처리 및 웹 서비스 개발

자격 요건 
- Java 및 Spring / 전자정부 프레임워크 기반 백엔드 개발 역량
- JSP, JavaScript, jQuery 활용 및 웹 프론트엔드 연동 능력
- RDBMS(Oracle, MySQL 등) 및 SQL 작성/활용 능력
- 고객 요구사항 분석 및 장애 원인 분석/해결 역량
- 유관 부서 및 고객사와의 원활한 커뮤니케이션 가능자

우대사항 
- 컴퓨터공학 등 전산 관련 학과 전공자
- 관련 자격증(정보처리기사, SQLD 등) 소지자
- TypeScript, React, Vue.js 등 프론트엔드 프레임워크 개발 경험자
- 클라우드(AWS, Docker, Kubernetes) 환경 유경험자
- 데이터 품질, 메타데이터 등 데이터 거버넌스 솔루션 구축 경험자
- AI 에이전트, RAG 구현, 프롬프트 엔지니어링 경험자


AI/ML 엔지니어

담당업무 
- 자사 AI 솔루션(WiseAIOps, WiseProphet 등) 기반 머신러닝/답러닝 모델 설계 및 개발
- LLM 기반 서비스 개발 및 성능 최적화 (Fine-tuning, Prompt Engineering 포함)
- Vector DB 기반 지식 검색 및 임베딩 파이프라인 구축 (RAG 시스템)
- 데이터 전처리, 피처 엔지니어링 및 모델 학습 파이프라인 구축
- AI 모델 성능 평가 및 운영 환경 배포 지원

자격 요건 
- Python 기반 데이터 처리 및 머신러닝/답러닝 모델 개발 경험
- PyTorch 또는 TensorFlow 등 딥러닝 프레임워크 활용 역량 보유자
- 통계, 선형대수, 확률론 등 수학적 기초 이해를 갖춘 분
- 모델 학습 및 성능 평가 경험 또는 이에 준하는 역량 보유자
- 새로운 AI 기술에 대한 관심과 자기 주도적 학습 의지가 높은 분

우대사항 
- 전산 및 AI 관련 자격증 소지자 또는 연구 논문 실적 보유자
- HuggingFace, LangChain 등 LLM 관련 라이브러리 활용 경험자
- VectorDB(Pinecone, Chroma, Weaviate 등) 활용 경험자
- MLOps 파이프라인 구축 또는 운영 경험자
- Kaggle 등 AI 대회 수상 실적 보유자
- Docker, Linux 기반 개발 환경 사용 경험자

AX 서비스 개발

담당 업무 
- AI Agent 기반 서비스 아키텍처 설계 및 개발
- MCP 기반 외부 시스템 연동 및 Tooling 개발
- LLM 활용 애플리케이션 개발 및 운영
- RAG 기반 검색/질의응답 시스템 구축
- 사내솔루션 개발 및 커스터마이징
- 사내/고객사 업무 시스템과 AI 서비스 연동

자격요건 
- 개발 경력 3년 이상 또는 이에 준하는 역량 보유자
- Python, Java 등 1개 이상의 개발 언어 활용 가능자
- 새로운 기술에 대한 관심과 학습 의지가 높은 분
- 생성형 시, AI Agent 분야에 관심이 있는 분
- 원활한 커뮤니케이션 및 협업 능력을 갖춘 분
- 고객 및 사업 관점에서 사고할 수 있는 분

우대사항 
- React, Spring 등 웹 서비스 개발 경험
- REST API 개발 경험
- Docker, Linux 환경 사용 경험
- 공공 및 민간 프로젝트 제안 지원 경험
- Claude 활용한 프로젝트 또는 서비스 개발 경험
- RAG 시스템 구축경험

AI R&D (국가연구개발과제)

- 담당 업무 
- 국가연구개발과제 수행 및 관리
- 인공지능(AI) 모델 연구 및 개발
- AI 연계 어플리케이션 기획 및 개발

자격 요건 
- 전산학, 컴퓨터공학, 인공지능 등 관련 전공자(학사 이상)
- Python, Java 등 프로그래밍 언어 활용 능력 보유자
- 머신러닝/딥러닝 프레임워크 활용 가능자
- (경력) 국가연구개발과제 수행 또는 연구소 등의 R&D 관련 경험자

우대사항 
- 정부 R&D 과제 기획, 수행, 결과보고서 작성 경험자
- 어플리케이션 시스템(백엔드/웹) 연동 개발 경험자
- AI 관련 주요 학술대회 논문 게재 또는 연구 실적 보유자

프로젝트 매니저 (PM)

담당업무 
- SI 솔루션 기반 프로젝트 관리(PM) 총괄
- 프로젝트 사업 범위, 일정 관리, 인력 운영 및 이슈/리스크 관리
- 고객 요구사항 분석 및 이해관계자 커뮤니케이션 조율
- 사전 영업 지원 및 제안 활동(제안서 작성, 제안 발표 등)

자격요건 
- IT 프로젝트 관리(PM) 또는 PMO 유관 경력 10년 이상 보유자
- 원활한 고객 커뮤니케이션 및 탁월한 협업 리더십 역량을 가지신 분
- 제안서 작성, 발표 및 비즈니스 문서화 역량을 보유하신 분

우대사항 
- 공공 및 금융 도메인 대형 SI 프로젝트 PM 수행 경험자
- PMP(Project Management Professional) 등 관련 자격증 보유자
- DW/BI, 데이터 거버넌스 또는 AI 솔루션 구축 프로젝트 관리 경험자

데이터 아키텍트 (DA)

담당업무 
- 데이터 표준화, 데이터 모델링, 데이터 품질 진단 수행
- 데이터 거버넌스 컨설팅 및 구축 프로젝트 수행
- DW/BI 및 엔터프라이즈 데이터 플랫폼 아키텍처 설계

자격요건 
- 데이터 아키텍처(DA), 데이터 모델링 또는 데이터 거버넌스 분야 경력 10년 이상 보유자
- SQL 활용 능력 및 데이터베이스 구조에 대한 높은 이해도를 가지신 분
- 데이터 표준화 지침 수립 및 데이터 품질 개선 경험을 보유하신 분

우대사항 
- 데이터 거버넌스(품질, 메타) 솔루션 구축 또는 컨설팅 프로젝트 경험자
- 데이터 관련 자격증(DAP, ADP, SQLP 등) 보유자
- 공공 및 금융 도메인 대형 프로젝트 수행 경험자
- AI/LLM 연계 데이터 프로젝트 설계 경험자



### 섹션별 정리

| 구분 | 내용 |
|---|---|
| 담당업무 | - 자사 AI 솔루션(//WiseAIOps, WiseProphet 등) 기반 머신러닝/답러닝 모델 설계 및 개발 - LLM 기반 서비스 개발 및 성능 최적화 (Fine-tuning, Prompt Engineering 포함) - Vector DB 기반 지식 검색 및 임베딩 파이프라인 구축 (RAG 시스템) - 데이터 전처리, 피처 엔지니어링 및 모델 학습 파이프라인 구축 - AI 모델 성능 평가 및 운영 환경 배포 지원 자격 요건 - Python 기반 데이터 처리 및 머신러닝/답러닝 모델 개발 경험 - PyTorch 과 TensorFlow 등 딥러닝 프레임워크 활용 역량 보유자 - 통계, 선형대수, 확률론 등 수학적 기초 이해를 갖춘 분 - 모델 학습 및 성능 평가 경험 또는 이에 준하는 역량 보유자 - 새로운 시 기술에 대한 관심과 자기 주도적 학습 의지가 높은 분 |
| 자격요건 | - 개발 경력 3년 이상 또는 이에 준하는 역량 보유자 - Python, Java 등 17개 이상의 개발 언어 활용 가능자 - 새로운 기술에 대한 관심과 학습 의지가 높은 분 - 생성형 AI, AI Agent 분야에 관심이 있는 분 - 원활한 커뮤니케이션 및 협업 능력을 갖춘 분 - 고객 및 사업 관점에서 사고할 수 있는 분 |
| 우대사항 | - 컴퓨터공학 등 전산 관련 학과 전공자 - 관련 자격증(정보처리기사, SQLD 등) 소지자 - TypeScript, React, Vue js 등 프론트엔드 프레임워크 개발 경험자 - 운영(AWS, Docker, Kubernetes) 환경 유경험자 - 데이터 품질, 메타데이터 등 데이터 거버넌스 솔루션 구축 경험자 - AI 에이전트, RAG 구현, 프롬프트 엔지니어링 경험자 |',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"83","name":"데이터엔지니어"},"listSummary":{"sectors":["데이터분석가","데이터엔지니어","SI개발","딥러닝","머신러닝"],"careerText":"신입 · 경력 · 정규직","deadlineText":"D-6"},"processedSections":{"담당업무":"* 자사 AI 솔루션(//156시065, WiseProphet 등) 기반 머신러닝/답러닝 모델 설계 및 개발 + LLM 기반 서비스 개발 및 성능 최적화 (Fine-tuning, Prompt Engineering 포함) * Vector DB 기반 지식 검색 및 임베딩 파이프라인 구축 (RAG 시스템) + 데이터 전처리, 피처 엔지니어링 및 모델 학습 파이프라인 구축 * 시 모델 성능 평가 및 운영 환경 배포 지원 자격 요건 + Python 기반 데이터 처리 및 머신러닝/답러닝 모델 개발 경험 + PyTorch = TensorFlow 등 딥러닝 프레임워크 활용 역량 보유자 * 통계, 선형대수, 확률론 등 수학적 기초 이해를 갖춘 분 © 모델 학습 및 성능 평가 경험 또는 이에 준하는 역량 보유자 © 새로운 시 기술에 대한 관심과 자기 주도적 학습 의지가 높은 분","자격요건":"© 개발 경력 3년 이상 또는 이에 준하는 역량 보유자 + Python, Java 등 17H 이상의 개발 언어 활용 가능자 * 새로운 기술에 대한 관심과 학습 의지가 높은 분 + 생성형 시, AI Agent 분야에 관심이 있는 분 * 원활한 커뮤니케이션 및 협업 능력을 갖춘 분 © 고객 및 사업 관점에서 사고할 수 있는 분","우대사항":"* 컴퓨터공학 등 전산 관련 학과 전공자 ＊ 관련 자격증(정보처리기사, 501. 등) 소지자 * TypeScript, React, Vue js § 프론트엔드 프레임워크 개발 경험자 + B2I2C(AWS, Docker, Kubernetes) 환경 유경험자 + 데이터 품질, 메타데이터 등 데이터 거버넌스 솔루션 구축 경험자 ＊ 시 에이전트, RAG 구현, 프롬프트 엔지니어링 경험자 ag zaaost --/티/Ｌ엔지니어 담당업무 * 자사 AI 솔루션(//156시065, WiseProphet 등) 기반 머신러닝/답러닝 모델 설계 및 개발 + LLM 기반 서비스 개발 및 성능 최적화 (Fine-tuning, Prompt Engineering 포함) * Vector DB 기반 지식 검색 및 임베딩 파이프라인 구축 (RAG 시스템) + 데이터 전처리, 피처 엔지니어링 및 모델 학습 파이프라인 구축 * 시 모델 성능 평가 및 운영 환경 배포 지원 자격 요건 + Python 기반 데이터 처리 및 머신러닝/답러닝 모델 개발 경험 + PyTorch = TensorFlow 등 딥러닝 프레임워크 활용 역량 보유자 * 통계, 선형대수, 확률론 등 수학적 기초 이해를 갖춘 분 © 모델 학습 및 성능 평가 경험 또는 이에 준하는 역량 보유자 © 새로운 시 기술에 대한 관심과 자기 주도적 학습 의지가 높은 분 우대사항 © 전산 및 시 관련 자격증 소지자 또는 연구 논문 실적 보유자 + HuggingFace, LangChain 등ㄴ4 관련 라이브러리 활용 경험자 * VectorDB(Pinecone, Chroma, Weaviate 등) 활용 경험자 + MLOps 파이프라인 구축 또는 운영 경험자 + Kaggle 5 AI 대회 수상 실적 보유자 + Docker, Linux 기반 개발 환경 사용 경험자 시0(경격3년이 AX AJH|A JHE 담당 업무 * AI Agent 7] 서비스 아키텍처 설계 및 개발 + MCP 기반 외부 시스템 연동 및 10009 개발 ＊ LLM 활용 애플리케이션 개발 및 운영 + RAG 기반 검색/질의응답 시스템 구축 * 사내솔루션 개발 및 커스터마이징 * 사내/고객사 업무 시스템과 시 서비스 연동 자격요건 © 개발 경력 3년 이상 또는 이에 준하는 역량 보유자 + Python, Java 등 17H 이상의 개발 언어 활용 가능자 * 새로운 기술에 대한 관심과 학습 의지가 높은 분 + 생성형 시, AI Agent 분야에 관심이 있는 분 * 원활한 커뮤니케이션 및 협업 능력을 갖춘 분 © 고객 및 사업 관점에서 사고할 수 있는 분 우대사항 * React, Spring § 웹 서비스 개발 경험 * 8651.40 개발 경험 + Docker, Linux 환경 사용 경험 * 공공 및 민간 프로젝트 제안 지원 경험 * Claude 활용한 프로젝트 또는 서비스 개발 경험 * RAG 시스템 구축경험 칠잉/경각- 시| 요800 (국가연구개발과제) 담당 업무 * 국가연구개발과제 수행 및 관리 * 인공지능(시) 모델 연구 및 개발 + 시 연계 어플리케이션 기획 및 개발 자격 요건 + 전산학, 컴퓨터공학, 인공지능 등 관련 전공자(학사 이상) + Python, Java 등 프로그래밍 언어 활용 능력 보유자 ＊ 머신러닝/답러닝 프레임워크 활용 가능자 * (경력) 국가연구개발과제 수행 또는 연구소 등의 RRD 관련 경험자 우대사항 * 정부 880 과제 기획, 수행, 결과보고서 작성 경험자 * 어플리케이션 시스템(백엔드/웹) 연동 개발 경험자 * 시 관련 주요 학술대회 논문 게재 또는 연구 실적 보유자 sous | 프로젝트 매니저 (PM) 담당업무 © SI 솔루션 기반 프로젝트 관리(만) 총괄 * 프로젝트 사업 범위, 일정 관리, 인력 운영 및 이슈/리스크 관리 * 고객 요구사항 분석 및 이해관계자 커뮤니케이션 조율 * 사전 영업 지원 및 제안 활동(제안서 작성, 제안 발표 등) 자격요건 *＊ |7 프로젝트 관리(미\\) 또는 PMO 유관 경력 10년 이상 보유자 + 원활한 고객 커뮤니케이션 및 탁월한 협업 리더십 역량을 가지신 분 * 제안서 작성, 발표 및"},"detectedSkills":["JavaScript","Kubernetes","TensorFlow","TypeScript","OracleDB","PyTorch","Docker","jQuery","Spring","Vue.js","Linux","MySQL"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://webpds.saramin.co.kr/pds/united_company/logo/14020_logo_1.gif","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://www.saraminimage.co.kr/recruit/bbs_recruit26/41_wiseitech_img_260707.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":false,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://www.saraminimage.co.kr/recruit/bbs_recruit26/41_wiseitech_img_260707.png","text":"(쥐위세아이텍\n위세아이텍 신입 및 경력사원 모집\n위세아이텍 신입 및 경력사원 모집\n! 드투엔드 A 이터 플랫폼 7|Q 부문별 인재 채용\n1990년 설립된 (주)위세아이텍은 엔드투엔드 시-데이터 플랫폼 기업으로 시-데이터 거버넌스 ABE 주도하고 있습니다.\n독보적인 기술력을 바탕으로 기업과 기관의 인공지능 전환(&》) 및 디지털 전환(0>/)을 선도하는 국내 최고의 데이터 전문\n파트너입니다.\n1998년 BI 제품 개발을 시작으로 메타데이터 관리 솔루션 ''와이즈메타(//15614613)'' 데이터품질 관리 솔루션 ''와이즈디큐\n(WiseDQ)'' 등 데이터 거버넌스 분야 독자적인 라인업을 구축하였습니다. 최근에는 엔드투엔드 MLOps 플랫폼\n210] Z010]010| SA (WiseAIOps)''2} AI 개발 플랫폼 ''와이즈프로핏(\\/[660(이)67''을 비롯해 시각화 솔루션\n''와이즈인텔리전스(\\/15610{6196006)'' 무역 문서 정보 추출 자동화 서비스 ''아이도큐(2064)'' 등 인공지능 분야의 라인업을\n확장하며 AI 전문 솔루션 리더로 성장하고 있습니다.\n2020년 코스닥 시장 상장 이후, 200여 명의 정예 인력과 함께 36년간 다져진 탄탄한 기술력을 바탕으로 글로벌 무대를\n향해 끝없이 도전하고 있습니다. 위세아이텍에서 미래를 함께 그려나갈 인재를 찾습니다.\n회사설립 임직원 수 상장기업 자체 솔루션\n36 eel 데이터 전문 기업 #2 ogo) 싸빅데이터 인재 2020년 코스닥시장상장 WiseAIOps, WiseProphet §\nag zsvort Java 개발자\n담당 업무 * 자체 AI 및 데이터 거버넌스 솔루션(/\\/[5600, WiseMeta 등) 커스터마이징 및 구축\n* 183 / 전자정부 프레임워크 기반 5| 및 플랫폼 구축 개발\n＊ 클라우드 환경 기반의 데이터 처리 및 웹 서비스 개발\n자격 요건 * Java 및 50009 / 전자정부 프레임워크 기반 백엔드 개발 역량\n+ JSP, JavaScript, jQuery 활용 및 웹 프론트엔드 연동 능력\n+ RDBMS(Oracle, MySQL 5) 및 SQL 작성/활용 능력\n+ 고객 요구사항 분석 및 장애 원인 분석/해결 역량\n* 유관 부서 및 고객사와의 원활한 커뮤니케이션 가능자\n\n우대사항 * 컴퓨터공학 등 전산 관련 학과 전공자\n＊ 관련 자격증(정보처리기사, 501. 등) 소지자\n* TypeScript, React, Vue js § 프론트엔드 프레임워크 개발 경험자\n+ B2I2C(AWS, Docker, Kubernetes) 환경 유경험자\n+ 데이터 품질, 메타데이터 등 데이터 거버넌스 솔루션 구축 경험자\n＊ 시 에이전트, RAG 구현, 프롬프트 엔지니어링 경험자\nag zaaost --/티/Ｌ엔지니어\n\n담당업무 * 자사 AI 솔루션(//156시065, WiseProphet 등) 기반 머신러닝/답러닝 모델 설계 및 개발\n+ LLM 기반 서비스 개발 및 성능 최적화 (Fine-tuning, Prompt Engineering 포함)\n* Vector DB 기반 지식 검색 및 임베딩 파이프라인 구축 (RAG 시스템)\n+ 데이터 전처리, 피처 엔지니어링 및 모델 학습 파이프라인 구축\n* 시 모델 성능 평가 및 운영 환경 배포 지원\n자격 요건 + Python 기반 데이터 처리 및 머신러닝/답러닝 모델 개발 경험\n+ PyTorch = TensorFlow 등 딥러닝 프레임워크 활용 역량 보유자\n* 통계, 선형대수, 확률론 등 수학적 기초 이해를 갖춘 분\n© 모델 학습 및 성능 평가 경험 또는 이에 준하는 역량 보유자\n© 새로운 시 기술에 대한 관심과 자기 주도적 학습 의지가 높은 분\n\n우대사항 © 전산 및 시 관련 자격증 소지자 또는 연구 논문 실적 보유자\n+ HuggingFace, LangChain 등ㄴ4 관련 라이브러리 활용 경험자\n* VectorDB(Pinecone, Chroma, Weaviate 등) 활용 경험자\n+ MLOps 파이프라인 구축 또는 운영 경험자\n+ Kaggle 5 AI 대회 수상 실적 보유자\n+ Docker, Linux 기반 개발 환경 사용 경험자\n시0(경격3년이 AX AJH|A JHE\n담당 업무 * AI Agent 7] 서비스 아키텍처 설계 및 개발\n+ MCP 기반 외부 시스템 연동 및 10009 개발\n＊ LLM 활용 애플리케이션 개발 및 운영\n+ RAG 기반 검색/질의응답 시스템 구축\n* 사내솔루션 개발 및 커스터마이징\n* 사내/고객사 업무 시스템과 시 서비스 연동\n\n자격요건 © 개발 경력 3년 이상 또는 이에 준하는 역량 보유자\n+ Python, Java 등 17H 이상의 개발 언어 활용 가능자\n* 새로운 기술에 대한 관심과 학습 의지가 높은 분\n+ 생성형 시, AI Agent 분야에 관심이 있는 분\n* 원활한 커뮤니케이션 및 협업 능력을 갖춘 분\n© 고객 및 사업 관점에서 사고할 수 있는 분\n\n우대사항 * React, Spring § 웹 서비스 개발 경험\n* 8651.40 개발 경험\n+ Docker, Linux 환경 사용 경험\n* 공공 및 민간 프로젝트 제안 지원 경험\n* Claude 활용한 프로젝트 또는 서비스 개발 경험\n* RAG 시스템 구축경험\n칠잉/경각- 시| 요800 (국가연구개발과제)\n담당 업무 * 국가연구개발과제 수행 및 관리\n* 인공지능(시) 모델 연구 및 개발\n+ 시 연계 어플리케이션 기획 및 개발\n자격 요건 + 전산학, 컴퓨터공학, 인공지능 등 관련 전공자(학사 이상)\n+ Python, Java 등 프로그래밍 언어 활용 능력 보유자\n＊ 머신러닝/답러닝 프레임워크 활용 가능자\n* (경력) 국가연구개발과제 수행 또는 연구소 등의 RRD 관련 경험자\n\n우대사항 * 정부 880 과제 기획, 수행, 결과보고서 작성 경험자\n* 어플리케이션 시스템(백엔드/웹) 연동 개발 경험자\n* 시 관련 주요 학술대회 논문 게재 또는 연구 실적 보유자\nsous | 프로젝트 매니저 (PM)\n\n담당업무 © SI 솔루션 기반 프로젝트 관리(만) 총괄\n* 프로젝트 사업 범위, 일정 관리, 인력 운영 및 이슈/리스크 관리\n* 고객 요구사항 분석 및 이해관계자 커뮤니케이션 조율\n* 사전 영업 지원 및 제안 활동(제안서 작성, 제안 발표 등)\n\n자격요건 *＊ |7 프로젝트 관리(미\\) 또는 PMO 유관 경력 10년 이상 보유자\n+ 원활한 고객 커뮤니케이션 및 탁월한 협업 리더십 역량을 가지신 분\n* 제안서 작성, 발표 및 비즈니스 문서화 역량을 보유하신 분\n\n우대사항 * 공공 및 금융 도메인 대형 SI 프로젝트 PM 수행 경험자\n* PMP(Project Management Professional) 등 관련 자격증 보유자\n+ DW/BI, 데이터 거버넌스 또는 AI 솔루션 구축 프로젝트 관리 경험자\nzou. 데이터 아키텍트 (04)\n\n담당업무 + 데이터 표준화, 데이터 모델링, 데이터 품질 진단 수행\n© 데이터 거버넌스 컨설팅 및 구축 프로젝트 수행\n+ 00//8| 및 엔터프라이즈 데이터 플랫폼 아키텍처 설계\n자격 요건 + 데이터 아키텍처(06, 데이터 모델링 또는 데이터 거버넌스 분야 경력 10년 이상 보유자\n+ SQL 활용 능력 및 데이터베이스 구조에 대한 높은 이해도를 가지신 분\n* 데이터 표준화 지침 수립 및 데이터 품질 개선 경험을 보유하신 분\n\n우대사항 + 데이터 거버넌스(품질, 메타) 솔루션 구축 또는 컨설팅 프로젝트 경험자\n+ 데이터 관련 자격증(040, ADP, SQLP 등) 보유자\n© 공공 및 금융 도메인 대형 프로젝트 수행 경험자\n+ 시/ㄴ4 연계 데이터 프로젝트 설계 경험자\n2 지원자격\n학력 병역 고용 형태\n대졸 이상 남성의 경우 군필 및 면제자 정규직\n기타 연봉\nㆍ 필수\n해외 여행에 결격 사유가 없는 자 반드시 이력서에 희망 연봉을 기재해 주세요\n서류전형 1차면접 임원 면접 최종합격\n지원서 & 경력기술서 검토 실무진 직무 역량 면접 가치관& 종합 면접 3\n면접 전형의 일시는 합격자에 한하여 개별 통보됩니다.\n회사 사정에 따라 일부 일정이 조정될 수 있습니다.\n% 접수 안내\n접수방법 제출 서류\n사람인 온라인 입사지원 경력자는 상세 경력기술서 제출 2\n제출된 서류는 반환하지 않습니다.\n제출 서류 및 중명서의 기재 내용이 허위임이 판명될 경우, 합격을 취소합니다.\n성과급지급 현금성 복지 선택근무제\n출산-육아휴직 교육비 종합건강검진\n장기근속포상 안식휴가 자격증\n전화 영어 교육 경조사 리조트\n복지몰 운영 각종 수당 제도 4대보험\nwisEiTECH (주) KOSDAQ LISTED ND-TO-END AI - DAT 가이"}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54111660',
  '(주)비케이브',
  '[비케이브] AX 데이터 엔지니어(Data Engineer) 경력채용',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54111660',
  'DATA',
  '서울 마포구',
  'EXPERIENCED',
  '정규직',
  '대학교(4년)↑',
  NULL,
  '2026-08-08 23:59:59',
  '기술지원, 데이터분석가, 데이터엔지니어, 백엔드/서버개발, 앱개발, Node.js, Python, SaaS',
  '@@82.ㄷ86
AX 데이터 엔지니어(Data Engineer) 경력채용
비케이브는 브랜드를 통해, 소비자의 삶을 풍요롭게 만들어갑니다
비케이브는 브랜드를 넘어 문화를 만드는 패션기업 입니다.
단순히 옷을 만드는 회사가 아니라, 브랜드를 통해 사람과 일상, 문화를 잇는 여정을 설계해 갑니다.
커버낫(COVERNAT), 와키윌리(Wacky WiLLy), 리(LEE) 등 다양한 캐주얼 브랜드를 전개하며 브랜드의 임팩트를
세계 시장으로 확장시키고, 감도 높은 시선과 유연한 실행력으로 빠르게 변화하는 트렌드를 이끌어가고 있습니다.
패션으로 일상과 문화를 연결하는 여정에 함류해 주세요.
더 많은 이들의 일상에 영감과 변화를 전할 당신을 기다립니다.
| AX팀을 소개합니다.
AX팀은 사내 다양한 업무 영역에서 도출된 AI/자동화 과제를 실제 서비스로 전환하고, 조직 전반에서 활용 가능한
구조로 만드는 역할을 합니다. 단순한 PoC 수준을 넘어, 운영 가능한 플랫폼과 데이터 인프라를 구축하여 디자인·상품기획·
마케팅 등 주요 기능 조직의 업무 방식을 재설계하고 있습니다.
모집부문

[담당업무]
• Snowflake 기반 사내 데이터 플랫폼
(DW/DM) 구축 및 운영
• ERP/WMS/CRM 등 기간계 ETL 설계/운영
• 데이터 파이프라인/워크플로우 운영 자동화
• integrate. io 기반 데이터 적재 파이프라인 구성/운영
• n8n 기반 워크플로우 자동화·운영 표준화
• 데이터 제공 체계 구축 및 운영
• 사용자/서비스 요구에 맞는 데이터 레이어 구성
• 데이터 품질 관리 체계 고도화

[자격요건]
• 학력 - 대졸이상
• 경력 - 3년 이상
• 데이터 플랫폼 구축 또는 운영 경험
• SQL을 활용한 데이터 추출/가공/분석 역량
• 데이터 모델링 경험
• 배치 및 파이프라인 작성/운영 경험
• 데이터 거버넌스 운영 개념 이해 및 실무 적용 역량

[우대사항]
• 패션 브랜드 또는 캐주얼 ACC 카테고리 소싱 경력
• 다수 브랜드 또는 다수 카테고리 동시 운영 경험
• 중국·동남아 생산처 직접 소싱 또는 해외 공장
커뮤니케이션 경험
• ERP 등 상품 관리 시스템 활용 경험
• 트렌드 리딩 및 신규 협력업체 개발 경험
(0) 복지포인트 자사상품 할인구매
© 플렉스 데이 00 생일자 반차휴가 지원
So (조기퇴근의 날) 웰컴 키트
I 제주도법인콘도 (5) 센드위치데이
카페테리아 & 건강검진 지원 카페테리아 운영
ㅁ 아침간식 제공
팀워크지원비 직무교육 지원
| 지원 전 확인해주세요 :)
근무형태 : 정규직 (수습 3개월)
근무시간 : 주 5일(월~금) , 09:30~18:30
근무지 : 서울 특별시 마포구 잔다리로 24
급여 : 인터뷰 후 협의
유의사항 : 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다
| 비케이브의 합류 여정을 소개해요.
서류전형 > 인터뷰 전형 > 처우협의 > 최종합격 > 합류 🎉
서류합격자에 한해 개별 연락 드립니다.
본 공고는 채용 시 조기에 마감될 수 있는 수시채용으로 진행됩니다.

전형절차는 상황에 따라 변경될 수 있으며, 직책자의 경우 레퍼런스 체크에 대한 전형이 추가될 수 있습니다.
| More
기타 문의사항은 비케이브 인재개발팀 (recruit@bcave. co. kr)으로 연락바랍니다.
비케이브에 대한 더 많은 정보는 당사 홈페이지에서 확인하실 수 있습니다.
비케이브 공식 홈페이지 둘러보기',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"83","name":"데이터엔지니어"},"listSummary":{"sectors":["기술지원","데이터분석가","데이터엔지니어","백엔드/서버개발","앱개발"],"careerText":"경력 3년↑ · 정규직","deadlineText":"~08.08(토)"},"processedSections":{"우대사항":"] 바로가기\nㆍ 데이터 제공 체계 구축 및 운영\nㆍ 패션 브랜드 또는 캐주얼 ACC 카테고리 소싱 경력\nㆍ 사용자/서비스 요구에 맞는 데이터 레이어구성 、ㆍ 다수 브랜드 또는 다수 카테고리 동시 운영 경험\nㆍ 데이터 품질 관리 체계 고도화\nㆍ 중국-통남아 생산처 직접 소싱 또는 해외 공장 커뮤니케이션 경험 ＊ㆍ ERPS 상품 관리 시스템 활용 경험\nㆍ 트렌드 리딩 및 신규 혐력업체 개발 경험 B. CAVE BENEFIT (0) 복지포인트 자사상품 할인구매 => © 플렉스 데이 00 생일자 반차휴가 지원 So (조기퇴근의 날) 웰컴 키트 — I 제주도법인콘도 (5) 센드위치데이 (+) 12 카페테리아 & 건강검진 지원 [2 |페테리아 운영 ㅁ 아침간식 제공 $23 팀워크지원비 5 직무교육 지원 채용 프로세스 、 MREE 、 인터뷰전형. 처우협의 | 합격안내 _. ㅡ-ㅡ © ＊ 서류합격자에 한해 개별연락 드립니다. + 전형 절차는 지원자의 이력사항에 따라 변경됨 수 있습니다. + 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다. + 직책자의 경우 인적성 검사 단계 및 레퍼런스 체크 단계가 추가될 수 있습니다.","근무조건":"ㆍ 근무형태 정규직 (수습 3개월) ＊ 근무지 、 서울특별시 마포구 ＊ 근무요일 주 5일 (월~금) ＊ 근무시간 27 09:30 ~ 오후 06:30 제출서류\nㆍ 이력서 (자유양식) *개인정보(연봉정보, 가족관계, 주민번호 등) 제외\nㆍ 경력기술서 ＊ 자기소개서 * 포트폴리오 (직무별 상이)"},"detectedSkills":["Node.js","Python","SaaS"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/202606/17/tgr8gy12_jr0n-1ms4ndx_logo.png","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://www.saraminimage.co.kr/recruit/bbs_recruit26/35_bacve_img_260714.png"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":false,"ocrMethod":"tesseract.js kor+eng from Saramin detail images","cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"},"ocrTexts":[{"imageUrl":"https://www.saraminimage.co.kr/recruit/bbs_recruit26/35_bacve_img_260714.png","text":"@@82.ㄷ86\nAX 데이터 2lIX|L|0{(Data Engineer) 경력채용\n르 프\n\"브랜드를 통해, 소비자의 삶을 풍요롭게\"\nin 는 en\nC 7 IN——\nCOVERNAT - 는 졸부\nkB 48 4d Crump J DE “Jie uk\n내 ey ae 기\n07\nㆍ ,\nby A [이 I\nCAs . §\n7 IRS LS as “Y= RY J\n비케이브는 브랜드를 통해, 소비자의 삶을 풍요롭게 만들어갑니다\n비케이브(8.02\\/6)는 브랜드를 넘어 문화를 만드는 패션기업 입니다.\n단순히 옷을 만드는 회사가 아니라, 브랜드를 통해 사람과 일상, 문화를 잇는 여정을 설계해 갑니다.\n{85H (COVERNAT), 27/22] (Wacky WiLLy), 2|(LEE) 등 다양한 캐주얼 브랜드를 전개하며 브랜드의 임팩트를\n세계 시장으로 확장시키고, 감도 높은 시선과 유연한 실행력으로 빠르게 변화하는 트렌드를 이끌어가고 있습니다.\nTHOR 일상과 문화를 연결하는 여정에 함류해 주세요.\n더많은 이들의 일상에 영감과 변화를 전할 당신을 기다립니다.\n| AXES 소개합니다.\nAXES 사내 다양한 업무 영역에서 도출된 시/자동화 과제를 실제 서비스로 전환하고, 조직 전반에서 활용 가능한\nFER 만드는 역할을 합니다. 단순한 PoC 수준을 넘어, 운영 가능한 플랫폼과 데이터 인프라를 구축하여 디자인-상품기획-\n마케팅 등 주요 기능 조직의 업무 방식을 재설계하고 있습니다.\n모집부문\n[따격요건]\nㆍ 학력 - 대졸이상\nㆍ 경력 - 3년 이상\n+ Snowflake 기반 사내 데이터 플랫폼 ＊ 데이터 플랫폼 구축 또는 운영 경험\n(DW/DM) 구축 및 운영 + SQLE 활용한 데이터 추출/가공/분석 역량\n+ ERP/WMS/CRM 등 기간계 61Ｌ설계/운영 ＊ 데이터 모델링 경험\n＊ 데이터 파이프라인/워크플로우 운영 자동화 ＊ 배치 및 파이프라인 작성/운영 경험\nData + integrate. io 기반 데이터 적재 파이프라인 ＊ 데이터 거버넌스 운영 개념 이해 및 실무 적용 역량\nEngineer 구성/운영\n＊ 080 기반 워크플로우 자동화-운영 표준화 [우대사항]\n바로가기\nㆍ 데이터 제공 체계 구축 및 운영\nㆍ 패션 브랜드 또는 캐주얼 ACC 카테고리 소싱 경력\nㆍ 사용자/서비스 요구에 맞는 데이터 레이어구성 、ㆍ 다수 브랜드 또는 다수 카테고리 동시 운영 경험\nㆍ 데이터 품질 관리 체계 고도화\nㆍ 중국-통남아 생산처 직접 소싱 또는 해외 공장\n커뮤니케이션 경험\n＊ㆍ ERPS 상품 관리 시스템 활용 경험\nㆍ 트렌드 리딩 및 신규 혐력업체 개발 경험\n(0) 복지포인트 자사상품 할인구매\n© 플렉스 데이 00 생일자 반차휴가 지원\nSo (조기퇴근의 날) 웰컴 키트\nI 제주도법인콘도 (5) 센드위치데이\n(+) 12 카페테리아 &\n건강검진 지원 [2 |페테리아 운영\nㅁ 아침간식 제공\n$23 팀워크지원비 5 직무교육 지원\n채용 프로세스\n、 MREE 、 인터뷰전형. 처우협의 | 합격안내 _. ㅡ-ㅡ ©\n＊ 서류합격자에 한해 개별연락 드립니다.\n+ 전형 절차는 지원자의 이력사항에 따라 변경됨 수 있습니다.\n+ 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.\n+ 직책자의 경우 인적성 검사 단계 및 레퍼런스 체크 단계가 추가될 수 있습니다.\n\n근무조건\nㆍ 근무형태 정규직 (수습 3개월)\n＊ 근무지 、 서울특별시 마포구\n＊ 근무요일 주 5일 (월~금)\n＊ 근무시간 27 09:30 ~ 오후 06:30\n제출서류\nㆍ 이력서 (자유양식) *개인정보(연봉정보, 가족관계, 주민번호 등) 제외\nㆍ 경력기술서\n＊ 자기소개서\n* 포트폴리오 (직무별 상이)\n\n접수기간\nㆍ 서류접수시간 : 채용 마감시 까지\nㆍ 지원방법 : 당사 채용 홈페이지 온라인 접수 또는 사람인 직접 지원\n참고사항\nㆍ 본 공고는 채용 시 조기에 마감될 수 있는 수시채용으로 진행됩니다.\nㆍ 보훈 및 장애인 등 취업보호대상자는 관계법에 의거 우대합니다.\n＊ 채용 관련 궁금하신 부분은 채용담당자 hr@bcave. cokr 로 문의주세요.\nㆍ 이력서 제출 시 개인정보(연봉정보, 가족관계, 주민번호 등) 제외 바랍니다.\n온라인 지원 기업 홈페이지\ntol 지원 = 업 | =\n바로가기 바로가기\n디자인 인재풀 = 영업 인재풀 _\n등록하기 등록하기\n소싱 인재풀 해외 인재풀\n등록하기 등록하기"}]}',
  CURRENT_TIMESTAMP,
  TRUE
),
(
  '54409393',
  '데이터스랩(주)',
  '2026 하반기 데이터팀 모집 공고',
  'https://www.saramin.co.kr/zf_user/jobs/relay/view?view_type=list&rec_idx=54409393',
  'DATA',
  '경기 평택시',
  'ANY',
  '정규직',
  '학력무관',
  NULL,
  '2026-08-07 23:59:59',
  '데이터분석가, 백엔드/서버개발, 데이터시각화, 딥러닝, 머신러닝, Python, Azure, Spark, SQL',
  '채용공고 상세
회사명: 데이터스랩(주)
공고 제목: 2026 하반기 데이터팀 모집 공고
직무/태그: 데이터분석가, 백엔드/서버개발, 데이터시각화, 딥러닝, 머신러닝
근무지: 경기 평택시
경력/고용형태: 경력무관 · 정규직
학력: 학력무관
채용공고 상세 2026 하반기 데이터팀 모집 공고 데이터 사이언티스트 모집 공고(정규직) 모집분야 데이터 사이언티스트 (0명) 📋 주요업무
• Azure Databricks 기반 데이터 파이프라인(Medallion Architecture: Bronze/Silver/Gold) 구축·운영 참여
• Databricks(Notebook)기반 AI/ML 모델 개발 및 배포(모델 재학습, 고도화 등 AI 모델에 대한 자동화 및 고도화 포함)• 건설·산업 현장 데이터 수집·정제·변환(ETL/ELT) 및 품질 관리
• SQL 기반 데이터 모델링 및 Power BI 등 분석·시각화 연계 지원
• 데이터 품질 및 정합성 유지
• 데이터 분석 컨설팅
• 데이터 관련 문서화 및 고객 요구사항 반영
• 데이터팀 부서 소속으로 함께할 예정이에요. 📋 자격요건
• 경력 무관 (신입 지원 가능)• 학력무관, 졸업 예정자 지원가능
• ETL/ELT 데이터 프로세스, 데이터 웨어하우스. 데이터 파이프라인 구축 가능자
• SQL 기본 이해 및 기본 쿼리문 작성 능력
• Databricks 및 Python 기초 활용 능력
• 데이터 엔지니어링·클라우드 분야로 성장하고자 하는 명확한 의지
• 엑셀 및 Power BI 활용 가능자 (DAX 및 M Query)• 팀 협업 및 커뮤니케이션 역량 (매우 중요) 📋 우대사항
• 해당직무 인턴경력, 해당직무 근무경험
• Azure 등 클라우드 환경 경험 또는 학습 경험
• Databricks, Spark 등 빅데이터 처리 도구 경험
• 데이터 파이프라인·ETL 프로젝트 경험 (개인·학습 프로젝트 포함)• Power BI·Power Platform 등 데이터 도구 활용 경험
• 건설·제조·산업 도메인 데이터 경험 또는 관심 🏠 근무조건
• 고용형태 : 정규직 (수습 3개월)• 급여 : 면접 후 결정
• 근무지 : 경기 평택시 고덕여염로 118, 에스비씨비즈니스센터 935호
• 근무요일/시간 : 주 5일 (월~금) 08:00~17:30 / (점심시간 : 11:30 ~ 13:00) 🎁 복지 및 혜택
• 교육/생활 : 워크샵, 신규 입사자 교육(OJT), 직무능력향상교육, 식비 지원, 음료제공(차,커피)• 리프레시 : 연차, 반차, 근로자의날 휴무
• 급여제도 : 퇴직연금, 상여금, 장기근속자 포상
• 조직 문화 : 수평적 조직문화, 회식강요 안함, 야근강요 안함, 자유복장, 자유로운 연차사용, 출산 장려
• 선물 : 생일선물/파티, 장기근속 선물
• 근무 환경 : 회의실, 노트북, 사내도서관
• 출퇴근 : 기숙사 운영 🚀 채용절차 접수기간 : 2026-07-08 16시 ~ 2026-08-07 24시 제출서류 : 사람인 온라인 이력서, *필수첨부* - 자기소개서*, 이력서*, 포트폴리오(선택사항) 접수방법 : 사람인 입사지원 전형절차 : 서류전형 → 1차 면접 → 최종합격 🛎️ 유의사항
• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.• 모집분야별로 마감일이 상이할 수 있으니 유의하시길 바랍니다.

### 섹션별 정리

| 구분 | 내용 |
|---|---|
| 주요업무 | 주요업무<br>• Azure Databricks 기반 데이터 파이프라인(Medallion Architecture: Bronze/Silver/Gold) 구축·운영 참여<br>• Databricks(Notebook)기반 AI/ML 모델 개발 및 배포(모델 재학습, 고도화 등 AI 모델에 대한 자동화 및 고도화 포함)• 건설·산업 현장 데이터 수집·정제·변환(ETL/ELT) 및 품질 관리<br>• SQL 기반 데이터 모델링 및 Power BI 등 분석·시각화 연계 지원<br>• 데이터 품질 및 정합성 유지<br>• 데이터 분석 컨설팅<br>• 데이터 관련 문서화 및 고객 요구사항 반영<br>• 데이터팀 부서 소속으로 함께할 예정이에요. 📋 |
| 자격요건 | 자격요건<br>• 경력 무관 (신입 지원 가능)• 학력무관, 졸업 예정자 지원가능<br>• ETL/ELT 데이터 프로세스, 데이터 웨어하우스. 데이터 파이프라인 구축 가능자<br>• SQL 기본 이해 및 기본 쿼리문 작성 능력<br>• Databricks 및 Python 기초 활용 능력<br>• 데이터 엔지니어링·클라우드 분야로 성장하고자 하는 명확한 의지<br>• 엑셀 및 Power BI 활용 가능자 (DAX 및 M Query)• 팀 협업 및 커뮤니케이션 역량 (매우 중요) 📋 |
| 우대사항 | 우대사항<br>• 해당직무 인턴경력, 해당직무 근무경험<br>• Azure 등 클라우드 환경 경험 또는 학습 경험<br>• Databricks, Spark 등 빅데이터 처리 도구 경험<br>• 데이터 파이프라인·ETL 프로젝트 경험 (개인·학습 프로젝트 포함)• Power BI·Power Platform 등 데이터 도구 활용 경험<br>• 건설·제조·산업 도메인 데이터 경험 또는 관심 🏠 |
| 근무조건 | 근무조건<br>• 고용형태 : 정규직 (수습 3개월)• 급여 : 면접 후 결정<br>• 근무지 : 경기 평택시 고덕여염로 118, 에스비씨비즈니스센터 935호<br>• 근무요일/시간 : 주 5일 (월~금) 08:00~17:30 / (점심시간 : 11:30 ~ 13:00) 🎁 복지 및 혜택<br>• 교육/생활 : 워크샵, 신규 입사자 교육(OJT), 직무능력향상교육, 식비 지원, 음료제공(차,커피)• 리프레시 : 연차, 반차, 근로자의날 휴무<br>• 급여제도 : 퇴직연금, 상여금, 장기근속자 포상<br>• 조직 문화 : 수평적 조직문화, 회식강요 안함, 야근강요 안함, 자유복장, 자유로운 연차사용, 출산 장려<br>• 선물 : 생일선물/파티, 장기근속 선물<br>• 근무 환경 : 회의실, 노트북, 사내도서관<br>• 출퇴근 : 기숙사 운영 🚀 |
| 채용절차 | 채용절차 |
| 접수기간 | 접수기간 : 2026-07-08 16시 ~ 2026-08-07 24시 제출서류 : 사람인 온라인 이력서, *필수첨부* - 자기소개서*, 이력서*, 포트폴리오(선택사항) 접수방법 : 사람인 입사지원 |
| 전형절차 | 전형절차 : 서류전형 → 1차 면접 → 최종합격 🛎️ 유의사항<br>• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.• 모집분야별로 마감일이 상이할 수 있으니 유의하시길 바랍니다. |',
  NULL,
  '{"sourceProvider":"SARAMIN_WEB","sourceType":"LIVE_WEB_CRAWL","collectedAt":"2026-07-15T10:30:00+09:00","sourceCategory":{"code":"2248","name":"데이터 사이언티스트"},"listSummary":{"sectors":["데이터분석가","백엔드/서버개발","데이터시각화","딥러닝","머신러닝"],"careerText":"경력무관 · 정규직","deadlineText":"~08.07(금)"},"processedSections":{"주요업무":"주요업무\n• Azure Databricks 기반 데이터 파이프라인(Medallion Architecture: Bronze/Silver/Gold) 구축·운영 참여\n• Databricks(Notebook)기반 AI/ML 모델 개발 및 배포(모델 재학습, 고도화 등 AI 모델에 대한 자동화 및 고도화 포함)• 건설·산업 현장 데이터 수집·정제·변환(ETL/ELT) 및 품질 관리\n• SQL 기반 데이터 모델링 및 Power BI 등 분석·시각화 연계 지원\n• 데이터 품질 및 정합성 유지\n• 데이터 분석 컨설팅\n• 데이터 관련 문서화 및 고객 요구사항 반영\n• 데이터팀 부서 소속으로 함께할 예정이에요. 📋","자격요건":"자격요건\n• 경력 무관 (신입 지원 가능)• 학력무관, 졸업 예정자 지원가능\n• ETL/ELT 데이터 프로세스, 데이터 웨어하우스. 데이터 파이프라인 구축 가능자\n• SQL 기본 이해 및 기본 쿼리문 작성 능력\n• Databricks 및 Python 기초 활용 능력\n• 데이터 엔지니어링·클라우드 분야로 성장하고자 하는 명확한 의지\n• 엑셀 및 Power BI 활용 가능자 (DAX 및 M Query)• 팀 협업 및 커뮤니케이션 역량 (매우 중요) 📋","우대사항":"우대사항\n• 해당직무 인턴경력, 해당직무 근무경험\n• Azure 등 클라우드 환경 경험 또는 학습 경험\n• Databricks, Spark 등 빅데이터 처리 도구 경험\n• 데이터 파이프라인·ETL 프로젝트 경험 (개인·학습 프로젝트 포함)• Power BI·Power Platform 등 데이터 도구 활용 경험\n• 건설·제조·산업 도메인 데이터 경험 또는 관심 🏠","근무조건":"근무조건\n• 고용형태 : 정규직 (수습 3개월)• 급여 : 면접 후 결정\n• 근무지 : 경기 평택시 고덕여염로 118, 에스비씨비즈니스센터 935호\n• 근무요일/시간 : 주 5일 (월~금) 08:00~17:30 / (점심시간 : 11:30 ~ 13:00) 🎁 복지 및 혜택\n• 교육/생활 : 워크샵, 신규 입사자 교육(OJT), 직무능력향상교육, 식비 지원, 음료제공(차,커피)• 리프레시 : 연차, 반차, 근로자의날 휴무\n• 급여제도 : 퇴직연금, 상여금, 장기근속자 포상\n• 조직 문화 : 수평적 조직문화, 회식강요 안함, 야근강요 안함, 자유복장, 자유로운 연차사용, 출산 장려\n• 선물 : 생일선물/파티, 장기근속 선물\n• 근무 환경 : 회의실, 노트북, 사내도서관\n• 출퇴근 : 기숙사 운영 🚀","채용절차":"채용절차","접수기간":"접수기간 : 2026-07-08 16시 ~ 2026-08-07 24시 제출서류 : 사람인 온라인 이력서, *필수첨부* - 자기소개서*, 이력서*, 포트폴리오(선택사항) 접수방법 : 사람인 입사지원","전형절차":"전형절차 : 서류전형 → 1차 면접 → 최종합격 🛎️ 유의사항\n• 입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.• 모집분야별로 마감일이 상이할 수 있으니 유의하시길 바랍니다."},"detectedSkills":["Python","Azure","Spark","SQL"],"imageUrls":["https://www.saraminimage.co.kr/sri/recruit/ai_pass_01.png","https://www.saraminimage.co.kr/sri/recruit/img_graphic.png","https://www.saraminbanner.co.kr//new/sub/2026/03/tbo28t19_tk3h-2so2b5_.png","https://clogo.saramin.co.kr/company/logo/202306/01/rvjts0_48il-1p1ikjd_logo.jpg","https://www.saraminbanner.co.kr/adserver/default/2022/11/rlu35u_3w16-2so1qq_PC728X90.png","https://static.saraminimage.co.kr/static/hiring/images/template/toptype/it5.webp"],"extraction":{"listMethod":"saramin job-category html","detailMethod":"relay view-ajax + view-detail iframe","imageOnlyNotice":false,"cleaning":"selected 20 IT/data notices, line breaks preserved and OCR text normalized"}}',
  CURRENT_TIMESTAMP,
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
  is_active = VALUES(is_active),
  fetched_at = CURRENT_TIMESTAMP;
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'PostgreSQL'
WHERE j.external_notice_id = '54464435'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Node.js'
WHERE j.external_notice_id = '54464435'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MongoDB'
WHERE j.external_notice_id = '54464435'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Docker'
WHERE j.external_notice_id = '54464435'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Python'
WHERE j.external_notice_id = '54464435'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Linux'
WHERE j.external_notice_id = '54464435'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MySQL'
WHERE j.external_notice_id = '54464435'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Redis'
WHERE j.external_notice_id = '54464435'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Python'
WHERE j.external_notice_id = '54271343'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Fullstack'
WHERE j.external_notice_id = '54340223'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'JavaScript'
WHERE j.external_notice_id = '54470782'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'HTML'
WHERE j.external_notice_id = '54470782'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Java'
WHERE j.external_notice_id = '54470782'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'CSS'
WHERE j.external_notice_id = '54470782'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'TypeScript'
WHERE j.external_notice_id = '51067805'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'React'
WHERE j.external_notice_id = '51067805'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Spring Boot'
WHERE j.external_notice_id = '54389622'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'PostgreSQL'
WHERE j.external_notice_id = '54389622'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MyBatis'
WHERE j.external_notice_id = '54389622'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MariaDB'
WHERE j.external_notice_id = '54389622'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Spring'
WHERE j.external_notice_id = '54389622'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Kafka'
WHERE j.external_notice_id = '54389622'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Redis'
WHERE j.external_notice_id = '54389622'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Java'
WHERE j.external_notice_id = '54389622'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'WAS'
WHERE j.external_notice_id = '54389622'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'SQL'
WHERE j.external_notice_id = '54389622'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'JPA'
WHERE j.external_notice_id = '54389622'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Spring Boot'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Eclipse'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MariaDB'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Docker'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'jQuery'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Spring'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Tomcat'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Node.js'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'React'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Java'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'WAS'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'JSP'
WHERE j.external_notice_id = '54464320'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'PostgreSQL'
WHERE j.external_notice_id = '54462189'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'REST API'
WHERE j.external_notice_id = '54462189'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Node.js'
WHERE j.external_notice_id = '54462189'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'PyTorch'
WHERE j.external_notice_id = '54462189'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Docker'
WHERE j.external_notice_id = '54462189'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'OpenCV'
WHERE j.external_notice_id = '54462189'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Python'
WHERE j.external_notice_id = '54462189'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Redis'
WHERE j.external_notice_id = '54462189'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Flask'
WHERE j.external_notice_id = '54462189'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Java'
WHERE j.external_notice_id = '54462189'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'PostgreSQL'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'JavaScript'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Kubernetes'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'TypeScript'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'REST API'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Node.js'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Jenkins'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'GraphQL'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Docker'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Ubuntu'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Linux'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MySQL'
WHERE j.external_notice_id = '54458887'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'PostgreSQL'
WHERE j.external_notice_id = '54463666'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'REST API'
WHERE j.external_notice_id = '54463666'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Docker'
WHERE j.external_notice_id = '54463666'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MySQL'
WHERE j.external_notice_id = '54463666'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'AWS'
WHERE j.external_notice_id = '54463666'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Fullstack'
WHERE j.external_notice_id = '54463666'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'REST API'
WHERE j.external_notice_id = '54463604'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MariaDB'
WHERE j.external_notice_id = '54463604'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Vue.js'
WHERE j.external_notice_id = '54463604'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Python'
WHERE j.external_notice_id = '54463604'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'SQL'
WHERE j.external_notice_id = '54463604'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Fullstack'
WHERE j.external_notice_id = '54463604'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'REST API'
WHERE j.external_notice_id = '54407178'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'React'
WHERE j.external_notice_id = '54407178'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'SQL'
WHERE j.external_notice_id = '54407178'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Fullstack'
WHERE j.external_notice_id = '54407178'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'JavaScript'
WHERE j.external_notice_id = '54205846'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'TypeScript'
WHERE j.external_notice_id = '54205846'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'REST API'
WHERE j.external_notice_id = '54205846'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Angular'
WHERE j.external_notice_id = '54205846'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Docker'
WHERE j.external_notice_id = '54205846'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'React'
WHERE j.external_notice_id = '54205846'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'HTML'
WHERE j.external_notice_id = '54205846'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'CSS'
WHERE j.external_notice_id = '54205846'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Git'
WHERE j.external_notice_id = '54205846'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Vue.js'
WHERE j.external_notice_id = '54205846'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Fullstack'
WHERE j.external_notice_id = '54205846'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'PostgreSQL'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'JavaScript'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'TensorFlow'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'TypeScript'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'REST API'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Node.js'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MongoDB'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Angular'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'PyTorch'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Docker'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'OpenCV'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Python'
WHERE j.external_notice_id = '54206219'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Spring'
WHERE j.external_notice_id = '54421882'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Linux'
WHERE j.external_notice_id = '54421882'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Java'
WHERE j.external_notice_id = '54421882'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MFC'
WHERE j.external_notice_id = '54421882'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'C++'
WHERE j.external_notice_id = '54421882'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Git'
WHERE j.external_notice_id = '54421882'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Fullstack'
WHERE j.external_notice_id = '54421882'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'React Native'
WHERE j.external_notice_id = '51067920'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'JavaScript'
WHERE j.external_notice_id = '51067920'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'React'
WHERE j.external_notice_id = '51067920'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'HTML'
WHERE j.external_notice_id = '51067920'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'CSS'
WHERE j.external_notice_id = '51067920'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MySQL'
WHERE j.external_notice_id = '54470743'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'SQL'
WHERE j.external_notice_id = '54470743'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'JavaScript'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Kubernetes'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'TensorFlow'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'TypeScript'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'OracleDB'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'PyTorch'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Docker'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'jQuery'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Spring'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Vue.js'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Linux'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'MySQL'
WHERE j.external_notice_id = '54325930'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Node.js'
WHERE j.external_notice_id = '54111660'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Python'
WHERE j.external_notice_id = '54111660'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'SaaS'
WHERE j.external_notice_id = '54111660'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Python'
WHERE j.external_notice_id = '54409393'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Azure'
WHERE j.external_notice_id = '54409393'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'Spark'
WHERE j.external_notice_id = '54409393'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);
INSERT INTO job_notice_skills (job_notice_id, skill_id)
SELECT j.job_notice_id, s.skill_id
FROM job_notices j
JOIN skills s ON s.skill_name = 'SQL'
WHERE j.external_notice_id = '54409393'
ON DUPLICATE KEY UPDATE skill_id = VALUES(skill_id);

COMMIT;

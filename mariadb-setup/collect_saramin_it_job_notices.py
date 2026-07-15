from __future__ import annotations

import html
import json
import re
import time
from dataclasses import asdict, dataclass
from pathlib import Path
from urllib.parse import urlencode
from urllib.request import Request, urlopen

BASE_URL = "https://www.saramin.co.kr"
OUTPUT_PATH = Path("mariadb-setup/saramin_it_job_notice_candidates_20260715.json")
TARGET_COUNT = 80

HEADERS = {
    "User-Agent": (
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
        "AppleWebKit/537.36 Chrome/126 Safari/537.36"
    ),
    "Accept-Language": "ko-KR,ko;q=0.9,en-US;q=0.8",
}

CATEGORIES = [
    ("84", "BACKEND", "백엔드/서버개발"),
    ("92", "FRONTEND", "프론트엔드"),
    ("87", "FULLSTACK", "웹개발"),
    ("2232", "FULLSTACK", "풀스택"),
    ("86", "MOBILE", "앱개발"),
    ("83", "DATA", "데이터엔지니어"),
    ("82", "DATA", "데이터분석가"),
    ("2248", "DATA", "데이터 사이언티스트"),
    ("181", "AI", "AI(인공지능)"),
    ("146", "DEVOPS", "DevOps"),
    ("136", "DEVOPS", "클라우드"),
    ("90", "SECURITY", "정보보안"),
    ("99", "QA", "QA/테스터"),
    ("80", "GAME", "게임개발"),
]

EXCLUDED_TITLE_WORDS = (
    "국비",
    "교육",
    "부트캠프",
    "Bootcamp",
    "무료교육",
    "훈련",
    "취업연계",
    "과정",
    "아카데미",
)


@dataclass(frozen=True)
class JobNoticeCandidate:
    externalNoticeId: str
    title: str
    companyName: str
    jobCategory: str
    sourceCategoryCode: str
    sourceCategoryName: str
    sourceUrl: str


def fetch_text(url: str) -> str:
    request = Request(url, headers=HEADERS)
    with urlopen(request, timeout=15) as response:
        return response.read().decode("utf-8", errors="replace")


def build_category_url(category_code: str, page: int) -> str:
    query = urlencode(
        {
            "cat_kewd": category_code,
            "search_optional_item": "n",
            "search_done": "y",
            "recruitPage": page,
            "recruitPageCount": 50,
        }
    )
    return f"{BASE_URL}/zf_user/jobs/list/job-category?{query}"


def normalize_text(value: str) -> str:
    unescaped_value = html.unescape(re.sub(r"<[^>]+>", " ", value))
    return re.sub(r"\s+", " ", unescaped_value).strip()


def is_relevant_title(title: str) -> bool:
    return bool(title) and not any(word.lower() in title.lower() for word in EXCLUDED_TITLE_WORDS)


def parse_candidates(page_html: str, job_category: str, category_code: str, category_name: str) -> list[JobNoticeCandidate]:
    candidates: list[JobNoticeCandidate] = []
    seen_ids: set[str] = set()
    row_pattern = re.compile(r"<div[^>]+class=\"[^\"]*item_recruit[^\"]*\".*?</div>\s*</div>", re.S)

    for row_html in row_pattern.findall(page_html):
        id_match = re.search(r"rec_idx=(\d+)", row_html)
        title_match = re.search(r"<a[^>]+class=\"[^\"]*str_tit[^\"]*\"[^>]*>(.*?)</a>", row_html, re.S)
        company_match = re.search(r"<a[^>]+class=\"[^\"]*corp_name[^\"]*\"[^>]*>(.*?)</a>", row_html, re.S)

        if not id_match or not title_match:
            continue

        external_notice_id = id_match.group(1)
        title = normalize_text(title_match.group(1))
        company_name = normalize_text(company_match.group(1)) if company_match else ""

        if external_notice_id in seen_ids or not is_relevant_title(title):
            continue

        seen_ids.add(external_notice_id)
        candidates.append(
            JobNoticeCandidate(
                externalNoticeId=external_notice_id,
                title=title,
                companyName=company_name,
                jobCategory=job_category,
                sourceCategoryCode=category_code,
                sourceCategoryName=category_name,
                sourceUrl=f"{BASE_URL}/zf_user/jobs/relay/view?view_type=list&rec_idx={external_notice_id}",
            )
        )

    return candidates


def collect_candidates() -> list[JobNoticeCandidate]:
    collected: dict[str, JobNoticeCandidate] = {}

    for category_code, job_category, category_name in CATEGORIES:
        for page in range(1, 4):
            page_html = fetch_text(build_category_url(category_code, page))
            for candidate in parse_candidates(page_html, job_category, category_code, category_name):
                collected.setdefault(candidate.externalNoticeId, candidate)
                if len(collected) >= TARGET_COUNT:
                    return list(collected.values())
            time.sleep(0.4)

    return list(collected.values())


def main() -> None:
    candidates = collect_candidates()
    OUTPUT_PATH.write_text(
        json.dumps([asdict(candidate) for candidate in candidates], ensure_ascii=False, indent=2),
        encoding="utf-8",
        newline="\n",
    )
    print(f"Collected {len(candidates)} Saramin IT job notice candidates into {OUTPUT_PATH}.")
    print("Use the prepared SQL seed file and OCR enhancement script for DB-ready detail data.")


if __name__ == "__main__":
    main()

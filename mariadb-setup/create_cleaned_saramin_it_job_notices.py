from __future__ import annotations

import json
import re
from pathlib import Path

import importlib.util

SOURCE_SQL_PATH = Path("mariadb-setup/07_saramin_it_job_notices_20260715.sql")
OUTPUT_SQL_PATH = Path("mariadb-setup/08_saramin_it_job_notices_cleaned_20260715.sql")
ENHANCER_PATH = Path("mariadb-setup/enhance_saramin_it_job_notices_with_ocr.py")

IT_KEYWORDS = (
    "개발",
    "개발자",
    "엔지니어",
    "백엔드",
    "프론트엔드",
    "풀스택",
    "웹",
    "앱",
    "서버",
    "시스템",
    "소프트웨어",
    "펌웨어",
    "임베디드",
    "데이터",
    "AI",
    "인공지능",
    "머신러닝",
    "딥러닝",
    "LLM",
    "DevOps",
    "클라우드",
    "보안",
    "QA",
    "테스터",
    "DBA",
    "ERP",
)

NON_IT_TITLE_KEYWORDS = (
    "영업",
    "마케팅",
    "인사",
    "총무",
    "물류",
    "MD",
    "상품기획",
    "회계",
    "재무",
    "상담",
    "운전",
    "편집디자인",
    "영상",
)

OCR_NOISE_PATTERNS = (
    re.compile(r"^[A-Za-z0-9\s\\/\|\[\]\(\)\{\}<>=~`'\".,:;_+\-*^%$#@!]+$"),
    re.compile(r"^[ㄱ-ㅎㅏ-ㅣ\s\\/\|\[\]\(\)\{\}<>=~`'\".,:;_+\-*^%$#@!]+$"),
)

TEXT_REPLACEMENTS = {
    "[이미지 OCR 추출 본문]": "",
    "채요 공고": "채용 공고",
    "섬장을": "성장을",
    "성잠하며": "성장하며",
    "성잠과": "성장과",
    "좀겠어요": "좋겠어요",
    "건강체키": "건강검진",
    "일합니대": "일합니다",
    "입무": "업무",
    "유지부수": "유지보수",
    "무대사항": "우대사항",
    "무대]": "우대]",
    "강력 무대": "강력 우대",
    "파프라인": "파이프라인",
    "프로펙트": "프로젝트",
    "참며": "참여",
    "부며": "부여",
    "7|다립니다": "기다립니다",
    "Al": "AI",
    "OpenAl": "OpenAI",
    "시 오케스트레이션": "AI 오케스트레이션",
    "시 통합": "AI 통합",
    "시 정보검색": "AI 정보검색",
    "시 매그리게이터": "AI 애그리게이터",
    "시 전문": "AI 전문",
    "시 솔루션": "AI 솔루션",
    "시 리서치": "AI 리서치",
    "시 API": "AI API",
    "시 WHE": "AI 웹",
    "AIS 활용": "AI를 활용",
    "엔터테인먼트 pn ” 브브랜드 협업": "엔터테인먼트 브랜드 협업",
    "Bluetooth Remate": "Bluetooth Remote",
    "Cantraller": "Controller",
    "소소프트웨어": "소프트웨어",
}


def load_enhancer_module():
    spec = importlib.util.spec_from_file_location("saramin_enhancer", ENHANCER_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def normalize_spacing(text: str) -> str:
    text = re.sub(r"[ \t]+", " ", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    text = re.sub(r" ?ㆍ ?", "ㆍ ", text)
    text = re.sub(r" ?• ?", "• ", text)
    return text.strip()


def clean_text(text: str | None) -> str | None:
    if text is None:
        return None

    cleaned_text = text
    for source, target in TEXT_REPLACEMENTS.items():
        cleaned_text = cleaned_text.replace(source, target)
    cleaned_text = re.sub(r"(?<!소)프트웨어", "소프트웨어", cleaned_text)

    lines: list[str] = []
    for raw_line in cleaned_text.splitlines():
        line = raw_line.strip()
        if not line:
            if lines and lines[-1] != "":
                lines.append("")
            continue
        if should_drop_noise_line(line):
            continue
        lines.append(line)

    return normalize_spacing("\n".join(lines))


def should_drop_noise_line(line: str) -> bool:
    if len(line) <= 2:
        return True
    if any(pattern.match(line) for pattern in OCR_NOISE_PATTERNS) and len(line) <= 40:
        return True

    korean_count = len(re.findall(r"[가-힣]", line))
    alpha_count = len(re.findall(r"[A-Za-z0-9]", line))
    symbol_count = len(re.findall(r"[^가-힣A-Za-z0-9\s]", line))
    if len(line) <= 30 and symbol_count > korean_count + alpha_count:
        return True
    return False


def has_it_context(columns: list[str], payload: dict, helper) -> bool:
    title = helper.sql_unquote(columns[2]) or ""
    job_category = helper.sql_unquote(columns[4]) or ""
    description = helper.sql_unquote(columns[12]) or ""
    sectors = " ".join((payload.get("listSummary") or {}).get("sectors") or [])
    skills = payload.get("detectedSkills") or []
    search_text = f"{title} {job_category} {sectors} {description[:2500]}"

    has_it_keyword = any(keyword.lower() in search_text.lower() for keyword in IT_KEYWORDS)
    has_skill = bool(skills)
    title_has_non_it = any(keyword in title for keyword in NON_IT_TITLE_KEYWORDS)
    title_has_it = any(keyword.lower() in title.lower() for keyword in IT_KEYWORDS)

    if title_has_non_it and not title_has_it:
        return False
    if title_has_it:
        return True
    return has_it_keyword and has_skill


def clean_payload(payload: dict) -> dict:
    cleaned_payload = json.loads(json.dumps(payload, ensure_ascii=False))

    processed_sections = cleaned_payload.get("processedSections") or {}
    cleaned_payload["processedSections"] = {
        section_name: clean_text(section_text)
        for section_name, section_text in processed_sections.items()
        if clean_text(section_text)
    }

    if cleaned_payload.get("ocrTexts"):
        cleaned_payload["ocrTexts"] = [
            {
                **ocr_text,
                "text": clean_text(ocr_text.get("text")),
            }
            for ocr_text in cleaned_payload["ocrTexts"]
            if clean_text(ocr_text.get("text"))
        ]

    cleaned_payload.setdefault("extraction", {})["cleaning"] = "mojibake and OCR noise lightly normalized"
    return cleaned_payload


def extract_cleaned_ocr_body(payload: dict) -> str | None:
    ocr_texts = payload.get("ocrTexts") or []
    cleaned_texts = [clean_text(ocr_text.get("text")) for ocr_text in ocr_texts]
    usable_texts = [text for text in cleaned_texts if text and len(text) >= 80]
    if not usable_texts:
        return None
    return normalize_spacing("\n\n".join(usable_texts))


def format_row(columns: list[str]) -> str:
    return "(\n  " + ",\n  ".join(columns) + "\n)"


def filter_skill_insert_blocks(suffix: str, kept_external_notice_ids: set[str]) -> str:
    commit_index = suffix.rfind("\nCOMMIT;")
    if commit_index == -1:
        return suffix

    update_prefix = suffix[: suffix.index(";\n", suffix.index("ON DUPLICATE KEY UPDATE")) + 2]
    skill_sql = suffix[len(update_prefix) : commit_index]
    commit_sql = suffix[commit_index:]

    blocks = re.findall(r"INSERT INTO job_notice_skills .*?ON DUPLICATE KEY UPDATE created_at = created_at;\n?", skill_sql, re.S)
    kept_blocks = [
        block
        for block in blocks
        if any(f"WHERE j.external_notice_id = '{external_notice_id}'" in block for external_notice_id in kept_external_notice_ids)
    ]
    return update_prefix + "".join(kept_blocks) + commit_sql


def main() -> None:
    helper = load_enhancer_module()
    sql = SOURCE_SQL_PATH.read_text(encoding="utf-8")
    prefix, values_sql, suffix = helper.split_job_notice_sql(sql)
    rows = [helper.split_columns(row) for row in helper.split_rows(values_sql)]

    kept_rows: list[list[str]] = []
    kept_external_notice_ids: set[str] = set()
    removed_external_notice_ids: list[str] = []

    for columns in rows:
        external_notice_id = helper.sql_unquote(columns[0]) or ""
        payload = helper.load_payload(helper.sql_unquote(columns[14]))

        if not has_it_context(columns, payload, helper):
            removed_external_notice_ids.append(external_notice_id)
            continue

        cleaned_payload = clean_payload(payload)
        cleaned_description = extract_cleaned_ocr_body(cleaned_payload) or clean_text(helper.sql_unquote(columns[12]))
        columns[12] = helper.sql_quote(cleaned_description)
        columns[14] = helper.sql_quote(json.dumps(cleaned_payload, ensure_ascii=False, separators=(",", ":")))
        kept_rows.append(columns)
        kept_external_notice_ids.add(external_notice_id)

    cleaned_values_sql = "\n" + ",\n".join(format_row(columns) for columns in kept_rows) + "\n"
    cleaned_suffix = filter_skill_insert_blocks(suffix, kept_external_notice_ids)
    OUTPUT_SQL_PATH.write_text(prefix + cleaned_values_sql + cleaned_suffix, encoding="utf-8", newline="\n")

    print(f"Created {OUTPUT_SQL_PATH}")
    print(f"Kept {len(kept_rows)} job notices.")
    print(f"Removed {len(removed_external_notice_ids)} non-IT job notices: {', '.join(removed_external_notice_ids)}")


if __name__ == "__main__":
    main()

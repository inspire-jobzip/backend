from __future__ import annotations

import json
import re
from pathlib import Path

import importlib.util

SOURCE_SQL_PATH = Path("mariadb-setup/08_saramin_it_job_notices_cleaned_20260715.sql")
OUTPUT_SQL_PATH = Path("mariadb-setup/09_saramin_it_job_notices_cleaned_20_20260715.sql")
ENHANCER_PATH = Path("mariadb-setup/enhance_saramin_it_job_notices_with_ocr.py")

SELECTED_EXTERNAL_NOTICE_IDS = [
    "54464435",
    "54271343",
    "54340223",
    "54470782",
    "51067805",
    "54389622",
    "54464320",
    "54462189",
    "54458887",
    "54463666",
    "54463604",
    "54407178",
    "54205846",
    "54206219",
    "54421882",
    "51067920",
    "54470743",
    "54325930",
    "54111660",
    "54409393",
]

TEXT_REPLACEMENTS = {
    "소소프트웨어": "소프트웨어",
    "딜러닝": "딥러닝",
    "플랫폴": "플랫폼",
    "혐업": "협업",
    "세비스": "서비스",
    "결력": "경력",
    "신임": "신입",
    "학사 이상": "학사 이상",
    "RestAPI": "REST API",
    "Javascript": "JavaScript",
    "Nodejs": "Node.js",
    "Reactjs": "React.js",
    "Vuejs": "Vue.js",
    "Nextjs": "Next.js",
    "PostgreS0OL": "PostgreSQL",
    "MySQUO": "MySQL",
    "OpenAl": "OpenAI",
    "Al ": "AI ",
}

SECTION_HEADINGS = (
    "주요업무",
    "담당업무",
    "자격요건",
    "우대사항",
    "필수사항",
    "기술스택",
    "근무조건",
    "복지 및 혜택",
    "채용절차",
    "접수기간",
    "전형절차",
)


def load_enhancer_module():
    spec = importlib.util.spec_from_file_location("saramin_enhancer", ENHANCER_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def normalize_text(text: str | None) -> str | None:
    if text is None:
        return None

    normalized_text = text.replace("[이미지 OCR 추출 본문]", "")
    for source, target in TEXT_REPLACEMENTS.items():
        normalized_text = normalized_text.replace(source, target)
    normalized_text = re.sub(r"(?<!소)프트웨어", "소프트웨어", normalized_text)
    normalized_text = re.sub(r"(?<!Java)Script", "Script", normalized_text)
    normalized_text = re.sub(r"(?<!REST )API", "API", normalized_text)

    lines = [clean_line(line) for line in normalized_text.splitlines()]
    lines = [line for line in lines if line]
    return "\n".join(apply_readable_spacing(lines)).strip()


def clean_line(line: str) -> str:
    line = line.strip()
    line = re.sub(r"[ \t]+", " ", line)
    line = re.sub(r" ?ㆍ ?", "ㆍ ", line)
    line = re.sub(r" ?• ?", "• ", line)
    line = re.sub(r"([가-힣A-Za-z0-9])([ㆍ•])", r"\1\n\2", line)
    line = re.sub(r"([.!?])([가-힣A-Za-z])", r"\1 \2", line)
    return line.strip()


def apply_readable_spacing(lines: list[str]) -> list[str]:
    spaced_lines: list[str] = []
    for line in lines:
        if should_start_new_block(line) and spaced_lines and spaced_lines[-1] != "":
            spaced_lines.append("")
        spaced_lines.append(line)
    return spaced_lines


def should_start_new_block(line: str) -> bool:
    return any(line.startswith(heading) or line.startswith(f"[{heading}]") for heading in SECTION_HEADINGS)


def make_markdown_section_table(processed_sections: dict[str, str]) -> str | None:
    meaningful_sections = [
        (section_name, normalize_text(section_text))
        for section_name, section_text in processed_sections.items()
        if section_text and normalize_text(section_text)
    ]
    if len(meaningful_sections) < 3:
        return None

    table_lines = ["", "### 섹션별 정리", "", "| 구분 | 내용 |", "|---|---|"]
    for section_name, section_text in meaningful_sections:
        cell_text = (section_text or "").replace("\n", "<br>")
        table_lines.append(f"| {section_name} | {cell_text} |")
    return "\n".join(table_lines)


def clean_payload(payload: dict) -> dict:
    cleaned_payload = json.loads(json.dumps(payload, ensure_ascii=False))
    processed_sections = cleaned_payload.get("processedSections") or {}
    cleaned_payload["processedSections"] = {
        section_name: normalize_text(section_text)
        for section_name, section_text in processed_sections.items()
        if normalize_text(section_text)
    }

    if cleaned_payload.get("ocrTexts"):
        cleaned_payload["ocrTexts"] = [
            {
                **ocr_text,
                "text": normalize_text(ocr_text.get("text")),
            }
            for ocr_text in cleaned_payload["ocrTexts"]
            if normalize_text(ocr_text.get("text"))
        ]
    cleaned_payload.setdefault("extraction", {})["cleaning"] = "selected 20 IT/data notices, line breaks preserved and OCR text normalized"
    return cleaned_payload


def build_description(description: str | None, payload: dict) -> str | None:
    cleaned_description = normalize_text(description)
    markdown_table = make_markdown_section_table(payload.get("processedSections") or {})
    if markdown_table and markdown_table not in (cleaned_description or ""):
        return f"{cleaned_description}\n{markdown_table}".strip()
    return cleaned_description


def format_row(columns: list[str]) -> str:
    return "(\n  " + ",\n  ".join(columns) + "\n)"


def filter_skill_insert_blocks(suffix: str, kept_external_notice_ids: set[str]) -> str:
    commit_index = suffix.rfind("\nCOMMIT;")
    if commit_index == -1:
        return suffix

    update_end = suffix.index(";\n", suffix.index("ON DUPLICATE KEY UPDATE")) + 2
    update_prefix = suffix[:update_end]
    skill_sql = suffix[update_end:commit_index]
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
    rows_by_external_id = {helper.sql_unquote(columns[0]): columns for columns in rows}

    kept_rows: list[list[str]] = []
    for external_notice_id in SELECTED_EXTERNAL_NOTICE_IDS:
        columns = rows_by_external_id[external_notice_id]
        payload = helper.load_payload(helper.sql_unquote(columns[14]))
        cleaned_payload = clean_payload(payload)
        columns[12] = helper.sql_quote(build_description(helper.sql_unquote(columns[12]), cleaned_payload))
        columns[14] = helper.sql_quote(json.dumps(cleaned_payload, ensure_ascii=False, separators=(",", ":")))
        kept_rows.append(columns)

    kept_external_notice_ids = set(SELECTED_EXTERNAL_NOTICE_IDS)
    cleaned_values_sql = "\n" + ",\n".join(format_row(columns) for columns in kept_rows) + "\n"
    cleaned_suffix = filter_skill_insert_blocks(suffix, kept_external_notice_ids)
    OUTPUT_SQL_PATH.write_text(prefix + cleaned_values_sql + cleaned_suffix, encoding="utf-8", newline="\n")

    print(f"Created {OUTPUT_SQL_PATH}")
    print(f"Kept {len(kept_rows)} job notices.")


if __name__ == "__main__":
    main()

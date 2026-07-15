from __future__ import annotations

import json
import os
import re
import subprocess
from pathlib import Path

SQL_PATH = Path("mariadb-setup/07_saramin_it_job_notices_20260715.sql")
OCR_HELPER_PATH = Path("mariadb-setup/ocr_saramin_images.js")
NODE_PATH = os.getenv(
    "SARAMIN_OCR_NODE_PATH",
    r"C:\Users\user\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe",
)
OCR_WORKDIR = Path(os.getenv("SARAMIN_OCR_NODE_DIR", str(Path.home() / "AppData/Local/Temp/saramin-ocr-node")))

DETAIL_KEYWORDS = ("담당업무", "주요업무", "자격요건", "우대사항", "필수사항", "지원자격")
SECTION_NAMES = ("담당업무", "주요업무", "자격요건", "우대사항", "근무조건", "복리후생", "채용절차", "접수기간")


def split_job_notice_sql(sql: str) -> tuple[str, str, str]:
    marker = "INSERT INTO job_notices ("
    insert_start = sql.index(marker)
    values_start = sql.index(") VALUES", insert_start) + len(") VALUES")
    duplicate_start = sql.index("ON DUPLICATE KEY UPDATE", values_start)
    prefix = sql[:values_start]
    values_sql = sql[values_start:duplicate_start]
    suffix = sql[duplicate_start:]
    return prefix, values_sql, suffix


def split_rows(values_sql: str) -> list[str]:
    rows: list[str] = []
    depth = 0
    start = None
    in_string = False
    index = 0

    while index < len(values_sql):
      char = values_sql[index]
      next_char = values_sql[index + 1] if index + 1 < len(values_sql) else ""

      if in_string:
          if char == "'" and next_char == "'":
              index += 2
              continue
          if char == "'":
              in_string = False
          index += 1
          continue

      if char == "'":
          in_string = True
      elif char == "(":
          if depth == 0:
              start = index
          depth += 1
      elif char == ")":
          depth -= 1
          if depth == 0 and start is not None:
              rows.append(values_sql[start : index + 1])
              start = None

      index += 1

    return rows


def split_columns(row_sql: str) -> list[str]:
    body = row_sql.strip()[1:-1]
    columns: list[str] = []
    start = 0
    in_string = False
    index = 0

    while index < len(body):
        char = body[index]
        next_char = body[index + 1] if index + 1 < len(body) else ""

        if in_string:
            if char == "'" and next_char == "'":
                index += 2
                continue
            if char == "'":
                in_string = False
            index += 1
            continue

        if char == "'":
            in_string = True
        elif char == ",":
            columns.append(body[start:index].strip())
            start = index + 1

        index += 1

    columns.append(body[start:].strip())
    return columns


def sql_unquote(value: str) -> str | None:
    if value.upper() == "NULL":
        return None
    if value.startswith("'") and value.endswith("'"):
        return value[1:-1].replace("''", "'")
    return value


def sql_quote(value: str | None) -> str:
    if value is None:
        return "NULL"
    return "'" + value.replace("'", "''") + "'"


def load_payload(value: str | None) -> dict:
    if not value:
        return {}
    try:
        return json.loads(value)
    except json.JSONDecodeError:
        # Some crawled HTML contains literal quoted slogans. Repair over-escaped
        # quotes so the payload can be normalized when the SQL is regenerated.
        repaired_value = value.replace('\\\\"', '\\"')
        try:
            return json.loads(repaired_value)
        except json.JSONDecodeError:
            image_urls = re.findall(r'https?://[^"\\]+(?:png|jpg|jpeg|gif|webp)', value, re.I)
            return {
                "imageUrls": image_urls,
                "extraction": {
                    "payloadRepair": "raw_payload JSON was invalid, recovered image URLs only",
                },
            }


def has_detail_text(description: str | None, payload: dict) -> bool:
    if not description:
        return False
    if any(keyword in description for keyword in DETAIL_KEYWORDS):
        return True
    sections = payload.get("processedSections") or {}
    return any(section_name in sections for section_name in DETAIL_KEYWORDS)


def extract_sections(text: str) -> dict[str, str]:
    sections: dict[str, str] = {}
    for index, section_name in enumerate(SECTION_NAMES):
        pattern = re.compile(rf"{section_name}\s*[:：]?\s*(.*?)(?={'|'.join(SECTION_NAMES[index + 1:])}|$)", re.S)
        match = pattern.search(text)
        if match:
            section_text = re.sub(r"\s+", " ", match.group(1)).strip()
            if len(section_text) >= 20:
                sections[section_name] = section_text[:2000]
    return sections


def build_ocr_requests(rows: list[list[str]]) -> list[dict]:
    requests: list[dict] = []
    for columns in rows:
        external_notice_id = sql_unquote(columns[0])
        description = sql_unquote(columns[12])
        raw_payload = load_payload(sql_unquote(columns[14]))
        image_urls = raw_payload.get("imageUrls") or []

        if image_urls and not has_detail_text(description, raw_payload):
            requests.append(
                {
                    "externalNoticeId": external_notice_id,
                    "imageUrls": image_urls,
                }
            )

    return requests


def run_ocr(requests: list[dict]) -> dict[str, list[dict]]:
    if not requests:
        return {}

    env = {**os.environ, "NODE_PATH": str(OCR_WORKDIR / "node_modules")}
    process = subprocess.run(
        [NODE_PATH, str(OCR_HELPER_PATH.resolve())],
        input=json.dumps(requests, ensure_ascii=False),
        text=True,
        encoding="utf-8",
        capture_output=True,
        cwd=OCR_WORKDIR,
        env=env,
    )
    if process.returncode != 0:
        raise RuntimeError(process.stderr or process.stdout)
    results = json.loads(process.stdout)
    return {result["externalNoticeId"]: result.get("ocrTexts", []) for result in results}


def append_ocr_text(description: str | None, ocr_texts: list[dict]) -> str | None:
    usable_texts = [item["text"] for item in ocr_texts if item.get("text")]
    if not usable_texts:
        return description

    base_text = (description or "").strip()
    ocr_text = "\n\n".join(usable_texts)
    if base_text:
        return f"{base_text}\n\n[이미지 OCR 추출 본문]\n{ocr_text}"
    return f"채용공고 상세\n\n{ocr_text}"


def format_row(columns: list[str]) -> str:
    return "(\n  " + ",\n  ".join(columns) + "\n)"


def main() -> None:
    sql = SQL_PATH.read_text(encoding="utf-8")
    prefix, values_sql, suffix = split_job_notice_sql(sql)
    rows = [split_columns(row) for row in split_rows(values_sql)]
    requests = build_ocr_requests(rows)
    ocr_results = run_ocr(requests)
    enhanced_count = 0
    normalized_payload_count = 0

    for columns in rows:
        external_notice_id = sql_unquote(columns[0])
        ocr_texts = ocr_results.get(external_notice_id, [])
        original_payload = sql_unquote(columns[14])
        raw_payload = load_payload(original_payload)

        if not any(item.get("text") for item in ocr_texts):
            normalized_payload = json.dumps(raw_payload, ensure_ascii=False, separators=(",", ":"))
            if original_payload != normalized_payload:
                columns[14] = sql_quote(normalized_payload)
                normalized_payload_count += 1
            continue

        description = sql_unquote(columns[12])
        raw_payload["ocrTexts"] = ocr_texts
        raw_payload["processedSections"] = {
            **(raw_payload.get("processedSections") or {}),
            **extract_sections("\n\n".join(item["text"] for item in ocr_texts if item.get("text"))),
        }
        raw_payload.setdefault("extraction", {})["ocrMethod"] = "tesseract.js kor+eng from Saramin detail images"

        columns[12] = sql_quote(append_ocr_text(description, ocr_texts))
        columns[14] = sql_quote(json.dumps(raw_payload, ensure_ascii=False, separators=(",", ":")))
        enhanced_count += 1
        normalized_payload_count += 1

    rebuilt_values = "\n" + ",\n".join(format_row(columns) for columns in rows) + "\n"
    SQL_PATH.write_text(prefix + rebuilt_values + suffix, encoding="utf-8", newline="\n")
    print(f"Enhanced {enhanced_count} job notices with OCR text.")
    print(f"Normalized {normalized_payload_count} raw_payload values.")


if __name__ == "__main__":
    main()

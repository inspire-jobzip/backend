const { createRequire } = require("module");
const path = require("path");

function loadTesseract() {
  try {
    return require("tesseract.js");
  } catch {
    const runtimeRequire = createRequire(path.join(process.cwd(), "package.json"));
    return runtimeRequire("tesseract.js");
  }
}

const { createWorker } = loadTesseract();

const EXCLUDED_IMAGE_PATTERNS = [
  /ai_pass/i,
  /img_graphic/i,
  /banner/i,
  /logo/i,
  /watermark/i,
  /icon/i,
  /stack/i,
];

function readStdin() {
  return new Promise((resolve, reject) => {
    let input = "";
    process.stdin.setEncoding("utf8");
    process.stdin.on("data", (chunk) => {
      input += chunk;
    });
    process.stdin.on("end", () => resolve(input));
    process.stdin.on("error", reject);
  });
}

function normalizeText(text) {
  return text
    .replace(/\r/g, "\n")
    .replace(/[ \t]+/g, " ")
    .replace(/\n{3,}/g, "\n\n")
    .trim();
}

function selectDetailImageUrls(imageUrls) {
  return imageUrls
    .filter((imageUrl) => !EXCLUDED_IMAGE_PATTERNS.some((pattern) => pattern.test(imageUrl)))
    .slice(0, 3);
}

async function recognizeImages(requests) {
  const worker = await createWorker("kor+eng", 1);
  const results = [];

  try {
    for (const request of requests) {
      const imageUrls = selectDetailImageUrls(request.imageUrls || []);
      const ocrTexts = [];

      console.error(`[OCR] ${request.externalNoticeId}: ${imageUrls.length} detail image(s)`);
      for (const imageUrl of imageUrls) {
        try {
          const result = await worker.recognize(imageUrl);
          const text = normalizeText(result.data.text || "");
          if (text.length >= 80) {
            ocrTexts.push({ imageUrl, text });
          }
        } catch (error) {
          ocrTexts.push({ imageUrl, error: error.message });
        }
      }

      results.push({
        externalNoticeId: request.externalNoticeId,
        ocrTexts,
      });
    }
  } finally {
    await worker.terminate();
  }

  return results;
}

(async () => {
  const input = await readStdin();
  const requests = JSON.parse(input);
  const results = await recognizeImages(requests);
  process.stdout.write(JSON.stringify(results, null, 2));
})().catch((error) => {
  console.error(error);
  process.exit(1);
});

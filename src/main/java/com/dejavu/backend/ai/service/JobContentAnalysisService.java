package com.dejavu.backend.ai.service;

import com.dejavu.backend.ai.domain.JobNoticeSnapshot;
import com.dejavu.backend.ai.domain.SkillMatch;
import com.dejavu.backend.ai.dto.AiAnalysisResponse;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Service
public class JobContentAnalysisService {

    private final ObjectMapper objectMapper = new ObjectMapper();
    private final OpenAiJobAnalysisClient openAiJobAnalysisClient;

    public JobContentAnalysisService(OpenAiJobAnalysisClient openAiJobAnalysisClient) {
        this.openAiJobAnalysisClient = openAiJobAnalysisClient;
    }

    public AiAnalysisResponse.AiAnalysis analyze(
            JobNoticeSnapshot job,
            List<SkillMatch> mappedSkills
    ) {
        JobContentSections sections = extractSections(job);
        return openAiJobAnalysisClient.analyze(job, mappedSkills, sections)
                .orElseGet(() -> fallbackAnalyze(job, mappedSkills, sections));
    }

    private AiAnalysisResponse.AiAnalysis fallbackAnalyze(
            JobNoticeSnapshot job,
            List<SkillMatch> mappedSkills,
            JobContentSections sections
    ) {
        List<String> requiredSkills = mappedSkills.stream()
                .map(SkillMatch::skillName)
                .distinct()
                .limit(10)
                .toList();
        List<String> possibleTasks = possibleTasks(job, sections, requiredSkills);
        List<String> responsibilities = firstNonEmpty(
                sections.tasks(),
                possibleTasks,
                List.of("공고 원문 기반 세부 업무 확인 필요")
        );
        List<String> qualifications = firstNonEmpty(
                sections.requirements(),
                requiredSkills.stream().map(skill -> skill + " 활용 역량").toList(),
                List.of()
        );

        String overview = "%s의 %s 공고입니다. %s".formatted(
                blankToText(job.companyName(), "해당 기업"),
                blankToText(job.title(), "채용"),
                requiredSkills.isEmpty()
                        ? "공고 원문을 기반으로 담당업무와 근무조건을 요약했습니다."
                        : String.join(", ", requiredSkills.stream().limit(5).toList()) + " 역량이 중요하게 보입니다."
        );

        List<String> taskSummary = new ArrayList<>();
        taskSummary.add(overview);
        if (!possibleTasks.isEmpty()) {
            taskSummary.add("입사 후에는 " + String.join(", ", possibleTasks.stream().limit(3).toList()) + " 업무를 담당할 가능성이 높습니다.");
        }
        if (!sections.benefits().isEmpty() || !sections.workConditions().isEmpty()) {
            taskSummary.add("근무조건과 복리후생 정보도 함께 추출되어 공고 비교에 활용할 수 있습니다.");
        }

        return new AiAnalysisResponse.AiAnalysis(
                overview,
                taskSummary,
                responsibilities,
                qualifications,
                sections.preferred(),
                sections.workConditions(),
                sections.benefits(),
                sections.process(),
                requiredSkills,
                mappedSkills,
                possibleTasks,
                applicationComment(requiredSkills, possibleTasks),
                preferredSummary(sections.preferred()),
                "RULE_BASED_CONTENT_ANALYSIS",
                LocalDateTime.now()
        );
    }

    private JobContentSections extractSections(JobNoticeSnapshot job) {
        JobContentSections fromPayload = extractSectionsFromRawPayload(job.rawPayload());
        if (!fromPayload.isEmpty()) {
            return fromPayload;
        }
        return extractSectionsFromText(job.descriptionRaw());
    }

    private JobContentSections extractSectionsFromRawPayload(String rawPayload) {
        if (rawPayload == null || rawPayload.isBlank()) {
            return JobContentSections.empty();
        }

        try {
            JsonNode processedSections = objectMapper.readTree(rawPayload).path("processedSections");
            if (processedSections.isMissingNode() || processedSections.isNull()) {
                return JobContentSections.empty();
            }
            return new JobContentSections(
                    stringList(processedSections, "tasks"),
                    stringList(processedSections, "requirements"),
                    stringList(processedSections, "preferred"),
                    stringList(processedSections, "workConditions"),
                    stringList(processedSections, "benefits"),
                    stringList(processedSections, "process")
            );
        } catch (Exception ignored) {
            return JobContentSections.empty();
        }
    }

    private JobContentSections extractSectionsFromText(String descriptionRaw) {
        if (descriptionRaw == null || descriptionRaw.isBlank()) {
            return JobContentSections.empty();
        }

        List<String> tasks = new ArrayList<>();
        List<String> requirements = new ArrayList<>();
        List<String> preferred = new ArrayList<>();
        List<String> workConditions = new ArrayList<>();
        List<String> benefits = new ArrayList<>();
        List<String> process = new ArrayList<>();
        String current = "notes";

        for (String rawLine : descriptionRaw.split("\\n")) {
            String line = cleanLine(rawLine);
            if (line.isBlank()) {
                continue;
            }
            String nextSection = detectSection(line);
            if (nextSection != null) {
                current = nextSection;
                continue;
            }
            if (line.length() > 140) {
                continue;
            }

            switch (current) {
                case "tasks" -> addLimited(tasks, line);
                case "requirements" -> addLimited(requirements, line);
                case "preferred" -> addLimited(preferred, line);
                case "workConditions" -> addLimited(workConditions, line);
                case "benefits" -> addLimited(benefits, line);
                case "process" -> addLimited(process, line);
                default -> {
                }
            }
        }

        return new JobContentSections(tasks, requirements, preferred, workConditions, benefits, process);
    }

    private String detectSection(String line) {
        if (line.matches(".*(주요업무|담당업무|업무내용|이런 업무|이런 일).*")) {
            return "tasks";
        }
        if (line.matches(".*(자격요건|지원자격|필수 역량|필수역량|찾고 있어요|공통 자격요건).*")) {
            return "requirements";
        }
        if (line.matches(".*(우대사항|더욱 좋아요|우대).*")) {
            return "preferred";
        }
        if (line.matches(".*(근무조건|근무 조건|근무처|근무 장소|근무지역|근무지|근무형태).*")) {
            return "workConditions";
        }
        if (line.matches(".*(복리후생|복지 및 혜택|복지|근무 환경|지원금/보험|급여제도|선물|출퇴근|사내 문화).*")) {
            return "benefits";
        }
        if (line.matches(".*(전형절차|채용절차|채용 프로세스|접수방법|접수기간|제출서류).*")) {
            return "process";
        }
        return null;
    }

    private List<String> possibleTasks(
            JobNoticeSnapshot job,
            JobContentSections sections,
            List<String> requiredSkills
    ) {
        Set<String> tasks = new LinkedHashSet<>();
        String text = String.join(" ",
                nullToBlank(job.title()),
                nullToBlank(job.jobCategory()),
                nullToBlank(job.descriptionRaw()),
                String.join(" ", sections.tasks()),
                String.join(" ", requiredSkills)
        ).toLowerCase();

        if (text.contains("api") || text.contains("rest")) {
            tasks.add("API 설계 및 개발");
        }
        if (text.contains("db") || text.contains("sql") || text.contains("데이터")) {
            tasks.add("데이터 모델링 및 처리");
        }
        if (text.contains("운영") || text.contains("유지") || text.contains("보수") || text.contains("장애")) {
            tasks.add("서비스 운영 및 트러블슈팅");
        }
        if (text.contains("aws") || text.contains("cloud") || text.contains("docker") || text.contains("배포")) {
            tasks.add("클라우드 배포 및 인프라 운영");
        }
        if (text.contains("react") || text.contains("frontend") || text.contains("프론트")) {
            tasks.add("웹 프론트엔드 기능 개발");
        }
        if (text.contains("erp") || text.contains("saas") || text.contains("운영 지원")) {
            tasks.add("운영 지원 및 문서화");
        }
        if ("MANUFACTURING".equalsIgnoreCase(job.jobCategory())) {
            tasks.add("제조/생산 설비 조작 및 품질 확인");
        }
        return new ArrayList<>(tasks);
    }

    private List<String> firstNonEmpty(List<String> first, List<String> second, List<String> fallback) {
        if (!first.isEmpty()) {
            return first;
        }
        if (!second.isEmpty()) {
            return second;
        }
        return fallback;
    }

    private String applicationComment(List<String> requiredSkills, List<String> possibleTasks) {
        if (requiredSkills.isEmpty() && possibleTasks.isEmpty()) {
            return "공고 원문을 기준으로 자격요건과 담당업무를 먼저 확인한 뒤 지원 여부를 판단하면 좋습니다.";
        }
        if (requiredSkills.isEmpty()) {
            return String.join(", ", possibleTasks.stream().limit(2).toList())
                    + " 경험을 이력서에서 강조하면 지원 설득력을 높일 수 있습니다.";
        }
        String skills = String.join(", ", requiredSkills.stream().limit(3).toList());
        return skills + " 경험이 있다면 적합도가 높고, 관련 프로젝트 경험을 함께 강조하면 좋습니다.";
    }

    private String preferredSummary(List<String> preferred) {
        if (preferred.isEmpty()) {
            return "우대사항은 공고 원문에서 명확히 확인되지 않아 자격요건 중심으로 준비하면 좋습니다.";
        }
        return "우대사항으로는 " + String.join(", ", preferred.stream().limit(2).toList()) + "이 중요해 보입니다.";
    }

    private List<String> stringList(JsonNode node, String fieldName) {
        JsonNode value = node.path(fieldName);
        if (!value.isArray()) {
            return List.of();
        }
        List<String> result = new ArrayList<>();
        value.forEach(item -> addLimited(result, item.asText("")));
        return result;
    }

    private void addLimited(List<String> values, String value) {
        String cleaned = cleanLine(value);
        if (cleaned.isBlank() || values.contains(cleaned) || values.size() >= 12) {
            return;
        }
        values.add(cleaned);
    }

    private String cleanLine(String value) {
        if (value == null) {
            return "";
        }
        return value
                .replaceAll("^[ㆍ•\\-▶☞*\\s]+", "")
                .replaceAll("\\s+", " ")
                .trim();
    }

    private String blankToText(String value, String fallback) {
        return value == null || value.isBlank() ? fallback : value;
    }

    private String nullToBlank(String value) {
        return value == null ? "" : value;
    }

    public record JobContentSections(
            List<String> tasks,
            List<String> requirements,
            List<String> preferred,
            List<String> workConditions,
            List<String> benefits,
            List<String> process
    ) {
        static JobContentSections empty() {
            return new JobContentSections(List.of(), List.of(), List.of(), List.of(), List.of(), List.of());
        }

        boolean isEmpty() {
            return tasks.isEmpty()
                    && requirements.isEmpty()
                    && preferred.isEmpty()
                    && workConditions.isEmpty()
                    && benefits.isEmpty()
                    && process.isEmpty();
        }
    }
}

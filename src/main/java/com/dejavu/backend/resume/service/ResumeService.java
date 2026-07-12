package com.dejavu.backend.resume.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.resume.domain.Resume;
import com.dejavu.backend.resume.domain.ResumeProject;
import com.dejavu.backend.resume.dto.ResumeProjectRequest;
import com.dejavu.backend.resume.dto.ResumeRequest;
import com.dejavu.backend.resume.entity.ResumeEntity;
import com.dejavu.backend.resume.entity.ResumeProjectEntity;
import com.dejavu.backend.resume.repository.ResumeProjectRepository;
import com.dejavu.backend.resume.repository.ResumeRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class ResumeService {

    private static final Long MVP_USER_ID = 1L;
    private static final TypeReference<List<String>> STRING_LIST_TYPE = new TypeReference<>() {
    };

    private final ResumeRepository resumeRepository;
    private final ResumeProjectRepository resumeProjectRepository;
    private final ObjectMapper objectMapper = new ObjectMapper();

    public ResumeService(ResumeRepository resumeRepository, ResumeProjectRepository resumeProjectRepository) {
        this.resumeRepository = resumeRepository;
        this.resumeProjectRepository = resumeProjectRepository;
    }

    @Transactional
    public Resume create(ResumeRequest request) {
        if (request.isDefault()) {
            clearDefaultResume();
        }

        ResumeEntity resume = new ResumeEntity(
                MVP_USER_ID,
                request.title(),
                request.name(),
                request.email(),
                request.phone(),
                request.githubUrl(),
                request.blogUrl(),
                request.summaryText(),
                toJson(nullSafe(request.education())),
                toJson(nullSafe(request.experience())),
                toJson(nullSafe(request.resumeSkillNames())),
                request.motivationText(),
                request.strengthsAndWeaknessesText(),
                request.isDefault()
        );
        return toDomain(resumeRepository.save(resume));
    }

    public List<Resume> findAll() {
        return resumeRepository.findByUserIdOrderByUpdatedAtDesc(MVP_USER_ID).stream()
                .map(this::toDomain)
                .toList();
    }

    public Resume findById(Long resumeId) {
        return toDomain(findEntityById(resumeId));
    }

    public Resume findDefaultResume() {
        return resumeRepository.findFirstByUserIdAndDefaultResumeTrueOrderByUpdatedAtDesc(MVP_USER_ID)
                .or(() -> resumeRepository.findByUserIdOrderByUpdatedAtDesc(MVP_USER_ID).stream().findFirst())
                .map(this::toDomain)
                .orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, "RESUME_NOT_FOUND", "기본 이력서를 찾을 수 없습니다."));
    }

    @Transactional
    public Resume update(Long resumeId, ResumeRequest request) {
        ResumeEntity resume = findEntityById(resumeId);
        if (request.isDefault()) {
            clearDefaultResume();
        }

        resume.update(
                request.title(),
                request.name(),
                request.email(),
                request.phone(),
                request.githubUrl(),
                request.blogUrl(),
                request.summaryText(),
                toJson(nullSafe(request.education())),
                toJson(nullSafe(request.experience())),
                toJson(nullSafe(request.resumeSkillNames())),
                request.motivationText(),
                request.strengthsAndWeaknessesText(),
                request.isDefault()
        );
        return toDomain(resume);
    }

    @Transactional
    public void delete(Long resumeId) {
        ResumeEntity resume = findEntityById(resumeId);
        resumeProjectRepository.deleteByResumeId(resumeId);
        resumeRepository.delete(resume);
    }

    @Transactional
    public Resume setDefault(Long resumeId) {
        ResumeEntity resume = findEntityById(resumeId);
        clearDefaultResume();
        resume.setDefaultResume(true);
        return toDomain(resume);
    }

    @Transactional
    public ResumeProject createProject(Long resumeId, ResumeProjectRequest request) {
        findEntityById(resumeId);
        int sortOrder = request.sortOrder() == null
                ? (int) resumeProjectRepository.countByResumeId(resumeId) + 1
                : request.sortOrder();
        ResumeProjectEntity project = new ResumeProjectEntity(
                resumeId,
                request.projectName(),
                request.roleName(),
                request.startYearMonth(),
                request.endYearMonth(),
                request.description(),
                request.troubleshooting(),
                toJson(nullSafe(request.techStacks())),
                sortOrder
        );
        return toDomain(resumeProjectRepository.save(project));
    }

    @Transactional
    public ResumeProject updateProject(Long resumeId, Long projectId, ResumeProjectRequest request) {
        findEntityById(resumeId);
        ResumeProjectEntity project = findProjectEntity(resumeId, projectId);
        project.update(
                request.projectName(),
                request.roleName(),
                request.startYearMonth(),
                request.endYearMonth(),
                request.description(),
                request.troubleshooting(),
                toJson(nullSafe(request.techStacks())),
                request.sortOrder() == null ? project.getSortOrder() : request.sortOrder()
        );
        return toDomain(project);
    }

    @Transactional
    public void deleteProject(Long resumeId, Long projectId) {
        findEntityById(resumeId);
        resumeProjectRepository.delete(findProjectEntity(resumeId, projectId));
    }

    private ResumeEntity findEntityById(Long resumeId) {
        return resumeRepository.findById(resumeId)
                .filter(resume -> resume.getUserId().equals(MVP_USER_ID))
                .orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, "RESUME_NOT_FOUND", "이력서를 찾을 수 없습니다."));
    }

    private ResumeProjectEntity findProjectEntity(Long resumeId, Long projectId) {
        return resumeProjectRepository.findByResumeProjectIdAndResumeId(projectId, resumeId)
                .orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, "RESUME_PROJECT_NOT_FOUND", "프로젝트 경험을 찾을 수 없습니다."));
    }

    private void clearDefaultResume() {
        List<ResumeEntity> resumes = resumeRepository.findByUserIdOrderByUpdatedAtDesc(MVP_USER_ID);
        resumes.forEach(resume -> resume.setDefaultResume(false));
    }

    private Resume toDomain(ResumeEntity entity) {
        Resume resume = new Resume(
                entity.getResumeId(),
                entity.getUserId(),
                entity.getTitle(),
                entity.getName(),
                entity.getEmail(),
                entity.getPhone(),
                entity.getGithubUrl(),
                entity.getBlogUrl(),
                entity.getSummaryText(),
                fromJson(entity.getEducationJson()),
                fromJson(entity.getExperienceJson()),
                fromJson(entity.getResumeSkillNamesJson()),
                entity.getMotivationText(),
                entity.getStrengthsAndWeaknessesText(),
                Boolean.TRUE.equals(entity.getDefaultResume()),
                entity.getCreatedAt(),
                entity.getUpdatedAt()
        );
        resumeProjectRepository.findByResumeIdOrderBySortOrderAscCreatedAtAsc(entity.getResumeId())
                .stream()
                .map(this::toDomain)
                .forEach(resume::addProjectFromStorage);
        return resume;
    }

    private ResumeProject toDomain(ResumeProjectEntity entity) {
        return new ResumeProject(
                entity.getResumeProjectId(),
                entity.getResumeId(),
                entity.getProjectName(),
                entity.getRoleName(),
                entity.getStartYearMonth(),
                entity.getEndYearMonth(),
                entity.getDescription(),
                entity.getTroubleshooting(),
                fromJson(entity.getTechStacksJson()),
                entity.getSortOrder() == null ? 0 : entity.getSortOrder(),
                entity.getCreatedAt(),
                entity.getCreatedAt()
        );
    }

    private String toJson(List<String> values) {
        try {
            return objectMapper.writeValueAsString(values);
        } catch (JsonProcessingException exception) {
            throw new ApiException(HttpStatus.INTERNAL_SERVER_ERROR, "JSON_SERIALIZE_FAILED", "이력서 JSON 변환에 실패했습니다.");
        }
    }

    private List<String> fromJson(String json) {
        if (json == null || json.isBlank()) {
            return List.of();
        }

        try {
            return objectMapper.readValue(json, STRING_LIST_TYPE);
        } catch (JsonProcessingException exception) {
            return List.of();
        }
    }

    private List<String> nullSafe(List<String> value) {
        return value == null ? new ArrayList<>() : value;
    }
}

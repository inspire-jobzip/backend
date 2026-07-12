package com.dejavu.backend.resume.domain;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ResumeProject {

    private final Long resumeProjectId;
    private final Long resumeId;
    private String projectName;
    private String roleName;
    private String startYearMonth;
    private String endYearMonth;
    private String description;
    private String troubleshooting;
    private List<String> techStacks;
    private int sortOrder;
    private final LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public ResumeProject(Long resumeProjectId, Long resumeId, String projectName, String roleName,
                         String startYearMonth, String endYearMonth, String description,
                         String troubleshooting, List<String> techStacks, int sortOrder) {
        this(resumeProjectId, resumeId, projectName, roleName, startYearMonth, endYearMonth,
                description, troubleshooting, techStacks, sortOrder, LocalDateTime.now(), LocalDateTime.now());
    }

    public ResumeProject(Long resumeProjectId, Long resumeId, String projectName, String roleName,
                         String startYearMonth, String endYearMonth, String description,
                         String troubleshooting, List<String> techStacks, int sortOrder,
                         LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.resumeProjectId = resumeProjectId;
        this.resumeId = resumeId;
        this.projectName = projectName;
        this.roleName = roleName;
        this.startYearMonth = startYearMonth;
        this.endYearMonth = endYearMonth;
        this.description = description;
        this.troubleshooting = troubleshooting;
        this.techStacks = new ArrayList<>(techStacks);
        this.sortOrder = sortOrder;
        this.createdAt = createdAt == null ? LocalDateTime.now() : createdAt;
        this.updatedAt = updatedAt == null ? this.createdAt : updatedAt;
    }

    public Long getResumeProjectId() {
        return resumeProjectId;
    }

    public Long getResumeId() {
        return resumeId;
    }

    public String getProjectName() {
        return projectName;
    }

    public String getRoleName() {
        return roleName;
    }

    public String getStartYearMonth() {
        return startYearMonth;
    }

    public String getEndYearMonth() {
        return endYearMonth;
    }

    public String getDescription() {
        return description;
    }

    public String getTroubleshooting() {
        return troubleshooting;
    }

    public List<String> getTechStacks() {
        return List.copyOf(techStacks);
    }

    public int getSortOrder() {
        return sortOrder;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void update(String projectName, String roleName, String startYearMonth, String endYearMonth,
                       String description, String troubleshooting, List<String> techStacks, int sortOrder) {
        this.projectName = projectName;
        this.roleName = roleName;
        this.startYearMonth = startYearMonth;
        this.endYearMonth = endYearMonth;
        this.description = description;
        this.troubleshooting = troubleshooting;
        this.techStacks = new ArrayList<>(techStacks);
        this.sortOrder = sortOrder;
        this.updatedAt = LocalDateTime.now();
    }
}

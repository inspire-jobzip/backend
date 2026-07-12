package com.dejavu.backend.resume.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name = "resume_projects")
public class ResumeProjectEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "resume_project_id")
    private Long resumeProjectId;

    @Column(name = "resume_id", nullable = false)
    private Long resumeId;

    @Column(name = "project_name", nullable = false, length = 255)
    private String projectName;

    @Column(name = "role_name", length = 150)
    private String roleName;

    @Column(name = "start_year_month", length = 7)
    private String startYearMonth;

    @Column(name = "end_year_month", length = 7)
    private String endYearMonth;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(columnDefinition = "TEXT")
    private String troubleshooting;

    @Column(name = "tech_stacks_json", columnDefinition = "JSON")
    private String techStacksJson;

    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    protected ResumeProjectEntity() {
    }

    public ResumeProjectEntity(Long resumeId, String projectName, String roleName, String startYearMonth,
                               String endYearMonth, String description, String troubleshooting,
                               String techStacksJson, Integer sortOrder) {
        this.resumeId = resumeId;
        this.projectName = projectName;
        this.roleName = roleName;
        this.startYearMonth = startYearMonth;
        this.endYearMonth = endYearMonth;
        this.description = description;
        this.troubleshooting = troubleshooting;
        this.techStacksJson = techStacksJson;
        this.sortOrder = sortOrder;
    }

    @PrePersist
    void prePersist() {
        createdAt = LocalDateTime.now();
        if (sortOrder == null) {
            sortOrder = 0;
        }
    }

    public void update(String projectName, String roleName, String startYearMonth, String endYearMonth,
                       String description, String troubleshooting, String techStacksJson, Integer sortOrder) {
        this.projectName = projectName;
        this.roleName = roleName;
        this.startYearMonth = startYearMonth;
        this.endYearMonth = endYearMonth;
        this.description = description;
        this.troubleshooting = troubleshooting;
        this.techStacksJson = techStacksJson;
        this.sortOrder = sortOrder;
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

    public String getTechStacksJson() {
        return techStacksJson;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
}

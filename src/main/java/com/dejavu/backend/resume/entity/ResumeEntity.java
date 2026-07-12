package com.dejavu.backend.resume.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name = "resumes")
public class ResumeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "resume_id")
    private Long resumeId;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(nullable = false, length = 300)
    private String title;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(nullable = false, length = 255)
    private String email;

    @Column(length = 30)
    private String phone;

    @Column(name = "github_url", length = 500)
    private String githubUrl;

    @Column(name = "blog_url", length = 500)
    private String blogUrl;

    @Column(name = "summary_text", columnDefinition = "TEXT")
    private String summaryText;

    @Column(name = "education_json", columnDefinition = "JSON")
    private String educationJson;

    @Column(name = "experience_json", columnDefinition = "JSON")
    private String experienceJson;

    @Column(name = "resume_skill_names_json", columnDefinition = "JSON")
    private String resumeSkillNamesJson;

    @Column(name = "motivation_text", columnDefinition = "TEXT")
    private String motivationText;

    @Column(name = "strengths_and_weaknesses_text", columnDefinition = "TEXT")
    private String strengthsAndWeaknessesText;

    @Column(name = "is_default", nullable = false)
    private Boolean defaultResume;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    protected ResumeEntity() {
    }

    public ResumeEntity(Long userId, String title, String name, String email, String phone,
                        String githubUrl, String blogUrl, String summaryText, String educationJson,
                        String experienceJson, String resumeSkillNamesJson, String motivationText,
                        String strengthsAndWeaknessesText, Boolean defaultResume) {
        this.userId = userId;
        this.title = title;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.githubUrl = githubUrl;
        this.blogUrl = blogUrl;
        this.summaryText = summaryText;
        this.educationJson = educationJson;
        this.experienceJson = experienceJson;
        this.resumeSkillNamesJson = resumeSkillNamesJson;
        this.motivationText = motivationText;
        this.strengthsAndWeaknessesText = strengthsAndWeaknessesText;
        this.defaultResume = defaultResume;
    }

    @PrePersist
    void prePersist() {
        LocalDateTime now = LocalDateTime.now();
        createdAt = now;
        updatedAt = now;
        if (defaultResume == null) {
            defaultResume = false;
        }
    }

    @PreUpdate
    void preUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public void update(String title, String name, String email, String phone, String githubUrl,
                       String blogUrl, String summaryText, String educationJson,
                       String experienceJson, String resumeSkillNamesJson, String motivationText,
                       String strengthsAndWeaknessesText, Boolean defaultResume) {
        this.title = title;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.githubUrl = githubUrl;
        this.blogUrl = blogUrl;
        this.summaryText = summaryText;
        this.educationJson = educationJson;
        this.experienceJson = experienceJson;
        this.resumeSkillNamesJson = resumeSkillNamesJson;
        this.motivationText = motivationText;
        this.strengthsAndWeaknessesText = strengthsAndWeaknessesText;
        this.defaultResume = defaultResume;
    }

    public void setDefaultResume(Boolean defaultResume) {
        this.defaultResume = defaultResume;
    }

    public Long getResumeId() {
        return resumeId;
    }

    public Long getUserId() {
        return userId;
    }

    public String getTitle() {
        return title;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getGithubUrl() {
        return githubUrl;
    }

    public String getBlogUrl() {
        return blogUrl;
    }

    public String getSummaryText() {
        return summaryText;
    }

    public String getEducationJson() {
        return educationJson;
    }

    public String getExperienceJson() {
        return experienceJson;
    }

    public String getResumeSkillNamesJson() {
        return resumeSkillNamesJson;
    }

    public String getMotivationText() {
        return motivationText;
    }

    public String getStrengthsAndWeaknessesText() {
        return strengthsAndWeaknessesText;
    }

    public Boolean getDefaultResume() {
        return defaultResume;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }
}

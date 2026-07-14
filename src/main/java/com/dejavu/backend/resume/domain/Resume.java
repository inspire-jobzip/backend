package com.dejavu.backend.resume.domain;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Resume {

    private final Long resumeId;
    private final Long userId;
    private String title;
    private String name;
    private String email;
    private String phone;
    private String githubUrl;
    private String blogUrl;
    private String summaryText;
    private List<ResumeEducation> education;
    private List<ResumeExperience> experience;
    private List<String> resumeSkillNames;
    private String motivationText;
    private String strengthsAndWeaknessesText;
    private boolean isDefault;
    private final List<ResumeProject> projects;
    private final LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public Resume(Long resumeId, Long userId, String title, String name, String email,
                  String phone, String githubUrl, String blogUrl, String summaryText,
                  List<ResumeEducation> education, List<ResumeExperience> experience, List<String> resumeSkillNames,
                  String motivationText, String strengthsAndWeaknessesText, boolean isDefault) {
        this(resumeId, userId, title, name, email, phone, githubUrl, blogUrl, summaryText,
                education, experience, resumeSkillNames, motivationText, strengthsAndWeaknessesText,
                isDefault, LocalDateTime.now(), LocalDateTime.now());
    }

    public Resume(Long resumeId, Long userId, String title, String name, String email,
                  String phone, String githubUrl, String blogUrl, String summaryText,
                  List<ResumeEducation> education, List<ResumeExperience> experience, List<String> resumeSkillNames,
                  String motivationText, String strengthsAndWeaknessesText, boolean isDefault,
                  LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.resumeId = resumeId;
        this.userId = userId;
        this.title = title;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.githubUrl = githubUrl;
        this.blogUrl = blogUrl;
        this.summaryText = summaryText;
        this.education = new ArrayList<>(education);
        this.experience = new ArrayList<>(experience);
        this.resumeSkillNames = new ArrayList<>(resumeSkillNames);
        this.motivationText = motivationText;
        this.strengthsAndWeaknessesText = strengthsAndWeaknessesText;
        this.isDefault = isDefault;
        this.projects = new ArrayList<>();
        this.createdAt = createdAt == null ? LocalDateTime.now() : createdAt;
        this.updatedAt = updatedAt == null ? this.createdAt : updatedAt;
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

    public List<ResumeEducation> getEducation() {
        return List.copyOf(education);
    }

    public List<ResumeExperience> getExperience() {
        return List.copyOf(experience);
    }

    public List<String> getResumeSkillNames() {
        return List.copyOf(resumeSkillNames);
    }

    public String getMotivationText() {
        return motivationText;
    }

    public String getStrengthsAndWeaknessesText() {
        return strengthsAndWeaknessesText;
    }

    public boolean isDefault() {
        return isDefault;
    }

    public List<ResumeProject> getProjects() {
        return List.copyOf(projects);
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void update(String title, String name, String email, String phone, String githubUrl, String blogUrl,
                       String summaryText, List<ResumeEducation> education, List<ResumeExperience> experience,
                       List<String> resumeSkillNames, String motivationText, String strengthsAndWeaknessesText,
                       boolean isDefault) {
        this.title = title;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.githubUrl = githubUrl;
        this.blogUrl = blogUrl;
        this.summaryText = summaryText;
        this.education = new ArrayList<>(education);
        this.experience = new ArrayList<>(experience);
        this.resumeSkillNames = new ArrayList<>(resumeSkillNames);
        this.motivationText = motivationText;
        this.strengthsAndWeaknessesText = strengthsAndWeaknessesText;
        this.isDefault = isDefault;
        this.updatedAt = LocalDateTime.now();
    }

    public void setDefault(boolean value) {
        this.isDefault = value;
        this.updatedAt = LocalDateTime.now();
    }

    public void addProject(ResumeProject project) {
        projects.add(project);
        updatedAt = LocalDateTime.now();
    }

    public void addProjectFromStorage(ResumeProject project) {
        projects.add(project);
    }

    public void removeProject(Long projectId) {
        projects.removeIf(project -> project.getResumeProjectId().equals(projectId));
        updatedAt = LocalDateTime.now();
    }
}

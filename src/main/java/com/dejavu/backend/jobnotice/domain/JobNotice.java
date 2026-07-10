package com.dejavu.backend.jobnotice.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name = "job_notices")
public class JobNotice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "job_notice_id")
    private Long jobNoticeId;

    @Column(name = "external_notice_id", nullable = false, length = 100)
    private String externalNoticeId;

    @Column(name = "company_name", nullable = false, length = 200)
    private String companyName;

    @Column(nullable = false, length = 300)
    private String title;

    @Column(name = "job_category", length = 100)
    private String jobCategory;

    @Column(name = "role_keywords_text", columnDefinition = "TEXT")
    private String roleKeywordsText;

    @Column(name = "description_raw", columnDefinition = "TEXT")
    private String descriptionRaw;

    @Column(name = "deadline_at")
    private LocalDateTime deadlineAt;

    @Column(name = "is_active", nullable = false)
    private Boolean active;

    protected JobNotice() {
    }

    public Long getJobNoticeId() {
        return jobNoticeId;
    }

    public String getExternalNoticeId() {
        return externalNoticeId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public String getTitle() {
        return title;
    }

    public String getJobCategory() {
        return jobCategory;
    }

    public String getRoleKeywordsText() {
        return roleKeywordsText;
    }

    public String getDescriptionRaw() {
        return descriptionRaw;
    }

    public LocalDateTime getDeadlineAt() {
        return deadlineAt;
    }

    public Boolean getActive() {
        return active;
    }
}

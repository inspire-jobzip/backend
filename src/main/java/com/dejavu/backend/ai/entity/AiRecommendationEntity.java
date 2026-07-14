package com.dejavu.backend.ai.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name = "ai_recommendations")
public class AiRecommendationEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ai_recommendation_id")
    private Long aiRecommendationId;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "job_notice_id", nullable = false)
    private Long jobNoticeId;

    @Column(name = "resume_id", nullable = false)
    private Long resumeId;

    @Column(name = "feedback_text", nullable = false, columnDefinition = "TEXT")
    private String feedbackText;

    @Column(name = "response_payload", columnDefinition = "JSON")
    private String responsePayload;

    @Column(name = "model_name", length = 100)
    private String modelName;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    protected AiRecommendationEntity() {
    }

    public AiRecommendationEntity(
            Long userId,
            Long jobNoticeId,
            Long resumeId,
            String feedbackText,
            String responsePayload,
            String modelName
    ) {
        this.userId = userId;
        this.jobNoticeId = jobNoticeId;
        this.resumeId = resumeId;
        this.feedbackText = feedbackText;
        this.responsePayload = responsePayload;
        this.modelName = modelName;
    }

    @PrePersist
    void prePersist() {
        createdAt = LocalDateTime.now();
    }

    public Long getAiRecommendationId() {
        return aiRecommendationId;
    }

    public Long getUserId() {
        return userId;
    }

    public Long getJobNoticeId() {
        return jobNoticeId;
    }

    public Long getResumeId() {
        return resumeId;
    }

    public String getFeedbackText() {
        return feedbackText;
    }

    public String getResponsePayload() {
        return responsePayload;
    }

    public String getModelName() {
        return modelName;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
}

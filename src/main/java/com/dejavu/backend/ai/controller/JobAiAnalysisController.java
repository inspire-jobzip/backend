package com.dejavu.backend.ai.controller;

import com.dejavu.backend.ai.dto.AiAnalysisResponse;
import com.dejavu.backend.ai.dto.ResumeKeywordRequest;
import com.dejavu.backend.ai.dto.ResumeKeywordResponse;
import com.dejavu.backend.ai.service.AiAnalysisService;
import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.common.ApiResponse;
import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/job-notices/{jobNoticeId}")
public class JobAiAnalysisController {

    private final AiAnalysisService aiAnalysisService;

    public JobAiAnalysisController(AiAnalysisService aiAnalysisService) {
        this.aiAnalysisService = aiAnalysisService;
    }

    @PostMapping("/ai-analysis")
    public ApiResponse<AiAnalysisResponse> analyzeJob(@PathVariable Long jobNoticeId) {
        return ApiResponse.ok(aiAnalysisService.analyzeJob(jobNoticeId));
    }

    @PostMapping("/resume-keywords")
    public ApiResponse<ResumeKeywordResponse> compareResumeKeywords(
            @AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser,
            @PathVariable Long jobNoticeId,
            @RequestBody(required = false) ResumeKeywordRequest request
    ) {
        Long resumeId = request == null ? null : request.resumeId();
        return ApiResponse.ok(aiAnalysisService.compareResumeKeywords(getAuthenticatedUserId(authenticatedUser), jobNoticeId, resumeId));
    }

    private Long getAuthenticatedUserId(JwtAuthenticatedUser authenticatedUser) {
        if (authenticatedUser == null || authenticatedUser.userId() == null) {
            throw new ApiException(HttpStatus.UNAUTHORIZED, "UNAUTHORIZED", "로그인이 필요합니다.");
        }

        return authenticatedUser.userId();
    }
}

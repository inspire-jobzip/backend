package com.dejavu.backend.ai.controller;

import com.dejavu.backend.ai.dto.AiAnalysisResponse;
import com.dejavu.backend.ai.dto.ResumeKeywordRequest;
import com.dejavu.backend.ai.dto.ResumeKeywordResponse;
import com.dejavu.backend.ai.service.AiAnalysisService;
import com.dejavu.backend.common.ApiResponse;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/job-notices/{jobNoticeId}")
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
            @PathVariable Long jobNoticeId,
            @RequestBody(required = false) ResumeKeywordRequest request
    ) {
        Long resumeId = request == null ? null : request.resumeId();
        return ApiResponse.ok(aiAnalysisService.compareResumeKeywords(jobNoticeId, resumeId));
    }
}

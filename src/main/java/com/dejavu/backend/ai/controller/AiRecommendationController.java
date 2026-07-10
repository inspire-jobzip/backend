package com.dejavu.backend.ai.controller;

import com.dejavu.backend.ai.dto.AiRecommendationRequest;
import com.dejavu.backend.ai.dto.AiRecommendationResponse;
import com.dejavu.backend.ai.service.AiAnalysisService;
import com.dejavu.backend.common.ApiResponse;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/ai-recommendations")
public class AiRecommendationController {

    private final AiAnalysisService aiAnalysisService;

    public AiRecommendationController(AiAnalysisService aiAnalysisService) {
        this.aiAnalysisService = aiAnalysisService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse<AiRecommendationResponse>> create(
            @Valid @RequestBody AiRecommendationRequest request
    ) {
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.created(aiAnalysisService.createRecommendation(request.jobNoticeId(), request.resumeId())));
    }

    @GetMapping
    public ApiResponse<List<AiRecommendationResponse>> findAll() {
        return ApiResponse.ok(aiAnalysisService.findRecommendations());
    }
}

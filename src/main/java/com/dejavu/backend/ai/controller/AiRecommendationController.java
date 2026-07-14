package com.dejavu.backend.ai.controller;

import com.dejavu.backend.ai.dto.AiRecommendationRequest;
import com.dejavu.backend.ai.dto.AiRecommendationResponse;
import com.dejavu.backend.ai.service.AiAnalysisService;
import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.common.ApiResponse;
import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/ai-recommendations")
public class AiRecommendationController {

    private final AiAnalysisService aiAnalysisService;

    public AiRecommendationController(AiAnalysisService aiAnalysisService) {
        this.aiAnalysisService = aiAnalysisService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse<AiRecommendationResponse>> create(
            @AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser,
            @Valid @RequestBody AiRecommendationRequest request
    ) {
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.created(aiAnalysisService.createRecommendation(
                        getAuthenticatedUserId(authenticatedUser),
                        request.jobNoticeId(),
                        request.resumeId()
                )));
    }

    @GetMapping
    public ApiResponse<List<AiRecommendationResponse>> findAll(
            @AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser
    ) {
        return ApiResponse.ok(aiAnalysisService.findRecommendations(getAuthenticatedUserId(authenticatedUser)));
    }

    private Long getAuthenticatedUserId(JwtAuthenticatedUser authenticatedUser) {
        if (authenticatedUser == null || authenticatedUser.userId() == null) {
            throw new ApiException(HttpStatus.UNAUTHORIZED, "UNAUTHORIZED", "로그인이 필요합니다.");
        }

        return authenticatedUser.userId();
    }
}

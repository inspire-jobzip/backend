package com.dejavu.backend.resume.controller;

import com.dejavu.backend.common.ApiResponse;
import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import com.dejavu.backend.resume.dto.ResumeRequest;
import com.dejavu.backend.resume.dto.ResumeResponse;
import com.dejavu.backend.resume.dto.ResumeUpdateRequest;
import com.dejavu.backend.resume.service.ResumeService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/resumes")
public class ResumeController {

    private final ResumeService resumeService;

    public ResumeController(ResumeService resumeService) {
        this.resumeService = resumeService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse<ResumeResponse>> create(
            @AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser,
            @Valid @RequestBody ResumeRequest request
    ) {
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.created(ResumeResponse.from(resumeService.create(getAuthenticatedUserId(authenticatedUser), request))));
    }

    @GetMapping
    public ApiResponse<List<ResumeResponse>> findAll(
            @AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser
    ) {
        return ApiResponse.ok(resumeService.findAll(getAuthenticatedUserId(authenticatedUser)).stream()
                .map(ResumeResponse::from)
                .toList());
    }

    @GetMapping("/{resumeId}")
    public ApiResponse<ResumeResponse> findById(
            @AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser,
            @PathVariable Long resumeId
    ) {
        return ApiResponse.ok(ResumeResponse.from(resumeService.findById(getAuthenticatedUserId(authenticatedUser), resumeId)));
    }

    @PatchMapping("/{resumeId}")
    public ApiResponse<ResumeResponse> update(
            @AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser,
            @PathVariable Long resumeId,
            @Valid @RequestBody ResumeUpdateRequest request
    ) {
        return ApiResponse.ok(ResumeResponse.from(resumeService.update(getAuthenticatedUserId(authenticatedUser), resumeId, request)));
    }

    @PatchMapping("/{resumeId}/default")
    public ApiResponse<ResumeResponse> setDefault(
            @AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser,
            @PathVariable Long resumeId
    ) {
        return ApiResponse.ok(ResumeResponse.from(resumeService.setDefault(getAuthenticatedUserId(authenticatedUser), resumeId)));
    }

    @DeleteMapping("/{resumeId}")
    public ApiResponse<Void> delete(
            @AuthenticationPrincipal JwtAuthenticatedUser authenticatedUser,
            @PathVariable Long resumeId
    ) {
        resumeService.delete(getAuthenticatedUserId(authenticatedUser), resumeId);
        return ApiResponse.message(null, "이력서를 삭제했습니다.");
    }

    private Long getAuthenticatedUserId(JwtAuthenticatedUser authenticatedUser) {
        if (authenticatedUser == null || authenticatedUser.userId() == null) {
            throw new ApiException(HttpStatus.UNAUTHORIZED, "UNAUTHORIZED", "로그인이 필요합니다.");
        }

        return authenticatedUser.userId();
    }
}

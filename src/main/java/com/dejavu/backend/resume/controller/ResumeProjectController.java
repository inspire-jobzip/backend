package com.dejavu.backend.resume.controller;

import com.dejavu.backend.common.ApiResponse;
import com.dejavu.backend.resume.dto.ResumeProjectRequest;
import com.dejavu.backend.resume.dto.ResumeProjectResponse;
import com.dejavu.backend.resume.service.ResumeService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/resumes/{resumeId}/projects")
public class ResumeProjectController {

    private final ResumeService resumeService;

    public ResumeProjectController(ResumeService resumeService) {
        this.resumeService = resumeService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse<ResumeProjectResponse>> create(
            @PathVariable Long resumeId,
            @Valid @RequestBody ResumeProjectRequest request
    ) {
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.created(ResumeProjectResponse.from(resumeService.createProject(resumeId, request))));
    }

    @PatchMapping("/{projectId}")
    public ApiResponse<ResumeProjectResponse> update(
            @PathVariable Long resumeId,
            @PathVariable Long projectId,
            @Valid @RequestBody ResumeProjectRequest request
    ) {
        return ApiResponse.ok(ResumeProjectResponse.from(resumeService.updateProject(resumeId, projectId, request)));
    }

    @DeleteMapping("/{projectId}")
    public ApiResponse<Void> delete(@PathVariable Long resumeId, @PathVariable Long projectId) {
        resumeService.deleteProject(resumeId, projectId);
        return ApiResponse.message(null, "프로젝트 경험을 삭제했습니다.");
    }
}

package com.dejavu.backend.resume.controller;

import com.dejavu.backend.common.ApiResponse;
import com.dejavu.backend.resume.dto.ResumeRequest;
import com.dejavu.backend.resume.dto.ResumeResponse;
import com.dejavu.backend.resume.service.ResumeService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
@RequestMapping("/resumes")
public class ResumeController {

    private final ResumeService resumeService;

    public ResumeController(ResumeService resumeService) {
        this.resumeService = resumeService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse<ResumeResponse>> create(@Valid @RequestBody ResumeRequest request) {
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.created(ResumeResponse.from(resumeService.create(request))));
    }

    @GetMapping
    public ApiResponse<List<ResumeResponse>> findAll() {
        return ApiResponse.ok(resumeService.findAll().stream()
                .map(ResumeResponse::from)
                .toList());
    }

    @GetMapping("/{resumeId}")
    public ApiResponse<ResumeResponse> findById(@PathVariable Long resumeId) {
        return ApiResponse.ok(ResumeResponse.from(resumeService.findById(resumeId)));
    }

    @PatchMapping("/{resumeId}")
    public ApiResponse<ResumeResponse> update(@PathVariable Long resumeId, @Valid @RequestBody ResumeRequest request) {
        return ApiResponse.ok(ResumeResponse.from(resumeService.update(resumeId, request)));
    }

    @PatchMapping("/{resumeId}/default")
    public ApiResponse<ResumeResponse> setDefault(@PathVariable Long resumeId) {
        return ApiResponse.ok(ResumeResponse.from(resumeService.setDefault(resumeId)));
    }

    @DeleteMapping("/{resumeId}")
    public ApiResponse<Void> delete(@PathVariable Long resumeId) {
        resumeService.delete(resumeId);
        return ApiResponse.message(null, "이력서를 삭제했습니다.");
    }
}

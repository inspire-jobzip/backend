package com.dejavu.backend.skill.controller;

import com.dejavu.backend.common.ApiResponse;
import com.dejavu.backend.skill.dto.SkillResponse;
import com.dejavu.backend.skill.service.SkillService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
public class SkillController {

	private final SkillService skillService;

	@GetMapping("/skills")
	public ResponseEntity<ApiResponse<List<SkillResponse>>> getSkills(
		@RequestParam(required = false) String keyword,
		@RequestParam(required = false) String category
	) {
		List<SkillResponse> response = skillService.readSkills(keyword, category);
		return ResponseEntity.ok(ApiResponse.ok(response));
	}
}

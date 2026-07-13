package com.dejavu.backend.jobNotices.ctrl;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dejavu.backend.jobNotices.domain.dto.JobNoticesApiResponse;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesPageResponseDTO;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesResponseDTO;
import com.dejavu.backend.jobNotices.domain.dto.JobNoticesSearchCondition;
import com.dejavu.backend.jobNotices.service.JobNoticesService;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
public class JobNoticesController {

	private final JobNoticesService jobNoticesService;

	@GetMapping("/job-notices")
	public ResponseEntity<JobNoticesApiResponse<JobNoticesPageResponseDTO<JobNoticesResponseDTO>>> getJobNotices(
		@RequestParam(required = false) String keyword,
		@RequestParam(required = false) String jobRole,
		@RequestParam(required = false) String skillNames,
		@RequestParam(required = false) String experienceLevel,
		@RequestParam(required = false) String location,
		@RequestParam(required = false) String sort,
		@RequestParam(required = false) String page,
		@RequestParam(required = false) String size
	) {
		JobNoticesSearchCondition condition = JobNoticesSearchCondition.of(
			keyword,
			jobRole,
			skillNames,
			experienceLevel,
			location,
			sort,
			page,
			size
		);
		JobNoticesPageResponseDTO<JobNoticesResponseDTO> response = jobNoticesService.read(condition);

		return ResponseEntity.ok(JobNoticesApiResponse.success(response));
	}
}

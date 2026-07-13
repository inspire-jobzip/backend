package com.dejavu.backend.skill.service;

import com.dejavu.backend.jobNotices.domain.entity.Skills;
import com.dejavu.backend.skill.dto.SkillResponse;
import com.dejavu.backend.skill.repository.SkillRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class SkillService {

	private final SkillRepository skillRepository;

	@Transactional(readOnly = true)
	public List<SkillResponse> readSkills(String keyword, String category) {
		return skillRepository.search(normalize(keyword), normalize(category)).stream()
			.map(this::toResponse)
			.toList();
	}

	private SkillResponse toResponse(Skills skill) {
		return new SkillResponse(
			skill.getSkillId(),
			skill.getSkillName(),
			skill.getCategory()
		);
	}

	private String normalize(String value) {
		if (value == null) {
			return null;
		}

		String trimmed = value.trim();
		return trimmed.isEmpty() ? null : trimmed;
	}
}

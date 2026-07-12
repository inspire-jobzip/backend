package com.dejavu.backend.features.jobNotices.domain.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

// Bookmarks, ai_recommendations JPA entity 작성 후 다시 테스트 할 예정

@Entity
@Table(
	name = "skills",
	uniqueConstraints = {
		@UniqueConstraint(name = "uk_skills_skill_name", columnNames = "skill_name")
	},
	indexes = {
		@Index(name = "idx_skills_category", columnList = "category")
	}
)
public class Skills {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "skill_id")
	private Long skillId;

	@Column(name = "skill_name", nullable = false, length = 100, unique = true)
	private String skillName;

	@Column(name = "category", length = 50)
	private String category;

	// 기술 마스터 데이터는 DB 기본값으로 생성 시각을 관리한다.
	@Column(
		name = "created_at",
		nullable = false,
		insertable = false,
		updatable = false,
		columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP"
	)
	private LocalDateTime createdAt;

	@OneToMany(mappedBy = "skill")
	private List<JobNoticeSkills> jobNoticeSkills = new ArrayList<>();

	protected Skills() {
	}

	public Long getSkillId() {
		return skillId;
	}

	public String getSkillName() {
		return skillName;
	}

	public String getCategory() {
		return category;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public List<JobNoticeSkills> getJobNoticeSkills() {
		return jobNoticeSkills;
	}
}

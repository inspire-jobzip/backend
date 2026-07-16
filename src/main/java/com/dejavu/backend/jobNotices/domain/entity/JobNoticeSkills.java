package com.dejavu.backend.jobNotices.domain.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
@Table(
	name = "job_notice_skills",
	indexes = {
		@Index(name = "idx_job_notice_skills_skill_id", columnList = "skill_id")
	}
)
@IdClass(JobNoticeSkills.JobNoticeSkillsId.class)
public class JobNoticeSkills {

	// 매핑 테이블의 복합 PK를 DB 스키마 그대로 두 FK 컬럼으로 표현한다.
	@Id
	@Column(name = "job_notice_id")
	private Long jobNoticeId;

	@Id
	@Column(name = "skill_id")
	private Long skillId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "job_notice_id", nullable = false, insertable = false, updatable = false)
	private JobNotices jobNotice;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "skill_id", nullable = false, insertable = false, updatable = false)
	private Skills skill;

	@Column(
		name = "created_at",
		nullable = false,
		insertable = false,
		updatable = false,
		columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP"
	)
	private LocalDateTime createdAt;

	protected JobNoticeSkills() {
	}

	public Long getJobNoticeId() {
		return jobNoticeId;
	}

	public Long getSkillId() {
		return skillId;
	}

	public JobNotices getJobNotice() {
		return jobNotice;
	}

	public Skills getSkill() {
		return skill;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	// IdClass 필드명은 Entity의 @Id 필드명과 같아야 한다.
	public static class JobNoticeSkillsId implements Serializable {

		private Long jobNoticeId;
		private Long skillId;

		public JobNoticeSkillsId() {
		}

		public JobNoticeSkillsId(Long jobNoticeId, Long skillId) {
			this.jobNoticeId = jobNoticeId;
			this.skillId = skillId;
		}

		public Long getJobNoticeId() {
			return jobNoticeId;
		}

		public Long getSkillId() {
			return skillId;
		}

		@Override
		public boolean equals(Object object) {
			if (this == object) {
				return true;
			}
			if (!(object instanceof JobNoticeSkillsId that)) {
				return false;
			}
			return Objects.equals(jobNoticeId, that.jobNoticeId)
				&& Objects.equals(skillId, that.skillId);
		}

		@Override
		public int hashCode() {
			return Objects.hash(jobNoticeId, skillId);
		}
	}
}

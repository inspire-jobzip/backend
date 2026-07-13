package com.dejavu.backend.user.entity;

import com.dejavu.backend.common.util.JsonListConverter;
import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private Long userId;

	@Column(name = "email", nullable = false, unique = true, length = 255)
	private String email;

	@Column(name = "password_hash", nullable = false, length = 255)
	private String passwordHash;

	@Enumerated(EnumType.STRING)
	@Column(name = "status", nullable = false, length = 20)
	private UserStatus status;

	@Enumerated(EnumType.STRING)
	@Column(name = "desired_job_role", nullable = false, length = 100)
	private DesiredJobRole desiredJobRole;

	@Enumerated(EnumType.STRING)
	@Column(name = "career_status", nullable = false, length = 20)
	private CareerStatus careerStatus;

	@Column(name = "career_years", precision = 4, scale = 1)
	private BigDecimal careerYears;

	@Convert(converter = JsonListConverter.class)
	@Column(name = "preferred_skill_names_json", columnDefinition = "json")
	private List<String> preferredSkillNames;

	@Column(name = "created_at", nullable = false)
	private LocalDateTime createdAt;

	@Column(name = "updated_at", nullable = false)
	private LocalDateTime updatedAt;

	protected User() {
	}

	private User(
		String email,
		String passwordHash,
		DesiredJobRole desiredJobRole,
		CareerStatus careerStatus,
		BigDecimal careerYears,
		List<String> preferredSkillNames
	) {
		this.email = email;
		this.passwordHash = passwordHash;
		this.status = UserStatus.ACTIVE;
		this.desiredJobRole = desiredJobRole;
		this.careerStatus = careerStatus;
		this.careerYears = careerYears;
		this.preferredSkillNames = preferredSkillNames == null ? null : new ArrayList<>(preferredSkillNames);
	}

	public static User create(
		String email,
		String passwordHash,
		DesiredJobRole desiredJobRole,
		CareerStatus careerStatus,
		BigDecimal careerYears,
		List<String> preferredSkillNames
	) {
		return new User(email, passwordHash, desiredJobRole, careerStatus, careerYears, preferredSkillNames);
	}

	@PrePersist
	void onCreate() {
		LocalDateTime now = LocalDateTime.now();
		this.createdAt = now;
		this.updatedAt = now;
	}

	@PreUpdate
	void onUpdate() {
		this.updatedAt = LocalDateTime.now();
	}

	public void updateProfile(
		DesiredJobRole desiredJobRole,
		CareerStatus careerStatus,
		BigDecimal careerYears,
		List<String> preferredSkillNames
	) {
		this.desiredJobRole = desiredJobRole;
		this.careerStatus = careerStatus;
		this.careerYears = careerYears;
		this.preferredSkillNames = preferredSkillNames == null ? null : new ArrayList<>(preferredSkillNames);
	}

	public Long getUserId() {
		return userId;
	}

	public String getEmail() {
		return email;
	}

	public String getPasswordHash() {
		return passwordHash;
	}

	public UserStatus getStatus() {
		return status;
	}

	public DesiredJobRole getDesiredJobRole() {
		return desiredJobRole;
	}

	public CareerStatus getCareerStatus() {
		return careerStatus;
	}

	public BigDecimal getCareerYears() {
		return careerYears;
	}

	public List<String> getPreferredSkillNames() {
		return preferredSkillNames == null ? null : new ArrayList<>(preferredSkillNames);
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}
}

package com.dejavu.backend.auth.entity;

import com.dejavu.backend.user.entity.User;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_refresh_tokens")
public class UserRefreshToken {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "refresh_token_id")
	private Long refreshTokenId;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "user_id", nullable = false)
	private User user;

	@Column(name = "token_hash", nullable = false, unique = true, length = 255)
	private String tokenHash;

	@Column(name = "expires_at", nullable = false)
	private LocalDateTime expiresAt;

	@Column(name = "revoked_at")
	private LocalDateTime revokedAt;

	@Column(name = "created_at", nullable = false)
	private LocalDateTime createdAt;

	protected UserRefreshToken() {
	}

	private UserRefreshToken(User user, String tokenHash, LocalDateTime expiresAt) {
		this.user = user;
		this.tokenHash = tokenHash;
		this.expiresAt = expiresAt;
	}

	public static UserRefreshToken create(User user, String tokenHash, LocalDateTime expiresAt) {
		return new UserRefreshToken(user, tokenHash, expiresAt);
	}

	@PrePersist
	void onCreate() {
		this.createdAt = LocalDateTime.now();
	}

	public void revoke() {
		this.revokedAt = LocalDateTime.now();
	}

	public boolean isRevoked() {
		return revokedAt != null;
	}

	public boolean isExpired() {
		return expiresAt.isBefore(LocalDateTime.now());
	}

	public Long getRefreshTokenId() {
		return refreshTokenId;
	}

	public User getUser() {
		return user;
	}

	public String getTokenHash() {
		return tokenHash;
	}

	public LocalDateTime getExpiresAt() {
		return expiresAt;
	}

	public LocalDateTime getRevokedAt() {
		return revokedAt;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
}

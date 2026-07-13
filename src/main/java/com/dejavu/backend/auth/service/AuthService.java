package com.dejavu.backend.auth.service;

import com.dejavu.backend.auth.dto.LoginRequest;
import com.dejavu.backend.auth.dto.LoginResponse;
import com.dejavu.backend.auth.dto.LoginUserResponse;
import com.dejavu.backend.auth.dto.LogoutRequest;
import com.dejavu.backend.auth.dto.RefreshTokenRequest;
import com.dejavu.backend.auth.dto.SignUpRequest;
import com.dejavu.backend.auth.dto.SignUpResponse;
import com.dejavu.backend.auth.dto.TokenRefreshResponse;
import com.dejavu.backend.auth.entity.UserRefreshToken;
import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import com.dejavu.backend.auth.repository.UserRefreshTokenRepository;
import com.dejavu.backend.common.config.JwtProperties;
import com.dejavu.backend.common.exception.BusinessException;
import com.dejavu.backend.common.exception.ErrorCode;
import com.dejavu.backend.common.util.JwtTokenProvider;
import com.dejavu.backend.common.util.RefreshTokenGenerator;
import com.dejavu.backend.common.util.Sha256TokenHasher;
import com.dejavu.backend.user.entity.CareerStatus;
import com.dejavu.backend.user.entity.User;
import com.dejavu.backend.user.entity.UserStatus;
import com.dejavu.backend.user.repository.UserRepository;
import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthService {

	private final UserRepository userRepository;
	private final UserRefreshTokenRepository userRefreshTokenRepository;
	private final PasswordEncoder passwordEncoder;
	private final JwtTokenProvider jwtTokenProvider;
	private final RefreshTokenGenerator refreshTokenGenerator;
	private final Sha256TokenHasher sha256TokenHasher;
	private final JwtProperties jwtProperties;

	public AuthService(
		UserRepository userRepository,
		UserRefreshTokenRepository userRefreshTokenRepository,
		PasswordEncoder passwordEncoder,
		JwtTokenProvider jwtTokenProvider,
		RefreshTokenGenerator refreshTokenGenerator,
		Sha256TokenHasher sha256TokenHasher,
		JwtProperties jwtProperties
	) {
		this.userRepository = userRepository;
		this.userRefreshTokenRepository = userRefreshTokenRepository;
		this.passwordEncoder = passwordEncoder;
		this.jwtTokenProvider = jwtTokenProvider;
		this.refreshTokenGenerator = refreshTokenGenerator;
		this.sha256TokenHasher = sha256TokenHasher;
		this.jwtProperties = jwtProperties;
	}

	@Transactional
	public SignUpResponse signUp(SignUpRequest request) {
		if (userRepository.existsByEmail(request.email())) {
			throw new BusinessException(ErrorCode.DUPLICATE_EMAIL);
		}

		validateCareerYears(request.careerStatus(), request.careerYears());

		User user = User.create(
			request.email(),
			passwordEncoder.encode(request.password()),
			request.desiredJobRole(),
			request.careerStatus(),
			normalizeCareerYears(request.careerYears()),
			normalizePreferredSkillNames(request.preferredSkillNames())
		);

		User savedUser = userRepository.save(user);
		return new SignUpResponse(
			savedUser.getUserId(),
			savedUser.getEmail(),
			savedUser.getDesiredJobRole(),
			savedUser.getCareerStatus(),
			savedUser.getCareerYears(),
			savedUser.getPreferredSkillNames()
		);
	}

	@Transactional
	public LoginResponse login(LoginRequest request) {
		User user = userRepository.findByEmail(request.email())
			.filter(foundUser -> foundUser.getStatus() == UserStatus.ACTIVE)
			.orElseThrow(() -> new BusinessException(ErrorCode.INVALID_CREDENTIALS));

		if (!passwordEncoder.matches(request.password(), user.getPasswordHash())) {
			throw new BusinessException(ErrorCode.INVALID_CREDENTIALS);
		}

		String accessToken = jwtTokenProvider.generateAccessToken(user);
		String refreshToken = refreshTokenGenerator.generate();

		userRefreshTokenRepository.save(
			UserRefreshToken.create(
				user,
				sha256TokenHasher.hash(refreshToken),
				LocalDateTime.now().plus(Duration.ofMillis(jwtProperties.getRefreshExpiration()))
			)
		);

		return new LoginResponse(
			accessToken,
			refreshToken,
			new LoginUserResponse(
				user.getUserId(),
				user.getEmail(),
				user.getDesiredJobRole(),
				user.getCareerStatus()
			)
		);
	}

	@Transactional
	public TokenRefreshResponse refreshToken(RefreshTokenRequest request) {
		String tokenHash = sha256TokenHasher.hash(request.refreshToken());

		UserRefreshToken savedRefreshToken = userRefreshTokenRepository.findByTokenHash(tokenHash)
			.orElseThrow(() -> new BusinessException(ErrorCode.INVALID_REFRESH_TOKEN));

		if (savedRefreshToken.isRevoked() || savedRefreshToken.isExpired()) {
			savedRefreshToken.revoke();
			throw new BusinessException(ErrorCode.INVALID_REFRESH_TOKEN);
		}

		User user = savedRefreshToken.getUser();
		if (user.getStatus() != UserStatus.ACTIVE) {
			savedRefreshToken.revoke();
			throw new BusinessException(ErrorCode.INVALID_REFRESH_TOKEN);
		}

		savedRefreshToken.revoke();

		String newAccessToken = jwtTokenProvider.generateAccessToken(user);
		String newRefreshToken = refreshTokenGenerator.generate();

		userRefreshTokenRepository.save(
			UserRefreshToken.create(
				user,
				sha256TokenHasher.hash(newRefreshToken),
				LocalDateTime.now().plus(Duration.ofMillis(jwtProperties.getRefreshExpiration()))
			)
		);

		return new TokenRefreshResponse(newAccessToken, newRefreshToken);
	}

	@Transactional
	public void logout(JwtAuthenticatedUser authenticatedUser, LogoutRequest request) {
		String tokenHash = sha256TokenHasher.hash(request.refreshToken());
		UserRefreshToken savedRefreshToken = userRefreshTokenRepository.findByTokenHash(tokenHash)
			.orElseThrow(() -> new BusinessException(ErrorCode.INVALID_LOGOUT_TOKEN));

		if (savedRefreshToken.isRevoked()) {
			throw new BusinessException(ErrorCode.INVALID_LOGOUT_TOKEN);
		}

		if (!savedRefreshToken.getUser().getUserId().equals(authenticatedUser.userId())) {
			throw new BusinessException(ErrorCode.INVALID_LOGOUT_TOKEN);
		}

		savedRefreshToken.revoke();
	}

	private void validateCareerYears(CareerStatus careerStatus, BigDecimal careerYears) {
		if (careerYears == null) {
			return;
		}

		if (careerStatus == CareerStatus.NEW && careerYears.compareTo(BigDecimal.ZERO) != 0) {
			throw new BusinessException(ErrorCode.INVALID_INPUT, "신입의 경력 연차는 0이어야 합니다.");
		}
	}

	private BigDecimal normalizeCareerYears(BigDecimal careerYears) {
		if (careerYears == null) {
			return null;
		}

		return careerYears.stripTrailingZeros();
	}

	private List<String> normalizePreferredSkillNames(List<String> preferredSkillNames) {
		if (preferredSkillNames == null) {
			return null;
		}

		List<String> normalizedSkillNames = preferredSkillNames.stream()
			.map(String::trim)
			.filter(skillName -> !skillName.isEmpty())
			.toList();

		return normalizedSkillNames;
	}
}

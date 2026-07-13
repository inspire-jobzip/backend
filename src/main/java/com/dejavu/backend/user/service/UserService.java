package com.dejavu.backend.user.service;

import com.dejavu.backend.common.ApiException;
import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import com.dejavu.backend.user.dto.UpdateMyProfileRequest;
import com.dejavu.backend.user.dto.UpdateMyProfileResponse;
import com.dejavu.backend.user.entity.CareerStatus;
import com.dejavu.backend.user.entity.User;
import com.dejavu.backend.user.repository.UserRepository;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

	private final UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Transactional
	public UpdateMyProfileResponse updateMyProfile(
		JwtAuthenticatedUser authenticatedUser,
		UpdateMyProfileRequest request
	) {
		User user = userRepository.findById(authenticatedUser.userId())
			.orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, "USER_NOT_FOUND", "사용자를 찾을 수 없습니다."));

		validateCareerYears(request.careerStatus(), request.careerYears());

		user.updateProfile(
			request.desiredJobRole(),
			request.careerStatus(),
			normalizeCareerYears(request.careerYears()),
			normalizePreferredSkillNames(request.preferredSkillNames())
		);

		return new UpdateMyProfileResponse(
			user.getUserId(),
			user.getDesiredJobRole(),
			user.getCareerStatus(),
			user.getCareerYears(),
			user.getPreferredSkillNames()
		);
	}

	private void validateCareerYears(CareerStatus careerStatus, BigDecimal careerYears) {
		if (careerYears == null) {
			return;
		}

		if (careerStatus == CareerStatus.NEW && careerYears.compareTo(BigDecimal.ZERO) != 0) {
			throw new ApiException(HttpStatus.BAD_REQUEST, "INVALID_INPUT", "신입의 경력 연차는 0이어야 합니다.");
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

		return preferredSkillNames.stream()
			.map(String::trim)
			.filter(skillName -> !skillName.isEmpty())
			.toList();
	}
}

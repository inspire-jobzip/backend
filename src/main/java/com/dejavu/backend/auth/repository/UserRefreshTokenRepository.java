package com.dejavu.backend.auth.repository;

import com.dejavu.backend.auth.entity.UserRefreshToken;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRefreshTokenRepository extends JpaRepository<UserRefreshToken, Long> {

	Optional<UserRefreshToken> findByTokenHash(String tokenHash);
}

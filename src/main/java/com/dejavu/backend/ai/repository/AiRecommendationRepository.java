package com.dejavu.backend.ai.repository;

import com.dejavu.backend.ai.entity.AiRecommendationEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AiRecommendationRepository extends JpaRepository<AiRecommendationEntity, Long> {

    List<AiRecommendationEntity> findByUserIdOrderByCreatedAtDesc(Long userId);
}

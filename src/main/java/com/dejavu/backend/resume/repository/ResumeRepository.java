package com.dejavu.backend.resume.repository;

import com.dejavu.backend.resume.entity.ResumeEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ResumeRepository extends JpaRepository<ResumeEntity, Long> {

    List<ResumeEntity> findByUserIdOrderByUpdatedAtDesc(Long userId);

    Optional<ResumeEntity> findFirstByUserIdAndDefaultResumeTrueOrderByUpdatedAtDesc(Long userId);
}

package com.dejavu.backend.resume.repository;

import com.dejavu.backend.resume.entity.ResumeProjectEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ResumeProjectRepository extends JpaRepository<ResumeProjectEntity, Long> {

    List<ResumeProjectEntity> findByResumeIdOrderBySortOrderAscCreatedAtAsc(Long resumeId);

    Optional<ResumeProjectEntity> findByResumeProjectIdAndResumeId(Long resumeProjectId, Long resumeId);

    long countByResumeId(Long resumeId);

    void deleteByResumeId(Long resumeId);
}

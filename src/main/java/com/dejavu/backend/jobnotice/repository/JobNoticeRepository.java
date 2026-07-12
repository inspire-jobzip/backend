package com.dejavu.backend.jobnotice.repository;

import com.dejavu.backend.jobnotice.domain.JobNotice;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface JobNoticeRepository extends JpaRepository<JobNotice, Long> {

    Optional<JobNotice> findByExternalNoticeId(String externalNoticeId);
}

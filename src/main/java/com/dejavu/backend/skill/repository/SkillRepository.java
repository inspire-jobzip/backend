package com.dejavu.backend.skill.repository;

import com.dejavu.backend.jobNotices.domain.entity.Skills;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SkillRepository extends JpaRepository<Skills, Long> {

	@Query("""
		select s
		from Skills s
		where (:keyword is null or lower(s.skillName) like lower(concat('%', :keyword, '%')))
		  and (:category is null or lower(s.category) = lower(:category))
		order by s.skillName asc
	""")
	List<Skills> search(
		@Param("keyword") String keyword,
		@Param("category") String category
	);
}

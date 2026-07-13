package com.dejavu.backend;

import static org.mockito.Mockito.mock;

import com.dejavu.backend.auth.repository.UserRefreshTokenRepository;
import com.dejavu.backend.jobNotices.repository.JobNoticesRepository;
import com.dejavu.backend.resume.repository.ResumeProjectRepository;
import com.dejavu.backend.resume.repository.ResumeRepository;
import com.dejavu.backend.user.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootTest(properties = {
	"spring.autoconfigure.exclude="
		+ "org.springframework.boot.jdbc.autoconfigure.DataSourceAutoConfiguration,"
		+ "org.springframework.boot.hibernate.autoconfigure.HibernateJpaAutoConfiguration"
})
class BackendApplicationTests {

	@Test
	void contextLoads() {
	}

	@TestConfiguration
	static class TestJdbcTemplateConfig {

		@Bean
		JdbcTemplate jdbcTemplate() {
			return mock(JdbcTemplate.class);
		}

		@Bean
		JobNoticesRepository jobNoticesRepository() {
			return mock(JobNoticesRepository.class);
		}

		@Bean
		ResumeRepository resumeRepository() {
			return mock(ResumeRepository.class);
		}

		@Bean
		ResumeProjectRepository resumeProjectRepository() {
			return mock(ResumeProjectRepository.class);
		}

		@Bean
		UserRepository userRepository() {
			return mock(UserRepository.class);
		}

		@Bean
		UserRefreshTokenRepository userRefreshTokenRepository() {
			return mock(UserRefreshTokenRepository.class);
		}
	}
}

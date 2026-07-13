package com.dejavu.backend.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.dejavu.backend.common.filter.JwtAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	private static final String[] PUBLIC_URLS = {
		"/",
		"/api/v1/auth/signup",
		"/api/v1/auth/login",
		"/api/v1/auth/refresh",
		"/health",
		"/actuator/health",
		"/api/jobs",
		"/api/jobs/**",
		"/api/v1/job-notices",
		"/api/v1/job-notices/**",
		"/swagger-ui.html",
		"/swagger-ui/**",
		"/api-docs/**",
		"/job-notices/*/ai-analysis",
		"/job-notices/*/resume-keywords",
		"/ai-recommendations/**",
		"/resumes/**"
	};

	private final JwtAuthenticationFilter jwtAuthenticationFilter;
	private final RestAuthenticationEntryPoint restAuthenticationEntryPoint;

	public SecurityConfig(
		JwtAuthenticationFilter jwtAuthenticationFilter,
		RestAuthenticationEntryPoint restAuthenticationEntryPoint
	) {
		this.jwtAuthenticationFilter = jwtAuthenticationFilter;
		this.restAuthenticationEntryPoint = restAuthenticationEntryPoint;
	}

	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
			.csrf(AbstractHttpConfigurer::disable)
			.formLogin(AbstractHttpConfigurer::disable)
			.httpBasic(AbstractHttpConfigurer::disable)
			.cors(Customizer.withDefaults())
			.exceptionHandling(exception -> exception.authenticationEntryPoint(restAuthenticationEntryPoint))
			.sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
			.addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class)
			.authorizeHttpRequests(auth -> auth
				.requestMatchers(HttpMethod.POST, "/api/v1/job-notices/*/bookmark").authenticated()
				.requestMatchers(HttpMethod.DELETE, "/api/v1/job-notices/*/bookmark").authenticated()
				.requestMatchers(HttpMethod.GET, "/api/v1/bookmarks").authenticated()
				.requestMatchers(PUBLIC_URLS).permitAll()
				.anyRequest().authenticated());

		return http.build();
	}
}

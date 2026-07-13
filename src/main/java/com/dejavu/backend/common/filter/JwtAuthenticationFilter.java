package com.dejavu.backend.common.filter;

import com.dejavu.backend.common.auth.JwtAuthenticatedUser;
import com.dejavu.backend.common.util.JwtTokenProvider;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

	private static final String AUTHORIZATION_HEADER = "Authorization";
	private static final String BEARER_PREFIX = "Bearer ";

	private final JwtTokenProvider jwtTokenProvider;
	private final AuthenticationEntryPoint authenticationEntryPoint;

	public JwtAuthenticationFilter(
		JwtTokenProvider jwtTokenProvider,
		AuthenticationEntryPoint authenticationEntryPoint
	) {
		this.jwtTokenProvider = jwtTokenProvider;
		this.authenticationEntryPoint = authenticationEntryPoint;
	}

	@Override
	protected void doFilterInternal(
		HttpServletRequest request,
		HttpServletResponse response,
		FilterChain filterChain
	) throws ServletException, IOException {
		String authorizationHeader = request.getHeader(AUTHORIZATION_HEADER);

		if (authorizationHeader == null || authorizationHeader.isBlank()) {
			filterChain.doFilter(request, response);
			return;
		}

		if (!authorizationHeader.startsWith(BEARER_PREFIX)) {
			SecurityContextHolder.clearContext();
			authenticationEntryPoint.commence(request, response, JwtTokenProvider.unauthorizedException());
			return;
		}

		String accessToken = authorizationHeader.substring(BEARER_PREFIX.length());
		if (!jwtTokenProvider.validateToken(accessToken)) {
			SecurityContextHolder.clearContext();
			authenticationEntryPoint.commence(request, response, JwtTokenProvider.unauthorizedException());
			return;
		}

		JwtAuthenticatedUser authenticatedUser = jwtTokenProvider.getAuthenticatedUser(accessToken);
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
			authenticatedUser,
			null,
			List.of()
		);
		SecurityContextHolder.getContext().setAuthentication(authentication);
		filterChain.doFilter(request, response);
	}
}

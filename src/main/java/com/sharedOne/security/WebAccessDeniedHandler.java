package com.sharedOne.security;

import java.io.IOException;
import java.nio.file.AccessDeniedException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

@Component
public class WebAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			org.springframework.security.access.AccessDeniedException accessDeniedException)
			throws IOException, ServletException {
				// 권한이 없는 경우 페이지 이동 시 사용
				response.sendRedirect("/member/denied");
				// 권한이 없는 경우 에러코드 반환 시 사용
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
		
	}
	
}

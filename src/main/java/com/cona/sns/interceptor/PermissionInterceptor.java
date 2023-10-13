package com.cona.sns.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class PermissionInterceptor implements HandlerInterceptor{

	
	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		

		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		

		String uri = request.getRequestURI();
		
		// 로그인이 안된 경우
		if(userId == null) {
			if(uri.startsWith("/post")) {
				
				response.sendRedirect("/user/login-view");
				
				return false;			
				
			}
		}else {
			if(uri.startsWith("/user")) {
				
				response.sendRedirect("/post/list-view");
				return false;
			}
		}
		
		return true;
		
		
	}
	
}

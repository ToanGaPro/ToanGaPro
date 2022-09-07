package com.example.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(request.getSession().getAttribute("ac") == null) {
			session.setAttribute("error", "Email hoặc mật khẩu không chính xác");
			response.sendRedirect("/Assignment/admin/logins/login");
			return false;
		}
		return true;
	}
	
}

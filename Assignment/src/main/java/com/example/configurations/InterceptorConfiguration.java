package com.example.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.interceptors.AuthInterceptor;

public class InterceptorConfiguration implements WebMvcConfigurer {
	@Autowired
	AuthInterceptor interceptor;
	@Override
	public void addInterceptors(InterceptorRegistry registy) {
		registy.addInterceptor(interceptor)
			.addPathPatterns("/admin/accounts/**",
			"/admin/category/**",
			"/admin/logins/**",
			"/admin/orderdetail/**",
			"/admin/orders/**",
			"/admin/shoppingcart/**",
			"/admin/products/**");
	}
}

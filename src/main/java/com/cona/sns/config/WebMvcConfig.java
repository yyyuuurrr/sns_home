package com.cona.sns.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.cona.sns.common.FileManager;
import com.cona.sns.interceptor.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManager.FILE_UPLOAD_PATH + "/");	
		
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		PermissionInterceptor interceptor = new PermissionInterceptor();
		
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**")
		.excludePathPatterns("/user/logout", "/static/**", "/images/**");
	}
	
	
}

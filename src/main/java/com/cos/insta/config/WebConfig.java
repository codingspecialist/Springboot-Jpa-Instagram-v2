package com.cos.insta.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

@Configuration
public class WebConfig implements WebMvcConfigurer{
	
	@Value("${file.path}")
	private String uploadImagePath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		
		registry.addResourceHandler("/upload/**")
		.addResourceLocations("file:///"+uploadImagePath)
		.setCachePeriod(3600)
		.resourceChain(true)
		.addResolver(new PathResourceResolver());
	}
}

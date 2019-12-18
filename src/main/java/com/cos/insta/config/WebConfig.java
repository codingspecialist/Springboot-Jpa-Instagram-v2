package com.cos.insta.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Value("${file.path}")
	private String fileRealPath;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);

		registry.addResourceHandler("/upload/**").addResourceLocations("file:///" + fileRealPath).setCachePeriod(3600)
				.resourceChain(true).addResolver(new PathResourceResolver());
	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		WebMvcConfigurer.super.addCorsMappings(registry);
		registry.addMapping("/**")
		.allowedOrigins("*")
		.allowedMethods("GET", "POST", "OPTIONS", "PUT")
		.allowedHeaders("Content-Type", "X-Requested-With", "accept", "Origin", "Access-Control-Request-Method","Access-Control-Request-Headers")
		.exposedHeaders("Access-Control-Allow-Origin", "Access-Control-Allow-Credentials")
		.allowCredentials(true).maxAge(3600);
	}

}

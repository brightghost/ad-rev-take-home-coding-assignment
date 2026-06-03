package com.swlkr.adrevdemo.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ApiVersionConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ApiVersionConfig implements WebMvcConfigurer {

    @Override
    public void configureApiVersioning(ApiVersionConfigurer configurer) {
        configurer
            .usePathSegment(2)
            .setDefaultVersion("1")
            .addSupportedVersions("1")
            .detectSupportedVersions(true);
    }
}

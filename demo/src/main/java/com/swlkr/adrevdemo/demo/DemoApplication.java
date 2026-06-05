package com.swlkr.adrevdemo.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class DemoApplication {

	@RequestMapping("/")
	public String home() {
		return "This is the API server; try port 3000 for the frontend or send a request to /api for the backend API.";
	}
	
	public static void main(String[] args) {

		SpringApplication.run(DemoApplication.class, args);
	}

}

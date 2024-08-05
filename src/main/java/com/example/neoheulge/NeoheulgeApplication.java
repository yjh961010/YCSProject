package com.example.neoheulge;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
public class NeoheulgeApplication {

	public static void main(String[] args) {
		SpringApplication.run(NeoheulgeApplication.class, args);
	}

}

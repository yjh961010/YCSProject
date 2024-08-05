package com.example.neoheulge;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.neoheulge.admin.service")
public class NeoheulgeApplication {

	public static void main(String[] args) {
		SpringApplication.run(NeoheulgeApplication.class, args);
	}

}

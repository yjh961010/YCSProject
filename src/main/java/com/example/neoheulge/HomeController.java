package com.example.neoheulge;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/index.do")
	public String home() {
		return "index";
	}
}

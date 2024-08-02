package com.example.neoheulge.commu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commu")
public class CommuController {
	@GetMapping("/commuList.do")
	public String commuList() {
		return "commu/commulist";
	}
}

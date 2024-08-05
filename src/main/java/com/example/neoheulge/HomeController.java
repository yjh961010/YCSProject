package com.example.neoheulge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.neoheulge.commu.service.CommuService;
import com.example.neoheulge.dto.CommuDTO;

import jakarta.servlet.http.HttpServletRequest;



@Controller
public class HomeController {
	
	@Autowired
	CommuService commuService;
	
	@GetMapping("/index.do")
	public String home(HttpServletRequest req) {
		List<CommuDTO> list = commuService.commuList();
		req.setAttribute("commuList", list);
		return "index";
	}
}

package com.example.neoheulge;

import java.util.List;

import com.example.neoheulge.dto.NoticeDTO;
import com.example.neoheulge.notice.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.neoheulge.commu.service.CommuService;
import com.example.neoheulge.dto.CommuDTO;

import jakarta.servlet.http.HttpServletRequest;



@Controller
public class HomeController {
	
	@Autowired
	CommuService commuService;
    @Autowired
    private NoticeService noticeService;

	@GetMapping("/index.do")
	public String home(HttpServletRequest req) {
		List<NoticeDTO> noticelist = noticeService.noticeList();
		req.setAttribute("noticeList", noticelist);
		List<CommuDTO> commulist = commuService.commuList();
		req.setAttribute("commuList", commulist);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        System.out.println(username);
		return "index";
	}
}

package com.example.neoheulge.notice.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @GetMapping("/noticeboard.do")
    public String noticeboard() { return "notice/noticeboard"; }
}

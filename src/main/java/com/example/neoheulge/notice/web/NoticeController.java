package com.example.neoheulge.notice.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
    @GetMapping("/noticeboard.do")
    public String noticeboard() { return "notice/noticeboard"; }
}

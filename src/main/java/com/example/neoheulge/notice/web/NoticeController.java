package com.example.neoheulge.notice.web;

import com.example.neoheulge.dto.NoticeDTO;
import com.example.neoheulge.notice.service.NoticeService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService noticeservice;

    @RequestMapping("notice/noticeList.do")
    public String notice() { return "notice/noticelist"; }

    @RequestMapping("notice/insertnotice.do")
    public String noticeInsert(HttpServletRequest req, NoticeDTO dto) {
        //int res = noticeservice.insertNotice(dto);
        return "notice/notice";
    }
    @RequestMapping(value = "notice/deleteNotice.do", method = RequestMethod.POST)
    public String deleteNotice(HttpServletRequest req, int id) {
        //int res = noticeservice.deleteNotice(id);
        return "redirect:/notice/listNotice.do";
    }

}


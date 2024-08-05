package com.example.neohuelge.admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.neohuelge.admin.service.AdminDAO;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @GetMapping("/adminmember.do")
    public String adminMember() {
        return "admin/adminMember";
      
    }
}

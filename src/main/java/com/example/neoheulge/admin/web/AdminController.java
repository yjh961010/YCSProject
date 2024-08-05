package com.example.neoheulge.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.neoheulge.admin.service.AdminDAO;
import com.example.neoheulge.admin.service.AdminService;
import com.example.neoheulge.dto.MemberDTO;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired 
	private AdminService adminservice;
    @GetMapping("/adminmember.do")
    public String adminMember(Model model) {
    	List<MemberDTO>mList = adminservice.MemberAll();
    	model.addAttribute("mList" , mList);
        return "admin/adminMember";
      
    }
}

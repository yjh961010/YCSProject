package com.example.neoheulge.member.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.neoheulge.dto.MemberDTO;
import com.example.neoheulge.dto.NePreSavProdDTO;
import com.example.neoheulge.member.service.MemberService;
import com.example.neoheulge.purproduct.service.PurproductService;
import com.example.neoheulge.util.SmsUtil;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberservice;
	@Autowired
	private SmsUtil sms;
	@Autowired
	PurproductService purproductService;
	@GetMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/signup.do")
	public String signup() {
		return "member/signup";
	}
	
	@PostMapping("/signupPro.do")
	public String signupPro(MemberDTO member) {
		memberservice.signupPro(member);
		return "redirect:/";
	}
    
    @GetMapping("/findid.do")
    public String findId(HttpServletRequest req) {
    	req.setAttribute("check", "!@#!@#");
    	return "member/findid";
    }
    
    @PostMapping("/findid.do")
    public String findIdPro(HttpServletRequest req,MemberDTO member) {
    	MemberDTO dto = memberservice.findByName(member.getName());
    	req.setAttribute("member", dto);
    	
    	return "member/findid_result";
    }
    @GetMapping("/myPage.do")
    public String myPage(HttpServletRequest req,@RequestParam String user) {
    	List<NePreSavProdDTO> userProducts = purproductService.getAllSubscriptionsByMemberId(user);
    	req.setAttribute("userProducts", userProducts);
    	
    	System.out.println(user);
    	return "member/myPage";
    }
    
    @ResponseBody
    @PostMapping("/subCrtifi.ajax")
    public ResponseEntity<?> sendSmsToFindEmail(@RequestParam("phone") String phone, HttpServletRequest req) {
        //수신번호 형태에 맞춰 "-"을 ""로 변환
        String phoneNum = phone.replaceAll("-","");
        Random rand = new Random();
        String randomNum = "";
        for (int i = 0; i < 4; i++) {
            String random = Integer.toString(rand.nextInt(10));
            randomNum += random;
        }        
        sms.sendOne(phoneNum, randomNum);
        Map<String, Object> response = new HashMap<>();
        response.put("check", randomNum.toString());
        req.setAttribute("check", randomNum);
        
        return ResponseEntity.ok(response);
    }
}

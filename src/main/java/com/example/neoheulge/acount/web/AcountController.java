package com.example.neoheulge.acount.web;

import com.example.neoheulge.dto.NoticeDTO;
import jakarta.servlet.http.HttpServletRequest;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.neoheulge.acount.service.AcountService;
import com.example.neoheulge.dto.NeAcountDTO;
import com.example.neoheulge.dto.NePreSavProdDTO;
import com.example.neoheulge.product.service.ProductService;
import com.example.neoheulge.purproduct.service.PurproductService;

@Controller
@RequestMapping("/acount")
public class AcountController {
	@Autowired
	AcountService acountService;

	@Autowired
	PurproductService purproductService;



	@PostMapping("/insertNeacount.do")
	public String addAccount(NeAcountDTO dto) {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String username = authentication.getName();
		acountService.addAccount(dto);
		return "redirect:/member/myPage.do?user="+username;
	}

	@GetMapping("/insertNeacountform.do")
	public String addAccountform(NeAcountDTO dto) {
		return "member/acount";
	}

	@RequestMapping("/deleteNeacount.do")
	public String deleteAccount(NeAcountDTO dto) {
		acountService.removeAccount(dto);
		return "member/myPage="+dto.getMember_id();
	}


	@GetMapping("/add.do")
	public String addAcount() {
		return "checkMe";
	}

	@PostMapping("/mail.do")
    public String sendMail(@RequestParam("email") String email,String id, Model model) {
        // 6자리 랜덤 숫자 생성
        Random rand = new Random();
        int randomNum = rand.nextInt(900000) + 100000;  // 100000(최소값)부터 999999(최대값) 사이의 숫자

        // 세션에 랜덤 숫자 저장
        model.addAttribute("randomNum", randomNum);
        model.addAttribute("email",email);
        model.addAttribute("id",id);

        // 이메일 전송
        acountService.sendSimpleEmail(email, "인증번호", "인증번호 : " + randomNum + "입니다.");
        System.out.println("저장된 값 : "+model);
        return "checkMe";
    }





    @PostMapping("/confirmCheckNumber")
    public String confirmCheckNumber(@RequestParam String checkNumber, Model model) {
        String sessionCheckNumber = (String) model.getAttribute("checkNumber");
        if (sessionCheckNumber != null && sessionCheckNumber.equals(checkNumber)) {
            return "인증번호가 확인되었습니다.";
        } else {
            return "인증번호가 일치하지 않습니다.";
        }
    }

}

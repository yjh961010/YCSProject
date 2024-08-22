package com.example.neoheulge.acount.web;

import com.example.neoheulge.dto.NeAcountDTO;
import com.example.neoheulge.acount.service.AcountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Random;

@Controller
@RequestMapping("/acount")
public class AcountController {

	@Autowired
	private AcountService acountService;

	@PostMapping("/insertNeacount.do")
	public String addAccount(NeAcountDTO dto) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();

		// 주계좌 설정 전 모든 계좌의 상태를 'N'으로 변경
		acountService.addAccount(dto);

		return "redirect:/member/myPage.do?user=" + username;
	}

	@GetMapping("/insertNeacountform.do")
	public String addAccountForm() {
		return "member/acount";
	}

	@PostMapping("/deleteNeacount.do")
	public String deleteAccount(@RequestParam("acount_id") String acountId) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();

		NeAcountDTO dto = new NeAcountDTO();
		dto.setAcount_id(acountId);

		acountService.removeAccount(dto);

		return "redirect:/member/myPage.do?user=" + username;
	}

	@GetMapping("/add.do")
	public String addAccount() {
		return "checkMe";
	}

	@PostMapping("/mail.do")
	public String sendMail(@RequestParam("email") String email, @RequestParam("id") String id, Model model) {
		// 6자리 랜덤 숫자 생성
		Random rand = new Random();
		int randomNum = rand.nextInt(900000) + 100000;  // 100000(최소값)부터 999999(최대값) 사이의 숫자

		// 세션에 랜덤 숫자 저장
		model.addAttribute("randomNum", randomNum);
		model.addAttribute("email", email);
		model.addAttribute("id", id);

		// 이메일 전송
		acountService.sendSimpleEmail(email, "인증번호", "인증번호 : " + randomNum + "입니다.");

		return "checkMe";
	}

	@PostMapping("/confirmCheckNumber")
	public String confirmCheckNumber(@RequestParam("checkNumber") String checkNumber, Model model) {
		// 세션에서 인증번호 가져오기
		Integer sessionCheckNumber = (Integer) model.getAttribute("randomNum");

		if (sessionCheckNumber != null && sessionCheckNumber.equals(Integer.parseInt(checkNumber))) {
			return "인증번호가 확인되었습니다.";
		} else {
			return "인증번호가 일치하지 않습니다.";
		}
	}
}

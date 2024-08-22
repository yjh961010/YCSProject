package com.example.neoheulge.acount.web;

import com.example.neoheulge.dto.NoticeDTO;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		acountService.addAccount(dto);
		return "member/acount";
	}

	@GetMapping("/insertNeacountform.do")
	public String addAccountform(NeAcountDTO dto) {
		return "member/acount";
	}
	
	@PostMapping("/add.do")
	public String addAcount(NeAcountDTO dto, NePreSavProdDTO pdto) {
		
		dto.setAcount_number("");
		dto.setMember_id("");
		dto.setAcount_status("");
		acountService.addAccount(dto);
		return "";
	}
}

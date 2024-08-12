package com.example.neoheulge.purproduct.web;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.neoheulge.dto.NePreSavProdDTO;
import com.example.neoheulge.dto.NeSavProdDTO;
import com.example.neoheulge.product.service.ProductService;
import com.example.neoheulge.purproduct.service.PurproductService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/proProduct")
public class PurproductController {
	@Autowired
	ProductService productService;
	
	@Autowired
	PurproductService purproductService;
	
	@GetMapping("/does.do")
	public String productSignUp(HttpServletRequest req,@RequestParam String product_code,
			@RequestParam(value="id", required=false, defaultValue="0")Integer id ) {
		NeSavProdDTO prod = productService.selectProductByCode(product_code);
		req.setAttribute("product", prod);
		
		return "proproduct/productSignUp";
	}
	
	@PostMapping("/input.do")
	public String proInput(HttpServletRequest req,NePreSavProdDTO dto
			,@RequestParam String user,@RequestParam String product_code
			,@RequestParam BigDecimal amount,@RequestParam String select) {
		
		dto.setMember_id(user);
		dto.setProduct_code(product_code);
		dto.setSubscription_amount(amount);
		
		if("goldenball".equals(select)) {
			dto.setSubscription_select("골든볼");
		}else if("base".equals(select)) {
			dto.setSubscription_select("기본");
		}
		
		System.out.println(select);
		
		//member_id, product_code, 
        //subscription_amount, subscription_select, early_refund 
		
		int res = purproductService.insertSubscription(dto);
		return "proproduct/productSignUp";
	}
	
	@PostMapping("/cancel")
	public String proCancle(NePreSavProdDTO dto,@RequestParam String user) {
		int res = purproductService.terminateSubscription(user);
		
		return "";
	}
}





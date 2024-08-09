package com.example.neoheulge.purproduct.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.neoheulge.dto.NeSavProdDTO;
import com.example.neoheulge.product.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/proProduct")
public class PurproductController {
	@Autowired
	ProductService productService;
	
	@GetMapping("/does.do")
	public String productSignUp(HttpServletRequest req,@RequestParam String product_code,
			@RequestParam(value="id", required=false, defaultValue="0")Integer id ) {
		NeSavProdDTO prod = productService.selectProductByCode(product_code);
		req.setAttribute("product", prod);
		
		return "proproduct/productSignUp";
	}
}

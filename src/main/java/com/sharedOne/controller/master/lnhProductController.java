package com.sharedOne.controller.master;


import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sharedOne.domain.master.BuyerDto;

import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.service.master.lnhProductService;

@Controller
@RequestMapping("master")
public class lnhProductController {

	@Autowired
	private lnhProductService productService;
	
	@GetMapping("productList")
	public void productList(
			@RequestParam(name = "keyword", defaultValue = "") String keyword, 
			@RequestParam(name = "productCode", defaultValue = "") String productCode, 
			@RequestParam(name = "productName", defaultValue = "") String productName, 
			@RequestParam(name = "size", defaultValue = "") String size, 
			Model model){
		List <ProductDto> product1 = productService.selectProductList();
		
		Set <Integer> setSizes = new HashSet<>();
		for( ProductDto product : product1) {
			setSizes.add(product.getSize());
		}
		
		List <ProductDto> searchResult = productService.searchProductList(keyword, productCode, productName, size);
		
		System.out.println(keyword);
		System.out.println("검색결과: "+searchResult);
		
		model.addAttribute("sizes", setSizes);
		
		model.addAttribute("product", product1);
		model.addAttribute("productList", searchResult);

	}
	
	@GetMapping("productRegister")
	public void register() {
		
	}
	
	@PostMapping("productRegister")
	public void register(ProductDto product) {
		productService.register(product);
		
	}
	
	//새 창으로 띄우는 경우 
	@GetMapping("productGet")
	public void get(
			@RequestParam(name = "code") String productCode,
/*			Authentication auth,*/
			Model model) {
		ProductDto product = productService.get(productCode);
		model.addAttribute("product", product);
		
	}
	
	
	@GetMapping("productModify") // @은 외부 빈, #은 메소드의 파라미터
	/* @PreAuthorize("@Security.checkWriter(authentication.name, #productCode)") */
	public void modify(
			@RequestParam(name = "code") String productCode,
			Model model) {
		
		ProductDto product = productService.get(productCode);
		model.addAttribute("product", product);
		
	}
	
	@PostMapping("productModify")
	/* @PreAuthorize("@Security.checkWriter(authentication.name, #productCode)") */
	public String modify(ProductDto product) {
		productService.update(product);
		String code = product.getProductCode();
		
		return "redirect:/master/productList/productGet?code=" + code;
	}
	
	@GetMapping("existproductName/{productName}")
	@ResponseBody
	public Map<String, Object> existbuyerCode(@PathVariable String productName) {
		Map<String, Object> map = new HashMap<>();

		ProductDto product = productService.getByProductName(productName);

		if (product == null) {
			map.put("status", "not exist");
			map.put("message", "사용가능한 제품명입니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 제품명입니다.");
		}

		return map;
	}
	
	@PostMapping("productRemove")
	/* @PreAuthorize("@Security.checkWriter(authentication.name, #productCode)") */
	public void remove(
			@RequestParam(name = "code") String productCode) {
		productService.remove(productCode);
		
	}
	
}

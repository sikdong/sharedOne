package com.sharedOne.controller.master;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("master")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("productList")
	public void productList(){
		productService.selectProductsList();
	}
}

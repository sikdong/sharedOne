package com.sharedOne.controller.master;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.service.master.AsjProductService;

@Controller
@RequestMapping("master")
public class AsjProductController {

	@Autowired
	private AsjProductService asjProductService;
	
	/*@GetMapping("productList")
	public void productList(Model model){
		List <ProductDto> productList = asjProductService.selectProductList();
		
		Set <String> setTypes = new HashSet<>();
		for( ProductDto product : productList) {
			setTypes.add(product.getProductType());
		}
		Set <Integer> setSizes = new HashSet<>();
		for( ProductDto product : productList) {
			setSizes.add(product.getSize());
		}
		
		model.addAttribute("types", setTypes);
		model.addAttribute("sizes", setSizes);
		
		model.addAttribute("productList", productList);
	}*/
}

package com.sharedOne.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedOne.domain.Buyer;
import com.sharedOne.domain.product.ProductDto;
import com.sharedOne.service.OrderService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	
	@GetMapping("register")
	public void searchBuyer(Model model, @RequestParam(required = false) String buyerInfo ){
	List<Buyer> buyers = service.searchBuyer(buyerInfo);
	List<Buyer> buyerNames = service.getBuyerNames();
	model.addAttribute("buyers", buyers);
	model.addAttribute("buyerNames", buyerNames);
		
	}
	
	
	@GetMapping("searchAllBuyerInfo/{allBuyerInfoInput}")
	@ResponseBody
	public List<Buyer> searchAllBuyer(@PathVariable String allBuyerInfoInput){
		return service.searchBuyer(allBuyerInfoInput);
	}
	
	@GetMapping("searchbuyerName/{buyerName}")
	@ResponseBody
	public List<Buyer> searchbuyerName(@PathVariable String buyerName){
		return service.searchBuyer(buyerName);
	}
	
	@GetMapping("searchcountry/{country}")
	@ResponseBody
	public List<Buyer> searchcountry(@PathVariable String country){
		return service.searchBuyer(country);
	}
	
	@GetMapping("searchbuyerCode/{buyerCode}")
	@ResponseBody
	public List<Buyer> searchbuyerCode(@PathVariable String buyerCode){
		return service.searchBuyer(buyerCode);
	}
	
	@GetMapping("searchAllProductInfo/{allProductInfo}")
	@ResponseBody
	public List<ProductDto> searchAllProductInfo(@PathVariable String allProductInfo){
		return service.searchProduct(allProductInfo);
		
	}
	
}

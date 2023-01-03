package com.sharedOne.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharedOne.domain.Buyer;
import com.sharedOne.service.OrderService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	
	@GetMapping("searchBuyer")
	public void searchBuyer(Model model, @RequestParam(required=false) String buyerInfo ){
	List<Buyer> buyers = service.searchBuyer(buyerInfo);
	List<Buyer> buyerNames = service.getBuyerNames();
	model.addAttribute("buyers", buyers);
	model.addAttribute("buyerNames", buyerNames);
		
	}
	
	@GetMapping("register")
	public void orderRegister() {
		
	}	
	
	
}

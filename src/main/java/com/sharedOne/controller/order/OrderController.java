package com.sharedOne.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharedOne.domain.Buyer;
import com.sharedOne.service.OrderService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	
	@GetMapping("searchBuyer")
	public void searchBuyer(Model model){
	List<Buyer> buyers = service.searchBuyer();
	model.addAttribute("buyers", buyers);
		
	}
	
	@GetMapping("register")
	public void orderRegister() {
		
	}	
	
	
}

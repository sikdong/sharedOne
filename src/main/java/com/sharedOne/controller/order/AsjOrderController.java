package com.sharedOne.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.service.order.AsjOrderService;

@Controller
@RequestMapping("order")
public class AsjOrderController {
	
	@Autowired
	private AsjOrderService orderService;
	
	@GetMapping("list") public void orderList(Model model, String orderCode) {
		
		List<OrderHeaderDto> headerList = orderService.selectOrderHeaderList(); 
		
		model.addAttribute("headerList", headerList); 		
		
		System.out.println("#####orderCode: " + orderCode);
		
		List<OrderItemDto> itemListByOrderCode = orderService.selectOrderItemListByOrderCode(orderCode);
		model.addAttribute("itemList", itemListByOrderCode);
		
		System.out.println(itemListByOrderCode);
	}
	
	
}

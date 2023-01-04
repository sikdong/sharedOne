package com.sharedOne.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.service.order.AsjOrderService;

@Controller
@RequestMapping("order")
public class AsjOrderController {
	
	@Autowired
	private AsjOrderService orderService;
	
	@GetMapping("list") public void orderList(Model model) {
		
		List<OrderHeaderDto> headerList = orderService.selectOrderHeaderList(); 
		
		model.addAttribute("headerList", headerList); 	
		
		
	 
	}
	
	
	@GetMapping("list/{orderCode}")
	public void orderListPost (@PathVariable String orderCode, Model model ) {
		
		System.out.println("#####orderCode" + orderCode);
		
		List<OrderItemDto> itemListByOrderCode = orderService.selectOrderItemListByOrderCode(orderCode);
		
		System.out.println(itemListByOrderCode);
		
		model.addAttribute("itemList", itemListByOrderCode);
		
	}
	
}

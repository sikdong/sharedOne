/*package com.sharedOne.controller.order;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.service.order.AsjOrderService;

@Controller
@RequestMapping("order")
public class AsjOrderController {
	
	@Autowired
	private AsjOrderService orderService;
	
	@GetMapping("list")
	public void orderList(Model model,
			@RequestParam(name="q", defaultValue="") String keyword ,
			@RequestParam(name="buyerCode", defaultValue="") String buyerCode,
			@RequestParam(name="orderCode", defaultValue="") String orderCode,
			@RequestParam(name="writer", defaultValue="") String writer,
			@RequestParam(name="status", defaultValue="") String status
			) {
		
		//System.out.println(keyword + buyerCode + orderCode + writer + status);
		
		List<OrderHeaderDto> headerList = orderService.selectOrderHeaderList(keyword,buyerCode,orderCode,writer,status); 	
		model.addAttribute("headerList", headerList); 		
		
//		List<OrderItemDto> itemListByOrderCode = orderService.selectOrderItemListByOrderCode(orderCode);
//		model.addAttribute("itemList", itemListByOrderCode);
		
		int size = headerList.size();
		//System.out.println("size:"+size);
		model.addAttribute("size", size);
		
		Set<String> setBuyer = new HashSet<>();
		for(OrderHeaderDto header: headerList) {
			String buyerCod = header.getBuyerCode();
			setBuyer.add(buyerCod);
		}
		model.addAttribute("buyerCodeList", setBuyer);
		
		Set<String> setName = new HashSet<>();
		for(OrderHeaderDto header: headerList) {
			String name = header.getWriter();
			setName.add(name);
		}
		model.addAttribute("writerList", setName);
		
		Set<String> setStatus = new HashSet<>();
		for(OrderHeaderDto header: headerList) {
			String stat = header.getStatus();
			setStatus.add(stat);
		}
		model.addAttribute("statusList", setStatus);
		
	}
	
	@GetMapping("itemList/{orderCode}")
	@ResponseBody
	public List<OrderItemDto> itemList(Model model, @PathVariable String orderCode) {
		
		List<OrderItemDto> itemListByOrderCode = orderService.selectOrderItemListByOrderCode(orderCode);
		
		System.out.println(itemListByOrderCode);
		
		return itemListByOrderCode;
		
	}
	
	
}*/

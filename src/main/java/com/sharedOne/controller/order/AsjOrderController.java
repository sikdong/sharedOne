package com.sharedOne.controller.order;

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

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("order")
@Api(tags="주문 API")
public class AsjOrderController {
	
	@Autowired
	private AsjOrderService orderService;
	
	@GetMapping("list")
	@ApiOperation(value="주문 목록 조회")
	public void orderList(Model model,
			@RequestParam(name="q", defaultValue="") String keyword ,
			@RequestParam(name="buyerCode", defaultValue="") String buyerCode,
			@RequestParam(name="orderCode", defaultValue="") String orderCode,
			@RequestParam(name="writer", defaultValue="") String writer,
			@RequestParam(name="status", defaultValue="") String status,
			@RequestParam(name="d1", defaultValue="") String d1,
			@RequestParam(name="d2", defaultValue="") String d2
			) {
		
		
		List<OrderHeaderDto> headerList = orderService.selectOrderHeaderList(keyword,buyerCode,orderCode,writer,status,d1,d2); 	
		model.addAttribute("headerList", headerList); 		
	
		
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
	@ApiOperation(value="주문 상세 조회")
	public List<OrderItemDto> itemList(Model model, @PathVariable String orderCode) {
		
		List<OrderItemDto> itemListByOrderCode = orderService.selectOrderItemListByOrderCode(orderCode);
		
		return itemListByOrderCode;
		
	}
	
	
}

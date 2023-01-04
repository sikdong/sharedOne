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

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.ProductDto;

import lombok.RequiredArgsConstructor;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.service.order.OrderService;
import com.sharedOne.service.order.YdsOrderService;

@Controller
@RequestMapping("order")
public class YdsOrderController {
	
	@Autowired
	private YdsOrderService service;
	
	@Autowired
	private OrderService orderService;

	
	@GetMapping("register")
	public void searchBuyer(Model model, @RequestParam(required = false) String buyerInfo ){
	List<BuyerDto> buyers = service.searchBuyer(buyerInfo);
	List<BuyerDto> buyerNames = service.getBuyerNames();
	model.addAttribute("buyers", buyers);
	model.addAttribute("buyerNames", buyerNames);
		
	}
	
	
	@GetMapping("searchAllBuyerInfo/{allBuyerInfoInput}")
	@ResponseBody
	public List<BuyerDto> searchAllBuyer(@PathVariable String allBuyerInfoInput){
		return service.searchBuyer(allBuyerInfoInput);
	}
	
	@GetMapping("searchbuyerName/{buyerName}")
	@ResponseBody
	public List<BuyerDto> searchbuyerName(@PathVariable String buyerName){
		return service.searchBuyer(buyerName);
	}
	
	@GetMapping("searchcountry/{country}")
	@ResponseBody
	public List<BuyerDto> searchcountry(@PathVariable String country){
		return service.searchBuyer(country);
	}
	
	@GetMapping("searchbuyerCode/{buyerCode}")
	@ResponseBody
	public List<BuyerDto> searchbuyerCode(@PathVariable String buyerCode){
		return service.searchBuyer(buyerCode);
	}
	
	@GetMapping("searchAllProductInfo/{allProductInfo}")
	@ResponseBody
	public List<ProductDto> searchAllProductInfo(@PathVariable String allProductInfo){
		return service.searchProduct(allProductInfo);
		
	}
	
	
	  @GetMapping("list") public void orderList(Model model, String orderCode ) {
	  List <OrderHeaderDto> headerList = orderService.selectOrderHeaderList(); List
	 <OrderItemDto> itemListByOrderCode =
	 orderService.selectOrderItemListByOrderCode(orderCode);
	 
	 model.addAttribute("headerList", headerList); model.addAttribute("itemList",
	 itemListByOrderCode); }
	 
	
}
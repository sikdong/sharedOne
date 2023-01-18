package com.sharedOne.controller.order;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.master.YdsProductDto;

import lombok.RequiredArgsConstructor;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.order.YdsOrderDto;
import com.sharedOne.service.order.AsjOrderService;
import com.sharedOne.service.order.YdsOrderService;

@Controller
@RequestMapping("order")
@RequiredArgsConstructor
public class YdsOrderController {

	private final YdsOrderService service;

	@GetMapping("register")
	@PreAuthorize("isAuthenticated()")
	public void searchBuyer(Model model, @RequestParam(required = false) String buyerInfo) {
		List<BuyerDto> buyers = service.searchBuyer(buyerInfo);
		List<BuyerDto> buyerNames = service.getBuyerNames();
		model.addAttribute("buyers", buyers);
		model.addAttribute("buyerNames", buyerNames);

	}

	@GetMapping("searchAllBuyerInfo/{allBuyerInfoInput}")
	@ResponseBody
	public List<BuyerDto> searchAllBuyer(@PathVariable String allBuyerInfoInput) {
		return service.searchBuyer(allBuyerInfoInput);
	}

	@GetMapping("searchbuyerName/{buyerName}")
	@ResponseBody
	public List<BuyerDto> searchbuyerName(@PathVariable String buyerName) {
		return service.searchBuyer(buyerName);
	}

	@GetMapping("searchcountry/{country}")
	@ResponseBody
	public List<BuyerDto> searchcountry(@PathVariable String country) {
		return service.searchBuyer(country);
	}

	@GetMapping("searchbuyerCode/{buyerCode}")
	@ResponseBody
	public List<BuyerDto> searchbuyerCode(@PathVariable String buyerCode) {
		return service.searchBuyer(buyerCode);
	}

	@GetMapping("searchAllProductInfo/{allProductInfo}/{tableBuyerCode}/{deliveryDate}")
	@ResponseBody
	public List<ProductDto> searchAllProductInfo(@PathVariable String allProductInfo,
			@PathVariable String tableBuyerCode, @PathVariable String deliveryDate) {
		return service.searchProduct(allProductInfo, tableBuyerCode, deliveryDate);

	}

	@GetMapping("modify")
	@PreAuthorize("authentication.name == #id")
	public void modifyOrder(int orderId,String id, Model model) {
		OrderHeaderDto ohd = service.modifyOrderHeader(orderId);
		List<OrderItemDto> oid = service.modifyOrderItem(orderId);
		model.addAttribute("orderHeader", ohd);
		model.addAttribute("orderItems", oid);
	}

	@PostMapping("register")
	public String insertOrder(YdsOrderDto yod, Authentication at, RedirectAttributes rttr) {
		if (at != null) {
			yod.setMemberId(at.getName());
		}
		System.out.println("yod = " + yod);
		service.insertOrder(yod);
		return "redirect:/order/list";
	}

	@PostMapping("addTempProductOrder")
	@ResponseBody
	public List<YdsProductDto> addTempProductOrder(@RequestBody Map<String, Object> data) {
		return service.addTempProductOrder(data);
	}

	@PostMapping("modify")
	public String updateOrder(YdsOrderDto yod, @RequestParam int orderId, RedirectAttributes rttr) {
		System.out.println("orderId = " + orderId);
		System.out.println("yod = " + yod);
		service.updateOrder(yod, orderId);
		return "redirect:/order/list";
	}

	@DeleteMapping("deleteOrder")
	@ResponseBody
	public Map<String, String> deleteOrder(@RequestBody Map<String, String> data, RedirectAttributes rttr) {
		System.out.println(data);
		Map<String, String> map = new HashMap<>();
		int cnt = service.deleteOrder(data);
		if (cnt == 1) {
			map.put("message", "주문이 삭제되었습니다");
		}
		return map;
	}

}

package com.sharedOne.controller.order;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println("controller");
		return service.searchProduct(allProductInfo, tableBuyerCode,deliveryDate);

	}

	@GetMapping("tempSave")
	public void tempSave() {

	}

	@GetMapping("modify")
	public void modifyOrder(@RequestParam int orderId, Model model) {
		YdsOrderDto yod = service.modifyOrder(orderId);
		model.addAttribute("order", yod);
	}

	@PostMapping("register")
	public void insertOrder(YdsOrderDto yod, Authentication at) {
		if (at != null) {
			yod.setWriter(at.getName());
		}
		if (yod.getProductCode() != null) {

			service.insertOrder(yod);
		}
	}

	@PostMapping("addTempProductOrder")
	@ResponseBody
	public List<YdsProductDto> addTempProductOrder(@RequestBody Map<String, Object> data) {
		return service.addTempProductOrder(data);
	}

}

package com.sharedOne.controller.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.order.YjhOrderItemDto;
import com.sharedOne.domain.order.sumValueDto;
import com.sharedOne.service.order.YjhOrderService;

@Controller
@RequestMapping("order")
public class YjhOrderController {
	
	@Autowired
	YjhOrderService service;
	
	@GetMapping("orderSheet")
	@PreAuthorize("isAuthenticated()")
	public void getOrderSheet(Model model, int orderId) {
		
		OrderHeaderDto orderHeader = service.getOrderSheetHead(orderId);
		model.addAttribute("orderHeader", orderHeader);

		List<YjhOrderItemDto> orderItem = service.getOrderSheetItem(orderId);
		model.addAttribute("orderItem", orderItem);

		BuyerDto buyerInfo = service.getOrderSheetBuyer(orderId);
		model.addAttribute("buyer", buyerInfo);
		
		sumValueDto sumValue = service.getSumValue(orderId);
		model.addAttribute("sumValue",sumValue );
	}
	@GetMapping("confirmOrderSheet")
	@PreAuthorize("hasAuthority('팀장')")
	public void getConfirmOrderSheet(Model model, int orderId) {
		
		OrderHeaderDto orderHeader = service.getOrderSheetHead(orderId);
		model.addAttribute("orderHeader", orderHeader);

		List<YjhOrderItemDto> orderItem = service.getOrderSheetItem(orderId);
		model.addAttribute("orderItem", orderItem);

		BuyerDto buyerInfo = service.getOrderSheetBuyer(orderId);
		model.addAttribute("buyer", buyerInfo);
		
		sumValueDto sumValue = service.getSumValue(orderId);
		model.addAttribute("sumValue",sumValue );
	}
	
	@PostMapping("confirmOrderSheet")
	public String setApproval(RedirectAttributes rttr,String comment,int orderId, String status) {
		
		if(status.equals("승인")) {
			int approval = service.setApproval(comment, orderId);
			
			return "redirect:/order/orderSheet/?orderId=" + orderId;
		}
		
		if(status.equals("반려")) {
			int companion = service.setCompanion(comment, orderId);
			
			return "redirect:/order/orderSheet/?orderId=" + orderId;
		}
		
		return "redirect:/order/orderSheet/?orderId=" + orderId;
	}
	
	@GetMapping("companionSheet")
	@PreAuthorize("hasAuthority('팀장','차장') or (authentication.name == #writer)")
	public void getCompanionSheet(Model model,int orderId,String writer) {
		
		OrderHeaderDto orderHeader = service.getOrderSheetHead(orderId);
		model.addAttribute("orderHeader", orderHeader);

		List<YjhOrderItemDto> orderItem = service.getOrderSheetItem(orderId);
		model.addAttribute("orderItem", orderItem);

		BuyerDto buyerInfo = service.getOrderSheetBuyer(orderId);
		model.addAttribute("buyer", buyerInfo);
		
		sumValueDto sumValue = service.getSumValue(orderId);
		model.addAttribute("sumValue",sumValue );
		
	}
	
	@PostMapping("companionSheet")
	public String setClosing(RedirectAttributes rttr,int orderId, String status) {
		
		if(status.equals("종결")) {
			int closing = service.setClosing(orderId);
			
			return "redirect:/order/companionSheet/?orderId=" + orderId;
		}
		
		return "redirect:/order/companionSheet/?orderId=" + orderId;
	}
}

package com.sharedOne.controller.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.SalePriceDto;
import com.sharedOne.service.master.SalePriceService;

@Controller
@RequestMapping("master")
public class SalePriceController {
	
	@Autowired
	private SalePriceService salePriceService;
	
	@GetMapping("salePriceList")
	public void salePriceList(Model model, String buyerCode) {
		
		List <BuyerDto> headerList = salePriceService.selectSalePriceHeaderList();
		List <SalePriceDto> itemList = salePriceService.selectSalePriceItemList(buyerCode);
		
		model.addAttribute("headerList", headerList);
		model.addAttribute("itemList", itemList);
		
	}
}

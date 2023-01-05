package com.sharedOne.controller.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.SalePriceDto;
import com.sharedOne.service.master.AsjSalePriceService;

@Controller
@RequestMapping("master")
public class AsjSalePriceController {
	
	@Autowired
	private AsjSalePriceService asjSalePriceService;
	
	@GetMapping("salePriceList")
	public void salePriceList(Model model, String buyerCode) {
		System.out.println("@@@ buyerCode  : "+ buyerCode);
		List <BuyerDto> headerList = asjSalePriceService.selectSalePriceHeaderList();
		List <SalePriceDto> itemList = asjSalePriceService.selectSalePriceItemListByBuyerCode(buyerCode);
		
		model.addAttribute("headerList", headerList);
		model.addAttribute("itemList", itemList);
		System.out.println("### : " + itemList);
		
	}
}

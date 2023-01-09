package com.sharedOne.controller.master;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.master.SalePriceDto;
import com.sharedOne.service.master.AsjProductService;
import com.sharedOne.service.master.AsjSalePriceService;
import com.sharedOne.service.master.lnhBuyerService;

@Controller
@RequestMapping("master")
public class AsjSalePriceController {
	
	@Autowired
	private AsjSalePriceService asjSalePriceService;
	
	@Autowired
	private AsjProductService productService;
	
	@Autowired
	private lnhBuyerService buyerService;
	
	@GetMapping("salePriceList")
	public void salePriceList(
			Model model, 
			@RequestParam(name="q", defaultValue="") String keyword,
			@RequestParam(name="productCode", defaultValue="") String productCode,
			@RequestParam(name="productName", defaultValue="") String productName,
			@RequestParam(name="buyerCode", defaultValue="") String buyerCode,
			@RequestParam(name="buyerName", defaultValue="") String buyerName,
			@RequestParam(name="country", defaultValue="") String country
			) {
		//System.out.println("@@@   : " + keyword);
		
		List <SalePriceDto> allSalePriceList = asjSalePriceService.selectAllSalePriceItemList(keyword, productCode, productName, buyerCode, buyerName, country);	
		model.addAttribute("allSalePriceList", allSalePriceList);
		
			
		List <ProductDto> productList = productService.selectProductList();	
		model.addAttribute("productList", productList);
		
			
		List<BuyerDto> buyerList = buyerService.selectBuyerList();
		model.addAttribute("buyerList", buyerList);
		
		Set<String> setCountry = new HashSet<>();
		for(BuyerDto buyer: buyerList) {
			String buyerCountry = buyer.getCountry();
			setCountry.add(buyerCountry);
		}
		model.addAttribute("countryList", setCountry);
			
	}
	
	@GetMapping("salePriceModify")
	public void salePriceGet(Model model, int priceId) {
		SalePriceDto sale = asjSalePriceService.selectSaleByPriceId(priceId);
		model.addAttribute("sale", sale);
	}
	@PostMapping("salePriceModify")
	public String salePriceUpdate(@ModelAttribute SalePriceDto saleInfo ) {
		//System.out.println("### postMapping::" + saleInfo);
		
		asjSalePriceService.updateSalePriceByPriceId(saleInfo);
		return "redirect:/master/salePriceModify?priceId="+saleInfo.getPriceId();
	}
	
	
	
}










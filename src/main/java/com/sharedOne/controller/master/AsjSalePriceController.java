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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.master.SalePriceDto;
import com.sharedOne.service.master.AsjProductService;
import com.sharedOne.service.master.AsjSalePriceService;
import com.sharedOne.service.master.lnhBuyerService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import springfox.documentation.annotations.ApiIgnore;

@Controller
@RequestMapping("master")
@ApiIgnore
public class AsjSalePriceController {
	
	@Autowired
	private AsjSalePriceService asjSalePriceService;

	@Autowired
	private AsjProductService productService;
	
	@Autowired
	private lnhBuyerService buyerService;
	
	/* 목록 리셋  */
	@GetMapping("salePriceListAjaxList")
	@ResponseBody
	@ApiIgnore
	public List<SalePriceDto> salePriceRegisterAjaxList() {
		/* ajax SalePrice 의 처음 또는 리셋 리스트 */
		List<SalePriceDto> salePriceListAll = asjSalePriceService.selectSalePriceListAll();
		//System.out.println("salePriceListAll : "+salePriceListAll);	
		return salePriceListAll;
	}
	
	@GetMapping("salePriceListAjax")
	@ResponseBody
	@ApiOperation(value="가격 목록 조회")
	public List <SalePriceDto> salePriceListAjax(
			Model model, 
			String q,
			String productCode,
			String productName,
			String buyerCode,
			String buyerName,
			String country,
			int priceMin,
			int priceMax,
			String fromDate,
			String endDate
			) {
		System.out.println( q+productCode+productName+buyerCode+buyerName+country);
		List <SalePriceDto> allSalePriceList 
			= asjSalePriceService.selectAllSalePriceItemList(q, productCode, productName, buyerCode, buyerName, country, priceMin, priceMax, fromDate, endDate);	

		System.out.println(allSalePriceList);
		
		return allSalePriceList;
		
	}
	
	@GetMapping("salePriceList")
	public void salePriceList(Model model) {
			
		/* 필터에 데이타리스트 넣어주기 (제품코드,제품명, 바이어코드,바이어명, 국가) */
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
	
	@GetMapping("getPrice")
	@ResponseBody
	public int selectPriceByProductCode(String productCode) {
		//System.out.println("ajax 단가 얻기 productCode : " + productCode);
		int price = asjSalePriceService.selectPriceByProductCode(productCode);
		return price;
	}
	
	@GetMapping("salePriceRegister")
	public void register(Model model, SalePriceDto saleInfo) {
		List<BuyerDto> buyerList = buyerService.selectBuyerList();
		model.addAttribute("buyerList", buyerList);
		
		List <ProductDto> productList = productService.selectProductList();	
		model.addAttribute("productList", productList);
			
	}
	
	
	@PostMapping("salePriceRegister")
	@ResponseBody
	public List<SalePriceDto> register(  @ModelAttribute SalePriceDto saleInfo ) {
		//System.out.println("########"+saleInfo	);
		String buyerCode = saleInfo.getBuyerCode();
		String productCode = saleInfo.getProductCode();
		int cnt = asjSalePriceService.register(saleInfo);
		System.out.println(cnt);
		System.out.println("제너레이터 KEY : "+saleInfo.getPriceId());
		
		List<SalePriceDto> dateListByBuyerCodeAndProductCode = asjSalePriceService.selectDateListByBuyerCodeAndProductCode(buyerCode, productCode);
		System.out.println("등록후 리스트 가져와 ! : "+dateListByBuyerCodeAndProductCode);
		return dateListByBuyerCodeAndProductCode;
		
	}
	
	@GetMapping("salePriceRegisterAjax")
	@ResponseBody
	public List<SalePriceDto> salePriceRegisterAjax( SalePriceDto saleInfo) {
		/* ajax SalePrice 의 productCode 중복확인 */
		String buyerCode = saleInfo.getBuyerCode();
		String productCode = saleInfo.getProductCode();
		System.out.println("!!"+buyerCode + productCode );
		List<SalePriceDto> dateListByBuyerCodeAndProductCode = asjSalePriceService.selectDateListByBuyerCodeAndProductCode(buyerCode, productCode);
		System.out.println("바이어의 제품들..의 날짜를 구해야해 !! : "+dateListByBuyerCodeAndProductCode);	
		return dateListByBuyerCodeAndProductCode;
	}
	
	@GetMapping("salePriceModify")
	public void salePriceGet(Model model, int priceId) {
		SalePriceDto sale = asjSalePriceService.selectSaleByPriceId(priceId);
		model.addAttribute("sale", sale);	
	}
	
	@GetMapping("salePriceModifyAjax")
	@ResponseBody
	public List<SalePriceDto> salePriceModifyAjax( SalePriceDto saleInfo) {
		/* ajax SalePrice 의 productCode 중복확인 */
		String buyerCode = saleInfo.getBuyerCode();
		String productCode = saleInfo.getProductCode();
		
		System.out.println("!@#!@#!@#"+buyerCode);
		
		List<SalePriceDto> sale = asjSalePriceService.selectDateListByBuyerCodeAndProductCode(buyerCode, productCode);
		return sale;
	}
	
	@PostMapping("salePriceModify")
	@ResponseBody
	public int salePriceUpdate( @ModelAttribute SalePriceDto saleInfo   ) {
		//System.out.println("# ajax saleInfo : " + saleInfo);

		int cnt = asjSalePriceService.updateSalePriceByPriceId(saleInfo);
		//System.out.println("### cnt : " + cnt);
		// @ResponseBody return 아무거나 해둠... ajax success 를 위해서. 
		return cnt;
	}
	
	@PostMapping("salePriceDelete")
	@ResponseBody
	public int delete(int priceId){
		System.out.println("프라이스 아이디  : "+priceId);
		int cnt = asjSalePriceService.deleteSalePriceInfoByPriceId(priceId);
		return cnt; 
	}
	
	
}











package com.sharedOne.controller.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedOne.domain.master.SearchBuyerDto;
import com.sharedOne.service.master.AsjSearchService;

import io.swagger.annotations.Api;
import springfox.documentation.annotations.ApiIgnore;
@Controller
@RequestMapping("master")
@ApiIgnore
public class AsjSearchController {
	
	@Autowired
	private AsjSearchService searchService;
	
	// 처음 검색창 열었을때 실행
	@RequestMapping("buyerSearch")
	@PreAuthorize("isAuthenticated()")
	public void buyerList(
			@RequestParam(name = "keyword", defaultValue = "") String keyword ,Model model){		
		
		System.out.println("###########"+keyword);
		int countBuyer = 0;
		
		if(keyword.equals("")) {
			
			countBuyer = searchService.countBuyerAll();
			
		} else {
			
			countBuyer = searchService.countBuyer(keyword);
		}
		
		
		List <SearchBuyerDto> searchResult = searchService.searchBuyerList(keyword);
		
		if(searchResult.size()>0) {
			
			int resultSize = searchResult.size()-1;
			
			int lastBuyerId = searchResult.get(resultSize).getBuyerId();
			
			model.addAttribute("lastBuyerId",lastBuyerId);
		}
		
		model.addAttribute("count", countBuyer);
		
		model.addAttribute("buyerList", searchResult);

	}
	
	// 10개씩 검색 리스트 추가
		@GetMapping("addBuyerList")
		@PreAuthorize("isAuthenticated()")
		@ResponseBody
		public List <SearchBuyerDto> addList(
				@RequestParam(name = "keyword", defaultValue = "") String keyword ,
				@RequestParam(name = "lastId", defaultValue = "") int lastId,
				Model model){
	
			/*
			 * if(searchResult.size()>0) {
			 * 
			 * int resultSize = searchResult.size()-1;
			 * 
			 * int lastProductId = searchResult.get(resultSize).getProductId();
			 * 
			 * model.addAttribute("lastProductId",lastProductId); }
			 */
			System.out.println(lastId);
			return searchService.addBuyerList(keyword,lastId);

		}
}

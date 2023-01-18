package com.sharedOne.controller.master;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedOne.domain.master.SearchProductDto;
import com.sharedOne.service.master.YjhSearchService;
@Controller
@RequestMapping("master")
public class YjhSearchController {
	
	@Autowired
	private YjhSearchService searchService;
	
	// 처음 검색창 열었을때 실행
	@RequestMapping("productSearch")
	@PreAuthorize("isAuthenticated()")
	public void productList(
			@RequestParam(name = "keyword", defaultValue = "") String keyword ,Model model){		
		
		int countProduct = 0;
		
		if(keyword.equals("")) {
			
			countProduct = searchService.countProductAll();
			
		} else {
			System.out.println(searchService.countProduct(keyword));
			
			countProduct = searchService.countProduct(keyword);
		}
		
		
		List <SearchProductDto> searchResult = searchService.searchProductList(keyword);
		
		if(searchResult.size()>0) {
			
			int resultSize = searchResult.size()-1;
			
			int lastProductId = searchResult.get(resultSize).getProductId();
			
			model.addAttribute("lastProductId",lastProductId);
		}
		
		model.addAttribute("count", countProduct);
		
		model.addAttribute("productList", searchResult);

	}
	
	// 10개씩 검색 리스트 추가
		@GetMapping("addProductList")
		@PreAuthorize("isAuthenticated()")
		@ResponseBody
		public List <SearchProductDto> addList(
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
			return searchService.addProductList(keyword,lastId);

		}
}

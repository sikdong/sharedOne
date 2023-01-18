package com.sharedOne.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sharedOne.domain.master.SearchProductDto;
import com.sharedOne.mapper.master.YjhSearchMapper;

@Service
public class YjhSearchService {
	
	@Autowired
	private YjhSearchMapper searchMapper;
	
	public List<SearchProductDto> searchProductList(String keyword) {
		
		keyword = "%" + keyword + "%";		

		return searchMapper.searchProductList(keyword);
	}

	public List<SearchProductDto> addProductList(String keyword, int lastId) {
		
		keyword = "%" + keyword + "%";
		
		return searchMapper.addProductList(keyword, lastId);
	}

	public int countProduct(String keyword) {
		
		keyword = "%" + keyword + "%";
		
		return searchMapper.countProduct(keyword);
	}

	public int countProductAll() {
		
		return searchMapper.countProductAll();
	}
}

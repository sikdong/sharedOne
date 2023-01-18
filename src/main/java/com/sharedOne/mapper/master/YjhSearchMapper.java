package com.sharedOne.mapper.master;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharedOne.domain.master.SearchProductDto;
@Mapper
public interface YjhSearchMapper {
		
	List <SearchProductDto> searchProductList(String keyword); 
	
	int countProduct(String keyword);

	List<SearchProductDto> addProductList(String keyword, int lastId);

	int countProductAll();

}

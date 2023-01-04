package com.sharedOne.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.mapper.master.ProductMapper;

@Service
public class ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	public List <ProductDto> selectProductList() {
		return productMapper.selectProductList();
		
	}

}

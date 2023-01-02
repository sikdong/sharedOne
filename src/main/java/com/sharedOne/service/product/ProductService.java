package com.sharedOne.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.product.ProductDto;
import com.sharedOne.mapper.product.ProductMapper;

@Service
public class ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	public List <ProductDto> selectProductList() {
		return productMapper.selectProductList();
		
	}

}

package com.sharedOne.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.mapper.master.AsjProductMapper;

@Service
public class AsjProductService {

	@Autowired
	private AsjProductMapper asjProductMapper;
	
	public List <ProductDto> selectProductList() {
		return asjProductMapper.selectProductList();
		
	}

}

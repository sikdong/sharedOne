package com.sharedOne.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.Buyer;
import com.sharedOne.domain.product.ProductDto;
import com.sharedOne.mapper.OrderMapper;


@Service
public class OrderService {
	
	@Autowired(required = true)
	private OrderMapper mapper;

	public List<Buyer> searchBuyer(String buyerInfo) {
		// TODO Auto-generated method stub
		buyerInfo = "%" + buyerInfo + "%";
		return mapper.searchBuyer(buyerInfo);
	}

	public List<Buyer> getBuyerNames() {
		// TODO Auto-generated method stub
		return mapper.getBuyerNames();
	}

	public List<ProductDto> searchProduct(String ProductInfo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}

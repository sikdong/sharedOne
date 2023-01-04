package com.sharedOne.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.mapper.order.YdsOrderMapper;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class YdsOrderService {
	
	private final YdsOrderMapper mapper;

	public List<BuyerDto> searchBuyer(String buyerInfo) {
		// TODO Auto-generated method stub
		buyerInfo = "%" + buyerInfo + "%";
		return mapper.searchBuyer(buyerInfo);
	}

	public List<BuyerDto> getBuyerNames() {
		// TODO Auto-generated method stub
		return mapper.getBuyerNames();
	}

	public List<ProductDto> searchProduct(String allproductInfo) {
		// TODO Auto-generated method stub
		allproductInfo = "%" + allproductInfo + "%";
		return mapper.searchProduct(allproductInfo);
	}
	
	
}

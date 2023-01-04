package com.sharedOne.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.mapper.order.YdsOrderMapper;


@Service
public class YdsOrderService {
	
	@Autowired(required = true)
	private YdsOrderMapper mapper;

	public List<BuyerDto> searchBuyer(String buyerInfo) {
		// TODO Auto-generated method stub
		buyerInfo = "%" + buyerInfo + "%";
		return mapper.searchBuyer(buyerInfo);
	}

	public List<BuyerDto> getBuyerNames() {
		// TODO Auto-generated method stub
		return mapper.getBuyerNames();
	}

	public List<ProductDto> searchProduct(String ProductInfo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}

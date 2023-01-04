package com.sharedOne.mapper.order;

import java.util.List;

import org.springframework.stereotype.Component;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.ProductDto;


@Component
public interface YdsOrderMapper {

	List<BuyerDto> searchBuyer(String buyerInfo);

	List<BuyerDto> getBuyerNames();

	List<ProductDto> searchProduct(String productInfo);
	
}

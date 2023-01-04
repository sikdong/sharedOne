package com.sharedOne.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import com.sharedOne.domain.Buyer;
import com.sharedOne.domain.product.ProductDto;

@Component
public interface OrderMapper {

	List<Buyer> searchBuyer(String buyerInfo);

	List<Buyer> getBuyerNames();

	List<ProductDto> searchProduct(String productInfo);
	
}

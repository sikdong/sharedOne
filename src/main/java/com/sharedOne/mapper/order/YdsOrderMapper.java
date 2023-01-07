package com.sharedOne.mapper.order;

import java.util.List;

import org.springframework.stereotype.Component;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.master.YdsProductDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;


@Component
public interface YdsOrderMapper {

	List<BuyerDto> searchBuyer(String buyerInfo);

	List<BuyerDto> getBuyerNames();

	List<ProductDto> searchProduct(String productInfo);

	YdsProductDto addTempProductOrder(YdsProductDto ypd);

	void insertOrderHeader(OrderHeaderDto ohd);

	void insertOrderItem(OrderItemDto oid);
	
}

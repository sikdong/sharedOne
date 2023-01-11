package com.sharedOne.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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

	List<ProductDto> searchProduct(@Param("allProductInfo") String allProductInfo, @Param("tableBuyerCode") String tableBuyerCode);

	List<YdsProductDto> addTempProductOrder(List<YdsProductDto> ypd);

	void insertOrderHeader(OrderHeaderDto ohd);

	void insertOrderItem(@Param("oid")OrderItemDto oid, @Param("generatedId") int generatedId);

	YdsProductDto addTempProductOrder(@Param("productCode") String productCode, 
			@Param("buyerCode") String buyerCode);

	
}

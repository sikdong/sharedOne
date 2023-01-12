package com.sharedOne.mapper.order;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.master.YdsProductDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.order.YdsOrderDto;

@Component
public interface YdsOrderMapper {

	List<BuyerDto> searchBuyer(String buyerInfo);

	List<BuyerDto> getBuyerNames();

	List<ProductDto> searchProduct(@Param("allProductInfo") String allProductInfo,
			@Param("tableBuyerCode") String tableBuyerCode, @Param("fromDate") LocalDate fromDate,
			@Param("endDate") LocalDate endDate);

	List<YdsProductDto> addTempProductOrder(List<YdsProductDto> ypd);

	void insertOrderHeader(OrderHeaderDto ohd);

	void insertOrderItem(@Param("generatedId") int generatedId, @Param("oid") OrderItemDto oid);

	YdsProductDto addTempProductOrder(@Param("productCode") String productCode, @Param("buyerCode") String buyerCode,
			String fromDate, String endDate);

	void createOrderCode(@Param("generatedId") int generatedId, @Param("year") String year);

	String getDate(int generatedId);

	YdsOrderDto modifyOrder(int orderId);

	List<ProductDto> getPriceDate(String allProductInfo, String tableBuyerCode);


}

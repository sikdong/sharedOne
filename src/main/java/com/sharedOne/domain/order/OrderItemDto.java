package com.sharedOne.domain.order;

import java.util.List;

import com.sharedOne.domain.master.SalePriceDto;
import com.sharedOne.domain.master.ProductDto;

import lombok.Data;

@Data
public class OrderItemDto {
	private int itemId;
	private int quantity;
	private int sum;
	private String orderCode;
	
	private List <ProductDto> product;
	private String productCode;
//	private String productName;
//	private String unit;
//	private int price;
	
	private List <SalePriceDto> price;
//	private int salePrice;
//	private int discountRate;
//	private LocalDate fromDate;
//	private LocalDate endDate;
	
	
}

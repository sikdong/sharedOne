package com.sharedOne.domain.master;

import java.time.LocalDate;
import java.util.List;

import lombok.Data;

@Data
public class SalePriceDto {
	
	private int priceId;
	private int salePrice;
	private int discountRate;
	private LocalDate fromDate;
	private LocalDate endDate;
	
	// JOIN,WHERE buyerCode = #{buyerCode } 해서, 1개의 buyerCode만 결정됨.  	
	private String buyerCode; 
	
	List<ProductDto> product; 
	private String productCode;
	private String productName;
	private int price;
	
}

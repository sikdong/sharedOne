package com.sharedOne.domain.master;

import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data

public class SalePriceDto {
	
	private int priceId;
	private int salePrice;
	private int discountRate;
	private String fromDate;
	private String endDate;
	
	// JOIN,WHERE buyerCode = #{buyerCode } 해서, 1개의 buyerCode만 결정됨.  	
	private String buyerCode; 
	private String buyerName; 
	private String country; 
	
	List<ProductDto> product; 
	private String productCode;
	private String productName;
	private int price;
	
}

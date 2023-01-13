package com.sharedOne.domain.master;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ProductDto {
	
	//productCode, productName, productType, weight, size, price, unit, content, inserted
	private String productCode;
	private String productName;
	private String productType;
	private int weight;
	private int size;
	private int price;
	private String unit;
	private String content;
	private String inserted;

	private String modified;
	private String fromDate;
	private String endDate;

	private String buyerCode;
	
	// 테이블에서 조인해서 가져오려면 필요해서 넣었습니다
	private int salePrice;

}

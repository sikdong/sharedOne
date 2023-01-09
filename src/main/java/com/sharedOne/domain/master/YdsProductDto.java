package com.sharedOne.domain.master;

import java.time.LocalDate;

import lombok.Data;

@Data
public class YdsProductDto {

	private String productCode;
	private String productName;
	private String productType;
	private int weight;
	private int size;
	private int price;
	private String unit;
	private String content;
	private LocalDate inserted;
	private int quantity;
	private int salePrice;
	private int vat;
	private int sum;
}

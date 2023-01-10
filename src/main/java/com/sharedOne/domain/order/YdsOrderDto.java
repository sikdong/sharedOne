package com.sharedOne.domain.order;

import java.util.List;

import lombok.Data;

@Data
public class YdsOrderDto {
	private String buyerCode;
	private String deliveryDate;
	private String message;
	private List<String> productCode;
	private List<Integer> salePrice;
	private List<Integer> quantity;
}
package com.sharedOne.domain.order;

import lombok.Data;

@Data
public class YjhOrderItemDto {
	
	private int itemId;
	private int quantity;
	private int sum;
	private String orderCode;
	
	private String productCode;
	private String productName;
	private String productType;
	private int weight;
	private int size;
	private String unit;
	
	private int finalPrice;
	private int priceId;
	
	private int orderId;
	

}

package com.sharedOne.domain.report;

import java.time.LocalDate;

import lombok.Data;

@Data
public class OrderReportDto {
// DB Order_header : orderId, inserted, modified, deliveryDate, writer, buyerCode, status, message, comment
	private int orderId;
	private LocalDate inserted;
	private LocalDate modified;
	private LocalDate deliveryDate;
	private String writer;
	private String buyerCode;
	private String message;
	private String comment;
	private String status;
	
// DB Order_item : itemId, productCode, priceId, quantity, sum, finalPrice, orderId	
	private String productCode;
	private int finalPrice;
	private int quantity;
	private int sum;

// DB Product : productCode, productName, productType, weight, size, price, unit, content, inserted, modified, fromDate, endDate
	private String productName; 
	private String productType;
	private int size;
	
}

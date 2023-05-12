package com.sharedOne.domain.order;

import java.util.List;

import lombok.Data;

@Data
public class YdsOrderDto {
	private String buyerCode;
	private String deliveryDate;
	private String message;
	private OrderHeaderDto ohd;
	private List<OrderItemDto> oid;
	private String writer;
	private String status;
	private String inserted;
	private String modified;
	private String memberId;
}

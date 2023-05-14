package com.sharedOne.domain.order;

import java.util.List;

import lombok.Data;

@Data
public class YdsOrderDto {
	private OrderHeaderDto ohd;
	private List<OrderItemDto> oid;
}

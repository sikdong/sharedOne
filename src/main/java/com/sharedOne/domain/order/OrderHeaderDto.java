package com.sharedOne.domain.order;

import java.time.LocalDate;
import java.util.List;

import com.sharedOne.domain.master.BuyerDto;

import lombok.Data;

@Data
public class OrderHeaderDto {
	
	private int orderId;
	private String orderCode;
	private LocalDate inserted;
	private LocalDate modified;
	private String deliveryDate;
	private String writer;
	private String name;
	private String status;
	private String message;
	
	private List <BuyerDto> buyer;
	private String buyerCode;
	private String buyerName;
	
	
	/* Order에 들어갈 자료는 무엇이 있을까
		h.orderId,
		h.orderCode,
		h.inserted,
		h.modified,
		h.deliveryDate,
		h.writer,
		h.status,
		h.message,

		m.name,
		
		b.buyerCode,
		b.buyerName,
		
		i.itemId,
		i.quantity,
		i.sum,
		
		p.productCode,
		p.productName,
		p.unit,
		p.price,
		
		c.salePrice,
		c.discountRate,
		c.fromDate,
		c.endDate
	*/
	
}

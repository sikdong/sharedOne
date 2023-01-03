package com.sharedOne.domain.order;

import java.time.LocalDate;

import lombok.Data;

@Data
public class PriceDto {

	private int salePrice;
	private int discountRate;
	private LocalDate fromDate;
	private LocalDate endDate;
}

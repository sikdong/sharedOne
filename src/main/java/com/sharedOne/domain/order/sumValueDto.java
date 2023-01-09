package com.sharedOne.domain.order;

import java.time.LocalDate;

import lombok.Data;

@Data
public class sumValueDto {
	
	private int priceSum;
	private int quantitySum;
	private int sumTotal;
}

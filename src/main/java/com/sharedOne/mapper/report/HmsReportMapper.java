package com.sharedOne.mapper.report;

import java.util.List;

import org.springframework.stereotype.Component;

import com.sharedOne.domain.order.OrderHeaderDto;

@Component
public interface HmsReportMapper {
	
	List<OrderHeaderDto> orderList(int offset, int records, String orderQ);

	int countPage();
}

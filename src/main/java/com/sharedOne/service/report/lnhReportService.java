package com.sharedOne.service.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.report.ReportDto;
import com.sharedOne.mapper.report.lnhReportMapper;

@Service
public class lnhReportService {
	
	@Autowired
	private lnhReportMapper mapper;

	public List<OrderHeaderDto> orderList(String orderQ) { 
		
		//mapper.salesByBuyer(orderQ);
		
		return mapper.orderList("%" + orderQ + "%");
	}

	public List<ReportDto> thisYearSales() {
		return mapper.thisYearSales();
	}

}

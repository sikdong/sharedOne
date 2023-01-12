package com.sharedOne.service.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public List<OrderHeaderDto> orderList(String orderQ, String orderCode, String productCode, String writer, String status) { 
		
		orderQ = "%" + orderQ + "%";
		
		return mapper.orderList(orderQ, orderCode, productCode, writer, status);
	}
	
	public Map<String, Integer> salesByBuyer(String orderQ, List<String> buyerCodes) {
		Map<String, Integer> salesByBuyer = new HashMap<>();
		
		for (String buyerCode : buyerCodes ) {
			salesByBuyer.put(buyerCode, mapper.salesByBuyer(orderQ, buyerCode));
		}
		return salesByBuyer;
		
	}

	public List<ReportDto> thisYearSales() {
		return mapper.thisYearSales();
	}

	public Map<String, Integer> salesByWriter(String orderQ, List<String> writerList) {
		Map<String, Integer> salesByWriter = new HashMap<>();
		
		for (String writer : writerList) {
			salesByWriter.put(writer, mapper.salesByWriter(orderQ, writer));
		}
		
		return salesByWriter;
	}

}

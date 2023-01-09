package com.sharedOne.service.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.mapper.report.lnhReportMapper;

@Service
public class lnhReportService {
	
	@Autowired
	private lnhReportMapper mapper;

	public List<OrderHeaderDto> orderList(String orderQ) { 
		
		return mapper.orderList("%" + orderQ + "%");
	}
}

package com.sharedOne.service.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.report.PageInfo;
import com.sharedOne.mapper.report.HmsReportMapper;

@Service
public class HmsReportService {
	
	@Autowired
	private HmsReportMapper mapper;
	
	public List<OrderHeaderDto> orderList(int page, String orderQ, PageInfo pageInfo) { // int page = 페이지 파라미터 추가
		int records = 10; // 10개까지 표시
		int offset = (page - 1) * records; // 
		
		int countPage = mapper.countPage(); 
		int lastPage = (countPage - 1) / records + 1;
		
		int leftPageNumber = (page - 1) / records + 1;
		int rightPageNumber = leftPageNumber + 9;
		rightPageNumber = Math.min(rightPageNumber, lastPage);
		
		pageInfo.setCurrentPageNumber(page);
		pageInfo.setLeftPageNumber(leftPageNumber);
		pageInfo.setRightPageNumber(rightPageNumber);
		pageInfo.setLastPageNumber(lastPage);
		
		return mapper.orderList(offset, records, "%" + orderQ + "%");
	}

	

	
	
}

package com.sharedOne.service.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.report.OrderReportDto;
import com.sharedOne.domain.report.PageInfo;
import com.sharedOne.mapper.report.HmsReportMapper;

@Service
public class HmsReportService {
	
	@Autowired
	private HmsReportMapper mapper;
	
	public List<OrderReportDto> orderList(int page, 
										  String orderS, 
										  String orderQ, 
										  String productCode,
										  String productName, 
										  String productType, 
										  String size, 
										  PageInfo pageInfo) { // int page = 페이지 파라미터 추가
		
		orderQ = "%" + orderQ + "%";
		
		/* productCode = "%" + productCode + "%"; */
		
		/* productName = "%" + productName + "%"; */
		
		/* productType = "%" + productType + "%"; */
		
		/* size = "%" + size + "%"; */
		
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
		
		// 기간 설정 
		
		//입력된 날짜가 빈 값일 때
		// if (searchStartDate == "") {
	    //     searchStartDate = "00010101";
	    // }
	    // if (searchEndDate == "") {
	    //    searchEndDate = "99991231";
	    // }

	    // String으로 들어오는 날짜 데이터 변환
	    //LocalDateTime startDateTime = LocalDate.parse(searchStartDate, DateTimeFormatter.ofPattern("yyyy-MM-dd")).atTime(0, 0, 0);
	    //LocalDateTime endDateTime = LocalDate.parse(searchEndDate, DateTimeFormatter.ofPattern("yyyy-MM-dd")).atTime(23, 59, 59);
		
		return mapper.orderList(offset, records, orderS, orderQ, productCode, productName, productType, size);

	    

	}

	public List<ProductDto> productCatalog(String productS, String productQ) {
		
		return mapper.productCatalog(productS, "%" + productQ + "%");
	}

	

	
	

	
}

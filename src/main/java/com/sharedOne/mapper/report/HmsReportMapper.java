package com.sharedOne.mapper.report;

import java.util.List;

import org.springframework.stereotype.Component;

import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.report.OrderReportDto;

@Component
public interface HmsReportMapper {
	
	List<OrderReportDto> orderList(int offset, 
								   int records, 
								   //LocalDateTime startDateTime, 
								   //LocalDateTime endDateTime, 
								   String orderS,  
								   String orderQ,
								   String productCode,
								   String productName, 
								   String productType, 
								   String size
									);

	int countPage();

	List<ProductDto> productCatalog(String productS, String productQ);
}

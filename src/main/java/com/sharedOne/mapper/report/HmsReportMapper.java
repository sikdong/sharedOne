package com.sharedOne.mapper.report;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Component;

import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.order.OrderHeaderDto;

@Component
public interface HmsReportMapper {
	
	List<OrderHeaderDto> orderList(int offset, 
								   int records, 
								   //LocalDateTime startDateTime, 
								   //LocalDateTime endDateTime, 
								   String orderS, 
								   String orderQ);

	int countPage();

	List<ProductDto> productCatalog(String productS, String productQ);

}

package com.sharedOne.service.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.report.ReportDto;
import com.sharedOne.mapper.report.lnhReportMapper;

@Service
public class lnhReportService {
	
	@Autowired
	private lnhReportMapper mapper;

	public List<OrderHeaderDto> orderList(String orderQ, String orderCode, String productCode, String writer, String status, String fromDate, String endDate) { 
		
		orderQ = "%" + orderQ + "%";
		orderCode = "%" + orderCode + "%";
		productCode = "%" + productCode + "%";
		writer = "%" + writer + "%";
		status = "%" + status + "%";
		
		return mapper.orderList(orderQ, orderCode, productCode, writer, status, fromDate, endDate);
	}
	//올해 매출
	public List<ReportDto> thisYearSales() {
		return mapper.thisYearSales();
	}
	
	//검색 결과 바이어 별 매출
	public Map<String, Integer> salesByBuyer(String orderQ, String orderCode, String productCode,
											String writer, String status, String fromDate, String endDate, List<String> buyerCodes) {
		Map<String, Integer> salesByBuyer = new HashMap<>();
		orderQ = "%" + orderQ + "%";
		orderCode = "%" + orderCode + "%";
		productCode = "%" + productCode + "%";
		writer = "%" + writer + "%";
		status = "%" + status + "%";
		//바이어 코드 별 매출
		for (String buyerCode : buyerCodes ) {
			Integer BuyerSale = mapper.salesByBuyer(orderQ, orderCode, productCode, writer, status, fromDate, endDate, buyerCode);
			//매출이 없는 경우
			if (BuyerSale == null) {
				BuyerSale = 0;
			}
			salesByBuyer.put(buyerCode, BuyerSale);
		}
		return salesByBuyer;
		
	}
	//검색 결과 직원 별 매출
	public Map<String, Integer> salesByWriter(String orderQ, String orderCode, String productCode, 
												String status, String fromDate, String endDate, List<String> writerList) {
		Map<String, Integer> salesByWriter = new HashMap<>();
		orderQ = "%" + orderQ + "%";
		orderCode = "%" + orderCode + "%";
		productCode = "%" + productCode + "%";
		status = "%" + status + "%";
		//직원 별 매출
		for (String writer : writerList) {
			Integer writerSale = mapper.salesByWriter(orderQ, orderCode, productCode, writer, status, fromDate, endDate);
			//매출이 없는 경우
			if(writerSale == null) {
				writerSale = 0;
			}
			salesByWriter.put(writer, writerSale);
		}
		
		return salesByWriter;
	}

}

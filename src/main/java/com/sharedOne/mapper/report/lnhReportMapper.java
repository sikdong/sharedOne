package com.sharedOne.mapper.report;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.report.ReportDto;

@Component
public interface lnhReportMapper {

	List<OrderHeaderDto> orderList(String orderQ, String orderCode, String productCode, String writer, String status, String fromDate, String endDate);

	List<ReportDto> thisYearSales();

	Integer salesByBuyer(@Param("orderQ") String orderQ, @Param("orderCode") String orderCode, 
			@Param("productCode") String productCode, @Param("writer") String writer,
			@Param("status") String status, @Param("fromDate") String fromDate,
			@Param("endDate") String endDate, @Param("buyerCode") String buyerCode);

	Integer salesByWriter(@Param("orderQ") String orderQ, @Param("orderCode") String orderCode, 
			@Param("productCode") String productCode, @Param("writer") String writer,
			@Param("status") String status, @Param("fromDate") String fromDate,
			@Param("endDate") String endDate);


}

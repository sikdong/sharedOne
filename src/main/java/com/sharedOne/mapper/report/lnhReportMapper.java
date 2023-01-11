package com.sharedOne.mapper.report;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.report.ReportDto;

@Component
public interface lnhReportMapper {

	List<OrderHeaderDto> orderList(String orderQ);

	List<ReportDto> thisYearSales();

	int salesByBuyer(@Param("orderQ") String orderQ, @Param("buyerCode") String buyerCode);


}

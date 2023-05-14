package com.sharedOne.service.order;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.master.SalePriceDto;
import com.sharedOne.domain.master.YdsProductDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.order.YdsOrderDto;
import com.sharedOne.mapper.order.YdsOrderMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class YdsOrderService {

	private final YdsOrderMapper mapper;

	public List<BuyerDto> searchBuyer(String buyerInfo) {
		// TODO Auto-generated method stub
		buyerInfo = "%" + buyerInfo + "%";
		return mapper.searchBuyer(buyerInfo);
	}

	public List<BuyerDto> getBuyerNames() {
		// TODO Auto-generated method stub
		return mapper.getBuyerNames();
	}

	public List<ProductDto> searchProduct(String allProductInfo, String tableBuyerCode, String deliveryDate) {
		// TODO Auto-generated method stub
		allProductInfo = "%" + allProductInfo + "%";
		LocalDate parsedDeliveryDate = LocalDate.parse(deliveryDate, DateTimeFormatter.ISO_DATE);
		List<ProductDto> dates = mapper.getPriceDate(allProductInfo, tableBuyerCode);
		List<ProductDto> pddList = new ArrayList<>();
		for (ProductDto date : dates) {
			String fd = date.getFromDate();
			String ed = date.getEndDate();
			LocalDate fromDate = LocalDate.parse(fd, DateTimeFormatter.ISO_DATE);
			LocalDate endDate = LocalDate.parse(ed, DateTimeFormatter.ISO_DATE);
			if ((fromDate.isEqual(parsedDeliveryDate) || fromDate.isBefore(parsedDeliveryDate))
					&& (endDate.isEqual(parsedDeliveryDate) || endDate.isAfter(parsedDeliveryDate))) {

				pddList = mapper.searchProduct(allProductInfo, tableBuyerCode, fromDate, endDate);
			} 
		}
		if (pddList.size() != 0) {

			return pddList;
		} else {
			return new ArrayList<>();
		}
	}

	public List<YdsProductDto> addTempProductOrder(Map<String, Object> data) {
		// TODO Auto-generated method stub
		/* YdsProductDto yds = mapper.addTempProductOrder(data); */
		List<String> productCodes = (List<String>) data.get("productCodes");
		List<String> fromDates = (List<String>) data.get("fromDates");
		List<String> endDates = (List<String>) data.get("endDates");
		String buyerCode = (String) data.get("buyerCode");
		List<YdsProductDto> ypd = new ArrayList<>();

		for (int i = 0; i < productCodes.size(); i++) {
			String productCode = productCodes.get(i);
			String fromDate = fromDates.get(i);
			String endDate = endDates.get(i);
			ypd.add(mapper.addTempProductOrder(productCode, buyerCode, fromDate, endDate));
		}
		return ypd;

	}

	@Transactional
	public void insertOrder(YdsOrderDto yod) {
		long startTime = System.currentTimeMillis();
		System.out.println(startTime); 
		// 오더 헤더 파라미터 구성
		OrderHeaderDto ohd = yod.getOhd();
		mapper.insertOrderHeader(ohd);
		int generatedId = ohd.getOrderId();
		String date = mapper.getDate(generatedId);
		String year = date.substring(0, 4);
		mapper.createOrderCode(generatedId, year);

		// 오더 아이템 파라미터 구성
		List<OrderItemDto> oid = yod.getOid();
		for(OrderItemDto item : oid){
			mapper.insertOrderItem(generatedId, item);
		}

		long endTime = System.currentTimeMillis();
		
		System.out.println(endTime);
		System.out.println(endTime - startTime);
	}

	public OrderHeaderDto getOrderHeader(int orderId) {
		// TODO Auto-generated method stub
		return mapper.getOrderHeader(orderId);
	}

	public List<OrderItemDto> getOrderItem(int orderId) {
		// TODO Auto-generated method stub
		return mapper.getOrderItem(orderId);
	}

	@Transactional
	public void updateOrder(YdsOrderDto yod, int orderId) {
		long startTime = System.currentTimeMillis();
		System.out.println(startTime); 
		mapper.deleteOrder(orderId);
		OrderHeaderDto ohd = yod.getOhd();
		mapper.updateOrderHeader(ohd, orderId);
		long endTime = System.currentTimeMillis();
		List<OrderItemDto> oid = yod.getOid();
		for(OrderItemDto item : oid){
			mapper.insertNewOrderItem(orderId, item);
		}
		
		System.out.println(endTime);
		System.out.println(endTime - startTime);
	}

	public int deleteOrder(Map<String, String> data) {
		String productCode = data.get("productCode");
		String orderId = data.get("orderId");
		return mapper.deleteOrderItem(productCode, orderId);

	}

}

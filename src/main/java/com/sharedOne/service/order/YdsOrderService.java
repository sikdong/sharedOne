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
		System.out.println("parsedDeliveryDate " + parsedDeliveryDate);
		List<ProductDto> dates = mapper.getPriceDate(allProductInfo, tableBuyerCode);
		System.out.println("dates = " + dates);
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
			return null;
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

	public void insertOrder(YdsOrderDto yod) {
		// 오더 헤더 파라미터 구성
		OrderHeaderDto ohd = new OrderHeaderDto();
		ohd.setWriter(yod.getWriter());
		ohd.setBuyerCode(yod.getBuyerCode());
		if (yod.getDeliveryDate().isEmpty()) {

			ohd.setDeliveryDate(null);
		} else {
			ohd.setDeliveryDate(yod.getDeliveryDate());
		}
		ohd.setMessage(yod.getMessage());
		ohd.setStatus(yod.getStatus());
		mapper.insertOrderHeader(ohd);
		int generatedId = ohd.getOrderId();
		String date = mapper.getDate(generatedId);
		String year = date.substring(0, 4);
		mapper.createOrderCode(generatedId, year);

		// 오더 아이템 파라미터 구성
		OrderItemDto oid = new OrderItemDto();
		/* System.out.println("null 이여도 사이즈는 몇개? " + yod.getQuantity().size()); */

		// 상세 정보에 없는 경우
		System.out.println(yod.getProductCode() != null);
		if (yod.getProductCode() == null) {
			oid = null;
			mapper.insertOrderItem(generatedId, oid);
			System.out.println("false가 실행됨");
		} else {
			System.out.println("왜 여기로 안와?");

			List<Integer> quantities = yod.getQuantity();
			List<Integer> finalPrices = yod.getFinalPrice();
			List<Integer> sums = yod.getSum();
			List<String> productCodes = yod.getProductCode();
			for (int a = 0; a < yod.getQuantity().size(); a++) {
				// 수량 등록 된 상태
				if (yod.getQuantity().get(a) != null) {

					oid.setFinalPrice(finalPrices.get(a));
					oid.setQuantity(quantities.get(a));
					oid.setSum(sums.get(a));
					oid.setProductCode(productCodes.get(a));
					mapper.insertOrderItem(generatedId, oid);
					System.out.println(a + "번 실행됨");
				} else {
					// 수량 등록 안된 상태
					System.out.println("여기로 오니?");
					oid.setProductCode(productCodes.get(a));
					oid.setFinalPrice(finalPrices.get(a));
					oid.setQuantity(0);
					oid.setSum(0);
					mapper.insertOrderItem(generatedId, oid);
				}
			}
		}
	}

	public OrderHeaderDto modifyOrderHeader(int orderId) {
		// TODO Auto-generated method stub
		return mapper.modifyOrderHeader(orderId);
	}

	public List<OrderItemDto> modifyOrderItem(int orderId) {
		// TODO Auto-generated method stub
		return mapper.modifyOrderItem(orderId);
	}

}

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
		System.out.println("dates " + dates);
		List<ProductDto> pddList = new ArrayList<>();
		for (ProductDto date : dates) {
			LocalDate fromDate = date.getFromDate();
			System.out.println("fromDate " + fromDate);
			LocalDate endDate = date.getEndDate();
			System.out.println("endDate " + endDate);
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
		System.out.println("null 이여도 사이즈는 몇개? " + yod.getQuantity().size());

		// 상세 정보에 없는 경우
		if (yod.getProductCode() != null) {
			List<String> productCodes = yod.getProductCode();
			for (int i = 0; i < productCodes.size(); i++) {
				oid.setProductCode(productCodes.get(i));
			}
		} else {
			oid = null;
			mapper.insertOrderItem(generatedId, oid);
		}
		for (int a = 0; a < yod.getQuantity().size(); a++) {
			if (yod.getQuantity().get(a) != null) {
				List<Integer> quantities = yod.getQuantity();
				List<Integer> finalPrices = yod.getFinalPrice();
				List<Integer> sums = yod.getSum();
				for (int i = 0; i < quantities.size(); i++) {
					oid.setFinalPrice(finalPrices.get(i));
					oid.setQuantity(quantities.get(i));
					oid.setSum(sums.get(i));
					System.out.println("오더 목록 " + i + "번째는" + oid);
					mapper.insertOrderItem(generatedId, oid);
				}
			} else {
				List<Integer> quantities = new ArrayList<>();
				List<Integer> sums = new ArrayList<>();
				for (int i = 0; i < yod.getQuantity().size(); i++) {

					quantities.add(i, 0);
					sums.add(i, 0);
				}
				for (int i = 0; i < quantities.size(); i++) {

					oid.setQuantity(quantities.get(i));
					oid.setSum(sums.get(i));
				}
				mapper.insertOrderItem(generatedId, oid);
			}
		}
	}

	public YdsOrderDto modifyOrder(int orderId) {
		// TODO Auto-generated method stub
		return mapper.modifyOrder(orderId);
	}

}

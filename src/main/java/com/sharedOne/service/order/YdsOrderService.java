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
	public void insertOrder(OrderHeaderDto oid, OrderItemDto oid) {
		long startTime = System.currentTimeMillis();
		System.out.println(startTime); 
		// 오더 헤더 파라미터 구성
		OrderHeaderDto ohd = new OrderHeaderDto();
		ohd.setMemberId(yod.getMemberId());
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

		// 상세 정보에 없는 경우
		/*
		 * if (yod.getProductCode() == null) { oid = null;
		 * mapper.insertOrderItem(generatedId, oid); } else {
		 */
		List<Integer> quantities = yod.getQuantity();
		List<Integer> finalPrices = yod.getFinalPrice();
		List<Integer> sums = yod.getSum();
		List<String> productCodes = yod.getProductCode();
		if (yod.getProductCode() != null) {
			for (int a = 0; a < yod.getQuantity().size(); a++) {
				// 수량 등록 된 상태
				if (yod.getQuantity().get(a) != null) {

					oid.setFinalPrice(finalPrices.get(a));
					oid.setQuantity(quantities.get(a));
					oid.setSum(sums.get(a));
					oid.setProductCode(productCodes.get(a));
					mapper.insertOrderItem(generatedId, oid);
				} else {
					// 수량 등록 안된 상태
					oid.setProductCode(productCodes.get(a));
					oid.setFinalPrice(finalPrices.get(a));
					oid.setQuantity(0);
					oid.setSum(0);
					mapper.insertOrderItem(generatedId, oid);
				}
			}
		}
		long endTime = System.currentTimeMillis();
		
		System.out.println(endTime);
		System.out.println(endTime - startTime);
	}

	public OrderHeaderDto modifyOrderHeader(int orderId) {
		// TODO Auto-generated method stub
		return mapper.modifyOrderHeader(orderId);
	}

	public List<OrderItemDto> modifyOrderItem(int orderId) {
		// TODO Auto-generated method stub
		return mapper.modifyOrderItem(orderId);
	}

	@Transactional
	public void updateOrder(YdsOrderDto yod, int orderId) {
		long startTime = System.currentTimeMillis();
		System.out.println(startTime); 
		// 오더 헤더 파라미터 구성
		OrderHeaderDto ohd = new OrderHeaderDto();
		ohd.setBuyerCode(yod.getBuyerCode());
		String modified = yod.getModified();
		LocalDate parsedModified = LocalDate.parse(modified, DateTimeFormatter.ISO_DATE);
		ohd.setModified(parsedModified);
		if (yod.getDeliveryDate().isEmpty()) {

			ohd.setDeliveryDate(null);
		} else {
			ohd.setDeliveryDate(yod.getDeliveryDate());
		}
		ohd.setMessage(yod.getMessage());
		ohd.setStatus(yod.getStatus());
		mapper.updateOrderHeader(ohd, orderId);

		OrderItemDto oid = new OrderItemDto();
		// 오더 아이템 파라미터 구성
		// 상세 정보에 없는 경우
		/*
		 * if (yod.getProductCode() == null) { oid = null; mapper.updateOrderItem(oid,
		 * orderId); } else {
		 */

		List<String> compareyod = mapper.selectProductCodes(orderId);
		List<String> readyProductCodes = yod.getProductCode();
		List<Integer> quantities = yod.getQuantity();
		List<Integer> finalPrices = yod.getFinalPrice();
		List<Integer> sums = yod.getSum();
		
		// 기존 데이터 베이스의 제품코드와 비교하여 update or insert 여부 결정위한 for 문
		if (compareyod != null && !compareyod.isEmpty()) {
			for (int a = 0; a < readyProductCodes.size(); a++) {
				for (String cpc : compareyod) {
					if (readyProductCodes.get(a).equals(cpc)) {
						// 수량 등록 된 상태
						if (quantities.get(a) != 0) {
							oid.setProductCode(readyProductCodes.get(a));
							readyProductCodes.set(a, "1");
							oid.setFinalPrice(finalPrices.get(a));
							oid.setQuantity(quantities.get(a));
							oid.setSum(sums.get(a));
							mapper.updateOrderItem(oid, orderId);
						
						} else {
							// 수량 등록 안된 상태
							oid.setProductCode(readyProductCodes.get(a));
							readyProductCodes.set(a, "1"); // 기존 제품 코드 지우기
							oid.setFinalPrice(finalPrices.get(a));
							oid.setQuantity(0);
							oid.setSum(0);
							mapper.updateOrderItem(oid, orderId);
						
						}
					}
				}
			}
			
			// 기존 주문 아닌 제품 코드들 인식
			for (int a = 0; a < readyProductCodes.size(); a++) {
				if (!readyProductCodes.get(a).equals("1")) {

					if (quantities.get(a) != 0) {
						// 수량 등록 된 상태
						oid.setProductCode(readyProductCodes.get(a));
						oid.setFinalPrice(finalPrices.get(a));
						oid.setQuantity(quantities.get(a));
						oid.setSum(sums.get(a));
						mapper.insertOrderItem(orderId, oid);
						
					} else {
						// 수량 등록 안된 상태
						oid.setProductCode(readyProductCodes.get(a));
						oid.setFinalPrice(finalPrices.get(a));
						oid.setQuantity(0);
						oid.setSum(0);
						mapper.insertOrderItem(orderId, oid);
						
					}
				}

			}
		} else {
			for (int a = 0; a < readyProductCodes.size(); a++) {
				if (quantities.get(a) != 0) {
					// 수량 등록 된 상태
					oid.setProductCode(readyProductCodes.get(a));
					oid.setFinalPrice(finalPrices.get(a));
					oid.setQuantity(quantities.get(a));
					oid.setSum(sums.get(a));
					mapper.insertOrderItem(orderId, oid);
					
				} else {
					// 수량 등록 안된 상태
					oid.setProductCode(readyProductCodes.get(a));
					oid.setFinalPrice(finalPrices.get(a));
					oid.setQuantity(0);
					oid.setSum(0);
					mapper.insertOrderItem(orderId, oid);
					
				}
			}

		}
		long endTime = System.currentTimeMillis();
		
		System.out.println(endTime);
		System.out.println(endTime - startTime);
	}

	public int deleteOrder(Map<String, String> data) {
		String productCode = data.get("productCode");
		String orderId = data.get("orderId");
		return mapper.deleteOrderItem(productCode, orderId);

	}

}

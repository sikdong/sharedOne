package com.sharedOne.service.order;

import java.util.ArrayList;
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

	public List<ProductDto> searchProduct(String allProductInfo, String tableBuyerCode) {
		// TODO Auto-generated method stub
		allProductInfo = "%" + allProductInfo + "%";
		return mapper.searchProduct(allProductInfo, tableBuyerCode);
	}


	public List<YdsProductDto> addTempProductOrder(Map<String, Object> data) {
		// TODO Auto-generated method stub
		/* YdsProductDto yds = mapper.addTempProductOrder(data); */
		List<String> productCodes = (List<String>) data.get("productCodes");
		String buyerCode = (String) data.get("buyerCode");
		List<YdsProductDto> ypd = new ArrayList<>();
		
		for(String productCode : productCodes ) {
			 ypd.add(mapper.addTempProductOrder(productCode, buyerCode));
			}
		return ypd;
		
		
	}


	public void insertOrder(YdsOrderDto yod) {
		OrderHeaderDto ohd = new OrderHeaderDto();
		  OrderItemDto oid = new OrderItemDto();
		  ohd.setWriter(yod.getWriter());
		  ohd.setBuyerCode(yod.getBuyerCode());
		  ohd.setDeliveryDate(yod.getDeliveryDate());
		  ohd.setMessage(yod.getMessage());
		  ohd.setStatus(yod.getStatus());
		  mapper.insertOrderHeader(ohd);
		  int generatedId = ohd.getOrderId();
		  String date = mapper.getDate(generatedId);
		  String year = date.substring(0, 4);
		  System.out.println(year);
		  mapper.createOrderCode(generatedId, year);
		  List<String> productCodes = yod.getProductCode();
		  System.out.println("코드는" + productCodes);
		  List<Integer> quantities = yod.getQuantity();
		  List<Integer> finalPrices = yod.getFinalPrice();
		  List<Integer> sums = yod.getSum();
		  for(int i = 0; i < productCodes.size(); i++) {
			  oid.setProductCode(productCodes.get(i));
			  oid.setFinalPrice(finalPrices.get(i));
			  oid.setQuantity(quantities.get(i));
			  oid.setSum(sums.get(i));
			  System.out.println("오더 목록 " + i + "번째는" +oid);
			  mapper.insertOrderItem(generatedId,oid);
		  }
		  
		  
		  
		  
	}

	public YdsOrderDto modifyOrder(int orderId) {
		// TODO Auto-generated method stub
		return mapper.modifyOrder(orderId);
	}

	
}

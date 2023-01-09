package com.sharedOne.service.order;

import java.util.ArrayList;
import java.util.List;

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

	public List<ProductDto> searchProduct(String allproductInfo, String tableBuyerCode) {
		// TODO Auto-generated method stub
		allproductInfo = "%" + allproductInfo + "%";
		return mapper.searchProduct(allproductInfo, tableBuyerCode);
	}


	public YdsProductDto addTempProductOrder(YdsProductDto ypd) {
		// TODO Auto-generated method stub
		YdsProductDto yds = mapper.addTempProductOrder(ypd);
		yds.setQuantity(ypd.getQuantity());
		yds.setSalePrice(ypd.getSalePrice());
		int vat = ypd.getSalePrice()/10;
		yds.setVat(vat);
		int sum = ypd.getSalePrice()*ypd.getQuantity();
		yds.setSum(sum);
		return yds;
		
	}


	public void insertOrder(YdsOrderDto yod) {
		OrderHeaderDto ohd = new OrderHeaderDto();
		  OrderItemDto oid = new OrderItemDto();
	
		  ohd.setBuyerCode(yod.getBuyerCode());
		  ohd.setDeliveryDate(yod.getDeliveryDate());
		  ohd.setMessage(yod.getMessage());
		  System.out.println("service에서의 " + ohd);
		  mapper.insertOrderHeader(ohd);
		  
		  List<String> productCodes = yod.getProductCode();
		  System.out.println("코드는" + productCodes);
		  List<Integer> quantities = yod.getQuantity();
		  List<Integer> salePrices = yod.getSalePrice();
		  for(int i = 0; i < productCodes.size(); i++) {
			  oid.setProductCode(productCodes.get(i));
			  oid.setSalePrice(salePrices.get(i));
			  oid.setQuantity(quantities.get(i));
			  System.out.println("오더 목록 " + i + "번째는" +oid);
			  mapper.insertOrderItem(oid);
		  }
		  
		  
		  
		  
	}
	
	
}

package com.sharedOne.service.order;

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

	public List<ProductDto> searchProduct(String allproductInfo) {
		// TODO Auto-generated method stub
		allproductInfo = "%" + allproductInfo + "%";
		return mapper.searchProduct(allproductInfo);
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
	}
	
	
}

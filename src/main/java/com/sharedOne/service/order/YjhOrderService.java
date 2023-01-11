package com.sharedOne.service.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.order.YjhOrderItemDto;
import com.sharedOne.domain.order.sumValueDto;
import com.sharedOne.mapper.order.YjhOrderMapper;

@Transactional
@Service
public class YjhOrderService {
	
	@Autowired
	private YjhOrderMapper mapper;
	
	public OrderHeaderDto getOrderSheetHead(int orderId){
		
		return mapper.selectOrderSheetHead(orderId);
	}
	
	public BuyerDto getOrderSheetBuyer(int orderId){
		
		return mapper.selectOrderSheetBuyer(orderId);
	}
	
	public List<YjhOrderItemDto> getOrderSheetItem(int orderId){
		 
		int price = 0;
		int quantity = 0;
		int total = 0;
		for(int i = 0; i < mapper.selectOrderItem(orderId).size(); i++) {
			price += mapper.selectOrderItem(orderId).get(i).getFinalPrice();
			quantity += mapper.selectOrderItem(orderId).get(i).getQuantity();
			total += mapper.selectOrderItem(orderId).get(i).getSum();
		}
		
		return mapper.selectOrderItem(orderId);
	}
	
	public sumValueDto getSumValue(int orderId) {
		sumValueDto sum = new sumValueDto() ;

		int price = 0;
		int quantity = 0;
		int total = 0;
		for(int i = 0; i < mapper.selectOrderItem(orderId).size(); i++) {
			price += mapper.selectOrderItem(orderId).get(i).getFinalPrice();
			quantity += mapper.selectOrderItem(orderId).get(i).getQuantity();
			total += mapper.selectOrderItem(orderId).get(i).getSum();
		}
		sum.setPriceSum(price);
		sum.setQuantitySum(quantity);
		sum.setSumTotal(total);
		
		return sum;
	}

	public int setApproval(String comment, int orderId) {
		
		return mapper.setApproval(orderId, comment);
	}

	public int setCompanion(String comment, int orderId) {

		return mapper.setCompanion(orderId, comment);
	}

	public int setClosing(int orderId) {

		return mapper.setClosing(orderId);
	}
}

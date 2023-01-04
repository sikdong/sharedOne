package com.sharedOne.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.mapper.order.OrderMapper;

@Service
public class OrderService {

	@Autowired
	private OrderMapper orderMapper;

	public List <OrderHeaderDto> selectOrderHeaderList() {
		return orderMapper.selectOrderHeaderList();
		
	}

	public List<OrderItemDto> selectOrderItemListByOrderCode(String orderCode) {
		return orderMapper.selectOrderItemListByOrderCode(orderCode);
	}
	
	
}

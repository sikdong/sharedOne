package com.sharedOne.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.mapper.order.AsjOrderMapper;

@Service
public class AsjOrderService {

	@Autowired
	private AsjOrderMapper asjOrderMapper;

	public List <OrderHeaderDto> selectOrderHeaderList(String keyword, String buyerCode, String orderCode, String writer, String status) {
		
		keyword = "%"+keyword+"%";
		
		return asjOrderMapper.selectOrderHeaderList(keyword,buyerCode,orderCode,writer,status);
	}

	public List<OrderItemDto> selectOrderItemListByOrderCode(String orderCode) {
		System.out.println("$$$orderCode :" + orderCode);
		return asjOrderMapper.selectOrderItemListByOrderCode(orderCode);
	}
	
	
}

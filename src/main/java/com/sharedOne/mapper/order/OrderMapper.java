package com.sharedOne.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;

@Mapper
public interface OrderMapper {

	List<OrderHeaderDto> selectOrderHeaderList();

	List<OrderItemDto> selectOrderItemListByOrderCode(String orderCode);

}

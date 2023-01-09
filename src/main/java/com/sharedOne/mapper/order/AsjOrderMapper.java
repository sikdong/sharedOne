package com.sharedOne.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;

@Mapper
public interface AsjOrderMapper {

	List<OrderHeaderDto> selectOrderHeaderList(String keyword, String buyerCode, String orderCode, String writer, String status);

	List<OrderItemDto> selectOrderItemListByOrderCode(String orderCode);

}

package com.sharedOne.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.order.YjhOrderItemDto;
import com.sharedOne.domain.order.sumValueDto;

@Mapper
public interface YjhOrderMapper {
	
	OrderHeaderDto selectOrderSheetHead(int orderId);
	
	BuyerDto selectOrderSheetBuyer(int orderId);
	
	List<YjhOrderItemDto> selectOrderItem (int orderId);
	
	sumValueDto sum(int orderId);

	int setApproval(int orderId,String comment);

	int setCompanion(int orderId, String comment);

	int setClosing(int orderId);
}

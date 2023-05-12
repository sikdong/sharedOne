package com.sharedOne.mapper.master;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharedOne.domain.master.BuyerDto;

@Mapper
public interface lnhBuyerMapper {

	List<BuyerDto> selectBuyerList();

	int register(BuyerDto buyer);

	BuyerDto get(String buyerCode);

	void update(BuyerDto buyer);

	void delete(String buyerCode);
	
	BuyerDto selectByBuyerCode(String buyerCode);

	BuyerDto selectByBusinessNumber(String businessNumber);

	List<BuyerDto> searchBuyerList(String keyword, String buyerCode, String buyerName, String country);

	void deleteSalePrice(String buyerCode);

	void deleteOrder(String buyerCode);

}

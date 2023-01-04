package com.sharedOne.mapper.master;

import java.util.List;

import com.sharedOne.domain.master.BuyerDto;

public interface lnhBuyerMapper {

	List<BuyerDto> selectBuyerList();

	int register(BuyerDto buyer);

	BuyerDto get(String buyerCode);

	void update(BuyerDto buyer);

	void delete(String buyerCode);
}

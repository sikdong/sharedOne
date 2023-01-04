package com.sharedOne.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.SalePriceDto;
import com.sharedOne.mapper.master.SalePriceMapper;

@Service
public class SalePriceService {
	
	@Autowired
	private SalePriceMapper salePriceMapper;
	
	public List<BuyerDto> selectSalePriceHeaderList() {
		return salePriceMapper.selectSalePriceHeaderList();
	}

	public List<SalePriceDto> selectSalePriceItemList(String buyerCode) {
		return salePriceMapper.selectSalePriceItemList(buyerCode);
	}

}

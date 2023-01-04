package com.sharedOne.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.SalePriceDto;
import com.sharedOne.mapper.master.AsjSalePriceMapper;

@Service
public class AsjSalePriceService {
	
	@Autowired
	private AsjSalePriceMapper asjSalePriceMapper;
	
	public List<BuyerDto> selectSalePriceHeaderList() {
		return asjSalePriceMapper.selectSalePriceHeaderList();
	}

	public List<SalePriceDto> selectSalePriceItemList(String buyerCode) {
		return asjSalePriceMapper.selectSalePriceItemList(buyerCode);
	}

}

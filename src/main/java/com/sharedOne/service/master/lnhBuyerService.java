package com.sharedOne.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.mapper.master.lnhBuyerMapper;

public class lnhBuyerService {
	@Autowired
	private lnhBuyerMapper buyerMapper;

	public List<BuyerDto> selectBuyerList() {
		return buyerMapper.selectBuyerList();
		
	}
	//바이어 등록
	public int register(BuyerDto buyer) {
		return buyerMapper.register(buyer);
		
	}
	
	//수정 시, 바이어내용 가져오기
	public BuyerDto get(String buyerCode) {
		return buyerMapper.get(buyerCode);
	}
	//수정
	public void update(BuyerDto buyer) {
		buyerMapper.update(buyer);
	}
	//삭제
	public void remove(String buyerCode) {
		buyerMapper.delete(buyerCode);
	}

}

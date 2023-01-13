package com.sharedOne.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.mapper.master.lnhBuyerMapper;

@Service
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
		System.out.println("서비스: " + buyer);
	}
	//삭제
	public void remove(String buyerCode) {
		buyerMapper.delete(buyerCode);
	}

	//중복확인
	public BuyerDto getByBusinessNumber(String businessNumber) {
		return buyerMapper.selectByBusinessNumber(businessNumber);
	}
	public BuyerDto getByBuyerCode(String buyerCode) {
		return buyerMapper.selectByBuyerCode(buyerCode);
	}
	public List<BuyerDto> searchBuyerList(String keyword, String buyerCode, String buyerName, String country) {
		
		keyword = "%" + keyword + "%";
		
		return buyerMapper.searchBuyerList(keyword, buyerCode, buyerName, country);
	}

}

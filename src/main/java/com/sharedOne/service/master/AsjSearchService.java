package com.sharedOne.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.master.SearchBuyerDto;
import com.sharedOne.mapper.master.AsjSearchMapper;

@Service
public class AsjSearchService {

	@Autowired
	AsjSearchMapper searchMapper;
	
	public int countBuyerAll() {
		
		return searchMapper.countBuyerAll();
	}

	public int countBuyer(String keyword) {
		keyword = "%"+keyword+"%";
		return searchMapper.countBuyer(keyword);
	}

	public List<SearchBuyerDto> searchBuyerList(String keyword) {
		keyword = "%"+keyword+"%";
		return searchMapper.searchBuyerList(keyword);
	}

	public List<SearchBuyerDto> addBuyerList(String keyword, int lastId) {
		keyword = "%"+keyword+"%";
		return searchMapper.addBuyerList(keyword, lastId);
	}

}

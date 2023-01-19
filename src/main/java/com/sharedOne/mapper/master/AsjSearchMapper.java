package com.sharedOne.mapper.master;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharedOne.domain.master.SearchBuyerDto;

@Mapper
public interface AsjSearchMapper {

	int countBuyerAll();

	int countBuyer(String keyword);

	List<SearchBuyerDto> searchBuyerList(String keyword);

	List<SearchBuyerDto> addBuyerList(String keyword, int lastId);

}

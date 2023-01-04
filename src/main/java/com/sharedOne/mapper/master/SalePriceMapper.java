package com.sharedOne.mapper.master;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.master.SalePriceDto;

@Mapper
public interface SalePriceMapper {

	List<BuyerDto> selectSalePriceHeaderList();

	List<SalePriceDto> selectSalePriceItemList(String buyerCode);

}

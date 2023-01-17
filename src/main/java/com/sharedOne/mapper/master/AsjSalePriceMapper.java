package com.sharedOne.mapper.master;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharedOne.domain.master.SalePriceDto;

@Mapper
public interface AsjSalePriceMapper {
	
	List<SalePriceDto> selectAllSalePriceItemList(String keyword, String productCode, String productName, String buyerCode, String buyerName, String country, int priceMin, int priceMax, String fromDate, String endDate);

	SalePriceDto selectSaleByPriceId(int priceId);

	int updateSalePriceByPriceId(int priceId, int salePrice, int discountRate, String fromDate, String endDate);

	int selectPriceByProductCode(String productCode);

	int register(SalePriceDto sale);

	List<SalePriceDto> selectDateListByBuyerCodeAndProductCode(String buyerCode, String productCode);

	List<SalePriceDto> selectSalePriceListAll();



}

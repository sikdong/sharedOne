package com.sharedOne.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sharedOne.domain.master.SalePriceDto;
import com.sharedOne.mapper.master.AsjSalePriceMapper;

@Service
public class AsjSalePriceService {
	
	@Autowired
	private AsjSalePriceMapper asjSalePriceMapper;

	public List<SalePriceDto> selectAllSalePriceItemList(String keyword ,String productCode, String productName, String buyerCode, String buyerName, String country, int priceMin, int priceMax, String fromDate, String endDate) {
		
		keyword = "%"+keyword+"%";
		productCode = "%"+productCode+"%"; 
		productName = "%"+productName+"%";
		buyerCode = "%"+buyerCode+"%";
		buyerName = "%"+buyerName+"%";
		country = "%"+country+"%";
		
		return asjSalePriceMapper.selectAllSalePriceItemList(keyword, productCode, productName, buyerCode, buyerName, country, priceMin, priceMax, fromDate, endDate);
	}

	public SalePriceDto selectSaleByPriceId(int priceId) {
		
		return asjSalePriceMapper.selectSaleByPriceId(priceId);
		
	}

	public int updateSalePriceByPriceId(SalePriceDto saleInfo) {
		
		int priceId = saleInfo.getPriceId();
		int salePrice = saleInfo.getSalePrice();
		int discountRate = saleInfo.getDiscountRate();
		
		String fromDate = saleInfo.getFromDate();
		String endDate = saleInfo.getEndDate();
		
		int cnt = asjSalePriceMapper.updateSalePriceByPriceId(priceId, salePrice, discountRate, fromDate, endDate);
		
		return cnt;
	}

	public int selectPriceByProductCode(String productCode) {
		return asjSalePriceMapper.selectPriceByProductCode(productCode);
		
	}

	public List<SalePriceDto> selectDateListByBuyerCodeAndProductCode(String buyerCode, String productCode) {
		return asjSalePriceMapper.selectDateListByBuyerCodeAndProductCode(buyerCode, productCode);
		
	}

	public int register(SalePriceDto sale) {
		return asjSalePriceMapper.register(sale);
		
	}

	public List<SalePriceDto> selectSalePriceListAll() {
		
		return asjSalePriceMapper.selectSalePriceListAll();
	}


	public int deleteSalePriceInfoByPriceId(int priceId) {
		return asjSalePriceMapper.deleteSalePriceInfoByPriceId(priceId);
		
	}

}

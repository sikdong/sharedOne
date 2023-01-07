package com.sharedOne.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.mapper.master.lnhProductMapper;

@Service
public class lnhProductService {

	@Autowired
	private lnhProductMapper productMapper;
	
	public List <ProductDto> selectProductList() {
		return productMapper.selectProductList();
		
	}
	
	//제품 등록
	public int register(ProductDto product) {
		return productMapper.register(product);
		
	}
	
	//수정 시, 제품내용 가져오기
	public ProductDto get(String productCode) {
		return productMapper.get(productCode);
	}
	//수정
	public void update(ProductDto product) {
		productMapper.update(product);
	}
	
	public ProductDto getByProductName(String productName) {
		return productMapper.selectProductName(productName);
	}
	//삭제
	public void remove(String productCode) {
		productMapper.delete(productCode);
	}


	

}

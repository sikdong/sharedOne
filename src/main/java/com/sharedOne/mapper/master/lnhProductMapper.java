package com.sharedOne.mapper.master;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.order.OrderHeaderDto;

@Mapper
public interface lnhProductMapper {
	
	List <ProductDto> searchProductList(String keyword); 

	List <ProductDto> selectProductList();

	int register(ProductDto product);

	ProductDto get(String productCode);

	void delete(String productCode);

	void update(ProductDto product);

	ProductDto selectProductName(String productName);


}

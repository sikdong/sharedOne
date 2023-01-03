package com.sharedOne.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharedOne.domain.product.ProductDto;

@Mapper
public interface ProductMapper {

	List <ProductDto> selectProductList();

}

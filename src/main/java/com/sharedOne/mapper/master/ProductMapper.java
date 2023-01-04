package com.sharedOne.mapper.master;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharedOne.domain.master.ProductDto;

@Mapper
public interface ProductMapper {

	List <ProductDto> selectProductList();

}

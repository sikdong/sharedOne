package com.sharedOne.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import com.sharedOne.domain.Buyer;

@Component
public interface OrderMapper {

	List<Buyer> searchBuyer();
	
}

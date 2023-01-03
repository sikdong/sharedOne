package com.sharedOne.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.Buyer;
import com.sharedOne.mapper.OrderMapper;


@Service
public class OrderService {
	
	@Autowired(required = true)
	private OrderMapper mapper;

	public List<Buyer> searchBuyer() {
		// TODO Auto-generated method stub
		return mapper.searchBuyer();
	}
	
	
}

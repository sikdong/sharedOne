package com.sharedOne.domain.master;

import lombok.Data;

@Data
public class SearchPageDto {
	
	private int page;
	private int startRowNum;
	private int endRowNum;
	
	private int rowCount;
}

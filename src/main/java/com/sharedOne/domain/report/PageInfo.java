package com.sharedOne.domain.report;

import lombok.Data;

@Data
public class PageInfo {
	
	private int currentPageNumber;
	private int lastPageNumber;
	private int leftPageNumber;
	private int rightPageNumber;
	
}

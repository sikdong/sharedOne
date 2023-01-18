package com.sharedOne.domain.master;

import lombok.Data;
@Data
public class SearchProductDto {
		
		private String productCode;
		private String productName;
		private String productType;
		
		private int countProduct;
		
		private int productId;

}

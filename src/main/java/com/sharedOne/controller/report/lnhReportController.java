package com.sharedOne.controller.report;

import java.io.IOException;
import java.util.ArrayList;
/*import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;*/
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.master.SalePriceDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.service.master.lnhProductService;
import com.sharedOne.service.report.lnhReportService;

@Controller
@RequestMapping("report")
public class lnhReportController {
	@Autowired
	private lnhProductService productService;
	
	@Autowired
	private lnhReportService service;
	
	
	@GetMapping("monthlyReport")
	public void getMontlyReport(@RequestParam(name = "orderQ", defaultValue = "") String orderQ, Model model) {
		System.out.println(orderQ);
		
		List <ProductDto> productList = productService.selectProductList();
		
		Set <String> setTypes = new HashSet<>();
		for( ProductDto product : productList) {
			setTypes.add(product.getProductType());
		}
		Set <Integer> setSizes = new HashSet<>();
		for( ProductDto product : productList) {
			setSizes.add(product.getSize());
		}
		
		model.addAttribute("types", setTypes);
		model.addAttribute("sizes", setSizes);
		
		model.addAttribute("productList", productList);
		
		// business logic 작동
		List<OrderHeaderDto> orderList = service.orderList(orderQ);
		
		  List<OrderItemDto> itemList = new ArrayList<>(); List<SalePriceDto> salePrice
		  = new ArrayList<>(); for (int i = 0; i < orderList.size(); i++) {
		  
		  if(orderList.get(i).getOrderItem()!= null) { for (int j = 0;
		  j<orderList.get(i).getOrderItem().size(); j++) {
		  itemList.add(orderList.get(i).getOrderItem().get(j)); } }
		  
		  if(orderList.get(i).getItemPrice()!= null) { for (int j = 0; j <
		  orderList.get(i).getItemPrice().size(); j++) {
		  salePrice.add(orderList.get(i).getItemPrice().get(j)); } } }
		 
		
		
/*
 * List<OrderItemDto> itemList = orderList.get(0).getOrderItem();
 * List<SalePriceDto> salePrice = orderList.get(0).getItemPrice();
 */
		  
		  //order_header 안에 있는 List<OrderItemDto>랑 List<SalePriceDto>를 어떻게 꺼내서 전달해야될지 고민...
		  //검색에 따라 결과가 여러개가 나오면서 중복으로 여러개로 모델에 담겨 보내지거나 없으면 결과가 안나옴...
		  //일단 오더 데이터 값이 좀 제대로 되어 있어야 할 필요가 있음
		 
		
		System.out.println("컨트롤러: " + orderList);
		System.out.println(itemList);
		System.out.println(salePrice);
		// add attribute
		model.addAttribute("orderList", orderList); // c:forEach items = orderList
		model.addAttribute("itemList",itemList);
		model.addAttribute("salePrice",salePrice);
	}
	
	//엑셀 파일 css 서식
	/*
	 * private void setHeaderCS(CellStyle cs, Font font, Cell cell) {
	 * cs.setAlignment(CellStyle.ALIGN_CENTER);
	 * cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
	 * cs.setBorderTop(CellStyle.BORDER_THIN);
	 * cs.setBorderBottom(CellStyle.BORDER_THIN);
	 * cs.setBorderLeft(CellStyle.BORDER_THIN);
	 * cs.setBorderRight(CellStyle.BORDER_THIN);
	 * cs.setFillForegroundColor(HSSFColor.LIGHT_BLUE.index);
	 * cs.setFillPattern(CellStyle.SOLID_FOREGROUND); setHeaderFont(font, cell);
	 * cs.setFont(font); cell.setCellStyle(cs); }
	 * 
	 * private void setHeaderFont(Font font, Cell cell) { font.setBoldweight((short)
	 * 700); font.setColor(HSSFColor.WHITE.index); }
	 * 
	 * private void setCmmnCS2(CellStyle cs, Cell cell) {
	 * cs.setAlignment(CellStyle.ALIGN_LEFT);
	 * cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
	 * cs.setBorderTop(CellStyle.BORDER_THIN);
	 * cs.setBorderBottom(CellStyle.BORDER_THIN);
	 * cs.setBorderLeft(CellStyle.BORDER_THIN);
	 * cs.setBorderRight(CellStyle.BORDER_THIN); cell.setCellStyle(cs); }
	 */
	
	//엑셀 다운로드
	@RequestMapping("excelDown.do")
	@ResponseBody
	public void excelDown(HttpServletResponse response,	@RequestParam(name="items")String items) throws IOException {

	
	}

}
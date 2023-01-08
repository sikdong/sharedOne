package com.sharedOne.controller.report;

import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.util.HashSet;
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
		
		/*
		 * List<OrderItemDto> itemList = new ArrayList<>(); List<SalePriceDto> salePrice
		 * = new ArrayList<>(); for (int i = 0; i < orderList.size(); i++) {
		 * 
		 * if(orderList.get(i).getOrderItem()!= null) { for (int j = 0;
		 * j<orderList.get(i).getOrderItem().size(); j++) {
		 * itemList.add(orderList.get(i).getOrderItem().get(j)); } }
		 * 
		 * if(orderList.get(i).getItemPrice()!= null) { for (int j = 0; j <
		 * orderList.get(i).getItemPrice().size(); j++) {
		 * salePrice.add(orderList.get(i).getItemPrice().get(j)); } } }
		 */
		 
		
		

		List<OrderItemDto> itemList = orderList.get(0).getOrderItem();
		List<SalePriceDto> salePrice = orderList.get(0).getItemPrice();
 
		  
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
	
	//엑셀 다운로드
	@RequestMapping("excelDown")
	@ResponseBody
	public void excelDown(HttpServletResponse response,	@RequestParam(name = "orderQ", defaultValue = "") String orderQ) throws IOException {
		
		List<OrderHeaderDto> list = service.orderList(orderQ);
		List<OrderItemDto> itemList = list.get(0).getOrderItem();
		List<SalePriceDto> salePrice = list.get(0).getItemPrice();
		
		 try (Workbook workbook = new XSSFWorkbook()) {
			 
			 Sheet sheet = workbook.createSheet("레포트");
			 int rowNo = 0;
			 
			 CellStyle headStyle = workbook.createCellStyle();
	            headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.LIGHT_BLUE.getIndex());
	            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	            Font font = workbook.createFont();
	            font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex());
	            font.setFontHeightInPoints((short) 13);
	            headStyle.setFont(font);
			 
				Row headerRow = sheet.createRow(rowNo++);
				headerRow.createCell(0).setCellValue("주문서 ID");
				headerRow.createCell(1).setCellValue("바이어코드");
				headerRow.createCell(2).setCellValue("제품코드");
				headerRow.createCell(3).setCellValue("단가");
				headerRow.createCell(4).setCellValue("수량");
				headerRow.createCell(5).setCellValue("합계");
				headerRow.createCell(6).setCellValue("등록일");
				headerRow.createCell(7).setCellValue("수정일");
				headerRow.createCell(8).setCellValue("납기일");
				headerRow.createCell(9).setCellValue("담당자");
				headerRow.createCell(10).setCellValue("상태");
				headerRow.createCell(11).setCellValue("메세지");
			 
			 for(int i=0; i<=11; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }
			 
			 
			 for (OrderHeaderDto board : list) {
				 Row row = sheet.createRow(rowNo++);
				 row.createCell(0).setCellValue(board.getOrderCode());
				 row.createCell(1).setCellValue(board.getBuyerCode());
				 row.createCell(6).setCellValue(board.getInserted());
				 row.createCell(7).setCellValue(board.getModified());
				 row.createCell(8).setCellValue(board.getDeliveryDate());
				 row.createCell(9).setCellValue(board.getWriter());
				 row.createCell(10).setCellValue(board.getStatus());
				 row.createCell(11).setCellValue(board.getMessage());
				 
				 for (OrderItemDto board1 : itemList) {
					 row.createCell(2).setCellValue(board1.getProductCode());
					 row.createCell(4).setCellValue(board1.getQuantity());
					 row.createCell(5).setCellValue(board1.getSum()); 
				 }
				 
				 for (SalePriceDto board1 : salePrice) {
					 row.createCell(3).setCellValue(board1.getSalePrice());
					 
				 }
				 
				}
			 
			 
			 
			 response.setContentType("ms-vnd/excel");
			 response.setHeader("Content-Disposition", "attachment;filename=report.xls");
			 
			 workbook.write(response.getOutputStream());
			 workbook.close();
			 

			}

		}

}
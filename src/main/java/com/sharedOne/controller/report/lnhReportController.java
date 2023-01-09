package com.sharedOne.controller.report;

import java.io.IOException;
/*import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;*/
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
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.report.PageInfo;
import com.sharedOne.service.master.lnhProductService;
import com.sharedOne.service.report.HmsReportService;

@Controller
@RequestMapping("report")
public class lnhReportController {
	
	@Autowired
	private lnhProductService productService;
	
	@Autowired
	private HmsReportService service;
	
	@GetMapping("monthlyReport")
	public void getMontlyReport(Model model,
			@RequestParam(name = "page", defaultValue = "1") int page, 
			PageInfo pageInfo, // 페이지네이션
			@RequestParam(name = "orderS", defaultValue = "") String orderS,  // 전체검색 조건
			@RequestParam(name = "orderQ", defaultValue = "") String orderQ, // orderQ 전체검색 Attribute
			@RequestParam(value = "searchStartDate", required = false) String searchStartDate, // 기간 설정(시작)
            @RequestParam(value = "searchEndDate", required = false) String searchEndDate, // 기간 설정(끝)
			@RequestParam(name = "productS", defaultValue = "") String productS, // 전체검색 조건
			@RequestParam(name = "productQ", defaultValue = "") String productQ // productQ 전체검색 Attribute
			) {
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
		List<OrderHeaderDto> orderList = service.orderList(page, searchStartDate, searchEndDate, orderS, orderQ, pageInfo); // page = "파라미터 수집
		List<ProductDto> productCatalog = service.productCatalog(productS, productQ); // 
		
		// add attribute    
		model.addAttribute("orderList", orderList); // c:forEach items = orderList
		model.addAttribute("productCatalog", productCatalog); // c:forEach items = productCatalog
		
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
package com.sharedOne.controller.report;

import java.io.IOException;
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
import com.sharedOne.service.master.lnhProductService;

@Controller
@RequestMapping("report")
public class lnhReportController {
	@Autowired
	private lnhProductService productService;
	
	
	@GetMapping("monthlyReport")
	public void getMontlyReport(Model model) {
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
	}
	
/*	//엑셀 파일 css 서식
	private void setHeaderCS(CellStyle cs, Font font, Cell cell) {
		  cs.setAlignment(CellStyle.ALIGN_CENTER);
		  cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		  cs.setBorderTop(CellStyle.BORDER_THIN);
		  cs.setBorderBottom(CellStyle.BORDER_THIN);
		  cs.setBorderLeft(CellStyle.BORDER_THIN);
		  cs.setBorderRight(CellStyle.BORDER_THIN);
		  cs.setFillForegroundColor(HSSFColor.LIGHT_BLUE.index);
		  cs.setFillPattern(CellStyle.SOLID_FOREGROUND);
		  setHeaderFont(font, cell);
		  cs.setFont(font);
		  cell.setCellStyle(cs);
		}
		 
		private void setHeaderFont(Font font, Cell cell) {
		  font.setBoldweight((short) 700);
		  font.setColor(HSSFColor.WHITE.index);
		}
		 
		private void setCmmnCS2(CellStyle cs, Cell cell) {
		  cs.setAlignment(CellStyle.ALIGN_LEFT);
		  cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		  cs.setBorderTop(CellStyle.BORDER_THIN);
		  cs.setBorderBottom(CellStyle.BORDER_THIN);
		  cs.setBorderLeft(CellStyle.BORDER_THIN);
		  cs.setBorderRight(CellStyle.BORDER_THIN);
		  cell.setCellStyle(cs);
		}
	
	//엑셀 다운로드
	@RequestMapping("excelDown.do")
	@ResponseBody
	public void excelDown(HttpServletResponse response,	@RequestParam(name="items")String items) throws IOException {
*/
	
	}


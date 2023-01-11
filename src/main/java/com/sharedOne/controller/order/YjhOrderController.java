package com.sharedOne.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.order.YjhOrderItemDto;
import com.sharedOne.domain.order.sumValueDto;
import com.sharedOne.service.order.YjhOrderService;

@Controller
@RequestMapping("order")
public class YjhOrderController {
	
	@Autowired
	YjhOrderService service;
	
	@GetMapping("orderSheet")
	@PreAuthorize("isAuthenticated()")
	public void getOrderSheet(Model model, int orderId) {
		
		OrderHeaderDto orderHeader = service.getOrderSheetHead(orderId);
		model.addAttribute("orderHeader", orderHeader);

		List<YjhOrderItemDto> orderItem = service.getOrderSheetItem(orderId);
		model.addAttribute("orderItem", orderItem);

		BuyerDto buyerInfo = service.getOrderSheetBuyer(orderId);
		model.addAttribute("buyer", buyerInfo);
		
		sumValueDto sumValue = service.getSumValue(orderId);
		model.addAttribute("sumValue",sumValue );
	}
	@GetMapping("confirmOrderSheet")
	@PreAuthorize("hasAuthority('팀장')")
	public void getConfirmOrderSheet(Model model, int orderId) {
		
		OrderHeaderDto orderHeader = service.getOrderSheetHead(orderId);
		model.addAttribute("orderHeader", orderHeader);

		List<YjhOrderItemDto> orderItem = service.getOrderSheetItem(orderId);
		model.addAttribute("orderItem", orderItem);

		BuyerDto buyerInfo = service.getOrderSheetBuyer(orderId);
		model.addAttribute("buyer", buyerInfo);
		
		sumValueDto sumValue = service.getSumValue(orderId);
		model.addAttribute("sumValue",sumValue );
	}
	
	@PostMapping("confirmOrderSheet")
	public String setApproval(RedirectAttributes rttr,String comment,int orderId, String status) {
		
		if(status.equals("승인")) {
			int approval = service.setApproval(comment, orderId);
			
			return "redirect:/order/orderSheet/?orderId=" + orderId;
		}
		
		if(status.equals("반려")) {
			int companion = service.setCompanion(comment, orderId);
			
			return "redirect:/order/orderSheet/?orderId=" + orderId;
		}
		
		return "redirect:/order/orderSheet/?orderId=" + orderId;
	}
	
	@GetMapping("companionSheet")
	@PreAuthorize("hasAuthority('팀장','차장') or (authentication.name == #writer)")
	public void getCompanionSheet(Model model,int orderId,String writer) {
		
		OrderHeaderDto orderHeader = service.getOrderSheetHead(orderId);
		model.addAttribute("orderHeader", orderHeader);

		List<YjhOrderItemDto> orderItem = service.getOrderSheetItem(orderId);
		model.addAttribute("orderItem", orderItem);

		BuyerDto buyerInfo = service.getOrderSheetBuyer(orderId);
		model.addAttribute("buyer", buyerInfo);
		
		sumValueDto sumValue = service.getSumValue(orderId);
		model.addAttribute("sumValue",sumValue );
		
	}
	
	@PostMapping("companionSheet")
	public String setClosing(RedirectAttributes rttr,int orderId, String status) {
		
		if(status.equals("종결")) {
			int closing = service.setClosing(orderId);
			
			return "redirect:/order/companionSheet/?orderId=" + orderId;
		}
		
		return "redirect:/order/companionSheet/?orderId=" + orderId;
	}
	
	
	  @RequestMapping("excelConvert")
	  @ResponseBody
	  public void excelConvert(HttpServletResponse hsr, @RequestParam(name="orderId", defaultValue = "") int orderId) throws IOException {
		  	OrderHeaderDto orderHeader = service.getOrderSheetHead(orderId);			

			List<YjhOrderItemDto> orderItem = service.getOrderSheetItem(orderId);
	
			BuyerDto buyerInfo = service.getOrderSheetBuyer(orderId);
					
			sumValueDto sumValue = service.getSumValue(orderId);
			
			Workbook workbook = new XSSFWorkbook();
				
				Sheet sheet = workbook.createSheet("주문서");
				
				CellStyle headStyle = workbook.createCellStyle();
	            headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.LIGHT_BLUE.getIndex());
	            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	            Font font = workbook.createFont();
	            font.setFontName(HSSFFont.FONT_ARIAL); // 폰트 스타일
	            font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex()); // 폰트 색 지정
	            font.setFontHeightInPoints((short) 13); // 폰트 크기
	            headStyle.setFont(font);
	            
	            //셀병합
				sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 12)); //첫행, 마지막행, 첫열, 마지막열 병합
				sheet.addMergedRegion(new CellRangeAddress(2, 3, 0, 1)); //첫행, 마지막행, 첫열, 마지막열 병합
				sheet.addMergedRegion(new CellRangeAddress(2, 3, 2, 5)); //첫행, 마지막행, 첫열, 마지막열 병합
				sheet.addMergedRegion(new CellRangeAddress(2, 3, 6, 7)); //첫행, 마지막행, 첫열, 마지막열 병합
				sheet.addMergedRegion(new CellRangeAddress(2, 3, 8, 12)); //첫행, 마지막행, 첫열, 마지막열 병합
				
				//테이블 셀 스타일
				CellStyle cellStyle = workbook.createCellStyle();
				sheet.setColumnWidth(0, (sheet.getColumnWidth(0))+(short)2048); // 0번째 컬럼 넓이 조절
				sheet.setColumnWidth(6, (sheet.getColumnWidth(6))+(short)2048); // 6번째 컬럼 넓이 조절
				sheet.setColumnWidth(7, (sheet.getColumnWidth(7))+(short)2048); // 7번째 컬럼 넓이 조절
				sheet.setColumnWidth(8, (sheet.getColumnWidth(8))+(short)2048); // 8번째 컬럼 넓이 조절
				cellStyle.setAlignment(HorizontalAlignment.CENTER);
				
				Font fontTitle = workbook.createFont();
				fontTitle.setColor(HSSFColor.HSSFColorPredefined.LIGHT_BLUE.getIndex());
				fontTitle.setFontName(HSSFFont.FONT_ARIAL);
				fontTitle.setBold(true);
				fontTitle.setFontHeightInPoints((short)20); // 폰트 크기
				cellStyle.setFont(fontTitle ); // cellStyle에 font를 적용
				
				int rowNo = 0;
			
				// 타이틀 생성
				Row xssfRow = sheet.createRow(rowNo++); // 행 객체 추가
				Cell xssfCell = xssfRow.createCell((short) 0); // 추가한 행에 셀 객체 추가
				xssfCell.setCellStyle(cellStyle); // 셀에 스타일 지정
				xssfCell.setCellValue("주문서"); // 데이터 입력
				
				
				Row OhFirstRow = sheet.createRow(rowNo++);
				OhFirstRow.createCell(0).setCellValue("주문번호");
				OhFirstRow.createCell(2).setCellValue(orderHeader.getOrderCode());
				OhFirstRow.createCell(6).setCellValue("기안자");
				OhFirstRow.createCell(8).setCellValue(orderHeader.getWriter());
				
				Row OhSecondRow = sheet.createRow(rowNo++);
				OhSecondRow.createCell(0).setCellValue("기안일자");
				OhSecondRow.createCell(2).setCellValue(orderHeader.getInserted());
				OhSecondRow.createCell(6).setCellValue("납기요청일");
				OhSecondRow.createCell(8).setCellValue(orderHeader.getDeliveryDate());
				
				Row buyerRow1 = sheet.createRow(rowNo++);
				buyerRow1.createCell(0).setCellValue("바이어");
				buyerRow1.createCell(1).setCellValue(buyerInfo.getBuyerName());
				buyerRow1.createCell(2).setCellValue("대표자");
				buyerRow1.createCell(3).setCellValue(buyerInfo.getManager());
				
				Row buyerRow2 = sheet.createRow(rowNo++);
				buyerRow2.createCell(0).setCellValue("국가");
				buyerRow2.createCell(1).setCellValue(buyerInfo.getCountry());
				buyerRow2.createCell(2).setCellValue("주소");
				buyerRow2.createCell(3).setCellValue(buyerInfo.getAddress());
				
				Row buyerRow3 = sheet.createRow(rowNo++);
				buyerRow3.createCell(0).setCellValue("전화번호");
				buyerRow3.createCell(1).setCellValue(buyerInfo.getPhone());
				buyerRow3.createCell(2).setCellValue("사업자번호");
				buyerRow3.createCell(3).setCellValue(buyerInfo.getBusinessNumber());
				
				Row spaceRow = sheet.createRow(rowNo++);
				spaceRow.createCell(0).setCellValue("상세정보");
				
				Row orderItemHeadRow = sheet.createRow(rowNo++);
				orderItemHeadRow.createCell(0).setCellValue("번호");
				orderItemHeadRow.createCell(1).setCellValue("제품정보");
				orderItemHeadRow.createCell(2).setCellValue("금액정보");
				
				Row orderItemHeadSubRow = sheet.createRow(rowNo++);
				orderItemHeadSubRow.createCell(0).setCellValue("#");
				orderItemHeadSubRow.createCell(1).setCellValue("제품명");
				orderItemHeadSubRow.createCell(2).setCellValue("규격");
				orderItemHeadSubRow.createCell(3).setCellValue("단위");
				orderItemHeadSubRow.createCell(4).setCellValue("판매가");
				orderItemHeadSubRow.createCell(5).setCellValue("수량");
				orderItemHeadSubRow.createCell(6).setCellValue("합계액");
				
				int Num = 1;
				for(YjhOrderItemDto orderSheet : orderItem) {
				
					Row itemRow = sheet.createRow(rowNo++);
					itemRow.createCell(0).setCellValue(Num);
					itemRow.createCell(1).setCellValue(orderSheet.getProductName());
					itemRow.createCell(2).setCellValue(orderSheet.getSize());
					itemRow.createCell(3).setCellValue(orderSheet.getUnit());
					itemRow.createCell(4).setCellValue(orderSheet.getSalePrice());
					itemRow.createCell(5).setCellValue(orderSheet.getQuantity());
					itemRow.createCell(6).setCellValue(orderSheet.getSum());
					Num++;
				}
				
				Row sumRow = sheet.createRow(rowNo++);
				sumRow.createCell(0).setCellValue("총합");
				sumRow.createCell(1).setCellValue(sumValue.getPriceSum());
				sumRow.createCell(2).setCellValue(sumValue.getQuantitySum());
				sumRow.createCell(3).setCellValue(sumValue.getSumTotal());

				
				hsr.setContentType("ms-vnd/excel");
				hsr.setHeader("Content-Disposition", "attachment;filename=orderSheet.xls");
				
				workbook.write(hsr.getOutputStream());
				workbook.close();		
			
	 }
	 
}

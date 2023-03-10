package com.sharedOne.controller.order;

import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
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
	@PreAuthorize("hasAuthority('??????') or (authentication.name == #id)")
	public void getOrderSheet(Model model, int orderId ,String id) {
		
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
	@PreAuthorize("hasAuthority('??????')")
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
	@PreAuthorize("hasAuthority('??????')")
	public String setApproval(RedirectAttributes rttr,String comment,int orderId, String status) {
		
		if(status.equals("??????")) {
			int approval = service.setApproval(comment, orderId);
			
			return "redirect:/order/confirmOk";
		}
		
		if(status.equals("??????")) {
			int companion = service.setCompanion(comment, orderId);
			
			return "redirect:/order/companionOk";
		}
		
		return "redirect:/order/confirmOk";
	}
	
	@GetMapping("companionSheet")
	@PreAuthorize("(authentication.name == #id)")
	public void getCompanionSheet(Model model,int orderId,String id) {
		
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
	@PreAuthorize("(authentication.name == #id)")
	public void setClosing(RedirectAttributes rttr,int orderId, String status, String id) {
		
		if(status.equals("??????")) {
			
			int closing = service.setClosing(orderId);
			
		}
		
	}
	
	@RequestMapping("closing")
	@PreAuthorize("isAuthenticated()")
	public void closing() {
		
	}
	
	@RequestMapping("companionOk")
	@PreAuthorize("isAuthenticated()")
	public void companionOK() {
		
	}
	
	@RequestMapping("confirmOk")
	@PreAuthorize("isAuthenticated()")
	public void confirmOK() {
		
	}
	
	
	  @RequestMapping("excelConvert")
	  @ResponseBody
	  public void excelConvert(HttpServletResponse hsr, @RequestParam(name="orderId", defaultValue = "") int orderId) throws IOException {
		  	OrderHeaderDto orderHeader = service.getOrderSheetHead(orderId);			

			List<YjhOrderItemDto> orderItem = service.getOrderSheetItem(orderId);
	
			BuyerDto buyerInfo = service.getOrderSheetBuyer(orderId);
					
			sumValueDto sumValue = service.getSumValue(orderId);
			
			DecimalFormat df = new DecimalFormat("###,###");
			
			Workbook workbook = new XSSFWorkbook();
				
				Sheet sheet = workbook.createSheet("?????????");
				
				// ????????? head ????????? ??????
				CellStyle headStyle = workbook.createCellStyle();
	            headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.LIGHT_BLUE.getIndex());
	            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	            Font font = workbook.createFont();
	            font.setFontName(HSSFFont.FONT_ARIAL); // ?????? ?????????
	            font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex()); // ?????? ??? ??????
	            font.setFontHeightInPoints((short) 13); // ?????? ??????
	            headStyle.setFont(font);
	            	            
	            //?????? ?????????
				
				sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 6)); //??????, ????????????, ??????, ????????????
				
				//????????? ??? ?????????
				CellStyle cellStyle = workbook.createCellStyle();
				sheet.setColumnWidth(0, (sheet.getColumnWidth(0))+(short)700); // 0?????? ?????? ?????? ??????
				sheet.setColumnWidth(1, (sheet.getColumnWidth(1))+(short)2800); // 1?????? ?????? ?????? ??????
				sheet.setColumnWidth(2, (sheet.getColumnWidth(2))+(short)100); // 2?????? ?????? ?????? ??????
				sheet.setColumnWidth(3, (sheet.getColumnWidth(3))+(short)100); // 3?????? ?????? ?????? ??????
				sheet.setColumnWidth(4, (sheet.getColumnWidth(4))+(short)700); // 4?????? ?????? ?????? ??????
				sheet.setColumnWidth(5, (sheet.getColumnWidth(5))+(short)100); // 5?????? ?????? ?????? ??????
				sheet.setColumnWidth(6, (sheet.getColumnWidth(6))+(short)1500); // 5?????? ?????? ?????? ??????
				cellStyle.setAlignment(HorizontalAlignment.CENTER);
				
				Font fontTitle = workbook.createFont();
				fontTitle.setFontName(HSSFFont.FONT_ARIAL);
				fontTitle.setBold(true);
				fontTitle.setFontHeightInPoints((short)20); // ?????? ??????
				cellStyle.setFont(fontTitle ); // cellStyle??? font??? ??????
				
				Font fontHead = workbook.createFont();
				fontHead.setBold(true);

				// ????????? ?????? title ?????????
				XSSFCellStyle titleStyle = (XSSFCellStyle)workbook.createCellStyle();
	            titleStyle.setFont(fontHead);
	            titleStyle.setAlignment(HorizontalAlignment.RIGHT);
	            titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	            titleStyle.setFillForegroundColor(new XSSFColor(new byte[] {(byte) 172,(byte) 171,(byte) 171}, null));
	            titleStyle.setFillPattern(FillPatternType.FINE_DOTS);
	            //titleStyle.setBorderTop(BorderStyle.THIN);
	            //titleStyle.setBorderBottom(BorderStyle.THIN);
	            //titleStyle.setBorderLeft(BorderStyle.THIN);
	            //titleStyle.setBorderRight(BorderStyle.THIN);
	            
	            XSSFCellStyle valueTitleStyle = (XSSFCellStyle)workbook.createCellStyle();
	            valueTitleStyle.setAlignment(HorizontalAlignment.CENTER);
	            valueTitleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	            valueTitleStyle.setFillForegroundColor(new XSSFColor(new byte[] {(byte) 172,(byte) 171,(byte) 171}, null));
	            valueTitleStyle.setFillPattern(FillPatternType.FINE_DOTS);
	            valueTitleStyle.setFont(fontHead);
	            //valueTitleStyle.setBorderTop(BorderStyle.THIN);
	            //valueTitleStyle.setBorderBottom(BorderStyle.THIN);
	            //valueTitleStyle.setBorderLeft(BorderStyle.THIN);
	            //valueTitleStyle.setBorderRight(BorderStyle.THIN);
	            
	            XSSFCellStyle valueHeadStyle = (XSSFCellStyle)workbook.createCellStyle();
	            valueHeadStyle.setFillForegroundColor(new XSSFColor(new byte[] {(byte) 212,(byte) 211,(byte) 211}, null));
	            valueHeadStyle.setFillPattern(FillPatternType.FINE_DOTS);  	    
	            valueHeadStyle.setAlignment(HorizontalAlignment.CENTER);
	            valueHeadStyle.setFont(fontHead);
	            //valueHeadStyle.setBorderTop(BorderStyle.THIN);
	            //valueHeadStyle.setBorderBottom(BorderStyle.THIN);
	            //valueHeadStyle.setBorderLeft(BorderStyle.THIN);
	            //valueHeadStyle.setBorderRight(BorderStyle.THIN);
	            
	            CellStyle valueStyle = workbook.createCellStyle();
	            valueStyle.setAlignment(HorizontalAlignment.CENTER);
	            //valueStyle.setBorderTop(BorderStyle.THIN);
	            //valueStyle.setBorderBottom(BorderStyle.THIN);
	            //valueStyle.setBorderLeft(BorderStyle.THIN);
	            //valueStyle.setBorderRight(BorderStyle.THIN);
								
				int rowNo = 0;
			
				// ????????? ??????
				
				Row xssfRow = sheet.createRow(rowNo++); // ??? ?????? ?????? 
				Cell xssfCell =  xssfRow.createCell((short) 0); // ????????? ?????? ??? ?????? ??????
				xssfCell.setCellStyle(cellStyle); // ?????? ????????? ?????? 
				xssfCell.setCellValue("?????????");	  // ????????? ??????
				rowNo++;
				 							
				Row OhFirstRow = sheet.createRow(rowNo++);
				OhFirstRow.createCell(0).setCellValue("????????????");
				OhFirstRow.createCell(1).setCellValue(orderHeader.getOrderCode());
				OhFirstRow.createCell(2).setCellValue("?????????");
				OhFirstRow.createCell(4).setCellValue(orderHeader.getWriter());
				titleStyle.setWrapText(true);
				OhFirstRow.getCell(0).setCellStyle(titleStyle);
				OhFirstRow.getCell(2).setCellStyle(titleStyle);
			
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 2, 3)); //??????, ????????????, ??????, ???????????? ??????
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 4, 6)); //??????, ????????????, ??????, ???????????? ??????				
				
				Row OhSecondRow = sheet.createRow(rowNo++);
				OhSecondRow.createCell(0).setCellValue("????????????");
				OhSecondRow.createCell(1).setCellValue(orderHeader.getInserted().toString());
				OhSecondRow.createCell(2).setCellValue("???????????????");
				OhSecondRow.createCell(4).setCellValue(orderHeader.getDeliveryDate());
				OhSecondRow.getCell(0).setCellStyle(titleStyle);
				OhSecondRow.getCell(2).setCellStyle(titleStyle);
				
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 2, 3)); //??????, ????????????, ??????, ???????????? ??????
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 4, 6)); //??????, ????????????, ??????, ???????????? ??????
				
				rowNo++;
				
				Row buyerRow1 = sheet.createRow(rowNo++);
				buyerRow1.createCell(0).setCellValue("?????????");
				buyerRow1.createCell(1).setCellValue(buyerInfo.getBuyerName());
				buyerRow1.createCell(2).setCellValue("?????????");
				buyerRow1.createCell(4).setCellValue(buyerInfo.getManager());
				buyerRow1.getCell(0).setCellStyle(titleStyle);
				buyerRow1.getCell(2).setCellStyle(titleStyle);
				
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 2, 3)); //??????, ????????????, ??????, ???????????? ??????
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 4, 6)); //??????, ????????????, ??????, ???????????? ??????

				Row buyerRow2 = sheet.createRow(rowNo++);
				buyerRow2.createCell(0).setCellValue("??????");
				buyerRow2.createCell(1).setCellValue(buyerInfo.getCountry());
				buyerRow2.createCell(2).setCellValue("??????");
				buyerRow2.createCell(4).setCellValue(buyerInfo.getAddress());
				buyerRow2.getCell(0).setCellStyle(titleStyle);
				buyerRow2.getCell(2).setCellStyle(titleStyle);
				
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 2, 3)); //??????, ????????????, ??????, ???????????? ??????
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 4, 6)); //??????, ????????????, ??????, ???????????? ??????

				Row buyerRow3 = sheet.createRow(rowNo++);
				buyerRow3.createCell(0).setCellValue("????????????");
				buyerRow3.createCell(1).setCellValue(buyerInfo.getPhone());
				buyerRow3.createCell(2).setCellValue("???????????????");
				buyerRow3.createCell(4).setCellValue(buyerInfo.getBusinessNumber());
				buyerRow3.getCell(0).setCellStyle(titleStyle);
				buyerRow3.getCell(2).setCellStyle(titleStyle);
				
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 2, 3)); //??????, ????????????, ??????, ???????????? ??????
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 4, 6)); //??????, ????????????, ??????, ???????????? ??????
				
				rowNo++;

				CellStyle detailStyle = workbook.createCellStyle();
				detailStyle.setAlignment(HorizontalAlignment.CENTER);
				detailStyle.setFont(fontHead);
				
				Row spaceRow = sheet.createRow(rowNo++);
				spaceRow.createCell(0).setCellValue("????????????");
				spaceRow.getCell(0).setCellStyle(detailStyle);
				
				Row orderItemHeadRow = sheet.createRow(rowNo++);
				orderItemHeadRow.createCell(0).setCellValue("");
				orderItemHeadRow.createCell(1).setCellValue("????????????");
				orderItemHeadRow.createCell(4).setCellValue("????????????");
				orderItemHeadRow.getCell(0).setCellStyle(valueTitleStyle);
				orderItemHeadRow.getCell(1).setCellStyle(valueTitleStyle);
				orderItemHeadRow.getCell(4).setCellStyle(valueTitleStyle);
				
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 1, 3)); //??????, ????????????, ??????, ???????????? ??????
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 4, 6)); //??????, ????????????, ??????, ???????????? ??????
				
				Row orderItemHeadSubRow = sheet.createRow(rowNo++);
				orderItemHeadSubRow.createCell(0).setCellValue("??????");
				orderItemHeadSubRow.createCell(1).setCellValue("?????????");
				orderItemHeadSubRow.createCell(2).setCellValue("??????");
				orderItemHeadSubRow.createCell(3).setCellValue("??????");
				orderItemHeadSubRow.createCell(4).setCellValue("?????????");
				orderItemHeadSubRow.createCell(5).setCellValue("??????");
				orderItemHeadSubRow.createCell(6).setCellValue("?????????");
				for(int i = 0; i <= 6; i++) {
					orderItemHeadSubRow.getCell(i).setCellStyle(valueHeadStyle);
				}
				
				int Num = 1;
				for(YjhOrderItemDto orderSheet : orderItem) {
				
					Row itemRow = sheet.createRow(rowNo++);
					itemRow.createCell(0).setCellValue(Num);
					itemRow.createCell(1).setCellValue(orderSheet.getProductName());
					itemRow.createCell(2).setCellValue(orderSheet.getSize());
					itemRow.createCell(3).setCellValue(orderSheet.getUnit());
					itemRow.createCell(4).setCellValue("???" + df.format((Integer)orderSheet.getFinalPrice()).toString());
					itemRow.createCell(5).setCellValue(orderSheet.getQuantity());
					itemRow.createCell(6).setCellValue("???" + df.format((Integer)orderSheet.getSum()).toString());
					Num++;
					for(int i = 0; i <= 6; i++) {
						itemRow.getCell(i).setCellStyle(valueStyle);
					}
				}
				
				XSSFCellStyle  footStyle = (XSSFCellStyle)workbook.createCellStyle();
				footStyle.setAlignment(HorizontalAlignment.CENTER);
				footStyle.setVerticalAlignment(VerticalAlignment.CENTER);
				footStyle.setFillForegroundColor(new XSSFColor(new byte[] {(byte) 172,(byte) 171,(byte) 171}, null));
				footStyle.setFillPattern(FillPatternType.FINE_DOTS);
				footStyle.setFont(fontHead);
				
				XSSFCellStyle footValueStyle = (XSSFCellStyle)workbook.createCellStyle();
				footValueStyle.setAlignment(HorizontalAlignment.CENTER);
				footValueStyle.setVerticalAlignment(VerticalAlignment.CENTER);
				//footValueStyle.setBorderTop(BorderStyle.THIN);
				//footValueStyle.setBorderBottom(BorderStyle.THIN);
				//footValueStyle.setBorderLeft(BorderStyle.THIN);
				//footValueStyle.setBorderRight(BorderStyle.THIN);
				
				Row sumRow = sheet.createRow(rowNo++);
				sumRow.createCell(0).setCellValue("??????");
				sumRow.createCell(4).setCellValue("???"+df.format((Integer)sumValue.getPriceSum()).toString());
				sumRow.createCell(5).setCellValue(sumValue.getQuantitySum());
				sumRow.createCell(6).setCellValue("???"+df.format((Integer)sumValue.getSumTotal()).toString());
				//System.out.println("???"+df.format((Integer)sumValue.getSumTotal()).toString().formatted(df));
				footStyle.setWrapText(true);
				footValueStyle.setWrapText(true);
				
				sumRow.getCell(0).setCellStyle(footStyle);
			
				for(int i = 4; i <= 6; i++) {
					sumRow.getCell(i).setCellStyle(footValueStyle);
				}
				
				sheet.addMergedRegion(new CellRangeAddress(rowNo-1, rowNo-1, 0, 3)); //??????, ????????????, ??????, ???????????? ??????
				
				String fileName = "?????????(" + orderHeader.getOrderCode()+ ").xls";
		        String outputFileName = new String(fileName.getBytes("KSC5601"), "8859_1");
				
				hsr.setContentType("ms-vnd/excel");
				hsr.setHeader("Content-Disposition", "attachment; filename=" + outputFileName);
				
				workbook.write(hsr.getOutputStream());
				workbook.close();		
			
	 }
	 
}

package com.sharedOne.controller.report;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;

import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.report.OrderReportDto;
import com.sharedOne.domain.report.PageInfo;
import com.sharedOne.domain.report.ReportDto;
import com.sharedOne.service.master.lnhProductService;
import com.sharedOne.service.report.HmsReportService;
import com.sharedOne.service.report.lnhReportService;

@Controller
@RequestMapping("report")
public class lnhReportController {
	@Autowired
	private lnhProductService productService;
	
	@Autowired
	private lnhReportService service;
	
	@Autowired
	private HmsReportService hmsService;
	
	@GetMapping("monthlyReport")
	public void getMontlyReport(
			@RequestParam(name = "orderQ", defaultValue = "") String orderQ,
			@RequestParam(name="orderCode", defaultValue="") String orderCode,
			@RequestParam(name="productCode", defaultValue="") String productCode,
			@RequestParam(name="writer", defaultValue="") String writer,
			@RequestParam(name="status", defaultValue="") String status,
			@RequestParam(name="fromDate", defaultValue="0001-01-01") String fromDate,
			@RequestParam(name="endDate", defaultValue="9999-12-31") String endDate,
			Model model) {
		
		//?????? ?????? ?????????
		List<OrderHeaderDto> orderList = service.orderList(orderQ, orderCode, productCode, writer, status, fromDate, endDate);
		
		
		//?????? ?????? ?????? ?????????
		List <ProductDto> productList = productService.selectProductList();
		
		Set <String> setWriters = new HashSet<>();
		for( OrderHeaderDto writer1 : orderList) {
			setWriters.add(writer1.getWriter());
		}
		Set <String> setStatus = new HashSet<>();
		for( OrderHeaderDto status1 : orderList) {
			setStatus.add(status1.getStatus());
		}
		
		model.addAttribute("writers", setWriters);
		model.addAttribute("status", setStatus);
		
		model.addAttribute("productList", productList);
		
		
		//?????? ?????? ?????????(?????????)
		List<ReportDto> thisYearSales = service.thisYearSales();
		
			
		// ???????????? ????????? ?????????, ?????? ?????????
		List<String> buyerList = new ArrayList<>();
		List<String> writerList = new ArrayList<>();
		for (int i = 0; i < orderList.size(); i++) {
			buyerList.add(orderList.get(i).getBuyerCode());
			writerList.add(orderList.get(i).getWriter());
		}

		Map<String, Integer> buyerSales = service.salesByBuyer(orderQ, orderCode, productCode, writer, status, fromDate,
				endDate, buyerList);
		Map<String, Integer> writerSales = service.salesByWriter(orderQ, orderCode, productCode, status, fromDate,
				endDate, writerList);

		System.out.println("??????????????? ?????????: " + orderList.size());

		System.out.println("????????????" + thisYearSales);
		System.out.println("????????? ??? ?????? " + buyerSales);
		System.out.println("?????? ??? ??????" + writerSales);

		System.out.println("????????????: " + orderList);

		// add attribute
		model.addAttribute("orderList", orderList); // c:forEach items = orderList
		model.addAttribute("buyerSales", buyerSales);
		model.addAttribute("writerSales", writerSales);

		model.addAttribute("thisYearSales", thisYearSales);
	}
	
	//?????? ????????????
	@RequestMapping("excelDown")
	@ResponseBody
	public void excelDown(HttpServletResponse response,	
			@RequestParam(name = "orderQ", defaultValue = "") String orderQ,
			@RequestParam(name="orderCode", defaultValue="") String orderCode,
			@RequestParam(name="productCode", defaultValue="") String productCode,
			@RequestParam(name="writer", defaultValue="") String writer,
			@RequestParam(name="status", defaultValue="") String status,
			@RequestParam(name="fromDate", defaultValue="0001-01-01") String fromDate,
			@RequestParam(name="endDate", defaultValue="9999-12-31") String endDate) throws IOException {
		
		
		try (Workbook workbook = new XSSFWorkbook()) {

			Sheet sheet = workbook.createSheet("?????????");
			int rowNo = 0;

			CellStyle headStyle = workbook.createCellStyle();
			headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.LIGHT_BLUE.getIndex());
			headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			Font font = workbook.createFont();
			font.setFontName(HSSFFont.FONT_ARIAL); // ?????? ?????????
			font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex()); // ?????? ??? ??????
			font.setFontHeightInPoints((short) 13); // ?????? ??????
			headStyle.setFont(font);

			// ?????????
			sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 11)); // ??????, ????????????, ??????, ???????????? ??????

			// ????????? ??? ?????????
			CellStyle cellStyle = workbook.createCellStyle();
			sheet.setColumnWidth(0, (sheet.getColumnWidth(0)) + (short) 2048); // 0?????? ?????? ?????? ??????
			sheet.setColumnWidth(6, (sheet.getColumnWidth(6)) + (short) 2048); // 6?????? ?????? ?????? ??????
			sheet.setColumnWidth(7, (sheet.getColumnWidth(7)) + (short) 2048); // 7?????? ?????? ?????? ??????
			sheet.setColumnWidth(8, (sheet.getColumnWidth(8)) + (short) 2048); // 8?????? ?????? ?????? ??????
			sheet.setColumnWidth(11, (sheet.getColumnWidth(11)) + (short) 5000); // 8?????? ?????? ?????? ??????
			cellStyle.setAlignment(HorizontalAlignment.CENTER);

			Font fontTitle = workbook.createFont();
			fontTitle.setColor(HSSFColor.HSSFColorPredefined.LIGHT_BLUE.getIndex());
			fontTitle.setFontName(HSSFFont.FONT_ARIAL);
			fontTitle.setBold(true);
			fontTitle.setFontHeightInPoints((short) 20); // ?????? ??????
			cellStyle.setFont(fontTitle); // cellStyle??? font??? ??????

			// ????????? ??????
			Row xssfRow = sheet.createRow(rowNo++); // ??? ?????? ??????
			Cell xssfCell = xssfRow.createCell((short) 0); // ????????? ?????? ??? ?????? ??????
			xssfCell.setCellStyle(cellStyle); // ?????? ????????? ??????
			xssfCell.setCellValue("?????????"); // ????????? ??????

			sheet.createRow(rowNo++);
			xssfRow = sheet.createRow(rowNo++); // ?????? ??????

			Row headerRow = sheet.createRow(rowNo++);
			headerRow.createCell(0).setCellValue("????????? ID");
			headerRow.createCell(1).setCellValue("???????????????");
			headerRow.createCell(2).setCellValue("????????????");
			headerRow.createCell(3).setCellValue("?????????");
			headerRow.createCell(4).setCellValue("??????");
			headerRow.createCell(5).setCellValue("??????");
			headerRow.createCell(6).setCellValue("?????????");
			headerRow.createCell(7).setCellValue("?????????");
			headerRow.createCell(8).setCellValue("?????????");
			headerRow.createCell(9).setCellValue("?????????");
			headerRow.createCell(10).setCellValue("??????");
			headerRow.createCell(11).setCellValue("?????????");

			for (int i = 0; i <= 11; i++) {
				headerRow.getCell(i).setCellStyle(headStyle);
			}

			// ?????? ?????? ?????????
			List<OrderHeaderDto> list = service.orderList(orderQ, orderCode, productCode, writer, status, fromDate,
					endDate);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			DecimalFormat DF = new DecimalFormat("###,###");

			for (OrderHeaderDto board1 : list) {
				// ?????? ???????????? ????????? ?????? ??????
				if (board1.getOrderItem().size() == 1) {
					Row row = sheet.createRow(rowNo++);
					row.createCell(0).setCellValue(board1.getOrderCode());
					row.createCell(1).setCellValue(board1.getBuyerCode());
					row.createCell(2).setCellValue(board1.getOrderItem().get(0).getProductCode());
					row.createCell(3).setCellValue(DF.format((Integer)board1.getOrderItem().get(0).getFinalPrice()).toString());
					row.createCell(4).setCellValue(board1.getOrderItem().get(0).getQuantity());
					row.createCell(5).setCellValue(DF.format((Integer)board1.getOrderItem().get(0).getSum()).toString());
					Date cell6 = java.sql.Date.valueOf(board1.getInserted());
					String inserted = sdf.format(cell6);
					row.createCell(6).setCellValue(inserted);

					if (board1.getModified() != null) {
						Date cell7 = java.sql.Date.valueOf(board1.getModified());
						String modified = sdf.format(cell7);
						row.createCell(7).setCellValue(modified);

					}

					Date cell8 = java.sql.Date.valueOf(board1.getDeliveryDate());
					String deliveryDate = sdf.format(cell8);
					row.createCell(8).setCellValue(deliveryDate);

					row.createCell(9).setCellValue(board1.getWriter());
					row.createCell(10).setCellValue(board1.getStatus());
					row.createCell(11).setCellValue(board1.getMessage());
				}
				// ?????? ???????????? ????????? ??? ??????
				if (board1.getOrderItem().size() != 1) {
					List<OrderItemDto> itemList = new ArrayList<>();

					itemList = board1.getOrderItem();
					for (OrderItemDto board2 : itemList) {
						Row row = sheet.createRow(rowNo++);
						row.createCell(0).setCellValue(board1.getOrderCode());
						row.createCell(1).setCellValue(board1.getBuyerCode());
						row.createCell(2).setCellValue(board2.getProductCode());
						row.createCell(3).setCellValue(DF.format((Integer)board2.getFinalPrice()).toString());
						row.createCell(4).setCellValue(board2.getQuantity());
						row.createCell(5).setCellValue(DF.format((Integer)board2.getSum()).toString());
						Date cell6 = java.sql.Date.valueOf(board1.getInserted());
						String inserted = sdf.format(cell6);
						row.createCell(6).setCellValue(inserted);

						if (board1.getModified() != null) {
							Date cell7 = java.sql.Date.valueOf(board1.getModified());
							String modified = sdf.format(cell7);
							row.createCell(7).setCellValue(modified);

						}

						Date cell8 = java.sql.Date.valueOf(board1.getDeliveryDate());
						String deliveryDate = sdf.format(cell8);
						row.createCell(8).setCellValue(deliveryDate);

						row.createCell(9).setCellValue(board1.getWriter());
						row.createCell(10).setCellValue(board1.getStatus());
						row.createCell(11).setCellValue(board1.getMessage());
					}

				}

			}

			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attachment;filename=report.xls");

			workbook.write(response.getOutputStream());
			workbook.close();

		}

	}

}

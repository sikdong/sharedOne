package com.sharedOne.controller.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.report.PageInfo;
import com.sharedOne.service.report.HmsReportService;

@Controller
@RequestMapping("report")
public class HmsReportController {

	  
	  //@Autowired 
	  //private HmsReportService service;
	  
	 // @GetMapping("monthlyReportA") 
	  //public void montlyReport(
		//	  	@RequestParam(name = "page", defaultValue = "1") int page,
		//	  	@RequestParam(name = "orderQ", defaultValue = "") String orderQ, // orderQ 전체검색 Attribute
		//	  	PageInfo pageInfo, 
		//	  	Model model) {
	  
	// request param 수집 
	// montlyReport 메소드 파라미터 PageInfo에 일어나는 일을 풀어서 작성
	  
		  //PageInfo pageInfo = new PageInfo();
		  //pageInfo.setLastPageNumber(Integer.parseInt(request.getParameter(
		  //"lastPageNumber"))); model.addAttribute("pageInfo", pageInfo);
	  
	  
	  // business logic 작동 
		//List<OrderHeaderDto> orderList = service.orderList(page,
		//orderQ, pageInfo); // page = "파라미터 수집 
		//// add attribute
		//model.addAttribute("orderList", orderList); // c:forEach items = orderList 
		// forward 
		}
	   
	 

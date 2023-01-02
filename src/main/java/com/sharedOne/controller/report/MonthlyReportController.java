package com.sharedOne.controller.report;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("report")
public class MonthlyReportController {
	
	@GetMapping("monthlyReport")
	public void getMontlyReport() {
		
	}

}

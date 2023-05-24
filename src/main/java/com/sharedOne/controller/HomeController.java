package com.sharedOne.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.swagger.annotations.Api;
import springfox.documentation.annotations.ApiIgnore;

@Controller
@ApiIgnore
public class HomeController {
	
	@RequestMapping("")
	@PreAuthorize("not isAuthenticated()")
	public String home() {
		
		return "redirect:/member/login";
	}
	
	@GetMapping("")
	@PreAuthorize("isAuthenticated()")
	public String main() {
		
		return "redirect:/order/list";
	}
}

package com.sharedOne.controller.master;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.service.master.AsjProductService;

@Controller
@RequestMapping("master")
public class AsjProductController {

	@Autowired
	private AsjProductService asjProductService;
	

}

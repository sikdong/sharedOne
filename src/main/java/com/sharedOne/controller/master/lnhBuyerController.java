package com.sharedOne.controller.master;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.service.master.lnhBuyerService;

@Controller
@RequestMapping("master")
public class lnhBuyerController {

	@Autowired
	private lnhBuyerService buyerService;

	@GetMapping("buyerList")
	@PreAuthorize("isAuthenticated()")
	public void buyerList(
			@RequestParam(name = "keyword", defaultValue = "") String keyword,
			@RequestParam(name = "buyerCode", defaultValue = "") String buyerCode,
			@RequestParam(name = "buyerName", defaultValue = "") String buyerName,
			@RequestParam(name = "country", defaultValue = "") String country,
			Model model) {
		List<BuyerDto> buyer1 = buyerService.selectBuyerList();

		Set<String> setCountries = new HashSet<>();
		for (BuyerDto buyer : buyer1) {
			setCountries.add(buyer.getCountry());
		}
		Set<String> setManagers = new HashSet<>();
		for (BuyerDto buyer : buyer1) {
			setManagers.add(buyer.getManager());
		}
		
		List<BuyerDto> searhResult = buyerService.searchBuyerList(keyword, buyerCode, buyerName, country);
		
		System.out.println(keyword);
		System.out.println(searhResult);
		
		model.addAttribute("country", setCountries);
		model.addAttribute("manager", setManagers);

		model.addAttribute("buyer", buyer1);
		model.addAttribute("buyerList", searhResult);
		
	}

	@GetMapping("buyerRegister")
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}

	@PostMapping("buyerRegister")
	@PreAuthorize("isAuthenticated()")
	public void register(BuyerDto buyer) {
		buyerService.register(buyer);
	}


	@GetMapping("buyerModify") // @은 외부 빈, #은 메소드의 파라미터
	@PreAuthorize("isAuthenticated()")
	public void modify(@RequestParam(name = "code") String buyerCode, Model model) {

		BuyerDto buyer = buyerService.get(buyerCode);
		model.addAttribute("buyer", buyer);

	}

	@PostMapping("buyerModify")
	@PreAuthorize("isAuthenticated()")
	public void modify(BuyerDto buyer) {
		buyerService.update(buyer);
	}
	
	@GetMapping("existbuyerCode/{buyerCode}")
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	public Map<String, Object> existbuyerCode(@PathVariable String buyerCode) {
		Map<String, Object> map = new HashMap<>();

		BuyerDto buyer = buyerService.getByBuyerCode(buyerCode);

		if (buyer == null) {
			map.put("status", "not exist");
			map.put("message", "사용가능한 바이어코드입니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 바이어코드입니다.");
		}

		return map;
	}
	
	@GetMapping("existbusinessNum/{businessNumber}")
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	public Map<String, Object> existbusinessNum(@PathVariable String businessNumber) {
		Map<String, Object> map = new HashMap<>();

		BuyerDto buyer = buyerService.getByBusinessNumber(businessNumber);

		if (buyer == null) {
			map.put("status", "not exist");
			map.put("message", "사용가능한 사업자번호입니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 사업자번호입니다.");
		}

		return map;
	}
	

	@PostMapping("buyerRemove")
	@PreAuthorize("isAuthenticated()")
	public void remove(@RequestParam(name = "code") String buyerCode) {
		buyerService.remove(buyerCode);
		/* return "redirect:/master/removeConfirm"; */
	}
}

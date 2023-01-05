package com.sharedOne.controller.master;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sharedOne.domain.master.BuyerDto;
import com.sharedOne.service.master.lnhBuyerService;

@Controller
@RequestMapping("master")
public class lnhBuyerController {

	@Autowired
	private lnhBuyerService buyerService;

	@GetMapping("buyerList")
	public void buyerList(Model model) {
		List<BuyerDto> buyerList = buyerService.selectBuyerList();

		Set<String> setCountries = new HashSet<>();
		for (BuyerDto buyer : buyerList) {
			setCountries.add(buyer.getCountry());
		}
		Set<String> setManagers = new HashSet<>();
		for (BuyerDto buyer : buyerList) {
			setManagers.add(buyer.getManager());
		}

		model.addAttribute("country", setCountries);
		model.addAttribute("manager", setManagers);

		model.addAttribute("buyerList", buyerList);
	}

	@GetMapping("buyerRegister")
	public void register() {

	}

	@PostMapping("buyerRegister")
	public void register(BuyerDto buyer, RedirectAttributes rttr) {

		buyerService.register(buyer);
	}

	// 새 창으로 띄우는 경우
	/*
	 * @GetMapping("buyerGet") public void get(
	 * 
	 * @RequestParam(name = "code") String buyerCode, Authentication auth, Model
	 * model) { BuyerDto buyer = buyerService.get(buyerCode);
	 * model.addAttribute("buyer", buyer);
	 * 
	 * }
	 */

	@GetMapping("buyerModify") // @은 외부 빈, #은 메소드의 파라미터
	/* @PreAuthorize("@Security.checkWriter(authentication.name, #buyerCode)") */
	public void modify(@RequestParam(name = "code") String buyerCode, Model model) {

		BuyerDto buyer = buyerService.get(buyerCode);
		model.addAttribute("buyer", buyer);

	}

	@PostMapping("buyerModify")
	/* @PreAuthorize("@Security.checkWriter(authentication.name, #buyerCode)") */
	public String modify(BuyerDto buyer) {
		buyerService.update(buyer);
		
		String code = buyer.getBuyerCode();

		return "redirect:/master/buyerModify?code=" + code;
	}

	@PostMapping("buyerRemove")
	/* @PreAuthorize("@Security.checkWriter(authentication.name, #buyerCode)") */
	public String remove(@RequestParam(name = "code") String buyerCode) {
		buyerService.remove(buyerCode);

		return "redirect:/master/buyerList";
	}
}

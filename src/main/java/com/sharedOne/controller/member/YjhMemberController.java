package com.sharedOne.controller.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedOne.domain.member.RanksDto;
import com.sharedOne.domain.member.MemberDto;
import com.sharedOne.service.member.YjhMemberService;

@Controller
@RequestMapping("member")
public class YjhMemberController {
	
	@Autowired
	YjhMemberService service;
	
	@RequestMapping("login")
	@PreAuthorize("not isAuthenticated()")
	public void login() {
		
	}
	
	@GetMapping("signup")
	/* @PreAuthorize("hasAuthority('팀장')") */
	public void signup() {
	}
	
	@PostMapping("signup")
	/* @PreAuthorize("hasAuthority('팀장')") */
	public void signup(MemberDto member , RanksDto rank) {
		
		service.insertMember(member,rank);

	}
	
	// 회원정보수정 이메일 중복확인
		@PostMapping("checkEmail")
		@ResponseBody
		public Map<String, Object> checkEmail(@RequestBody Map<String, String> req) {
			Map<String, Object> map = new HashMap<>();

			MemberDto member = service.checkEmail(req.get("email")+"@order.com");

			if (member == null) {
				map.put("status", "Approval");
				map.put("message", "사용 가능한 이메일ID입니다.");
			} else {
				map.put("status", "Refusal");
				map.put("message", "이미 존재하는 이메일ID입니다.");
			}

			return map;
		}
}

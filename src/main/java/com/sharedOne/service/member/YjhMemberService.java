package com.sharedOne.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.member.RanksDto;
import com.sharedOne.domain.member.MemberDto;
import com.sharedOne.mapper.member.YjhMemberMapper;

@Service
public class YjhMemberService {

	@Autowired YjhMemberMapper mapper;	
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public void insertMember(MemberDto member, RanksDto rank) {
		
		String pw = member.getPassword();
		
		member.setPassword(passwordEncoder.encode(pw));
		
		String email = member.getEmail() + "@order.com";
		
		member.setEmail(email);
		
		mapper.insertMember(member);
		
		int getMemberId = member.getMemberId();
		
		rank.setMemberId(getMemberId);
		
		mapper.insertRanks(rank);
	}
	
	/*
	 * public void insertRanks(RanksDto rank) {
	 * 
	 * mapper.insertRanks(rank);
	 * 
	 * }
	 */

	public MemberDto checkEmail(String email) {
		
		return mapper.getEmail(email);
	}

}

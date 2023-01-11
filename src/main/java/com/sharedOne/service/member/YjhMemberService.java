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
	
	public int insertMember(MemberDto member) {
		
		String pw = member.getPassword();
		
		member.setPassword(passwordEncoder.encode(pw));
		
		return mapper.insertMember(member);
	}
	
	public int insertRanks(RanksDto rank) {
		
		return mapper.insertRanks(rank);
		
	}

}

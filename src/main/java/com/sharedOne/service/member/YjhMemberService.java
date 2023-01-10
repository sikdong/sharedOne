package com.sharedOne.service.member;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharedOne.domain.member.AuthDto;
import com.sharedOne.domain.member.MemberDto;
import com.sharedOne.mapper.member.YjhMemberMapper;

@Service
public class YjhMemberService {

	@Autowired YjhMemberMapper mapper;	
	
	public int insertMember(MemberDto member) {
	
		return mapper.insertMember(member);
	}
	
	public int insertAuth(AuthDto auth) {
		
		return mapper.insertAuth(auth);
		
	}

}

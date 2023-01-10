package com.sharedOne.mapper.member;

import com.sharedOne.domain.member.AuthDto;
import com.sharedOne.domain.member.MemberDto;

public interface YjhMemberMapper {

	MemberDto selectById(String username);

	int insertMember(MemberDto member);

	int insertAuth(AuthDto auth);

}

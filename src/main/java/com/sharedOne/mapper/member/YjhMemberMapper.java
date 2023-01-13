package com.sharedOne.mapper.member;

import com.sharedOne.domain.member.RanksDto;
import com.sharedOne.domain.member.MemberDto;

public interface YjhMemberMapper {

	MemberDto selectById(String username);

	void insertMember(MemberDto member);

	void insertRanks(RanksDto rank);

	MemberDto getEmail(String email);

}

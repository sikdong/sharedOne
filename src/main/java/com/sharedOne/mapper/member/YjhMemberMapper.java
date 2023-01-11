package com.sharedOne.mapper.member;

import com.sharedOne.domain.member.RanksDto;
import com.sharedOne.domain.member.MemberDto;

public interface YjhMemberMapper {

	MemberDto selectById(String username);

	int insertMember(MemberDto member);

	int insertRanks(RanksDto rank);

}

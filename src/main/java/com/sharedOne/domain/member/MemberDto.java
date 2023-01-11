package com.sharedOne.domain.member;

import java.util.List;

import lombok.Data;

@Data
public class MemberDto {
	
	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	
	private List<String> Auth;
}

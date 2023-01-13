package com.sharedOne.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.sharedOne.domain.member.MemberDto;
import com.sharedOne.mapper.member.YjhMemberMapper;

@Component
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private YjhMemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		MemberDto member = mapper.selectById(username);
		
		if(member==null) {
			
			return null;
		}
		
		List<SimpleGrantedAuthority> authorityList = new ArrayList<>();
		
		if(member.getRank() != null) {
			for(String rank : member.getRank()) {
				authorityList.add(new SimpleGrantedAuthority(rank));
			}
		}
		
		User user = new User(member.getId(), member.getPassword(), authorityList);
		
		return user;
	}

}

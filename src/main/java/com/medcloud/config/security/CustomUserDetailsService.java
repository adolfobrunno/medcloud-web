package com.medcloud.config.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.jasypt.spring.security3.PasswordEncoder;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.medcloud.core.entities.User;
import com.medcloud.core.persistence.services.UserService;

public class CustomUserDetailsService implements UserDetailsService{

	@Resource
	MongoOperations mongoOperation; 
	@Resource
	UserService userService;
	@Resource
	PasswordEncoder pe;
	
	public Collection<? extends GrantedAuthority> getAuthorities(String role) {
		List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		authList.add(new SimpleGrantedAuthority(role));
		return authList;
	}

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = getUserDetail(username);
		org.springframework.security.core.userdetails.User userDetail = new org.springframework.security.core.userdetails.User(user.getUsername(),user.getPassword(),true,true,true,true,getAuthorities(user.getRole()));
		return userDetail;
	}
	
	 public User getUserDetail(String username){
		 User user = userService.getByUsername(username);
		 System.out.println("Password: " + user.getPassword());
		 return user;
	 }

}

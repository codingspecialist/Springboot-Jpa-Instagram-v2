package com.cos.insta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.cos.insta.model.User;
import com.cos.insta.repository.UserRepository;

@Service
public class MyUserDetailService implements UserDetailsService{
	
	@Autowired
	private UserRepository mUserRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		System.out.println("loadUserByUsername : "+username);
		User user = mUserRepository.findByUsername(username);
		
		MyUserDetail userDetails = null;
		if(user != null) {
			userDetails = new MyUserDetail();
			userDetails.setUser(user);
			
			
		}else {
			throw new UsernameNotFoundException("Not Found 'username'");
		}
		return userDetails;
	}
	
	
}

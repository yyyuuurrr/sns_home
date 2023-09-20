package com.cona.sns.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cona.sns.common.EncryptUtils;
import com.cona.sns.user.domain.User;
import com.cona.sns.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User addUser(
			String loginId
			, String password
			, String name
			, String email){
		
		String encryptPassword = EncryptUtils.md5(password);
		
		User user = User.builder()
						.loginId(loginId)
						.password(encryptPassword)
						.name(name)
						.email(email)
						.build();
		
		return userRepository.save(user);
		
	}


}

package com.example.service;

import com.example.domain.UserVO;

public interface UserService {
	
	
    void registerUser(UserVO userVO);

	UserVO loginUser(String userId, String password);

	String findEmail(String userName, String userTel);

	boolean findAndResetPassword(String userName, String userId, String userTel);
    
	boolean isDuplicateUser(String userId, String userTel);

	boolean isEmailDuplicate(String email);
}
package com.bookbookbook.service;

import java.util.Map;

import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserVO;

public interface UserService {
	
	//회원가입, 로그인 관련
	void registerUser(UserVO userVO)  throws IllegalArgumentException;

	public Map<String, Object> loginUser(String userId, String password);
	String findEmail(String userName, String userTel);
	boolean findAndResetPassword(String userName, String userId, String userTel);
	boolean isEmailDuplicate(String email);
	
	UserVO findUserByEmail(String email);
	
	public void updateUserPreferences(UserVO user);
	//채팅
	public void submitReport(ReportVO vo);

	
	
}

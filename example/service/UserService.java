package com.bookbookbook.service;

import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserVO;

public interface UserService {
	
	//회원가입, 로그인 관련
	void registerUser(UserVO userVO)  throws IllegalArgumentException;

	UserVO loginUser(String userId, String password);
	String findEmail(String userName, String userTel);
	boolean findAndResetPassword(String userName, String userId, String userTel);
	boolean isEmailDuplicate(String email);
	
	UserVO findUserByEmail(String email);
	
	//채팅
	public void submitReport(ReportVO vo);
	
}

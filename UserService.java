package com.bookbookbook.service;

import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.domain.VisitVO;

public interface UserService {
	
	//회원가입, 로그인 관련
	void registerUser(UserVO userVO);
	UserVO loginUser(String userId, String password);
	String findEmail(String userName, String userTel);
	boolean findAndResetPassword(String userName, String userId, String userTel);

	//채팅
	public void submitReport(ReportVO vo);
	
	//방문자저장
	public void saveVisitLog(VisitVO vo);
}

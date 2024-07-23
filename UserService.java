package com.bookbookbook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookbookbook.domain.CalendarVO;
import com.bookbookbook.domain.MemoVO;
import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserVO;

public interface UserService {
	
	//회원가입, 로그인 관련
	void registerUser(UserVO userVO);
	UserVO loginUser(String userId, String password);
	String findEmail(String userName, String userTel);
	boolean findAndResetPassword(String userName, String userId, String userTel);

	//채팅
	public void submitReport(ReportVO vo);
	
	//#####################################
	// 나의 달력
		// 출석 정보 조회
	List<CalendarVO> getAttendancesByUserId(String userId);
		// 메모 정보 조회
	List<MemoVO> getMemosByUserId(String userId);
	
	
		// 출석체크 데이터베이스에 저장
	boolean  markAttendance(String userId);
		// 데이터베이스에서 출석 정보 조회
	List<CalendarVO> getAttendanceList(String userId);
	
	//#####################################
	// 나의 캐릭터
		// userId로 userLevel에 따른 캐릭터 정보 조회
	List<HashMap<String, Object>> getCharactersByUserId(String userId);
		// 캐릭터 상세
	Map<String, Object> myCharactersDetail(Map<String, Object> params);
}

package com.bookbookbook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookbookbook.domain.CalendarVO;
import com.bookbookbook.domain.CharactersVO;
import com.bookbookbook.domain.MemoVO;
import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserVO;

@Mapper
public interface UserDAO {
	
	//####################################
	//회원가입, 로그인 관련
	public List<UserVO> getUserList(UserVO vo);
	public void registerUser(UserVO vo);
	public UserVO loginUser(String userId);
	public String findEmail(String userName, String userTel);
	public void updateUserOnlineStatus(String userId, boolean b);
	public UserVO findUserByNameIdAndTel(String userName, String userId, String userTel);
    public void updatePassword(String userId, String newPassword);

    //##############################
    //채팅
    public void submitReport(ReportVO vo);
    
    //##############################
    // 나의 달력
    	// 메모 정보 조회
    public List<HashMap<String, Object>> getMemosAtCalendar(String userId);
    	// 출석체크 데이터베이스에 저장
 	public Integer insertAttendance(String userId);
 		// 데이터베이스에서 출석 정보 조회
 	public List<CalendarVO> getAttendanceList(String userId);
    
    //##############################
  	// 나의 캐릭터
  		// userId로 userLevel에 따른 캐릭터 정보 조회
    List<HashMap<String, Object>> getCharactersByUserId(String userId);
  		// 캐릭터 상세
  	public Map<String, Object> myCharactersDetail(Map<String, Object> params);


}

package com.bookbookbook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bookbookbook.domain.BookshelfVO;
import com.bookbookbook.domain.CalendarVO;
import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserStatVO;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.domain.VisitVO;

@Mapper
public interface UserDAO {
	
	//###############################
    //방문자수등록
  	public void insertVisitLog(VisitVO vo);
	
	//####################################
	//회원가입, 로그인 관련
	public List<UserVO> getUserList(UserVO vo);
	public void registerUser(UserVO vo);
	public UserVO loginUser(String userId);
	public String findEmail(String userName, String userTel);
	public void updateUserOnlineStatus(String userId, boolean b);
	public UserVO findUserByNameIdAndTel(String userName, String userId, String userTel);
    public void updatePassword(String userId, String newPassword);
    
    int existsByUserId(String email);
    public int existsByUserTel(String userTel);
    
    UserVO findUserByEmail(String email);
    public void updateUserPreferences(UserVO user);
    
    
    // 임시 코드 업데이트
       void updateTempCode(@Param("userId") String userId, @Param("tempCode") String tempCode);
       void clearTempCodeAndAttempts(String userId);
       void incrementLoginAttempts(String userId);
       int getLoginAttempts(String userId);
       void resetLoginAttempts(String userId);
    
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
 	// 나의 메모
 		// 메모 정보 조회
 	public List<HashMap<String, Object>> getMemosAtMemo(String userId);
 		// 메모 상세 조회
 	public List<HashMap<String, Object>> getMemoDetailByMemoNum(HashMap<String, Object> params);
 		// 메모 삭제
 	public int memoDelete(HashMap<String, Object> params);
 		// 메모 수정
 	public int updateMemo(HashMap<String, Object> params);
 		// memo 테이블에서 shelfNum을 포함하는 레코드가 있는지 확인
 	int countMemoForShelf(HashMap<String, Object> params);
 	
    //##############################
  	// 나의 캐릭터
  		// userId로 userLevel에 따른 캐릭터 정보 조회
    List<HashMap<String, Object>> getCharactersByUserId(String userId);
  		// 캐릭터 상세
  	public Map<String, Object> myCharactersDetail(Map<String, Object> params);

  	//######################################
  //리그
  	public List<BookshelfVO> usersReadRank();
  	public List<BookshelfVO> getBooksByUserId(String userId);
  //##############################
  //나의 정보 수정
  	// 사용자 사용자 ID로 사용자 정보 조회
   	public UserVO getUserById(String userId);

   	// 사용자 정보 수정
   	public void updateUserInfo(UserVO user);

	// 사용자 통계 정보 조회
  	public UserStatVO getUserStatInfo(UserStatVO userStatVO);

  	
  	//###########################################################
  	//소셜 로그인 
  	
	//이메일 찾기
  	public UserVO findByEmail(String email);
  	
	//구글로그인 y
	public void updateGoogleStatus(String email);
	//Naver로그인
	public void updateNaverStatus(String email);
}

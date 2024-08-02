package com.bookbookbook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookbookbook.domain.BookshelfVO;
import com.bookbookbook.domain.CalendarVO;
import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserStatVO;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.domain.VisitVO;

import jakarta.servlet.http.HttpSession;

public interface UserService {
	
	//############################
	//방문자저장
		public void saveVisitLog(VisitVO vo);
	
		//##########################################################
		//회원가입, 로그인 관련
		void registerUser(UserVO userVO)  throws IllegalArgumentException;
		//로그인
		public Map<String, Object> loginUser(String userId, String password);
		//
		String findEmail(String userName, String userTel);
		//
		boolean findAndResetPassword(String userName, String userId, String userTel);
		//이메일 중복 확인
		boolean isEmailDuplicate(String email);
		//
		UserVO findUserByEmail(String email);
		//선호도 저장
		public void updateUserPreferences(UserVO user);

	//채팅
	public void submitReport(ReportVO vo);
	//#####################################
		// 나의 달력
			// 메모 정보 조회
		List<HashMap<String, Object>> getMemosAtCalendar(String userId);
			// 출석체크 데이터베이스에 저장
		boolean  markAttendance(String userId);
			// 데이터베이스에서 출석 정보 조회
		List<CalendarVO> getAttendanceList(String userId);
		
		//#####################################
		// 나의 메모
			// 메모 정보 조회 
		List<HashMap<String, Object>> getMemosAtMemo(String userId);
			// 메모 상세 조회
		List<HashMap<String, Object>> getMemoDetailByMemoNum(HashMap<String, Object> params);
			// 메모 삭제
		int memoDelete(HashMap<String, Object> params);
			// 메모 수정
		int updateMemo(HashMap<String, Object> params);
			// memo 테이블에서 shelfNum을 포함하는 레코드가 있는지 확인
		int hasMemoForShelf(HashMap<String, Object> params);
		
		//#####################################
		// 나의 캐릭터
		// userId로 userLevel에 따른 캐릭터 정보 조회
		List<HashMap<String, Object>> getCharactersByUserId(String userId);
			// 캐릭터 상세
		Map<String, Object> myCharactersDetail(Map<String, Object> params);
		
		//#######################################
		//리그
		List<BookshelfVO> usersReadRank();
		
		//나의 통계 화면
				List<BookshelfVO> readStatus(BookshelfVO vo, HttpSession session); // 여러 개의 책 상태 정보를 조회

				//#####################################
				// 나의 정보 조회
				UserVO getUserById(String userId);

				// 나의 정보 수정
				void updateUserInfo(UserVO userVO);
				UserStatVO getUserStatInfo(UserStatVO userStatVO);
}

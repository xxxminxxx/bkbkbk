package com.bookbookbook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bookbookbook.dao.BookshelfDAO;
import com.bookbookbook.dao.UserDAO;
import com.bookbookbook.dao.UserStatDAO;
import com.bookbookbook.domain.BookshelfVO;
import com.bookbookbook.domain.CalendarVO;
import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserStatVO;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.domain.VisitVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    // 로깅을 위한 Logger 설정
    private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
    
    //##################################################
  //방문자 기록 입력
  	@Override
      public void saveVisitLog(VisitVO vo) {
          userDAO.insertVisitLog(vo);
      } 

    // 의존성 주입을 위한 UserDAO와 PasswordEncoder 선언
    private final UserDAO userDAO;
    private final PasswordEncoder passwordEncoder;

    // 이메일 서비스 주입
    @Autowired
    private EmailService emailService;
    
    private final UserStatDAO userStatDAO;
   
    private boolean isValidPassword(String password) {
    	
    	// 최소 8자 이상
        if (password.length() < 8) return false;
        
        // 대문자 포함
        if (!password.matches(".*[A-Z].*")) return false;
        
        // 특수문자 포함
        if (!password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*")) return false;
        
        return true;
    }

    // 사용자 등록 메서드
    @Override
    public void registerUser(UserVO userVO) {
    	
    	// 비밀번호 유효성 검사
    	if (!isValidPassword(userVO.getPassword())) {
            throw new IllegalArgumentException("비밀번호는 최소 8자 이상이며, 대문자와 특수문자를 포함해야 합니다.");
    	//  비밀번호가 규칙에 맞지 않으면 서버단에서 예외를 발생시킴
    	}
    	
        // 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(userVO.getPassword());
        System.out.println(">>>User 서비스임플 호출: " + encodedPassword);
        userVO.setPassword(encodedPassword);
        
        // DAO를 통해 사용자 등록
        try {
            userDAO.registerUser(userVO);
            System.out.println(">>>User DAO 호출 완료");
        } catch (Exception e) {
            System.err.println(">>>User DAO 호출 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    
    // 회원가입 이메일 중복확인 메서드
    @Override
    public boolean isEmailDuplicate(String email) {
        return userDAO.existsByUserId(email) > 0;
    }
    
    // 사용자 로그인 메서드
    @Override
    public  Map<String, Object> loginUser(String userId, String password) {
    	   Map<String, Object> result = new HashMap<>();
    	 // DAO를 통해 사용자 정보 조회
        UserVO user = userDAO.loginUser(userId);
        System.out.println(">>> user서비스임플 호출: " + user);

        // 사용자 존재 여부와 비밀번호 일치 여부 확인
        if (user != null) {
            if ("Y".equals(user.getBanStatus())) {
                result.put("success", false);
                result.put("message", "강퇴된 회원입니다.");
            } else if ("Y".equals(user.getQuitStatus())) {
                result.put("success", false);
                result.put("message", "탈퇴한 회원입니다.");
            } else if (passwordEncoder.matches(password, user.getPassword())) {
                result.put("success", true);
                result.put("user", user);
            } else {
                result.put("success", false);
                result.put("message", "비밀번호가 일치하지 않습니다.");
            }
        } else {
            result.put("success", false);
            result.put("message", "존재하지 않는 사용자입니다.");
        }
        return result;
    }
    
    // 이메일 찾기 메서드
    @Override
    public String findEmail(String userName, String userTel) {
        return userDAO.findEmail(userName, userTel);
    }
    
    // 비밀번호 찾기 및 재설정 메서드
    @Override
    public boolean findAndResetPassword(String userName, String userId, String userTel) {
        // DAO를 통해 사용자 정보 조회
        UserVO user = userDAO.findUserByNameIdAndTel(userName, userId, userTel);
        if (user != null) {
            // 임시 비밀번호 생성
            String tempPassword = generateTempPassword();
            // 임시 비밀번호 암호화
            String encodedPassword = passwordEncoder.encode(tempPassword);
            // DAO를 통해 비밀번호 업데이트
            userDAO.updatePassword(user.getUserId(), encodedPassword);

            // 이메일 제목과 내용 설정
            String subject = "BOOKBOOKBOOK 임시 비밀번호 안내";
            String text = "안녕하세요 " + userName + "님,\n\n"
                        + "귀하의 임시 비밀번호는 " + tempPassword + " 입니다.\n"
                        + "보안을 위해 로그인 후 즉시 비밀번호를 변경해 주세요.\n\n"
                        + "감사합니다."; 
            try {
                // 이메일 전송 시도
                emailService.sendSimpleMessage(user.getUserId(), subject, text);
                return true;
            } catch (Exception e) {
                // 이메일 전송 실패 시 로그에 에러 메시지 기록
                log.error("Failed to send email", e);
                return false;
            }
        }
        return false;
    }
    
    // 구글 이메일로 로그인 할때 이메일 중복 확인 메서드
    @Override
    public UserVO findUserByEmail(String email) {
        return userDAO.findUserByEmail(email);
    }
    
    // 임시 비밀번호 생성 메서드
    private String generateTempPassword() {
        // 비밀번호에 사용할 문자 세트 설정
        String upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerAlphabet = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String specialChars = "!@#$%^&*()_+-=[]{}|;:,.<>?";
        
        String allChars = upperAlphabet + lowerAlphabet + numbers + specialChars;
        Random random = new Random();
        StringBuilder password = new StringBuilder();

        // 비밀번호 길이를 12로 설정
        for (int i = 0; i < 12; i++) {
            int index = random.nextInt(allChars.length());
            password.append(allChars.charAt(index));
        }
        return password.toString();
    }
 // 선호도 저장 메서드
    @Override
    public void updateUserPreferences(UserVO user) {
        userDAO.updateUserPreferences(user);
        System.out.println("유저 서비스임플 updateUserPreferences 호출");
    }
    
    //########################################
    //채팅
	public void submitReport(ReportVO vo) {
		userDAO.submitReport(vo);
	}
	
	//########################################
		// 나의 달력
			// 메모 정보 조회
		public List<HashMap<String, Object>> getMemosAtCalendar(String userId){
			System.out.println("userServiceImpl 메모 정보 조회 2 : " + userId);
			List<HashMap<String, Object>> result = userDAO.getMemosAtCalendar(userId);
			System.out.println("userServiceImpl 메모 정보 조회 2 : " + result);
			return result;
		}
		
			// 출석체크 데이터베이스에 저장
		public boolean  markAttendance(String userId) {
	        System.out.println("userServiceImpl 호출");
	        Integer result = userDAO.insertAttendance(userId);
	        System.out.println("userServiceImpl 출석체크 저장 여부 : " + result);
	          
	        return result > 0;
	    }

			// 데이터베이스에서 출석 정보 조회
		public List<CalendarVO> getAttendanceList(String userId) {
			System.out.println("userServiceImpl getAttendanceList 호출");
		    List<CalendarVO> result = userDAO.getAttendanceList(userId);
		    System.out.println("userServiceImpl 출석정보 조회 : " + result);
		    return result;
		}
		//########################################
		// 나의 메모
			// 메모 정보 조회
		public List<HashMap<String, Object>> getMemosAtMemo(String userId){
			System.out.println(">>>>>"+userId);
			List<HashMap<String, Object>> result = userDAO.getMemosAtMemo(userId);
			System.out.println("userServiceImpl 메모 정보 조회 : " + result);
			return result;
		}
			// 메모 상세 조회
		public List<HashMap<String, Object>> getMemoDetailByMemoNum(HashMap<String, Object> params) {
			List<HashMap<String, Object>> result = userDAO.getMemoDetailByMemoNum(params);
			System.out.println("userServiceImpl 메모 상세 조회 : " + result);
			return result;
		}
			// 메모 삭제
		public int memoDelete(HashMap<String, Object> params) {
			int result = userDAO.memoDelete(params);
			System.out.println("userServiceImpl 메모 삭제 : " + result);
			return result;
		}
			// 메모 수정
		public int updateMemo(HashMap<String, Object> params) {
			int result = userDAO.updateMemo(params);
			System.out.println("userServiceImpl 메모 수정 : " + result);
			return result;
		}
			// memo 테이블에서 shelfNum을 포함하는 레코드가 있는지 확인
		public int hasMemoForShelf(HashMap<String, Object> params) {
		    int count = userDAO.countMemoForShelf(params);
		    return count;
		}
		//########################################
		// 나의 캐릭터
			// userId로 userLevel에 따른 캐릭터 정보 조회
		public List<HashMap<String, Object>> getCharactersByUserId(String userId) {
			System.out.println("UserServiceImpl 호출");
			List<HashMap<String, Object>> result = userDAO.getCharactersByUserId(userId);
			System.out.println("UserServiceImpl result값 : " + result);
		    return result;
		}
		
			// 캐릭터 상세
		public Map<String, Object> myCharactersDetail(Map<String, Object> params) {
			System.out.println("myCharactersDetail 서비스 호출");
			Map<String, Object> result = userDAO.myCharactersDetail(params);
			System.out.println("myCharactersDetail 서비스 반환값 : " + result);
			return result;
		}

		//#########################################
	//리그 명단 불러오기
	public List<BookshelfVO> usersReadRank(){
		return userDAO.usersReadRank();
	}
	
	 //########################################
     //나의 통계

     private final BookshelfDAO bookshelfDAO;

     @Override
     public List<BookshelfVO> readStatus(BookshelfVO vo, HttpSession session) {
         vo.setUserNum((Integer) session.getAttribute("userNum"));
         return bookshelfDAO.checkBookStatus(vo);
     }

    //########################################
    //나의 정보 수정
    @Override
    public UserVO getUserById(String userId) {
        UserVO result = userDAO.getUserById(userId);
        return result;
    }

    @Override
    public void updateUserInfo(UserVO userVO) {
        userDAO.updateUserInfo(userVO);
    }

    @Override
    public UserStatVO getUserStatInfo(UserStatVO userStatVO) {

        return userDAO.getUserStatInfo(userStatVO);

    }

}

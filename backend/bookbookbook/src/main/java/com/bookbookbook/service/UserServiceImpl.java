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

    //전화번호 중복 확인
    @Override
    public boolean isTelDuplicate(String userTel) {
        boolean result = userDAO.existsByUserTel(userTel) > 0;
        System.out.println("Checking tel in service: " + userTel + ", isDuplicate: " + result);  // 디버깅용
        return result;
    }
    
    // ###############화면 통계
    private final BookshelfDAO bookshelfDAO;
    

    
    // 로그인 실패 횟수 및 SMS 서비스 주입
    @Autowired
    private LoginAttemptService loginAttemptService;

    @Autowired
    private CoolSmsService coolSmsService;

   
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
    public Map<String, Object> loginUser(String userId, String password) {
        Map<String, Object> result = new HashMap<>();
        log.debug("Attempting login for userId: {}", userId);

        try {
            if (loginAttemptService.isBlocked(userId)) {
                log.warn("Login blocked for userId: {}", userId);
                result.put("success", false);
                result.put("blocked", true);
                result.put("message", "계정이 잠겼습니다. SMS로 발송된 임시 코드를 입력하세요.");
                return result;
            }

            UserVO user = userDAO.loginUser(userId);
            log.debug("User retrieved from database: {}", user);

            if (user == null) {
                log.warn("No user found for userId: {}", userId);
                loginAttemptService.loginFailed(userId);
                int attempts = loginAttemptService.getAttempts(userId);
                int remainingAttempts = loginAttemptService.getMaxAttempt() - attempts;
                result.put("success", false);
                result.put("message", String.format("아이디 또는 비밀번호가 일치하지 않습니다. "
                		+ "<br> 남은 시도 횟수: %d회", remainingAttempts));
                result.put("remainingAttempts", remainingAttempts);
                return result;
            }

            if ("Y".equals(user.getBanStatus())) {
                log.info("Banned user attempt to login: {}", userId);
                result.put("success", false);
                result.put("message", "강퇴된 회원입니다.");
                return result;
            }

            if ("Y".equals(user.getQuitStatus())) {
                log.info("Quit user attempt to login: {}", userId);
                result.put("success", false);
                result.put("message", "탈퇴한 회원입니다.");
                return result;
            }

            if (!passwordEncoder.matches(password, user.getPassword())) {
            	 log.warn("Password mismatch for userId: {}", userId);
            	    loginAttemptService.loginFailed(userId);
            	    int attempts = loginAttemptService.getAttempts(userId);
            	    int remainingAttempts = loginAttemptService.getMaxAttempt() - attempts;
            	    log.debug("Attempts: {}, Max Attempts: {}", attempts, loginAttemptService.getMaxAttempt());
                
                if (attempts >= loginAttemptService.getMaxAttempt()) {
                    log.warn("Account locked due to too many failed attempts: {}", userId);
                    String tempCode = generateTempCode();
                    log.debug("TempCode generated: {}", tempCode);
                    userDAO.updateTempCode(user.getUserId(), tempCode);
                    
                    String subject = "로그인 실패 알림";
                    String text = "5회 연속 로그인에 실패하여 계정이 잠겼습니다. SMS로 발송된 임시 코드를 확인해 주세요.";
                    emailService.sendSimpleMessage(user.getUserId(), subject, text);
                    
                    coolSmsService.sendSms(user.getUserTel(), "BOOKBOOKBOOK 임시 코드: " + tempCode);
                    
                    result.put("success", false);
                    result.put("blocked", true);
                    result.put("message", "5회 연속 로그인 실패로 계정이 잠겼습니다. SMS로 발송된 임시 코드를 입력하세요.");
                } else {
                    result.put("success", false);
                    result.put("message", String.format("아이디 또는 비밀번호가 일치하지 않습니다. "
                    		+ "<br> 남은 시도 횟수: %d회", remainingAttempts));
                    result.put("remainingAttempts", remainingAttempts);
                }
                return result;
            }

            // 로그인 성공
            log.info("Successful login for userId: {}", userId);
            loginAttemptService.loginSucceeded(userId);
            result.put("success", true);
            result.put("user", user);
        } catch (Exception e) {
            log.error("Error occurred during login process for userId: {}", userId, e);
            result.put("success", false);
            result.put("message", "로그인 처리 중 오류가 발생했습니다. 관리자에게 문의해주세요.");
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
    
    
    @Override
    public boolean verifyTempCode(String userId, String tempCode) {
        try {
            UserVO user = userDAO.loginUser(userId);
            if (user != null && user.getTempCode() != null && user.getTempCode().equals(tempCode)) {
                userDAO.clearTempCodeAndAttempts(userId);
                loginAttemptService.resetAttempts(userId);
                log.info("Temp code verified successfully for user: {}. TempCode and attempts reset.", userId);
                return true;
            }
            log.warn("Temp code verification failed for user: {}", userId);
            return false;
        } catch (Exception e) {
            log.error("Error verifying temp code for user: {}", userId, e);
            throw e;
        }
    }

    private String generateTempCode() {
        Random random = new Random();
        return String.format("%06d", random.nextInt(1000000));
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
			System.out.println("서비스임플 getMemoDetailByMemoNum 실행 : " + params);
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
	//리그 책목록 불러오기
	public List<BookshelfVO> getBooksByUserId(String userId){
		return userDAO.getBooksByUserId(userId);
	}
	 //########################################
    //나의통계화면
    @Override
    public List<BookshelfVO> readStatus(BookshelfVO vo, HttpSession session) {
        vo.setUserNum((Integer) session.getAttribute("userNum")); //getAttribute 메소드는 반환 타입이 Object이므로, 이를 String 타입으로 변환하여 BookshelfVO 객체의 userNum 필드에 설정
        return bookshelfDAO.checkBookStatus(vo);
    }

    //########################################
    //나의 정보 수정

    @Override
    public UserVO getUserById(String userId) {
        // 사용자 ID로 사용자 정보 조회
        UserVO result = userDAO.getUserById(userId);
        return result;
    }

    @Override  // 사용자 정보 업데이트
    public void updateUserInfo(UserVO userVO) {
        userDAO.updateUserInfo(userVO);
    }
    
    @Override // 사용자 통계 정보 조회
    public UserStatVO getUserStatInfo(UserStatVO userStatVO) {

        return userDAO.getUserStatInfo(userStatVO);

    }

    
    //###################################################
    //소셜 로그인 관련
    @Override
    public UserVO findByEmail(String email) {
    	UserVO user = userDAO.findByEmail(email);
    	return user;
    }
    
	@Override
	public void updateGoogleStatus(String email) {
		userDAO.updateGoogleStatus(email);
	}

	@Override
	public void updateNaverStatus(String email) {
		userDAO.updateNaverStatus(email);
		
	}

}
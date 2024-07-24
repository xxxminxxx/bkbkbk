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

import com.bookbookbook.dao.UserDAO;
import com.bookbookbook.domain.CalendarVO;
import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserVO;

@Service
public class UserServiceImpl implements UserService{
	 // 로깅을 위한 Logger 설정
    private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    // 의존성 주입을 위한 UserDAO와 PasswordEncoder 선언
    private final UserDAO userDAO;
    private final PasswordEncoder passwordEncoder;

    // 이메일 서비스 주입
    @Autowired
    private EmailService emailService;
    
    // UserDAO와 PasswordEncoder를 주입받는 생성자
    public UserServiceImpl(UserDAO userDAO, PasswordEncoder passwordEncoder) {
        this.userDAO = userDAO;
        this.passwordEncoder = passwordEncoder;
    }

    // 사용자 등록 메서드
    public void registerUser(UserVO userVO) {
        // 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(userVO.getPassword());
        userVO.setPassword(encodedPassword);
        // DAO를 통해 사용자 등록
        userDAO.registerUser(userVO);
    }
    
    // 사용자 로그인 메서드
    public UserVO loginUser(String userId, String password) {
        // DAO를 통해 사용자 정보 조회
        UserVO user = userDAO.loginUser(userId);
        // 사용자 존재 여부와 비밀번호 일치 여부 확인
        if (user != null && passwordEncoder.matches(password, user.getPassword())) {
        	//System.out.println(passwordEncoder.matches(password, user.getPassword()));
            return user;
        }
        return null;
    }
    
    // 이메일 찾기 메서드
    public String findEmail(String userName, String userTel) {
        return userDAO.findEmail(userName, userTel);
    }
    
    // 비밀번호 찾기 및 재설정 메서드
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
    
    //########################################
    //채팅
	public void submitReport(ReportVO vo) {
		userDAO.submitReport(vo);
	}
	//########################################
	// 나의 달력
		// 메모 정보 조회
	public List<HashMap<String, Object>> getMemosAtCalendar(String userId){
		List<HashMap<String, Object>> result = userDAO.getMemosAtCalendar(userId);
		System.out.println("userServiceImpl 메모 정보 조회 : " + result);
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

}

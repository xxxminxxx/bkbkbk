package com.bookbookbook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bookbookbook.dao.UserDAO;
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
        userVO.setPassword(encodedPassword);
        // DAO를 통해 사용자 등록
        userDAO.registerUser(userVO);
    }
    
    
    
    
    // 회원가입 이메일 중복확인 메서드
    @Override
    public boolean isEmailDuplicate(String email) {
        return userDAO.existsByUserId(email) > 0;
    }
    
    // 사용자 로그인 메서드
    @Override
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
    
    //########################################
    //채팅
    @Override
    public void submitReport(ReportVO vo) {
        userDAO.submitReport(vo);
    }
}
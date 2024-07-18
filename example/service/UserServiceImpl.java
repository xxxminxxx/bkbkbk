package com.example.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.example.dao.UserDAO;
import com.example.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {
	 private static final Logger log = 
			 LoggerFactory.getLogger(UserServiceImpl.class);

    private final UserDAO userDAO;
    
    private final PasswordEncoder passwordEncoder;

    @Autowired
    private EmailService emailService;
    
    
    @Autowired
    public UserServiceImpl(UserDAO userDAO, PasswordEncoder passwordEncoder) {
        this.userDAO = userDAO;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void registerUser(UserVO userVO) {
        // 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(userVO.getPassword());
        userVO.setPassword(encodedPassword);
        
        userDAO.registerUser(userVO);
    }
    
    
    @Override
    public UserVO loginUser(String userId, String password) {
        UserVO user = userDAO.loginUser(userId);
        if (user != null && passwordEncoder.matches(password, user.getPassword())) {
            return user;
        }
        return null;
    }
    
    @Override
    public String findEmail(String userName, String userTel) {
        return userDAO.findEmail(userName, userTel);
    }
    
    
    @Override
    public boolean findAndResetPassword(String userName, String userId, String userTel) {
        UserVO user = userDAO.findUserByNameIdAndTel(userName, userId, userTel);
        if (user != null) {
            String tempPassword = generateTempPassword();
            String encodedPassword = passwordEncoder.encode(tempPassword);
            userDAO.updatePassword(user.getUserId(), encodedPassword);

            String subject = "BOOKBOOKBOOK 임시 비밀번호 안내";
            String text = "안녕하세요 " + userName + "님,\n\n"
                        + "귀하의 임시 비밀번호는 " + tempPassword + " 입니다.\n"
                        + "보안을 위해 로그인 후 비밀번호를 바꿔주세요.\n\n"
                        + "감사합니다."
                        + "-BOOKBOOKBOOK-";
            
            try {
                emailService.sendSimpleMessage(user.getUserId(), subject, text);
                return true;
            } catch (Exception e) {
                log.error("Failed to send email", e);
                return false;
            }
        }
        return false;
    }
    
    
    @Override
    public boolean isEmailDuplicate(String email) {
        return userDAO.existsByUserId(email) > 0;
    }
    
    
    @Override
    public boolean isDuplicateUser(String userId, String userTel) {
        return userDAO.checkDuplicateUser(userId, userTel) > 0;
    }


    private String generateTempPassword() {
        String upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerAlphabet = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        
        String allChars = upperAlphabet + lowerAlphabet + numbers;
        Random random = new Random();
        StringBuilder password = new StringBuilder();

        // 비밀번호 길이를 12로 설정
        for (int i = 0; i < 12; i++) {
            int index = random.nextInt(allChars.length());
            password.append(allChars.charAt(index));
        }
        
        
        return password.toString();
    }
    
    

    
}
package com.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.UserDAO;
import com.example.domain.UserVO;
import com.example.service.UserService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserDAO user;
	
	
	@RequestMapping("/signup")
	public String signupUser() {
	
		return "signup";
		
	}
	
	@RequestMapping("/register")
	public String doUser(HttpServletRequest req, Model model) {
		String userId = req.getParameter("userid");
		String userPassword = req.getParameter("userPassword");
		String userName = req.getParameter("userName");
		String userTelNum = req.getParameter("userTel");
		String gender = req.getParameter("gender");
		String birthDate = req.getParameter("birthDate");
		
        // UserVO 객체 생성 , 데이터 장입
        UserVO userVO = new UserVO();
        userVO.setUserId(userId);
        userVO.setPassword(userPassword);
        userVO.setUserName(userName);
        userVO.setUserTel(userTelNum);
        userVO.setGender(gender);
        userVO.setBirthDate(birthDate);

        //회원가입 처리
        int result = userService.registerUser(userVO);

        // 결과 처리 및 성공/실패시 리다이렉트
        if (result > 0) {
            model.addAttribute("message", "회원가입이 성공적으로 완료되었습니다.");
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "회원가입에 실패했습니다. 다시 시도해 주세요.");
            return "register"; // 회원가입 페이지로 돌아가기
        }
    
	}

}


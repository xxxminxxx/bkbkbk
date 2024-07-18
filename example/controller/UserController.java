package com.example.controller;

import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.UserVO;
import com.example.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class UserController {
	 private static final Logger log = 
			 LoggerFactory.getLogger(UserController.class);

    private final UserService userService;
    

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
    
    

    @PostMapping("/register")
    public String registerUser(@ModelAttribute UserVO userVO, RedirectAttributes redirectAttributes) {
        if (userService.isDuplicateUser(userVO.getUserId(), userVO.getUserTel())) {
            redirectAttributes.addFlashAttribute("errorMessage", "이미 동일인으로 가입이 되어있습니다.");
            return "redirect:/pages/page-signup";
        } else {
            try {
                userService.registerUser(userVO);
                return "redirect:/pages/page-signup-success";
            } catch (Exception e) {
                redirectAttributes.addFlashAttribute("errorMessage", "회원가입 중 오류가 발생했습니다.");
                return "redirect:/pages/page-signup";
            }
        }
    }
    
    @GetMapping("/pages/page-signup-success")
    public String signUpSuccess() {
        return "pages/page-signup-success";
    }

    @PostMapping("/pages/login")
    @ResponseBody
    public Map<String, Object> login(@RequestBody UserVO userVO, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        UserVO user = userService.loginUser(userVO.getUserId(), userVO.getPassword());
        if (user != null) {
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getUserName());
            response.put("success", true);
            response.put("message", "로그인 성공");
        } else {
            response.put("success", false);
            response.put("message", "아이디 또는 비밀번호가 올바르지 않습니다.");
        }
        return response;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/main";  // main 페이지로 리다이렉트
    }
    
    
    @PostMapping("/find-email")
    @ResponseBody
    public Map<String, Object> findEmail(@RequestBody Map<String, String> request) {
        Map<String, Object> response = new HashMap<>();
        String userName = request.get("userName");
        String userTel = request.get("userTel");
        
        if (userName == null || userTel == null) {
            response.put("success", false);
            response.put("message", "이름과 전화번호를 모두 입력해주세요.");
            return response;
        }
        
        String email = userService.findEmail(userName, userTel);
        if (email != null) {
            response.put("success", true);
            response.put("email", email);
        } else {
            response.put("success", false);
            response.put("message", "일치하는 사용자를 찾을 수 없습니다.");
        }
        return response;
    }

    @GetMapping("/find-email")
    public String emailReturnPage() {
        return "pages/page-find-email";
    }
    
//     이메일 중복 실시간 체크 
    @PostMapping("/check-email")
    @ResponseBody
    public String checkEmail(@RequestParam String email) {
        boolean isDuplicate = userService.isEmailDuplicate(email);
        return isDuplicate ? "duplicate" : "ok";
    }

    
    
    @PostMapping("/find-password")
    @ResponseBody
    public Map<String, Object> findPassword(@RequestBody Map<String, String> request) {
        Map<String, Object> response = new HashMap<>();
        String userName = request.get("userName");
        String userId = request.get("userId");
        String userTel = request.get("userTel");

        boolean isSuccess = userService.findAndResetPassword(userName, userId, userTel);
        if (isSuccess) {
            response.put("success", true);
            response.put("message", "임시 비밀번호가 이메일로 전송되었습니다. 로그인 페이지로 이동합니다.");
        } else {
            response.put("success", false);
            response.put("message", "비밀번호 재설정에 실패했습니다. 입력 정보를 확인해주세요.");
        }
        return response;
    }
    
    
}





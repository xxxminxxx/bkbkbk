package com.bookbookbook.controller;

import com.bookbookbook.domain.*;
import com.bookbookbook.service.UserService;
import com.bookbookbook.service.UserStatService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class UserStatController {
	// 로거 설정
	private static final Logger log = LoggerFactory.getLogger(UserStatController.class);


	private final UserService userService;
	private final UserStatService userStatService;

	// 사용자 등록 요청을 처리하는 메서드
	@GetMapping("/pages/user-myStat")
	public String userStat(@ModelAttribute UserStatVO userStatVO, HttpSession session, Model model) {

		//로그인한 userId
		userStatVO.setUserId((String) session.getAttribute("userId"));
		if(userStatVO.getUserId() == null){
			log.info("로그인이 안되어 있어서 로그인으로 이동");
			return "redirect:/pages/login";
		}
		//bookshelf 쓸 userNum 뽑아오기
		UserVO userVO = userService.getUserById(String.valueOf(userStatVO.getUserId()));
		userStatVO.setUserNum(userVO.getUserNum());
		//끝


		//권수별 통계
		List<UserStatVO> userStatVO1= userStatService.getUserStatInfo1(userStatVO);
		//페이지별 통계
		List<UserStatVO> userStatVO2= userStatService.getUserStatInfo2(userStatVO);

		
		model.addAttribute("userStatVO", userStatVO1);
		model.addAttribute("userStatVO2", userStatVO2);
		log.info("로그인 되있어서 나의 통계로 이동");
	    return "pages/user-myStat";


	}


}

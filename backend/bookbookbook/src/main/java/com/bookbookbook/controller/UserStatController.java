package com.bookbookbook.controller;

import com.bookbookbook.domain.*;
import com.bookbookbook.service.UserService;
import com.bookbookbook.service.UserStatService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class UserStatController {

	private final UserService userService;
	private final UserStatService userStatService;

	// 사용자 통계 페이지를 처리하는 메서드
	@GetMapping("/pages/user-myStat")
	public String userStat(@ModelAttribute UserStatVO userStatVO, HttpSession session, Model model,
						   @RequestParam(value ="bookYear",required = false) String bookYear,
						   @RequestParam(value =  "bookMonth",required = false) String bookMonth
	) {

		// 로그인한 사용자 ID 가져오기
		userStatVO.setUserId((String) session.getAttribute("userId"));
		if(userStatVO.getUserId() == null){
			return "redirect:/pages/login";
		}

		// 사용자 번호(userNum) 가져오기
		UserVO userVO = userService.getUserById(String.valueOf(userStatVO.getUserId()));
		userStatVO.setUserNum(userVO.getUserNum());

		// 년도와 월 설정
		userStatVO.setBookYear(bookYear);
		userStatVO.setBookMonth(bookMonth);

		//페이지별 통계 조회
		List<UserStatVO> userStatVO1= userStatService.getUserStatInfo1(userStatVO);
		//권수별 통계 조회
		List<UserStatVO> userStatVO2= userStatService.getUserStatInfo2(userStatVO);

		model.addAttribute("userStatVO", userStatVO1);
		model.addAttribute("userStatVO2", userStatVO2);
	    return "pages/user-myStat";


	}


}
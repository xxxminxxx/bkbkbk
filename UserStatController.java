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
//필수 필드에 대한 생성자를 자동으로 생성 (Lombok 어노테이션)
@RequiredArgsConstructor
public class UserStatController {

	// 로깅을 위한 Logger 객체를 생성
	private static final Logger log = LoggerFactory.getLogger(UserStatController.class);

	// 생성자 주입을 통해 서비스 객체들을 주입받기
	private final UserService userService;
	private final UserStatService userStatService;


	//GET 요청으로 나의 통계('/pages/user-myStat') 경로에 접근했을 때 처리하는 메서드입
	@GetMapping("/pages/user-myStat")
	public String userStat(@ModelAttribute UserStatVO userStatVO, HttpSession session, Model model) {

		//로그인한 userId (세션에서 로그인한 사용자의 ID를 가져와 UserStatVO 객체에 설정)
		userStatVO.setUserId((String) session.getAttribute("userId"));

		//나의 서재(bookshelf)에서 쓸 userNum 뽑아오기 (사용자 ID를 이용해 사용자 정보를 조회하고, 사용자 번호를 UserStatVO 객체에 설정)
		UserVO userVO = userService.getUserById(String.valueOf(userStatVO.getUserId()));
		userStatVO.setUserNum(userVO.getUserNum());

		//권수별 통계 정보를 조회
		List<UserStatVO> userStatVO1= userStatService.getUserStatInfo1(userStatVO);
		//페이지별 통계 정보를 조회
		List<UserStatVO> userStatVO2= userStatService.getUserStatInfo2(userStatVO);


		// 조회한 통계 정보를 모델에 추가
		model.addAttribute("userStatVO", userStatVO1);
		model.addAttribute("userStatVO2", userStatVO2);
		// 로그 메시지를 출력
		log.info("로그인 되있어서 나의 통계로 이동");
		//('pages/user-myStat')뷰를 반환
	    return "pages/user-myStat";

	}

}

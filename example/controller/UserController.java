package com.bookbookbook.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.service.NaverLoginService;
import com.bookbookbook.service.UserService;

import jakarta.servlet.http.HttpSession;
import reactor.core.publisher.Mono;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class UserController {
	// 로거 설정
	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	// UserService 인스턴스를 위한 필드 선언
	private final UserService userService;

	// UserService 인스턴스를 주입받기 위한 생성자
	@Autowired
	public UserController(UserService userService) {
	    this.userService = userService;
	}
	
	@GetMapping("/login")
	public String loginPage(HttpSession session) {
		 if (session.getAttribute("userId") != null) {
		        return "redirect:/"; // 이미 로그인한 경우 메인 페이지로 리다이렉트
		    }
		    return "pages/user-login";
	}
	

	// 사용자 회원가입 요청을 처리하는 메서드
	@PostMapping("/register")
	@ResponseBody
	public ResponseEntity<?> registerUser(@RequestBody UserVO userVO, HttpSession session) {
		//  HTTP 응답 처리
	    try {
	        userService.registerUser(userVO);
	        //회원가입 성공 후 세션에 회원 정보를 저장함
	        session.setAttribute("user", userVO);
	        return ResponseEntity.ok().body(Map.of("success", true, "message", "회원가입이 성공적으로 완료되었습니다."));
	        // 회원가입 성공 시 성공 메시지를 반환
	    } catch (IllegalArgumentException e) {
	        return ResponseEntity.badRequest().body(Map.of("success", false, "message", e.getMessage()));
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success", false, "message", "회원가입 중 오류가 발생했습니다."));
	        //비밀번호 규칙 위반 유효성 검사 실패 시 발생하는 예외를 처리
	    }
	    
	}

	/*
	 * // 회원가입 성공 페이지 요청을 처리하는 메서드
	 * 
	 * @GetMapping("/pages/page-signup-") public String signUpSuccess() { //
	 * 회원가입 성공 JSP 페이지 반환 return "pages/user-login"; }
	 */
	

	//  이메일 중복 실시간 체크 
	@PostMapping("/check-email")
	@ResponseBody
	public String checkEmail(@RequestParam String email) {
		boolean isDuplicate = userService.isEmailDuplicate(email);
		return isDuplicate ? "duplicate" : "ok";
	}


	// 로그인 요청을 처리하는 메서드
	@PostMapping("/pages/login")
	@ResponseBody
	public Map<String, Object> login(@RequestBody UserVO userVO, HttpSession session) {
	    Map<String, Object> response = userService.loginUser(userVO.getUserId(), userVO.getPassword());
	    if ((Boolean) response.get("success")) {
	        UserVO user = (UserVO) response.get("user");
	        session.setAttribute("userId", user.getUserId());
	        session.setAttribute("userName", user.getUserName());
	    }
	    return response;
	}

	// 로그아웃 요청을 처리하는 메서드
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    // 세션 무효화
	    session.invalidate();
	    // 메인 페이지로 리다이렉트
	    return "redirect:/";
	}
	
	// 구글 로그인 성공시 
	 @GetMapping("/loginSuccess")
	    public String loginSuccess(OAuth2AuthenticationToken authentication) {
	        OAuth2User oauth2User = authentication.getPrincipal();
	        String email = oauth2User.getAttribute("email");
	        // 필요한 경우 추가 처리
	        return "redirect:/";
	    }

	// 이메일 찾기 요청을 처리하는 메서드
	@PostMapping("/find-email")
	@ResponseBody
	public Map<String, Object> findEmail(@RequestBody Map<String, String> request) {
	    // 응답 데이터를 담을 맵 생성
	    Map<String, Object> response = new HashMap<>();
	    String userName = request.get("userName");
	    String userTel = request.get("userTel");
	    // 사용자 이름과 전화번호가 입력되지 않은 경우
	    if (userName == null || userTel == null) {
	        response.put("success", false);
	        response.put("message", "이름과 전화번호를 모두 입력해주세요.");
	        return response;
	    }
	    // UserService를 통해 이메일 찾기 처리
	    String email = userService.findEmail(userName, userTel);
	    if (email != null) {
	        // 이메일 찾기 성공 응답 설정
	        response.put("success", true);
	        response.put("email", email);
	    } else {
	        // 이메일 찾기 실패 응답 설정
	        response.put("success", false);
	        response.put("message", "일치하는 사용자를 찾을 수 없습니다.");
	    }
	    // 응답 반환
	    return response;
	}

	// 이메일 찾기 페이지 요청을 처리하는 메서드
	@GetMapping("/find-email")
	public String emailReturnPage() {
	    return "pages/user-findEmail";
	}

	// 비밀번호 찾기 요청을 처리하는 메서드
	@PostMapping("/find-password")
	@ResponseBody
	public Map<String, Object> findPassword(@RequestBody Map<String, String> request) {
	    // 응답 데이터를 담을 맵 생성
	    Map<String, Object> response = new HashMap<>();
	    String userName = request.get("userName");
	    String userId = request.get("userId");
	    String userTel = request.get("userTel");
	    // UserService를 통해 비밀번호 찾기 및 재설정 처리
	    boolean isSuccess = userService.findAndResetPassword(userName, userId, userTel);
	    if (isSuccess) {
	        // 비밀번호 재설정 성공 응답 설정
	        response.put("success", true);
	        response.put("message", "임시 비밀번호가 이메일로 전송되었습니다. 로그인 페이지로 이동합니다.");
	    } else {
	        // 비밀번호 재설정 실패 응답 설정
	        response.put("success", false);
	        response.put("message", "비밀번호 재설정에 실패했습니다. 입력 정보를 확인해주세요.");
	    }
	    // 응답 반환
	    return response;
	}
	
	
	 // 회원가입 후 회원의 선호 목록 받아오기
	@PostMapping("/updateUserPreferences")
	public String updateUserPreferences(
	    @RequestParam(value="interest", required=false) String[] interests,
	    @RequestParam(value="address", required=false) String address,
	    @RequestParam(value="userId", required=true) String userId) {
	    
	    UserVO user = userService.findUserByEmail(userId);
	    if (user != null) {
	        String interestHobby = interests != null ? String.join(",", interests) : null;
	        user.setInterestHobby(interestHobby);
	        user.setAddress(address);
	        
	        userService.updateUserPreferences(user);
	        return "redirect:/";
	    } else {
	        return "redirect:/login";
	    }
	}
	
	
	
	
	//#####################################
	//채팅 신고기능
	  @PostMapping("/submitReport")
	    @ResponseBody
		public void submitReport(@ModelAttribute ReportVO vo) {
			userService.submitReport(vo);
		}

	  //###################################
	  //나의 정보 
		@GetMapping("/pages/user-myStat")
		public String myStat() {
			System.out.println("user-myStat호출");
			return "pages/user-myStat";
		}
   //######################################
   //나의 리그
	@GetMapping("/pages/user-myLeague")
	public String myLeague() {
		System.out.println("user-myLeague호출");
		return "pages/user-myLeague";
	}
	
	//#######################################
	//도서 검색 결과
	@GetMapping("/pages/book-bookSearchResult")
	public String bookSearchResult() {
		System.out.println("book-bookSearchResult 호출");
		return "pages/book-bookSearchResult";
	}
	
	//#######################################
	//도서 상세 페이지 
	@GetMapping("/pages/book-bookDetails")
	public String bookDetail() {
		System.out.println("book-bookDetails 호출");
		return "pages/book-bookDetails";
	}
	
	//#######################################
		//나의 달력
	@GetMapping("/pages/user-myCalendar")
	public String myCalendar() {
		System.out.println("user-myCalendar 호출");
		return "pages/user-myCalendar";
	}
	
	//#######################################
		//나의 메모
	@GetMapping("/pages/user-myMemo")
	public String myMemo() {
		System.out.println("user-myMemo 호출");
		return "pages/user-myMemo";
	}
	@GetMapping("/pages/user-myMemoDetail")
	public String myMemoDetail() {
		System.out.println("user-myMemoDetail 호출");
		return "pages/user-myMemoDetail";
	}

}

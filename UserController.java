package com.bookbookbook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookbookbook.domain.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookbookbook.service.UserService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {
	// 로거 설정
	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	// UserService 인스턴스를 위한 필드 선언
	private final UserService userService;

	private final PasswordEncoder passwordEncoder;

	// UserService 인스턴스를 주입받기 위한 생성자
	@Autowired
	public UserController(UserService userService, PasswordEncoder passwordEncoder) {
		this.userService = userService;
		this.passwordEncoder = passwordEncoder;
	}

	// 사용자 등록 요청을 처리하는 메서드
	@PostMapping("/register")
	public String registerUser(@ModelAttribute UserVO userVO) {
	    // UserService를 통해 사용자 등록 처리
	    userService.registerUser(userVO);
	    // 회원가입 성공 후 성공 페이지로 리다이렉트
	    return "redirect:/pages/user-login";
	}

	/*
	 * // 회원가입 성공 페이지 요청을 처리하는 메서드
	 * 
	 * @GetMapping("/pages/page-signup-success") public String signUpSuccess() { //
	 * 회원가입 성공 JSP 페이지 반환 return "pages/user-login"; }
	 */

	// 로그인 요청을 처리하는 메서드
	@PostMapping("/pages/login")
	@ResponseBody
	public Map<String, Object> login(@RequestBody UserVO userVO, HttpSession session) {
	    // 응답 데이터를 담을 맵 생성
	    Map<String, Object> response = new HashMap<>();
	    // UserService를 통해 사용자 인증 처리
	    UserVO user = userService.loginUser(userVO.getUserId(), userVO.getPassword());
	    if (user != null) {
	        // 세션에 사용자 정보 저장
	        session.setAttribute("userId", user.getUserId());
	        session.setAttribute("userName", user.getUserName());
	        // 로그인 성공 응답 설정
	        response.put("success", true);
	        response.put("message", "로그인 성공");
	    } else {
	        // 로그인 실패 응답 설정
	        response.put("success", false);
	        response.put("message", "아이디 또는 비밀번호가 올바르지 않습니다.");
	    }
	    // 응답 반환
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


	//#######################################
	// 도서 위치 찾기
	@GetMapping("/pages/book-findLocatoin")
	public String location() {
		System.out.println("findLocation 호출");
		return "pages/book-findLocatoin";
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
		// 페이지 연결
	@GetMapping("/pages/user-myCalendar")
	public String myCalendar() {
		System.out.println("user-myCalendar 호출");
		return "pages/user-myCalendar";
	}
/*
	@GetMapping("/pages/user-myCalendar")
	public String myCalendar(HttpSession session, Model m) {
		System.out.println("user-myCalendar 호출");
		

		 * String userId = (String) session.getAttribute("userId");
		 * 
		 * List<HashMap<String, Object>> memoList =
		 * userService.getMemosAtCalendar(userId);
		 * 
		 * System.out.println("userController getMemosAtCalendar memoList : " +
		 * memoList);


		// m.addAttribute("memoList", memoList);
		
		return "pages/user-myCalendar";
	}
*/
		// 출석체크 데이터베이스에 저장
	@PostMapping("/calendar/checkAttendance")
    public ResponseEntity<?> checkAttendance(HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        System.out.println("userController checkAttendance 호출");
        
        boolean result = userService.markAttendance(userId);
        System.out.println("UserController 출석체크 데이터베이스 저장 result값 : " + result);
        
        if (result) {
            return ResponseEntity.ok("success");
        } 
        else {
            return ResponseEntity.ok("alreadyChecked");
        }
    }
		// 데이터베이스에서 출석 정보 조회
	@GetMapping("/calendar/getAttendance")
	public ResponseEntity<?> getAttendance(HttpSession session) {
		System.out.println("userController getAttendance 호출");
		
	    String userId = (String) session.getAttribute("userId");
	    
	    List<CalendarVO> attendanceList = userService.getAttendanceList(userId);
	    
	    System.out.println("userController getAttendance attendanceList : " + attendanceList);
	    
	    return ResponseEntity.ok().body(Map.of("attendanceList", attendanceList));
	}

		// 데이터베이스에서 작성한 메모 조회
	@GetMapping("/calendar/getMemos")
	public List<HashMap<String, Object>> getMemosAtCalendar(HttpSession session, Model m) {
		System.out.println("userController getMemosAtCalendar 호출");
		
		String userId = (String) session.getAttribute("userId");
		
		List<HashMap<String, Object>> memoList = userService.getMemosAtCalendar(userId);
		
		System.out.println("userController getMemosAtCalendar memoList : " + memoList);
		
		return memoList;
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

	//#######################################
	// 나의 캐릭터
		// myCharacters 페이지
	@GetMapping("/pages/user-myCharacters")
	public String myCharacters(HttpSession session, Model m) {
		System.out.println("user-myCharacters 호출");
		// 세션의 userId 값 
	    String userId = (String)session.getAttribute("userId");

	    // 로그인을 한 경우
	    if (userId != null) {
	    	System.out.println("로그인 성공");
	    	// userId로 userLevel에 따른 캐릭터 정보 조회
	    		// UserVO, CharactersVO가 있는 HashMap
	        List<HashMap<String, Object>> result = userService.getCharactersByUserId(userId);
	        System.out.println("HashMap : " + result);
	        // 조회한 정보가 있는 경우
	        if (!result.isEmpty()) {
	        	System.out.println("캐릭터 정보 조회 성공");
	        	Integer userLevel = (Integer) result.get(0).get("userLevel");
	        	
	        	System.out.println("myCharacters 컨트롤러 사용자 레벨 : " + userLevel);
	            System.out.println("myCharacters 컨트롤러 사용자 캐릭터 : " + result);
	            
	            m.addAttribute("userLevel", userLevel);
	            m.addAttribute("characters", result);
	        }
	    }
		return "pages/user-myCharacters";
	}
	
		// myCharactersDetail 페이지
	@GetMapping("/pages/user-myCharactersDetail")
	public String myCharactersDetail(@RequestParam("stage") Integer stage, Model m, HttpSession session) {
		System.out.println("user-myCharactersDetail 호출, stage : " + stage);
		
		// userLevel 얻어오기 위해 userId 변수 생성
		String userId = (String) session.getAttribute("userId");
		
		// userId, stage를 hashMap으로 한번에
		Map<String, Object> params = new HashMap<>();
	    params.put("stage", stage);
	    params.put("userId", userId);
	    
	    // userLevel과 캐릭터 정보 조회
	    Map<String, Object> result = userService.myCharactersDetail(params);
	    
	    // 사용자 레벨 체크
	    Integer userLevel = (Integer) result.get("userLevel");
	    
	    // 요청한 단계가 사용자의 레벨을 초과하는 경우 에러 페이지로 리다이렉트
	    if (stage > userLevel) {
	        return "redirect:/error";
	    }

	    System.out.println("user-myCharactersDetail 반환값 : " + result);

	    m.addAttribute("character", result);

		return "pages/user-myCharactersDetail";
	}

	//#####################################
	//채팅 신고기능
	@PostMapping("/submitReport")
	@ResponseBody
	public void submitReport(@ModelAttribute ReportVO vo) {
		userService.submitReport(vo);
	}

	///#######################################
	//나의 정보 수정
	@GetMapping("pages/user-myInfo")
	public String getUserInfo(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		UserVO user = userService.getUserById(userId);
		model.addAttribute("userId", user.getUserId());
		model.addAttribute("userName", user.getUserName());
		model.addAttribute("userTel", user.getUserTel());
		return "pages/user-myInfo";
	}


	@PostMapping("/pages/modify")
	public String updateUserInfo(@ModelAttribute UserVO uservo, HttpSession session, RedirectAttributes redirectAttributes) {
		String userId = (String) session.getAttribute("userId");
		uservo.setUserId(userId);
		uservo.setPassword(passwordEncoder.encode(uservo.getPassword()));

		userService.updateUserInfo(uservo);
		redirectAttributes.addFlashAttribute("message", "나의 정보 수정이 완료되었습니다");
		return "redirect:/pages/user-myInfo";
	}
	
	//###################################

	@GetMapping("/checkBookStatus")
	@ResponseBody //메소드의 반환값이 HTTP 응답의 본문(body)으로 직렬화
	public List<BookshelfVO> checkBookStatus(@RequestBody BookshelfVO vo, HttpSession session) { //@RequestBody : HTTP 요청의 본문을 메소드의 파라미터로 변환
		return userService.readStatus(vo, session);
	}
}

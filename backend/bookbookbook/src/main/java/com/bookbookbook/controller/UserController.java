package com.bookbookbook.controller;



import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookbookbook.domain.BookshelfVO;
import com.bookbookbook.domain.CalendarVO;
import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.domain.VisitVO;
import com.bookbookbook.service.MainService;
import com.bookbookbook.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



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

	//유저 번호 불러오는 기능
		@Autowired
		private MainService mainService;
		
		@GetMapping("/login")
		public String loginPage(HttpSession session) {
			 if (session.getAttribute("userId") != null) {
			        return "redirect:/"; // 이미 로그인한 경우 메인 페이지로 리다이렉트
			    }
			    return "pages/user-login";
		}
	
		@GetMapping("/pages/login")
		public String loginPage(HttpSession session, HttpServletRequest request) {
		    // 계정 잠금 해제 페이지에서 오는 요청인 경우 허용
		    if (request.getHeader("Referer") != null && request.getHeader("Referer").contains("/pages/unlockAccount")) {
		        return "pages/user-login";
		    }
		    
		    if (session.getAttribute("userId") != null) {
		        return "redirect:/";
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
	        session.setAttribute("user", userVO);
	        System.out.println(">>> user컨트롤러 registerUser 호출: " + userVO);
	        return ResponseEntity.ok().body(Map.of("success", true, "message", "회원가입이 성공적으로 완료되었습니다."));
	        // 회원가입 성공 시 HTTP 상태 코드 200와 함께 성공 메시지를 반환
	    } catch (IllegalArgumentException e) {
	        return ResponseEntity.badRequest().body(Map.of("success", false, "message", e.getMessage()));
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success", false, "message", "회원가입 중 오류가 발생했습니다."));
	        //비밀번호 규칙 위반 유효성 검사 실패 시 발생하는 예외를 처리
	    }
	    
	}

	//로그인 창 불러오기 
	   @GetMapping("/pages/user-signup")
	    public String signupPage(HttpSession session) {
	        if (session.getAttribute("userId") != null) {
	            return "redirect:/";
	        }
	        return "pages/user-signup";
	    }
	/*
	 * // 회원가입 성공 페이지 요청을 처리하는 메서드
	 * 
	 * @GetMapping("/pages/page-signup-success") public String signUpSuccess() { //
	 * 회원가입 성공 JSP 페이지 반환 return "pages/user-login"; }
	 */
	

	//  이메일 중복 실시간 체크 
	@PostMapping("/check-email")
	@ResponseBody
	public String checkEmail(@RequestParam String email) {
		boolean isDuplicate = userService.isEmailDuplicate(email);
		return isDuplicate ? "duplicate" : "ok";
	}
	
	// 휴대전화 중복 실시간 체크
	@PostMapping("/check-tel")
	@ResponseBody
	public String checkTel(@RequestParam String userTel) {
	    boolean isDuplicate = userService.isTelDuplicate(userTel);
	    System.out.println("Checking tel: " + userTel + ", isDuplicate: " + isDuplicate);  // 디버깅용
	    return isDuplicate ? "duplicate" : "ok";
	}


	// 로그인 요청을 처리하는 메서드
			@PostMapping("/pages/login")
			@ResponseBody
			public Map<String, Object> login(@RequestBody UserVO userVO, HttpSession session, HttpServletRequest request) {
			    Map<String, Object> response = new HashMap<>();
			    
			    try {
			        Map<String, Object> result = userService.loginUser(userVO.getUserId(), userVO.getPassword());
			        
			        System.out.println("Login result: " + result);  // 디버깅용 출력
			        
			        if ((Boolean) result.get("success")) {
			            UserVO user = (UserVO) result.get("user");
			            System.out.println("User object type: " + (user != null ? user.getClass().getName() : "null"));  // 디버깅용 출력
			            
			            if (user != null) {
			                // 세션에 사용자 정보 저장
			                session.setAttribute("userId", user.getUserId());
			                session.setAttribute("userNum", user.getUserNum());
			                session.setAttribute("userName", user.getUserName());
			                session.setAttribute("gender", user.getGender());
			                session.setAttribute("ageGroup", determineAgeGroup(user.getBirthDate()));
			                session.setAttribute("location", user.getAddress());

			                // 방문 기록 저장
			                VisitVO visitVO = new VisitVO();
			                visitVO.setVISIT_IP(request.getRemoteAddr());
			                visitVO.setVISIT_TIME(new Date());
			                visitVO.setVISIT_SITE(user.getUserId());
			                visitVO.setVISIT_BROWSER(request.getHeader("User-Agent"));
			                userService.saveVisitLog(visitVO);

			                response.put("success", true);
			                response.put("message", "로그인 성공");
			            } else {
			                throw new RuntimeException("사용자 정보를 찾을 수 없습니다.");
			            }
			        } else {
			            response.put("success", false);
			            response.put("message", result.get("message"));
			            
			            if (result.containsKey("blocked") && (Boolean) result.get("blocked")) {
			                response.put("blocked", true);
			            }
			            
			            if (result.containsKey("remainingAttempts")) {
			                response.put("remainingAttempts", result.get("remainingAttempts"));
			            }
			        }
			    } catch (Exception e) {
			        log.error("로그인 처리 중 오류 발생", e);
			        response.put("success", false);
			        response.put("message", "로그인 처리 중 오류가 발생했습니다.");
			    }
			    
			    System.out.println("ajax값 확인:" + response);
			    return response;
			}
    
    private String determineAgeGroup(String birthDate) {
        // 생년월일을 기준으로 나이대를 결정하는 로직 (예시로 간단히 구현)
        int birthYear = Integer.parseInt(birthDate.substring(0, 4));
        int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
        int age = currentYear - birthYear;

        System.out.println(">>>user 컨트롤러 determineAgeGroup 호출");
        if (age < 20) {
            return "10대";
        } else if (age < 30) {
            return "20대";
        } else if (age < 40) {
            return "30대";
        } else if (age < 50) {
            return "40대";
        } else if (age < 60) {
            return "50대";
        } else {
            return "60대 이상";
        }
    }
		
		
	// 로그아웃 요청을 처리하는 메서드
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    // 세션 무효화
	    session.invalidate();
	    // 메인 페이지로 리다이렉트
	    return "redirect:/";
	}

	// 로그인 잠금 해제 처리 메서드
		@GetMapping("/pages/unlockAccount")
	    public String showUnlockAccountPage() {
	        return "pages/user-unlockAccount";
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
   public String updateUserPreferences(@RequestParam String userId, 
                                       @RequestParam String[] interest, 
                                       HttpSession session, 
                                       RedirectAttributes redirectAttributes) {
       UserVO sessionUser = (UserVO) session.getAttribute("user");

       if (sessionUser != null && sessionUser.getUserId().equals(userId)) {
           // 관심사 배열을 콤마로 구분된 문자열로 변환
           String interestHobby = String.join(",", interest);
           sessionUser.setInterestHobby(interestHobby);
           userService.updateUserPreferences(sessionUser);
           System.out.println(">>> user컨트롤러 updateUserPreferences 호출: " + sessionUser);
           redirectAttributes.addFlashAttribute("message", "선호도가 성공적으로 저장되었습니다.");
       } else {
           redirectAttributes.addFlashAttribute("error", "사용자 정보를 찾을 수 없습니다.");
       }
       
       return "redirect:/"; // 업데이트 후 메인 페이지로 리다이렉트
   }
	
	
	//#####################################
		//채팅 신고기능
		  @PostMapping("/submitReport")
		    @ResponseBody
			public void submitReport(@ModelAttribute ReportVO vo) {
			  String userId=vo.getReportedUser();
			  vo.setReportedUserNum(Integer.parseInt(mainService.getUserId(userId)));
			  userId=vo.getReportUser();
			  vo.setReportUserNum(Integer.parseInt(mainService.getUserId(vo.getReportUser())));
				userService.submitReport(vo);
			}

	  //###################################
	  
   //######################################
   //나의 리그
	@GetMapping("/pages/user-myLeague")
	public String myLeague() {
		System.out.println("user-myLeague호출");
		return "pages/user-myLeague";
	}
	
	
	//#######################################
		//나의 달력
			// 페이지 연결
		@GetMapping("/pages/user-myCalendar")
		public String myCalendar(HttpSession session, Model m) {
			System.out.println("user-myCalendar 호출");
			return "pages/user-myCalendar";
		}
		
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
		public ResponseEntity<?> getMemosAtCalendar(HttpSession session, Model m) {
			System.out.println("userController getMemosAtCalendar 호출");
			
			String userId = (String) session.getAttribute("userId");
			
			List<HashMap<String, Object>> memoList = userService.getMemosAtCalendar(userId);
			
			System.out.println("userController getMemosAtCalendar memoList : " + memoList);
			
			return ResponseEntity.ok().body(Map.of("memoList", memoList));
		} 
			
		//#######################################
		//나의 메모
			// 메모 정보 조회
		@GetMapping("/pages/user-myMemo")
		public String myMemo(HttpSession session, Model m) {
			System.out.println("user-myMemo 호출");
			
			String userId = (String) session.getAttribute("userId");
			
			System.out.println("userId " + userId);
			
			List<HashMap<String, Object>> memoList = userService.getMemosAtMemo(userId);
			
			
			// memoDate 형식 변환
		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		    
		    // memoDate 형변환
		    for (HashMap<String, Object> memo : memoList) {
		        try {
		            Object memoDateObj = memo.get("memoDate");
		            if (memoDateObj instanceof LocalDateTime) {
		                LocalDateTime memoDate = (LocalDateTime) memoDateObj;
		                memo.put("memoDate", memoDate.format(formatter));
		            } else if (memoDateObj instanceof String) {
		                LocalDateTime memoDate = LocalDateTime.parse((String) memoDateObj, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
		                memo.put("memoDate", memoDate.format(formatter));
		            }
		        } catch (Exception e) {
		            System.out.println("날짜 변환 중 오류 발생: " + e.getMessage());
		            // 오류 발생 시 원본 날짜 유지
		        }
		    }
			
			System.out.println("userController getMemosAtMemo memoList : " + memoList);
			
			m.addAttribute("memoList", memoList);
			
			return "pages/user-myMemo";
		} 
		
			// 메모 상세보기
		@GetMapping("/pages/user-myMemoDetail")
		public String myMemoDetail(@RequestParam("shelfNum") Integer shelfNum, 
		                            Model m,
		                            HttpSession session,
		                            RedirectAttributes redirectAttributes) {
		    System.out.println("user-myMemoDetail 호출");
		    System.out.println("shelfNum : " + shelfNum);
		    
		    String userId = (String) session.getAttribute("userId");
		    
		    // userId, shelfNum을 hashMap으로 묶기
		    HashMap<String, Object> params = new HashMap<>();
		    params.put("shelfNum",  shelfNum);
		    params.put("userId", userId);
		    
		    // 메모 수 확인
		    int memoCount = userService.hasMemoForShelf(params);
		    System.out.println("myMemoDetail memoCount : " + memoCount);

		    // 해당 shelfNum에 대한 메모가 없는 경우
		    if (memoCount == 0) {
		        // 메모가 없으면 user-myMemo로 리다이렉트
		        redirectAttributes.addFlashAttribute("message", "해당 책의 메모가 모두 삭제되었습니다.");
		        return "redirect:/pages/user-myMemo";
		    }
		    
		    // 기존 코드 (메모 목록 조회 및 처리)
		    List<HashMap<String, Object>> memoList = userService.getMemoDetailByMemoNum(params);
		    
		    // memoDate 형변환 (연-월-일 시:분:초)
	 		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	 		// startDate, endDate 형변환 (연-월-일)
	 		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	 		
	 		for (HashMap<String, Object> memo : memoList) {
	 	        try {
	 	        	
	 	        	// memoDate 형변환
	 	            Object memoDateObj = memo.get("memoDate");
	 	            if (memoDateObj instanceof LocalDateTime) {
	 	                LocalDateTime memoDate = (LocalDateTime) memoDateObj;
	 	                memo.put("memoDate", memoDate.format(formatter));
	 	            } else if (memoDateObj instanceof String) {
	 	                LocalDateTime memoDate = LocalDateTime.parse((String) memoDateObj, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
	 	                memo.put("memoDate", memoDate.format(formatter));
	 	            }
	 	            
	 	            // startDate 형변환
	 	            Object startDateObj = memo.get("startDate");
	 	            if (startDateObj instanceof LocalDateTime) {
	 	                LocalDateTime startDate = (LocalDateTime) startDateObj;
	 	                memo.put("startDate", startDate.format(dateFormatter));
	 	            } else if (startDateObj instanceof String) {
	 	                LocalDateTime startDate = LocalDateTime.parse((String) startDateObj, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
	 	                memo.put("startDate", startDate.format(formatter));
	 	            }
	 	            
	 	            // endDate 형변환
	 	            Object endDateObj = memo.get("endDate");
	 	            if (endDateObj instanceof LocalDateTime) {
	 	                LocalDateTime endDate = (LocalDateTime) endDateObj;
	 	                memo.put("endDate", endDate.format(dateFormatter));
	 	            } else if (endDateObj instanceof String) {
	 	                LocalDateTime endDate = LocalDateTime.parse((String) endDateObj, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
	 	                memo.put("startDate", endDate.format(formatter));
	 	            }
	 	            
	 	            // readStatus 변환
	 	            String readStatus = (String) memo.get("readStatus");
	 	            if ("Y".equals(readStatus)) {
	 	                memo.put("readStatus", "읽은 책");
	 	            } else {
	 	                memo.put("readStatus", "읽고 있는 책");
	 	            } 
	 	        } catch (Exception e) {
	 	            System.out.println("날짜 변환 중 오류 발생: " + e.getMessage());
	 	            // 오류 발생 시 원본 날짜 유지
	 	        }
	 	    }

	 		System.out.println("userContoller myMemoDetail memo : " + memoList);


		    m.addAttribute("memoDetail", memoList);
		    
		    return "pages/user-myMemoDetail";
		}
		
			// 메모 삭제하기
		@PostMapping("/memoDetail/delete")
		@ResponseBody
		public String  memoDelete(@RequestParam("memoNum") Integer memoNum,
									HttpSession session,
									RedirectAttributes redirectAttributes) {
			System.out.println("userController memoDelete 호출, memoNum = " + memoNum);
			String userId = (String) session.getAttribute("userId");
			
			// userId, shelfNum을 hashMap으로 묶기
			HashMap<String, Object> params = new HashMap<>();
			params.put("memoNum",  memoNum);
			params.put("userId", userId);

			
			try {
		        int result = userService.memoDelete(params);
		        System.out.println("userController memoDelete result : " + result);

		        if (result > 0) {
		            return "success";
		        } else {
		            return "error"; // 삭제된 행이 없는 경우
		        }
		    } catch (Exception e) {
		        System.out.println("메모 삭제 중 오류 발생: " + e.getMessage());
		        return "error";
		    }
		}

			// 메모 수정하기
		@PostMapping("/memoDetail/update")
		@ResponseBody
		public String updateMemo(@RequestParam("memoNum") Integer memoNum,
			        				@RequestParam("memoContent") String memoContent, 
			        				HttpSession session) { 
			System.out.println("userController updateMemo 호출, memoNum = " + memoNum); // 로그 출력
			String userId = (String) session.getAttribute("userId"); // 세션에서 userId 추출
			
			
			System.out.println("userController updateMemo memoNum : " + memoNum);
			System.out.println("userController updateMemo memoContent : " + memoContent);
			
			HashMap<String, Object> params = new HashMap<>(); 
			params.put("memoNum", memoNum); 
			params.put("memoContent", memoContent); 
			params.put("userId", userId); 
			
			try {
				int result = userService.updateMemo(params); 
				System.out.println("userController updateMemo result : " + result); 
			
				if (result > 0) { // 업데이트된 행이 있으면
					return "success"; // 성공 응답
				} 
				else { // 업데이트된 행이 없으면
					return "error"; // 에러 응답
				}
			} 
			catch (Exception e) { 
				System.out.println("메모 수정 중 오류 발생: " + e.getMessage()); 
				return "error"; 
			}
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

		
	
		//#####################################################
		//리그 순위 불러오기
		@PostMapping("/usersReadRank")
		@ResponseBody
		public List<BookshelfVO> usersReadRank(){
			return userService.usersReadRank();
		}
		//리그 유저별 독서목록 가져오기
		@PostMapping("/getBooksByUserId")
		@ResponseBody
		public List<BookshelfVO> getBooksByUserId(String userId){
			return userService.getBooksByUserId(userId);
		}
		
		///#######################################
		//나의 정보 수정
				@GetMapping("pages/user-myInfo")
				public String getUserInfo(Model model, HttpSession session) {
					String userId = (String) session.getAttribute("userId");
					UserVO user = userService.getUserById(userId);
					 if (userId == null ) {
						 	// userId가 세션에 없다면 로그인 페이지로 리다이렉트
					        return "redirect:/login";
					    }
					model.addAttribute("userId", user.getUserId());
					model.addAttribute("userName", user.getUserName());
					model.addAttribute("userTel", user.getUserTel());
					return "pages/user-myInfo";
				}


				@PostMapping("/pages/modify")
				public String updateUserInfo(@ModelAttribute UserVO uservo, HttpSession session, RedirectAttributes redirectAttributes) {
					String userId = (String) session.getAttribute("userId");
					uservo.setUserId(userId);  // 세션에서 가져온 userId로 설정

					// 기존 사용자 정보 가져오기
					UserVO existingUser = userService.getUserById(userId);

					// 비밀번호 필드에 입력이 있을 때만 비밀번호 업데이트
					if (uservo.getPassword() != null && !uservo.getPassword().isEmpty()) {
						uservo.setPassword(passwordEncoder.encode(uservo.getPassword()));
					} else {
						// 비밀번호 입력이 없으면 기존 비밀번호 유지
						uservo.setPassword(existingUser.getPassword());
					}

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


		
		@PostMapping("/check2-email")
		   public ResponseEntity<Map<String, Object>> checkEmail(@RequestBody Map<String, String> payload) {
		       String email = payload.get("email");
		       System.out.println("이메일받아옴"+email);
		       
		       UserVO user = userService.findByEmail(email);
		      
		       
		       Map<String, Object> response = new HashMap<>();
		       if (user != null) {
		           response.put("exists", true);
		           response.put("user", user);
		           System.out.println("사용자존재");
		       } else {
		           response.put("exists", false);
		           System.out.println("사용자존재하지않음");
		       }
		       
		       return ResponseEntity.ok(response);
		   }
		   
		   @PostMapping("/login-naver")
		      public ResponseEntity<?> loginNaver(@RequestBody Map<String,String> payload, HttpSession session) {
		          String email = payload.get("email");
		          UserVO user = userService.findByEmail(email);
		          
		          if(user!=null) {
		             userService.updateNaverStatus(email);
		             session.setAttribute("userId", user.getUserId());
		             session.setAttribute("userName", user.getUserName());
		             return ResponseEntity.ok(user);
		          }else {
		             return ResponseEntity.notFound().build();
		          }
		      }


		
}


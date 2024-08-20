package com.bookbookbook.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.bookbookbook.domain.BestsellerVO;
import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.ChatroomVO;
import com.bookbookbook.service.ActiveUserService;
import com.bookbookbook.service.BestsellerService;
import com.bookbookbook.service.MainService;
import com.bookbookbook.service.NewsService;
import com.bookbookbook.service.RecommendationService;
import com.bookbookbook.util.MD5Generator;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	private BestsellerService bestsellerService;
	
	@Autowired
    private ActiveUserService activeUserService;	
	
	// 사용자 메모, 감정 분석 추천 서비스 주입
		// [ 0806 추가 ] 
		@Autowired
	    private RecommendationService recommendationService;
	
	/*
	 * @Autowired private BestsellerService bestsellerService;
	 */
	@RequestMapping("/pages/{step}")
	   public String step(@PathVariable String step) {
	      return "pages/"+step;
	   }
	
	//##########################################################	
		// NewsService 클래스의 인스턴스를 자동으로 주입
		@Autowired
		private NewsService newsService;

		// 메인 페이지 요청을 처리하는 메서드
		@RequestMapping("/")
		public String mainPage(Model model, HttpSession session) {
			  List<Map<String, String>> newsList = new ArrayList<>(); // newsList 초기화
		    String userId = (String) session.getAttribute("userId");
		    Integer userNum = (Integer) session.getAttribute("userNum");
		    System.out.println("메인컨트롤러 ::: 세션에서 가져온 사용자 ID: " + userId);
		    System.out.println("메인컨트롤러 ::: 세션에서 가져온 사용자 userNum: " + userNum);

		    if (userId != null) {
		        System.out.println("사용자 ID로 개인화 뉴스를 가져옵니다: " + userId);
		        try {
		            newsList = newsService.getPersonalizedNews(userId);
		            System.out.println("개인화 뉴스 리스트: " + newsList);
		            // 추천 도서 로직 추가
		            // [ 0807 추가 ] 
		            // ############################## 머신러닝 추천도서
		            System.out.println("MainController 추천 도서 로직 실행 시작");
					
					  try { List<Map<String, Object>> bookRecommendations =
					  recommendationService.getRecommendations(userNum); List<Map<String, Object>>
					  recommendedBooks = new ArrayList<>();
					 
					 for (Map<String, Object> bookRec : bookRecommendations) { Integer bookNum =
					  (Integer) bookRec.get("bookNum"); String recommendationType = (String)
					  bookRec.get("recommendationType");
					  
					  // "평점/감정 기반"을 "회원 서재 기반"으로 변경 if ("평점/감정 기반".equals(recommendationType)) {
					  recommendationType = "나의 서재 기반"; 
					  
					 Map<String, Object> bookInfo = mainService.getBookByBookNum(bookNum); if
					  (bookInfo != null) { bookInfo.put("recommendationType", recommendationType);
					  recommendedBooks.add(bookInfo); } }
					  System.out.println("추천결과:"+recommendedBooks.toString());
					  model.addAttribute("recommendedBooks", recommendedBooks);
					  
					  } catch (Exception e) { System.out.println("추천 도서 가져오는 중 오류 발생: " +
					  e.getMessage()); e.printStackTrace(); }
					 // ############################## 머신러닝 추천도서

		            // 기존의 성별, 연령대, 위치 기반 로직
		            String gender = (String) session.getAttribute("gender");
		            String ageGroup = (String) session.getAttribute("ageGroup");
		            String location = (String) session.getAttribute("location");
		            System.out.println("성별: " + gender + ", 연령대: " + ageGroup + ", 위치: " + location);

		            if (gender != null && ageGroup != null) {
		                String[] preferences = determineTop3Preferences(gender, ageGroup);
		                System.out.println("선호도: " + Arrays.toString(preferences));

		                String randomPreference = getRandomPreference(preferences);
		                System.out.println("랜덤 선호도: " + randomPreference);

		                String matchedPreference = getMatchedPreference(randomPreference);
		                System.out.println("매칭된 선호도: " + matchedPreference);

		                //if ("서울".equals(location)) {
		                    List<Integer> seoulCateNums = mainService.findCateNumByPreference(matchedPreference);
		                    System.out.println("서울지역 컨트롤러 반환값 : " + seoulCateNums);
		                    if (seoulCateNums != null && !seoulCateNums.isEmpty()) {
		                        System.out.println("서울 지역 추천 도서 조회 시작");
		                        List<BookVO> seoulRecommendations = mainService.findBooksByCateNum(seoulCateNums);
		                        model.addAttribute("seoulRecommendationBooks", seoulRecommendations);
		                    }
		                //}
		            }

		        } catch (Exception e) {
		            System.out.println("개인화 뉴스 가져오는 중 오류 발생: " + e.getMessage());
		            e.printStackTrace();
		        }

		        
		        String gender = (String) session.getAttribute("gender");
		        String ageGroup = (String) session.getAttribute("ageGroup");
		        String location = (String) session.getAttribute("location");
		        System.out.println("성별: " + gender + ", 연령대: " + ageGroup + ", 위치: " + location);

		    } else {
		        System.out.println("도서관 뉴스를 가져옵니다");
		        newsList = newsService.getLibraryNews();
		        System.out.println("도서관 뉴스 리스트: " + newsList);
		    }

		    model.addAttribute("newsList", newsList);
		    List<BestsellerVO> popularBooks = bestsellerService.getPopularBooks();
		    System.out.println("인기 도서 목록: " + popularBooks);
		    model.addAttribute("popularBooks", popularBooks);

		    return "index";
		}

		// 정확한 키워드 매칭을 위한 메서드 추가
		private String getMatchedPreference(String preference) {
		    // 여기에서 데이터베이스와 매칭되는 키워드로 변환합니다.
		    // 예시: '여행, 야외 나들이'를 '여행'으로 변환
		    switch (preference) {
		        case "여행, 야외 나들이":
		            return "여행";
		        case "영상시청":
		            return "영화";
		        case "종교":
		            return "종교";
		        case "운동":
		        	return "건강";
		        case "컴퓨터 게임, 인터넷 검색 등":
		        	return "만화";
		        case "문화예술관람":
		        	return "예술";
		        default:
		            return preference;
		    }
		}

		
		//탑3 중 하나만 랜덤으로
		private String getRandomPreference(String[] preferences) {
		    Random random = new Random();
		    int index = random.nextInt(preferences.length);
		    return preferences[index];
		}

		//서울시 탑3 희망 여가 활동
		private String[] determineTop3Preferences(String gender, String ageGroup) {
		    if ("남성".equals(gender)) {
		        return new String[]{"여행, 야외 나들이", "운동", "영상시청"};
		    } else if ("여성".equals(gender)) {
		        return new String[]{"여행, 야외 나들이", "종교", "영상시청"};
		    }

		    if ("10대".equals(ageGroup)) {
		        return new String[]{"컴퓨터 게임, 인터넷 검색 등", "여행, 야외 나들이", "문화예술관람"};
		    } else if ("20대".equals(ageGroup) || "30대".equals(ageGroup)) {
		        return new String[]{"여행, 야외 나들이", "문화예술관람", "운동"};
		    } else if ("40대".equals(ageGroup)) {
		        return new String[]{"여행, 야외 나들이", "운동", "문화예술관람"};
		    } else if ("50대".equals(ageGroup)) {
		        return new String[]{"여행, 야외 나들이", "문화예술참여활동", "영상시청"};
		    } else if ("60대 이상".equals(ageGroup)) {
		        return new String[]{"여행, 야외 나들이", "영상시청", "종교"};
		    }

		    return new String[]{"", "", ""}; // 기본 값
		}

		//메인페이지에서 로그인 페이지 요청을 처리하는 메서드
	@RequestMapping("/pages/login")
		public String loginPage() {
			System.out.println(">>>메인컨트롤러 로그인 요청");
			return "pages/user-login";  
		}
		

		// 회원가입 페이지 요청을 처리하는 메서드
		@RequestMapping("/pages/user-signup")
		public String signupPage() {
			return "pages/user-signup";
		}

		// 비밀번호 찾기 페이지 요청을 처리하는 메서드
		@RequestMapping("/pages/find-password")
		public String findPWPage() {
			return "pages/user-findPassword";
		}

		// 이메일 찾기 페이지 요청을 처리하는 메서드
		@RequestMapping("/pages/find-email")
		public String findingEmailPage() {
			return "pages/user-findEmail";
		}

		//#######################################
		// 캐릭터 찾기 페이지 요청을 처리하는 메서드
		@RequestMapping("/pages/find-mycharacters")
		public String myCharacterPage() {
			return "pages/user-myCharacters";
		}

		//#########################################
				//채팅방 목록 불러오기+접속 시 로그인 여부 확인
				 @GetMapping("/pages/chat-entrance")
				    public void getChatroom(Model m, @RequestParam(defaultValue = "1") int page, HttpSession session, String roomNum, RedirectAttributes redirectAttrs) {
				        if (session.getAttribute("userId") != null) {
				            String userId = (String) session.getAttribute("userId");
				            String userNum = mainService.getUserId(userId);
				            m.addAttribute("myBooks", mainService.getMyBookshelf(userNum));

				            int itemsPerPage = 6;

				            // 전체 페이지 수
				            List<ChatroomVO> chatrooms = mainService.getChatroom();
				            int totalPage = (int) Math.ceil((double) chatrooms.size() / itemsPerPage);

				            // 채팅방 페이지 기능
				            int startIndex = (page - 1) * itemsPerPage;
				            int endIndex = Math.min(startIndex + itemsPerPage, chatrooms.size());
				            List<ChatroomVO> currentPageRooms = chatrooms.subList(startIndex, endIndex);

				            m.addAttribute("chatrooms", currentPageRooms);
				            m.addAttribute("currentPage", page);
				            m.addAttribute("totalPage", totalPage);
				            
				            // 방의 활성 사용자 목록 가져오기
				            Map<String, Set<String>> allActiveUsersByRoom = activeUserService.getAllActiveUsers();
				            Map<String, Integer> userCountsByRoom = new HashMap<>();

				            // 방 번호별로 인원 수를 카운트
				            for (Map.Entry<String, Set<String>> entry : allActiveUsersByRoom.entrySet()) {
				                String roomNumber = entry.getKey();
				                Set<String> users = entry.getValue();
				                userCountsByRoom.put(roomNumber, users.size());
				            }

				            // 모델에 데이터를 추가
				            m.addAttribute("userCountsByRoom", userCountsByRoom);
				            
				        } else {
				            redirectAttrs.addFlashAttribute("message", "로그인이 필요합니다.");
				            throw new UnauthorizedException(); // 인증되지 않은 경우 예외를 던져서 처리
				        }
				    }
				    // 예외 처리를 위한 커스텀 예외 클래스
				    private static class UnauthorizedException extends RuntimeException {
				    	
				    }
				    // 예외 처리 핸들러
				    @ExceptionHandler(UnauthorizedException.class)
				    public RedirectView handleUnauthorized() {
				        return new RedirectView("/pages/user-login"); // 로그인 페이지로 리다이렉트
			        }
				    
				    
				//채팅방 생성
				@PostMapping("/createChatroom")
				public String createChatroom(ChatroomVO chat, HttpSession session, @RequestParam("file") MultipartFile file) {
					String userId=(String)session.getAttribute("userId");
					String userNum = mainService.getUserId(userId);
					chat.setUserNum(Integer.parseInt(userNum));
					String filePath = chat.getChatFilePath();
					try{
						//파일의 원래 이름
						String cfrealname = file.getOriginalFilename();
						//파일을 첨부한 경우
						if(cfrealname !=null && !cfrealname.equals("")) {
							System.out.println("test1");
							String cfname= new MD5Generator(cfrealname).toString();
							System.out.println("변경파일명:"+cfname);
							/*
							 * [1] 추후작업: 확장자가 필요한 경우  
							 */
							//정해진 폴더 지정
							String savepath=System.getProperty("user.dir")+"\\src\\main\\resources\\static\\files";
							System.out.println("저장 경로:"+savepath);
							/*
							 * [2] 
							 */
							if(! new File(savepath).exists()) {
								new File(savepath).mkdir();
							}
							//실제 저장되는 파일
							String chatFilePath = savepath+"\\"+cfname;
							file.transferTo(new File(chatFilePath));
							System.out.println(chatFilePath+"저장되었음");
							
							//디비 저장
							chat.setCfrealname(cfrealname);
							chat.setCfname(cfname);
							chat.setChatFilePath(chatFilePath);
							
							//파일을 첨부한 경우	
							mainService.createChatroom(chat);
							
						}//end of if(파일 첨부 경우)
						else {
							//파일을 첨부하지 않은 경우	
							//chat.setCfrealname(cfrealname);
							chat.setCfname(filePath);
							mainService.createChatroom(chat);
						}
					}catch(Exception ex) {
						ex.printStackTrace();
					}
					return "redirect:pages/chat-entrance";
				}

				//채팅방 검색
				@GetMapping("/searchChatroom")
				@ResponseBody
				public List<ChatroomVO> searchChatroom(@RequestParam String keyword){
					List<ChatroomVO> result= mainService.searchChatroom(keyword);
					return result;
				}

				//채팅방 이름 얻어오기
				@GetMapping("/pages/chat-chatroom")
				public void chatroom(String roomNum, Model m) {
					m.addAttribute("room",mainService.getRoomInfo(roomNum));
				}	
				
		
}
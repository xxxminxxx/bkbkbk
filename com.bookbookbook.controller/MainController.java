package com.bookbookbook.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bookbookbook.domain.ChatroomVO;
import com.bookbookbook.service.MainService;
import com.bookbookbook.service.NewsService;
import com.bookbookbook.util.MD5Generator;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;

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
		public String mainPage(Model model) {
			// newsService를 사용하여 도서관 뉴스를 가져와서 newsList에 저장
			List<Map<String, String>> newsList = newsService.getLibraryNews();
			// 모델에 newsList를 추가하여 뷰에서 사용할 수 있도록 설정
			model.addAttribute("newsList", newsList);
			// index.jsp 파일을 반환하여 클라이언트에게 보여줌
			return "index";
		}

		// 로그인 페이지 요청을 처리하는 메서드
		@RequestMapping("/pages/login")
		public String loginPage() {
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
		//채팅방 목록 불러오기
		@GetMapping("/pages/chat-entrance")
		public void getChatroom(Model m, @RequestParam(defaultValue = "1") int page){
		
		int itemsPerPage = 6;
		
		//전체 페이지 수
		List<ChatroomVO> chatrooms = mainService.getChatroom();
		int totalPage= (int) Math.ceil((double) chatrooms.size() / itemsPerPage);
		
		//채팅방 페이지기능
		int startIndex= (page-1)*itemsPerPage;
		int endIndex = Math.min(startIndex + itemsPerPage, chatrooms.size());
	    List<ChatroomVO> currentPageRooms = chatrooms.subList(startIndex, endIndex);
		
		m.addAttribute("chatrooms",currentPageRooms);
		m.addAttribute("currentPage",page);
		m.addAttribute("totalPage",totalPage);
		}

		//채팅방 생성
		@PostMapping("/createChatroom")
		public String createChatroom(ChatroomVO chat, @RequestParam("file") MultipartFile file) {
			
			try{
				//파일의 원래 이름
				String cfrealname = file.getOriginalFilename();
				System.out.println("원래 파일명:"+cfrealname);
				//파일을 첨부한 경우
				if(cfrealname !=null && !cfrealname.equals("")) {
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

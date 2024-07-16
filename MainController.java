package com.bookbookbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookbookbook.domain.ChatroomVO;
import com.bookbookbook.service.ChatRoomService;
import com.bookbookbook.service.MainService;

@Controller
public class MainController {

	@Autowired
	MainService mainService;
	ChatRoomService chatroomService;
	
	@RequestMapping("/pages/{step}")
	public String step(@PathVariable String step) {
		return "pages/"+step;
	}
	
	//채팅방 목록 불러오기
	@GetMapping("/pages/chat-entrance")
	public void getChatroom(Model m){
		m.addAttribute("chatrooms",mainService.getChatroom());
	}
	
	//채팅방 생성
	@GetMapping("/createChatroom")
	public String createChatroom(ChatroomVO chat) {
		//MultipartFile files로 받아서 chat.set~~하여서 넘기기
		System.out.println(chat.toString());		
		mainService.createChatroom(chat);
		return "redirect:pages/chat-entrance";
	}
	
	//채팅방 검색
	@GetMapping("/searchChatroom")
	@ResponseBody
	public List<ChatroomVO> searchChatroom(@RequestParam String keyword){
		System.out.println("컨트롤러 호출"+keyword);
		List<ChatroomVO> result= mainService.searchChatroom(keyword);
		System.out.println(result);
		return result;
	}
	
	//채팅방 이름 얻어오기
	@GetMapping("/pages/chat-chatroom")
	public void chatroom(String roomNum, Model m) {
		m.addAttribute("room",mainService.getRoomInfo(roomNum));
		//return "pages/chat-chatroom?roomNum="+roomNum;
	}
	
	
}

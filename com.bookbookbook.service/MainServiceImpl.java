package com.bookbookbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookbookbook.dao.MainDAO;
import com.bookbookbook.domain.ChatroomVO;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO mainDAO;
	
		//채팅방 불러오기
		public List<ChatroomVO> getChatroom(){
			return mainDAO.getChatroom();
		}
		//빈 방은 삭제
		/*
		 * public void emptyRoom() { mainDAO.emptyRoom(); }
		 */
		//채팅방 생성
		public void createChatroom(ChatroomVO chat) {
			mainDAO.createChatroom(chat);
		}
		//채팅방 검색
		public List<ChatroomVO> searchChatroom(String keyword){
			return mainDAO.searchChatroom(keyword);
		}
		//채팅방 정보
		public ChatroomVO getRoomInfo(String roomNum) {
			return mainDAO.getRoomInfo(roomNum);
		}
		//채팅방 삭제
		public void deleteChatroom(String roomNum) {
			System.out.println(roomNum);
			mainDAO.deleteChatroom(roomNum);
		}
}

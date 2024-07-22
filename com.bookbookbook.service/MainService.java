package com.bookbookbook.service;

import java.util.List;

import com.bookbookbook.domain.ChatroomVO;

public interface MainService {
	//베스트셀러, 신간, 뉴스 추천, 채팅방

	//채팅방 불러오기
	public List<ChatroomVO> getChatroom();
	//public void emptyRoom();
	//채팅방 생성
	public void createChatroom(ChatroomVO chat);
	//채팅방 검색
	public List<ChatroomVO> searchChatroom(String keyword);
	//채팅방 정보 불러오기
	public ChatroomVO getRoomInfo(String roomNum);
	//채팅방 삭제
	public void deleteChatroom(String roomNum);
}

package com.bookbookbook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bookbookbook.domain.ChatroomVO;

@Mapper
public interface MainDAO {

	//##################################
	//채팅방 불러오기
	public List<ChatroomVO> getChatroom();
	//빈 방 삭제
	//public void emptyRoom();
	//방 생성
	public void createChatroom(ChatroomVO chat);
	//방 검색
	public List<ChatroomVO> searchChatroom(String keyword);
	//방 정보 가져오기
	public ChatroomVO getRoomInfo(String roomNum);
	//방 삭제
	public void deleteChatroom(String roomNum);
}

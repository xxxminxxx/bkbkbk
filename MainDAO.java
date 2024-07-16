package com.bookbookbook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bookbookbook.domain.ChatroomVO;

@Mapper
public interface MainDAO {
	public List<ChatroomVO> getChatroom();
	public void createChatroom(ChatroomVO chat);
	public List<ChatroomVO> searchChatroom(String keyword);
	public ChatroomVO getRoomInfo(String roomNum);
}

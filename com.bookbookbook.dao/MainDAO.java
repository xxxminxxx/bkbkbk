package com.bookbookbook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.BookshelfVO;
import com.bookbookbook.domain.CategoryVO;
import com.bookbookbook.domain.ChatroomVO;

@Mapper
public interface MainDAO {

	 //##################################
	   //채팅방 불러오기
	   public List<ChatroomVO> getChatroom();
	   //유저 책장 불러오기
	   public List<BookshelfVO> getMyBookshelf(String userNum);
	   //방 생성
	   public void createChatroom(ChatroomVO chat);
	   //유저 번호 불러오기
	   public String getUserID(String userId);
	   //방 검색
	   public List<ChatroomVO> searchChatroom(String keyword);
	   //방 정보 가져오기
	   public ChatroomVO getRoomInfo(String roomNum);
	   //방 삭제
	   public void deleteChatroom(String roomNum);

	
	//######################################
  	//서울시 희망 여가 활동 데이터 처리
	  List<Integer> findCateNumByPreference(@Param("preference") String preference);
  List<BookVO> findBookByCateNum(@Param("cateNum") Integer cateNum);
}

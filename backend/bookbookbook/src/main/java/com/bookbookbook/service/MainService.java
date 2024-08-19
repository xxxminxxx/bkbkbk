package com.bookbookbook.service;

import java.util.List;
import java.util.Map;

import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.BookshelfVO;
import com.bookbookbook.domain.ChatroomVO;

public interface MainService {
	//베스트셀러, 신간, 뉴스 추천, 채팅방

	//채팅방 불러오기
	   public List<ChatroomVO> getChatroom();
	   //유저 개인의 서재 불러오기
	   public List<BookshelfVO> getMyBookshelf(String userNum);
	   //public void emptyRoom();
	   //채팅방 생성
	   public void createChatroom(ChatroomVO chat);
	   //유저 아이디로 유저 번호 불러오기
	   public String getUserId(String userId);
	   //채팅방 검색
	   public List<ChatroomVO> searchChatroom(String keyword);
	   //채팅방 정보 불러오기
	   public ChatroomVO getRoomInfo(String roomNum);
	   //채팅방 삭제
	   public void deleteChatroom(String roomNum);

	
	//##########################################
	//서울시 희망 여가 활동 데이터 처리
	  List<Integer> findCateNumByPreference(String preference);
	  List<BookVO> findBooksByCateNum(List<Integer> cateNums) ;
	  
	  // [ 0807 추가 ] 
	  // ############################## 머신러닝 추천도서
	// 머신러닝 사용 사용자 맞춤 도서 정보 조회
	  Map<String, Object> getBookByBookNum(Integer bookNum);
	 
}
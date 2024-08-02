package com.bookbookbook.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookbookbook.dao.MainDAO;
import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.BookshelfVO;
import com.bookbookbook.domain.ChatroomVO;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO mainDAO;
	
	   //채팅방 불러오기
    public List<ChatroomVO> getChatroom(){
       return mainDAO.getChatroom();
    }
    //서재 불러오기
    public List<BookshelfVO> getMyBookshelf(String userNum) {
       return mainDAO.getMyBookshelf(userNum);
    }
    //채팅방 생성
    public void createChatroom(ChatroomVO chat) {
       mainDAO.createChatroom(chat);
    }
    //유저 번호
    public String getUserId(String userId) {
       return mainDAO.getUserID(userId);
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

		//#################################################
		//서울시 희망 여가 활동 데이터 처리
		    public   List<Integer> findCateNumByPreference(String preference) {
		    	  List<Integer> cateNum = mainDAO.findCateNumByPreference(preference);
		         System.out.println("ServiceImpl matchedPreference- 카테고리 번호: " + cateNum + " for preference: " + preference);
		         return cateNum;
		    }

		    public List<BookVO> findBooksByCateNum(List<Integer> cateNums) {
		        System.out.println("findBooksByCateNums 서비스임플 cateNums : " + cateNums);
		        List<BookVO> books = new ArrayList<>();
		        int index = 0;
		        
		        // 결과 책 목록의 크기가 4개 이상이거나, 인덱스가 주어진 카테고리 번호 리스트의 크기보다 커지면 반복을 종료
		        while (books.size() < 4 && index < cateNums.size()) {
		            List<BookVO> newBooks = mainDAO.findBookByCateNum(cateNums.get(index));
		            System.out.println("ServiceImpl findBookByCateNum - 카테고리 번호: " + cateNums.get(index) + "로 찾은 책 목록: " + newBooks);
		            
		            if (!newBooks.isEmpty()) {
		                books.addAll(newBooks); // books 리스트에 newBooks 리스트의 모든 책을 추가
		            } else {
		                // 현재 카테고리에서 책이 없을 경우, 다음 카테고리로 시도
		                if (index + 1 < cateNums.size()) {
		                    newBooks = mainDAO.findBookByCateNum(cateNums.get(index + 1));
		                    System.out.println("ServiceImpl findBookByCateNum - 카테고리 번호: " + cateNums.get(index + 1) + "로 찾은 다음 책 목록: " + newBooks);
		                    if (!newBooks.isEmpty()) {
		                        books.addAll(newBooks);
		                    }
		                }
		            }
		            
		            index++;
		        }
		        
		        // 만약 books 리스트의 크기가 여전히 4보다 작으면 추가로 cateNums의 요소를 시도
		        while (books.size() < 4 && index < cateNums.size()) {
		            List<BookVO> newBooks = mainDAO.findBookByCateNum(cateNums.get(index));
		            System.out.println("ServiceImpl findBookByCateNum - 추가 시도 카테고리 번호: " + cateNums.get(index) + "로 찾은 책 목록: " + newBooks);
		            
		            if (!newBooks.isEmpty()) {
		                books.addAll(newBooks);
		            }
		            
		            index++;
		        }
		        
		        return books;
		    }
		    
		    
		
		
}

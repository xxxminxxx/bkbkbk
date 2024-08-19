package com.bookbookbook.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.bookbookbook.domain.BookshelfVO;
import com.bookbookbook.domain.MemoVO;

@Mapper
public interface BookshelfDAO {

	
	//나의 서재 전체 탭팬
	 List<BookshelfVO> getUserData(String userId);
	 
	 //나의 서재 읽은 책 탭팬
	  List<BookshelfVO> getReadBooksDetails(String userId);
	  
	  //나의 서재 읽고 있는 책 탭팬
	 // List<BookshelfVO> getReadingBooksDetails(String userId);
	  
	  //나의 서재 읽고 싶은 책 탭팬
	  List<BookshelfVO> getWishlistBooks(String userId);
	  
	  //읽은 책에서 메모 저장
	  void insertMemo(Map<String, Object> params);
	  
	  //
	  List<BookshelfVO> checkBookStatus(BookshelfVO vo);
	  
	  //책 상세에서 읽은 책 저장
	  void saveBook(BookshelfVO bookshelfVO);
	  
	  //이미 저장된 책인지 확인
	  int checkBookExists(Map<String, Object> params);
	  
	// 책의 현재 상태(읽음/읽는 중) 확인
	    String getBookStatus(Map<String, Object> params);
	    
	    // 책 정보 조회
	    BookshelfVO selectBookByShelfNum(Integer shelfNum);
	  
	// 읽은 책 권수 가져오기
	    int getReadBooksByUserNum(int userNum);
	    
	    // 사용자 레벨 업데이트
	    void updateUserLevel(Map<String, Object> params);
	    
	    //읽고 있는 책으로 저장
	    void saveReadingBook(BookshelfVO bookshelfVO);
	    
	    //읽고 있는 책 진행바 표시
	    List<BookshelfVO> getReadingBooksStatus(Integer userNum);
	    
	    //읽고 있는 책 수정
	    int updateBookProgress(Map<String, Object> params);
	 
	    //읽은 책 삭제
	    int deleteBook(Integer shelfNum);
	    
	    // 책과 관련된 메모 삭제
	    int deleteMemosByShelfNum(Integer shelfNum);
	    
}

package com.bookbookbook.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WishlistDAO {
	
		//저장
		 void insertWishlist(int bookNum, int userNum);
	 
	   //삭제
	    int deleteWishlistBook(Integer bookNum);
	    
	    // 중복 체크
	    int checkWishlistDuplicate(int bookNum, int userNum);
}

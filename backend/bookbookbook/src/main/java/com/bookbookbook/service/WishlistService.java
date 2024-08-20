package com.bookbookbook.service;

import java.util.List;

import com.bookbookbook.domain.WishlistVO;

public interface WishlistService {
	
	 // 저장 (중복 체크 포함)
    boolean addToWishlist(int bookNum, int userNum);
    
    //삭제 
	  boolean deleteWishlistBook(Integer bookNum);
}
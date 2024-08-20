package com.bookbookbook.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookbookbook.dao.WishlistDAO;
import com.bookbookbook.domain.WishlistVO;



@Service
public class WishlistServiceImpl implements WishlistService {

    @Autowired
    private WishlistDAO wishlistDAO;

    // 저장 (중복 체크 포함)
    @Override
    public boolean addToWishlist(int bookNum, int userNum) {
        System.out.println(">>> ServiceImpl: 위시리스트 서비스임플 addToWishlist 호출");
        
        // 중복 체크
        if (wishlistDAO.checkWishlistDuplicate(bookNum, userNum) > 0) {
            System.out.println(">>> ServiceImpl: 이미 위시리스트에 존재하는 책입니다.");
            return false;
        }
        
        wishlistDAO.insertWishlist(bookNum, userNum);
        System.out.println(">>> ServiceImpl: 위시리스트에 책 추가 완료");
        return true;
    }
    
  //삭제
  	 @Override
  	 public boolean deleteWishlistBook(Integer bookNum) {
  		 System.out.println(">>>북쉘프 서비스임플 삭제함수");
  		    int result = wishlistDAO.deleteWishlistBook(bookNum);
  		    System.out.println(">>서비스임플 삭제함수 결과: " + result);
  		    return result > 0;
  		   
  		}
}

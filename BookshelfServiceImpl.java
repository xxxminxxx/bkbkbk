package com.bookbookbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookbookbook.dao.BookshelfDAO;
import com.bookbookbook.domain.BookshelfVO;


@Service
public class BookshelfServiceImpl implements BookshelfService{

	
	@Autowired
	private BookshelfDAO bookshelfDAO;
	
	  // 나의 서재 전체 탭팬
    public List<BookshelfVO> getUserData() {
        System.out.println(">>> getUserData ServiceImpl 호출");
        List<BookshelfVO> userData = bookshelfDAO.getUserData();
        System.out.println(">>> DAO에서 반환된 데이터: " + userData);
        return userData;
    }
    
    // 나의 서재 읽은 책 탭팬
    public List<BookshelfVO> getReadBooksDetails() {
        System.out.println(">>> getReadBooksDetails ServiceImpl 호출");
        return bookshelfDAO.getReadBooksDetails();
    }
    
    public List<BookshelfVO> getReadingBooksDetails() {
        System.out.println(">>> getReadingBooksDetails ServiceImpl 호출");
        return bookshelfDAO.getReadingBooksDetails();
    }
    
    public List<BookshelfVO> getWishlistBooks() {
    	System.out.println(">>>getWishlistBooks ServiceImpl 호출");
        return bookshelfDAO.getWishlistBooks();
    }
    
}

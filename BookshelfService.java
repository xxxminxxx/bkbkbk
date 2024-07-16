package com.bookbookbook.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bookbookbook.domain.BookshelfVO;

@Service
public interface BookshelfService {

	//나의 서재 읽은 책 
	  List<BookshelfVO> getUserData();
	  
	//나의 서재 읽은 책 탭팬
	  List<BookshelfVO> getReadBooksDetails();
	  
	  //
	  List<BookshelfVO> getReadingBooksDetails();
	  
	  //
	  List<BookshelfVO> getWishlistBooks();
}

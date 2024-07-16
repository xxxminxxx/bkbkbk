package com.bookbookbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookbookbook.domain.BookshelfVO;
import com.bookbookbook.service.BookshelfService;

@Controller
public class BookshelfController {
	
	@Autowired
	private BookshelfService bookshelfService;

	/*
	 * 화면: 나의 서재 전체 탭팬 클릭 시
	 * method명: getUserData
	 * 인자:      Model 객체
	 * 리턴형:     String (페이지 이름)
	 * 역할:      BookshelfService를 통해 사용자 데이터를 가져와서 모델에 추가하고,
	 *           "pages/user-myBookshelf" 페이지를 반환하는 함수
	 */
	  @GetMapping("/pages/user-myBookshelf")
	    public String getUserData(Model model) {
		  
	        List<BookshelfVO> getUserData = bookshelfService.getUserData();
	        System.out.println(">>> Controller에서 받은 데이터: " + getUserData);
	        model.addAttribute("characterStages", getUserData);
	        
	        List<BookshelfVO> getReadBooksDetails = bookshelfService.getReadBooksDetails();
	        System.out.println(">>> Controller에서 받은 데이터: " + getReadBooksDetails);
	        model.addAttribute("readBooks", getReadBooksDetails);
	        
	        List<BookshelfVO> getReadingBooksDetails = bookshelfService.getReadingBooksDetails();
	        System.out.println(">>> Controller에서 받은 데이터: " + getReadingBooksDetails);
	        model.addAttribute("readingBooks", getReadingBooksDetails);
	        
	        List<BookshelfVO> wishlistBooks = bookshelfService.getWishlistBooks();
	        System.out.println(">>> Controller에서 받은 데이터: " + wishlistBooks);
	        model.addAttribute("wishlistBooks", wishlistBooks);
	        
	        return "pages/user-myBookshelf";
	    }
	   
	   
	 

}

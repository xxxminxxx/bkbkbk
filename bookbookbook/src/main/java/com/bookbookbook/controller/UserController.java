package com.bookbookbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.bookbookbook.service.UserService;

@Controller
public class UserController {
   
   @Autowired
   private UserService userService;
   
   //나의 리그
	@GetMapping("/pages/user-myLeague")
	public String myLeague() {
		System.out.println("user-myLeague호출");
		return "pages/user-myLeague";
	}
	
	//도서 검색 결과
	@GetMapping("/pages/user-bookSearchResult")
	public String bookSearchResult() {
		System.out.println("user-bookSearchResult 호출");
		return "pages/user-bookSearchResult";
	}

}
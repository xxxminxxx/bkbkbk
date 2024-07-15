package com.bookbookbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.CategoryVO;
import com.bookbookbook.service.LibraryService;

@RestController
public class LibraryController {

	@Autowired
	private LibraryService libraryService;
	
	//대분류 선택 시 중분류 항목 가져오기
	 @GetMapping("/loadCategoryData")
	 @ResponseBody
	    public List<CategoryVO> loadCategoryData(@RequestParam("category") String category) {
		 CategoryVO cate = new CategoryVO();
		 cate.setInterestNum1(category);
		 List<CategoryVO> categoryData = libraryService.getCategory(cate);
	     return categoryData;
	    }
	 
	 
	 //중분류 선택 시 책 가져오기
	 @GetMapping("/loadCateBookList")
	 @ResponseBody
	 public List<BookVO> loadCateBookList(String categoryName, String categoryValue){
		 CategoryVO cate = new CategoryVO();
		 cate.setInterestNum1(categoryName);
		 cate.setInterestNum2(categoryValue);
		 List<BookVO> cateBookList= libraryService.getCateBookList(cate);
		 return cateBookList;
	 }

	
}

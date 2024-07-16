package com.bookbookbook.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
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
	@PostMapping("/loadCategoryData")
	 @ResponseBody
	    public List<CategoryVO> loadCategoryData(@RequestParam("category") String category) {
		 CategoryVO cate = new CategoryVO();
		 cate.setInterestNum1(category);
		 List<CategoryVO> categoryData = libraryService.getCategory(cate);
	     return categoryData;
	    }
	 
	@PostMapping("/loadCateBookList")
	 @ResponseBody
	 public List<BookVO> loadAndSortCateBookList(@RequestParam("categoryName") String categoryName,
             @RequestParam("categoryValue") String categoryValue,
             @RequestParam(value = "sortType", required = false) String sortType) {
		// HashMap을 이용한 파라미터 전달
		HashMap<String, Object> map = new HashMap<>();
		map.put("categoryName", categoryName);
		map.put("categoryValue", categoryValue);
		
		if (sortType != null) {
			map.put("sortType", sortType);
		}
		List<BookVO> cateBookList = libraryService.getCateBookList(map);
		
		return cateBookList;
		}
}

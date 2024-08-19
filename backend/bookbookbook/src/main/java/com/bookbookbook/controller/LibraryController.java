package com.bookbookbook.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	// 대분류 가져오기
	@PostMapping("/loadCategory")
	@ResponseBody
	public List<CategoryVO> loadCategory(){
		List<CategoryVO> result= libraryService.loadCate();
		return result;
	}
	
	//대분류 선택 시 중분류 항목 가져오기
	@PostMapping("/loadCategoryData")
	 @ResponseBody
	    public List<CategoryVO> loadCategoryData(@RequestParam("category") String category) {
		 CategoryVO cate = new CategoryVO();
		 cate.setInterestNum1(category);
		 List<CategoryVO> categoryData = libraryService.getCategory(cate);
	     return categoryData;
	    }
	
	//중분류 선택 시 소분류 가져오기
	@GetMapping("/loadCategoryDataSecond")
	@ResponseBody
	 public List<CategoryVO> loadCategoryDataSecond(@RequestParam("categoryFirst") String categoryFirst,
			 @RequestParam("categorySecond") String categorySecond) {
		 CategoryVO cate = new CategoryVO();
		 cate.setInterestNum1(categoryFirst);
		 cate.setInterestNum2(categorySecond);
		 List<CategoryVO> categoryData = libraryService.getCategorySecond(cate);
	     return categoryData;
	    }
	
	//소분류 선택 시 검색 결과 출력 및 정렬
	@GetMapping("/loadCateBookList")
	 @ResponseBody
	 public List<BookVO> loadAndSortCateBookList(@RequestParam("categoryFirst") String categoryFirst,
             @RequestParam("categorySecond") String categorySecond,
             @RequestParam("categoryThird") String categoryThird,
             @RequestParam(value = "sortType", required = false) String sortType
             ) {
		// HashMap을 이용한 파라미터 전달
		HashMap<String, Object> map = new HashMap<>();
		map.put("categoryFirst", categoryFirst);
		map.put("categorySecond", categorySecond);
		map.put("categoryThird", categoryThird);
		if (sortType != null) {
			map.put("sortType", sortType);
		}
		List<BookVO> cateBookList = libraryService.getCateBookList(map);
		return cateBookList;
		}
}

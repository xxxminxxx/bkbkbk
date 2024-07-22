package com.bookbookbook.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookbookbook.dao.LibraryDAO;
import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.CategoryVO;

@Service
public class LibraryServiceImpl implements LibraryService {
	
	@Autowired
	private LibraryDAO libraryDAO;
	
	//책 카테고리 검색
	//대분류
	public List<CategoryVO> getCategory(CategoryVO cate){
		List<CategoryVO> result = libraryDAO.getCategory(cate);
		return result;
	}
	//중분류
	public List<CategoryVO> getCategorySecond(CategoryVO cate){
		List<CategoryVO> result = libraryDAO.getCategorySecond(cate);
		return result;
	}
	//소분류 선택
	public List<BookVO> getCateBookList(HashMap map){
		List<BookVO> result= libraryDAO.getCateBookList(map);
		return result;
	}
}

package com.bookbookbook.service;

import java.util.HashMap;
import java.util.List;

import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.CategoryVO;
import com.bookbookbook.domain.LibraryVO;

public interface LibraryService {
	//도서관 검색, 책 검색, 책 카테고리 검색
	
	//책 카테고리 검색
	public List<CategoryVO> loadCate();
	public List<CategoryVO> getCategory(CategoryVO cate);
	public List<CategoryVO> getCategorySecond(CategoryVO cate);
	public List<BookVO> getCateBookList(HashMap map);

}

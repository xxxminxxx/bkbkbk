package com.bookbookbook.service;

import java.util.List;

import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.CategoryVO;

public interface LibraryService {
	//도서관 검색, 책 검색, 책 카테고리 검색
	
	//책 카테고리 검색
	public List<CategoryVO> getCategory(CategoryVO cate);
	public List<BookVO> getCateBookList(CategoryVO cate);
}

package com.bookbookbook.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.CategoryVO;

@Mapper
public interface LibraryDAO {
	//책 카테고리 검색
	List<CategoryVO> getCategory(CategoryVO cate);
	List<CategoryVO> getCategorySecond(CategoryVO cate);
	List<BookVO> getCateBookList(HashMap map);
	
}

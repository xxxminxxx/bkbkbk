package com.bookbookbook.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.bookbookbook.domain.BookVO;

public interface BookService {
  
		//책 제목, 작가, 출판사, 책 소개 별 검색 기능
		Page<BookVO> bookSearchResultByTitle(String query, Pageable pageable);
	    Page<BookVO> bookSearchResultByWriter(String query, Pageable pageable);
	    Page<BookVO> bookSearchResultByPublisher(String query, Pageable pageable);
	    Page<BookVO> bookSearchResultByBookPreview(String query, Pageable pageable);
	  
	  //책 검색 결과에서 이미지 또는 제목 클릭 시 책 상세로 넘어가는 기능 
	  BookVO getBookDetails(Integer bookNum);
	  
	
}

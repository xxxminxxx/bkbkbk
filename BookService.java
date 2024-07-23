package com.bookbookbook.service;

import java.util.List;

import com.bookbookbook.domain.BookVO;

public interface BookService {
  
	  List<BookVO> bookSearchResultByTitle(String bookTitle);
	  
	  List<BookVO> bookSearchResultByWriter(String writer);
	  
	  List<BookVO> bookSearchResultByPublisher(String publisher);
	  
	  List<BookVO> bookSearchResultByBookPreview(String bookPreview);
}

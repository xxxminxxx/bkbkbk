package com.bookbookbook.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.bookbookbook.domain.BookVO;
import com.bookbookbook.persistence.BookRepository;


@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookRepository bookRepository;
    
   
    //책 제목, 작가, 출판사, 책 소개 별 검색 기능
    @Override
    public Page<BookVO> bookSearchResultByTitle(String query, Pageable pageable) {
        return bookRepository.findByBookTitleContainingIgnoreCase(query, pageable);
    }

    @Override
    public Page<BookVO> bookSearchResultByWriter(String query, Pageable pageable) {
        return bookRepository.findByWriterContainingIgnoreCase(query, pageable);
    }

    @Override
    public Page<BookVO> bookSearchResultByPublisher(String query, Pageable pageable) {
        return bookRepository.findByPublisherContainingIgnoreCase(query, pageable);
    }

    @Override
    public Page<BookVO> bookSearchResultByBookPreview(String query, Pageable pageable) {
        return bookRepository.findByBookPreviewContainingIgnoreCase(query, pageable);
    }
    
    //책 검색 결과에서 이미지 또는 제목 클릭 시 책 상세로 넘어가는 기능 
    public BookVO getBookDetails(Integer bookNum) {
        return bookRepository.findById(bookNum).orElse(null);
    }
    
   
    
}

package com.bookbookbook.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bookbookbook.domain.BookVO;
import com.bookbookbook.persistence.BookRepository;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookRepository bookRepository;

	
    @Override
    public List<BookVO> bookSearchResultByTitle(String bookTitle) {
        return bookRepository.findByBookTitleContainingIgnoreCase(bookTitle);
    }

    @Override
    public List<BookVO> bookSearchResultByWriter(String writer) {
        return bookRepository.findByWriterContainingIgnoreCase(writer);
    }

    @Override
    public List<BookVO> bookSearchResultByPublisher(String publisher) {
        return bookRepository.findByPublisherContainingIgnoreCase(publisher);
    }

    @Override
    public List<BookVO> bookSearchResultByBookPreview(String bookPreview) {
        return bookRepository.findByBookPreviewContainingIgnoreCase(bookPreview);
    }
    
}

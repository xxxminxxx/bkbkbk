package com.bookbookbook.persistence;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.bookbookbook.domain.BookVO;

public interface BookRepository extends JpaRepository<BookVO, Integer> {
	 List<BookVO> findByBookTitleContainingIgnoreCase(String bookTitle);

	    List<BookVO> findByWriterContainingIgnoreCase(String writer);

	    List<BookVO> findByPublisherContainingIgnoreCase(String publisher);

	    List<BookVO> findByBookPreviewContainingIgnoreCase(String bookPreview);
}

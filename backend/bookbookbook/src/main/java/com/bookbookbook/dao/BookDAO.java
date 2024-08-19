package com.bookbookbook.dao;

import com.bookbookbook.domain.BookVO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface BookDAO {

    
    BookVO getBookInfo(int bookId);
}

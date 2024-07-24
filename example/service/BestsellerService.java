package com.bookbookbook.service;

import com.bookbookbook.domain.BestsellerVO;
import java.util.List;

public interface BestsellerService {
    List<BestsellerVO> getPopularBooks();
}
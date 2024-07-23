package com.bookbookbook.controller;

import com.bookbookbook.domain.BookVO;
import com.bookbookbook.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;

    //도서 검색 기능
    @GetMapping("/bookSearchResult")
    public String bookSearchResult(@RequestParam("query") String query,
                                   @RequestParam("type") String type,
                                   @RequestParam(value = "page", defaultValue = "1") int page,
                                   Model model) {
        int pageSize = 12;
        int offset = (page - 1) * pageSize;

        List<BookVO> books = null;
        switch (type) {
            case "title":
                books = bookService.bookSearchResultByTitle(query);
                break;
            case "writer":
                books = bookService.bookSearchResultByWriter(query);
                break;
            case "publisher":
                books = bookService.bookSearchResultByPublisher(query);
                break;
            case "bookPreview":
                books = bookService.bookSearchResultByBookPreview(query);
                break;
        }

        int totalResults = books.size();
        boolean hasMore = totalResults > page * pageSize;

        model.addAttribute("books", books.subList(offset, Math.min(offset + pageSize, totalResults)));
        model.addAttribute("query", query);
        model.addAttribute("type", type);
        model.addAttribute("page", page);
        model.addAttribute("hasMore", hasMore);
        return "pages/book-bookSearchResult";
    }
    
    //도서 상세 페이지
    @GetMapping("/bookDetails")
    public String getBookDetails(@RequestParam("bookNum") Integer bookNum, Model model) {
        BookVO getBookDetails = bookService.getBookDetails(bookNum);
        model.addAttribute("bookDetails", getBookDetails);
        return "pages/book-bookDetails";
    }
}

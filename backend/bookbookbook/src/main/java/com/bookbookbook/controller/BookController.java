package com.bookbookbook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookbookbook.domain.BookVO;
import com.bookbookbook.service.BookService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;

	/**
	 * 화면: 도서 검색 결과 페이지 
	 * method명: bookSearchResult 
	 * 인자: query (검색어), type (검색 유형), page (페이지 번호), Model 객체 
	 * 리턴형: String (페이지 이름) 
	 * 역할: 사용자가 입력한 검색어와 검색 유형을 기반으로 도서를 검색하고, 
	 * 		결과를 모델에 추가하여 "pages/book-bookSearchResult" 페이지를 반환하는 함수
	 */
	@GetMapping("/bookSearchResult")
	public String bookSearchResult(
	    @RequestParam("query") String query,
	    @RequestParam("type") String type,
	    @RequestParam(value = "page", defaultValue = "0") int page,
	    @RequestParam(value = "size", defaultValue = "12") int size,
	    Model model) {
		System.out.println("북컨트롤러 bookSearchResult 함수 호출");
	    System.out.println("bookSearchResult called - query: " + query + ", type: " + type + ", page: " + page);

	    PageRequest pageRequest = PageRequest.of(page, size);
	    Page<BookVO> bookPage;

	    switch (type) {
	        case "title":
	            bookPage = bookService.bookSearchResultByTitle(query, pageRequest);
	            break;
	        case "writer":
	            bookPage = bookService.bookSearchResultByWriter(query, pageRequest);
	            break;
	        case "publisher":
	            bookPage = bookService.bookSearchResultByPublisher(query, pageRequest);
	            break;
	        case "bookPreview":
	            bookPage = bookService.bookSearchResultByBookPreview(query, pageRequest);
	            break;
	        default:
	            throw new IllegalArgumentException("Invalid search type: " + type);
	    }

	    model.addAttribute("books", bookPage.getContent());
	    model.addAttribute("currentPage", bookPage.getNumber());
	    model.addAttribute("totalPages", bookPage.getTotalPages());
	    model.addAttribute("totalItems", bookPage.getTotalElements());
	    model.addAttribute("query", query);
	    model.addAttribute("type", type);
	    model.addAttribute("hasMore", !bookPage.isLast());

	    System.out.println("Total books: " + bookPage.getTotalElements() + ", Current page: " + bookPage.getNumber() + ", Has more: " + !bookPage.isLast());

	    return "pages/book-bookSearchResult";
	}

	@GetMapping("/loadMoreBooks")
	@ResponseBody
	public Map<String, Object> loadMoreBooks(
	    @RequestParam("query") String query,
	    @RequestParam("type") String type,
	    @RequestParam(value = "page", defaultValue = "1") int page) {
		System.out.println("북컨트롤러 loadMoreBooks 함수 호출");
	    System.out.println("loadMoreBooks called - query: " + query + ", type: " + type + ", page: " + page);

	    int pageSize = 12;
	    PageRequest pageRequest = PageRequest.of(page - 1, pageSize); // 0-based index

	    Page<BookVO> bookPage;
	    switch (type) {
	        case "title":
	            bookPage = bookService.bookSearchResultByTitle(query, pageRequest);
	            break;
	        case "writer":
	            bookPage = bookService.bookSearchResultByWriter(query, pageRequest);
	            break;
	        case "publisher":
	            bookPage = bookService.bookSearchResultByPublisher(query, pageRequest);
	            break;
	        case "bookPreview":
	            bookPage = bookService.bookSearchResultByBookPreview(query, pageRequest);
	            break;
	        default:
	            throw new IllegalArgumentException("Invalid search type: " + type);
	    }

	    Map<String, Object> response = new HashMap<>();
	    response.put("books", bookPage.getContent());
	    response.put("hasMore", !bookPage.isLast());
	    response.put("totalItems", bookPage.getTotalElements());  // 추가: 총 아이템 수
	    
	    System.out.println("북 컨트롤러 더보기 함수 값 확인: " + bookPage.getContent()+ bookPage.getTotalElements());
	    System.out.println("Returning books: " + bookPage.getContent());
	    for (BookVO book : bookPage.getContent()) {
	        System.out.println(">>>for문 Book: " + book.toString());
	    }
	    return response;
	}

	/**
	 * 화면: 도서 상세 페이지 
	 * method명: getBookDetails 
	 * 인자: bookNum (도서 번호), Model 객체 
	 * 리턴형: String (페이지 이름) 
	 * 역할: 주어진 도서 번호를 사용하여 도서 세부 정보를 가져오고, 
	 * 		 모델에 추가하여 "pages/book-bookDetails" 페이지를 반환하는 함수
	 */
	@GetMapping("/bookDetails")
	public String getBookDetails(@RequestParam("bookNum") Integer bookNum, Model model) {
		BookVO getBookDetails = bookService.getBookDetails(bookNum);
		model.addAttribute("bookDetails", getBookDetails);
		return "pages/book-bookDetails";
	}

	
}

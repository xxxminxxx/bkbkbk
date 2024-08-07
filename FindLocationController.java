package com.bookbookbook.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookbookbook.domain.DocityVO;
import com.bookbookbook.domain.LibraryVO;
import com.bookbookbook.service.FindLocationService;

import jakarta.servlet.http.HttpSession;

@Controller
public class FindLocationController {

	@Autowired
	private FindLocationService findLocationService;

	// [1] 시/도 선택 페이지로 이동하는 요청을 처리
	@GetMapping("/pages/book-preFindLocation")
	public String preFindLocation(
			@RequestParam("isbn") String isbn,
			@RequestParam("bookTitle") String bookTitle,
			Model model) {
		// 모든 시/도 이름 목록을 가져옴
		List<String> regions = findLocationService.findDistinctDoNames();
		// 모델에 필요한 데이터 추가 (시/도 목록, ISBN, 책 제목)
		model.addAttribute("regions", regions);
		model.addAttribute("isbn", isbn);
		model.addAttribute("bookTitle", bookTitle);
		System.out.println(">>>FindLocationControllerpreFindLocation 요청:" + regions);
		return "pages/book-preFindLocation";
	}

	// 도서관 위치 페이지로 이동하는 요청을 처리
	@GetMapping("/findLibraries") 
	public String findLibraries(
			@RequestParam("isbn") String isbn,
			@RequestParam(value = "localCode", required = false) Integer localCode,
			@RequestParam(value = "doName", required = false) String doName, 
			HttpSession session,
			Model m
		) { 
			System.out.println("findLibraries 실행");
			System.out.println("indLocationController findLibraries isbn : " + isbn + "doName : " +doName +"localCode : " + localCode); 

			// 모든 시/도 이름 목록을 가져와 모델에 추가
			List<String> regions = findLocationService.findDistinctDoNames();
			m.addAttribute("regions", regions);

		    // localCode에 해당하는 libraryCode 조회
		    List<Integer> libraries = findLocationService.getLibraryCodeByLocalCode(localCode);
		    System.out.println("findLibraries 컨트롤러 실행 libraries 결과 : " +libraries );

			// isbn과 libraryCode를 이용해 API로 도서관 정보 조회
		    List<LibraryVO> availableLibraries = new ArrayList<>();
		    for (Integer libraryCode : libraries) {
		        LibraryVO library = findLocationService.getLibraryByApi(isbn, libraryCode);
		        if (library != null) {
		            availableLibraries.add(library);
		            m.addAttribute("libraries",availableLibraries);
		        }
		    }
		    System.out.println("API 조회 결과: " + availableLibraries);

			// 세션에 ISBN과 localCode 저장
		    session.setAttribute("isbn", isbn);
		    session.setAttribute("localCode", localCode);
			return "pages/book-preFindLocation";
		}


	// [2] 시/도에 해당하는 구/군 목록을 가져오는 AJAX 요청을 처리
	@ResponseBody
	@GetMapping("/getGuguns")
	public List<DocityVO> getGuguns(@RequestParam("doName") String doName) {
		System.out.println("컨트롤러 getGuguns 실행 doname : " + doName);
		List<DocityVO> guguns = findLocationService.findGugunsByDoName(doName);
		System.out.println("FindLocationController: /getGuguns 요청 처리 - 구/군 목록 로드 완료: " + guguns);
		return guguns;
	}
}

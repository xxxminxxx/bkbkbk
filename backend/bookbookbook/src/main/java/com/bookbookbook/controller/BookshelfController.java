package com.bookbookbook.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookbookbook.domain.BookshelfVO;
import com.bookbookbook.domain.MemoVO;
import com.bookbookbook.service.BookshelfService;
import com.bookbookbook.service.WishlistService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BookshelfController {
	
	@Autowired
	private BookshelfService bookshelfService;
	
	@Autowired
	private WishlistService wishlistService;

	/*
	 * 화면: 				나의 서재 전체, 읽은 책, 읽고 있는 책, 읽고 싶은 책 탭팬 정보 출력
	 * method명: 	getUserData
	 * 인자:      			Model 객체
	 * 리턴형:     		String 
	 * 역할:      			BookshelfService를 통해 사용자 데이터를 가져와서 모델에 추가하고,
	 *           				"pages/user-myBookshelf" 페이지를 반환하는 함수
	 */
	  @GetMapping("/pages/user-myBookshelf")
	    public String getUserData(HttpSession session, Model model) {
		  System.out.println("나의 서재 컨트롤러 getUserData 호출");
		  String userId = (String) session.getAttribute("userId");
		  Integer userNum = (Integer) session.getAttribute("userNum");
		    
		    System.out.println(">>>userId: " + userId);
		    System.out.println(">>>userNum: " + userNum);
		    
		    /* [0809 수정]
		    if (userId == null ) {
		        // userId 또는 userNum이 세션에 없다면 로그인 페이지로 리다이렉트
		        return "redirect:/login";
		    }
		    */
		    
		  if (userId != null) {
		  //전체 탭팬
	        List<BookshelfVO> getUserData = bookshelfService.getUserData(userId);
	        System.out.println(">>> BookshelfController 전체 탭팬: " + getUserData);
	        model.addAttribute("characterStages", getUserData);
	        
	        // 날짜 포맷 변환을 위한 SimpleDateFormat 객체 생성
	        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

	        // 읽은 책 탭팬
	        List<BookshelfVO> getReadBooksDetails = bookshelfService.getReadBooksDetails(userId);
	        for (BookshelfVO book : getReadBooksDetails) {
	            try {
	                if (book.getStartDate() != null) {
	                    Date startDate = inputFormat.parse(book.getStartDate());
	                    book.setStartDate(outputFormat.format(startDate));
	                }
	                if (book.getEndDate() != null) {
	                    Date endDate = inputFormat.parse(book.getEndDate());
	                    book.setEndDate(outputFormat.format(endDate));
	                }
	            } catch (ParseException e) {
	                e.printStackTrace();
	            }
	        }
	        model.addAttribute("readBooks", getReadBooksDetails);

	        /*
	        // 읽고 있는 책 탭팬
	        List<BookshelfVO> getReadingBooksDetails = bookshelfService.getReadingBooksDetails(userId);
	        for (BookshelfVO book : getReadingBooksDetails) {
	            try {
	                if (book.getStartDate() != null) {
	                    Date startDate = inputFormat.parse(book.getStartDate());
	                    book.setStartDate(outputFormat.format(startDate));
	                }
	            } catch (ParseException e) {
	                e.printStackTrace();
	            }
	        }
	        model.addAttribute("readingBooks", getReadingBooksDetails);
*/
	        List<BookshelfVO> readingBooksStatus = bookshelfService.getReadingBooksStatus(userNum);
	        for (BookshelfVO book : readingBooksStatus) {
	            try {
	                if (book.getStartDate() != null) {
	                    Date startDate = inputFormat.parse(book.getStartDate());
	                    book.setStartDate(outputFormat.format(startDate));
	                }
	            } catch (ParseException e) {
	                e.printStackTrace();
	            }
	            System.out.println("책 제목: " + book.getBookTitle() +
	                    ", 읽은 페이지: " + book.getReadPages() +
	                    ", 전체 페이지: " + book.getBookPage());
	        }
	        model.addAttribute("readingBooks", readingBooksStatus);
	        
	        // 읽고 싶은 책 탭팬
	        List<BookshelfVO> wishlistBooks = bookshelfService.getWishlistBooks(userId);
	        for (BookshelfVO book : wishlistBooks) {
	            try {
	                if (book.getAddedDate() != null) {
	                    Date addedDate = inputFormat.parse(book.getAddedDate());
	                    book.setAddedDate(outputFormat.format(addedDate));
	                }
	            } catch (ParseException e) {
	                e.printStackTrace();
	            }
	        }
	        model.addAttribute("wishlistBooks", wishlistBooks);
	        
	        //읽고 있는 책 진행률 표시
	     /*   List<BookshelfVO> readingBooksStatus = bookshelfService.getReadingBooksStatus(userNum);
	        System.out.println("### 북쉘프 컨트롤러 진행률");
	        for (BookshelfVO book : readingBooksStatus) {
	            System.out.println("책 제목: " + book.getBookTitle() + 
	                               ", 읽은 페이지: " + book.getReadPages() + 
	                               ", 전체 페이지: " + book.getBookPage());
	        }

	        model.addAttribute("readingBooks", readingBooksStatus);
	        */
	        
	        // userNum을 모델에 추가
	        model.addAttribute("userNum", userNum);
	        model.addAttribute("userId", userId);
	        
	     // #[추가] 다음 레벨까지 필요한 책 수 계산
	        int readBooksNum = bookshelfService.getReadBooksByUserNum(userNum);
	        int booksToNextLevel = calculateBooksToNextLevel(readBooksNum);
	        model.addAttribute("booksToNextLevel", booksToNextLevel);
	        model.addAttribute("readBooksNum", readBooksNum);
	        model.addAttribute("nextLevelBooks", readBooksNum + booksToNextLevel);
	      }  
	        return "pages/user-myBookshelf";
	    
	  }
	   
	  /*
	   * 화면: 					읽은 책에서 메모 저장 버튼 클릭 시 
	   * method명:    saveMemo
	   * 인자:        			MemoVO 객체
	   * 리턴형:      			ResponseEntity<?>
	   * 역할:        			메모를 받아서 BookshelfService를 통해 저장하고, 저장 완료 메시지를 반환하는 함수
	   */
	  @PostMapping("/saveMemo")
	  public ResponseEntity<?> saveMemo(@RequestBody MemoVO memo, HttpSession session) {
		  /*
		   * 
		   * ResponseEntity: 서버 응답을 구성하는 클래스
			  <?>: 어떤 타입의 데이터든 반환할 수 있음을 의미
			  사용 이유: 클라이언트에게 데이터를 전달하고, 응답의 상태(성공, 오류 등)를 명확히 하기 위함.
			  이해하기 쉽게 비유하자면, ResponseEntity는 서버가 클라이언트에게 보내는 편지 봉투 같은 것. 
			  봉투 안에는 답변 내용(데이터)과 이 답변이 성공적인지 실패했는지를 알려주는 표식(상태 코드)이 들어 있음.
			* 
		   * */
		   System.out.println("Received MemoVO: " + memo); 
	        System.out.println("BookshelfController 컨트롤러: 메모 저장 호출");
	        System.out.println("메모 내용: " + memo.getMemoContent());
	        // 세션에서 userId와 userNum 가져오기
	        String userId = (String) session.getAttribute("userId");
	        Integer userNum = (Integer) session.getAttribute("userNum");
	        
	        if (userId == null || userNum == null) { // MODIFIED: userNum도 체크
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
	        }
	        
	        // MODIFIED: userNum을 MemoVO에 설정
	        memo.setUserNum(userNum);
	        
	        bookshelfService.saveMemo(memo, userId);
	        System.out.println("BookshelfController 컨트롤러: 메모 저장 완료");
	        return ResponseEntity.ok("메모가 저장되었습니다.");
	    }
	  
	  // ##[수정] 책 상태 확인을 위한 새로운 엔드포인트 추가
	  @GetMapping("/bookshelf/checkBookStatus")
	  @ResponseBody
	  public ResponseEntity<Map<String, Object>> checkBookStatus(
	          @RequestParam Integer bookNum,
	          @RequestParam Integer userNum) {
	      Map<String, Object> response = new HashMap<>();
	      try {
	          boolean exists = bookshelfService.checkBookExists(bookNum, userNum);
	          response.put("exists", exists);
	          return ResponseEntity.ok(response);
	      } catch (Exception e) {
	          response.put("error", "책 상태 확인 중 오류가 발생했습니다.");
	          return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	      }
	  }
	  
	  //책 상세에서 읽은 책 저장 시 
	  @PostMapping("/saveBook")
	  public ResponseEntity<Map<String, String>> saveBook(@RequestBody BookshelfVO bookshelfVO, HttpSession session) {
	      System.out.println("saveBook 실행");
	      System.out.println("bookShelfVO 의 내용 : " + bookshelfVO.toString());
	      Map<String, String> response = new HashMap<>();
	      
	      String userId = (String) session.getAttribute("userId");
	      Integer userNum = (Integer) session.getAttribute("userNum");
	      
	      if (userId == null) {
	          response.put("status", "error");
	          response.put("message", "로그인이 필요합니다.");
	          return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
	      }

	      bookshelfVO.setUserId(userId);
	      bookshelfVO.setUserNum(userNum);

	      try {
	          String saveResult = bookshelfService.saveBook(bookshelfVO);
	          
	          if (!saveResult.equals("책이 성공적으로 저장되었습니다.")) {
	              response.put("status", "error");
	              response.put("message", saveResult);
	              return ResponseEntity.ok(response);
	          }

	          int readBooksNum = bookshelfService.getReadBooksByUserNum(userNum);
	          int userLevel = calculateUserLevel(readBooksNum);
	          bookshelfService.updateUserLevel(userLevel, userNum);
	          int booksToNextLevel = calculateBooksToNextLevel(readBooksNum);

	          response.put("status", "success");
	          response.put("message", saveResult);
	          response.put("userLevel", String.valueOf(userLevel));
	          response.put("booksToNextLevel", String.valueOf(booksToNextLevel));
	          return ResponseEntity.ok(response);
	      } catch (Exception e) {
	          e.printStackTrace();
	          response.put("status", "error");
	          response.put("message", "책 저장 중 오류가 발생했습니다: " + e.getMessage());
	          return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	      }
	  }
		  

		// userLevel 계산을 위한 별도 메서드
		private int calculateUserLevel(int readBooksNum) {
		    if (readBooksNum <= 5) return 1;
		    else if (readBooksNum <= 10) return 2;
		    else if (readBooksNum <= 20) return 3;
		    else if (readBooksNum <= 35) return 4;
		    else if (readBooksNum <= 55) return 5;
		    else if (readBooksNum <= 80) return 6;
		    else if (readBooksNum <= 110) return 7;
		    else if (readBooksNum <= 145) return 8;
		    else return 9;
		}
		
		  // 다음 레벨까지 필요한 책 수 계산 메서드
	    private int calculateBooksToNextLevel(int readBooksNum) {
	        if (readBooksNum <= 5) return 5 - readBooksNum;
	        else if (readBooksNum <= 10) return 10 - readBooksNum;
	        else if (readBooksNum <= 20) return 20 - readBooksNum;
	        else if (readBooksNum <= 35) return 35 - readBooksNum;
	        else if (readBooksNum <= 55) return 55 - readBooksNum;
	        else if (readBooksNum <= 80) return 80 - readBooksNum;
	        else if (readBooksNum <= 110) return 110 - readBooksNum;
	        else if (readBooksNum <= 145) return 145 - readBooksNum;
	        else return 0; // 최고 레벨
	    }
	    
	  //책 상세에서 읽고 있는 책 저장시
	    @PostMapping("/saveReadingBook")
	    @ResponseBody
	    public ResponseEntity<Map<String, String>> saveReadingBook(
	            @RequestBody BookshelfVO bookshelfVO,
	            HttpSession session) {
	        System.out.println("북쉘프 컨트롤러 readingBook ");
	        System.out.println("readPages + readingStartDate: " +
	                bookshelfVO.getReadPages() + ", "
	                + bookshelfVO.getStartDate() + ", "
	                + bookshelfVO.getBookNum());

	        String userId = (String) session.getAttribute("userId");
	        Integer userNum = (Integer) session.getAttribute("userNum");
	        
	        if (userId == null || userNum == null) {
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
	                    .body(Map.of("status", "error", "message", "로그인이 필요합니다."));
	        }

	        bookshelfVO.setUserId(userId);
	        bookshelfVO.setUserNum(userNum);
	        bookshelfVO.setReadStatus("N");
	        
	        Map<String, String> response = new HashMap<>();
	        
	        if (bookshelfVO.getReadPages() > bookshelfVO.getBookPage()) {
	            response.put("status", "error");
	            response.put("message", "입력한 페이지가 전체 페이지를 넘을 수 없습니다.");
	            return ResponseEntity.badRequest().body(response);
	        }
	        
	        String result = bookshelfService.saveReadingBook(bookshelfVO);
	        
	        switch (result) {
	            case "already_reading":
	                response.put("status", "error");
	                response.put("message", "이미 읽고 있는 책으로 저장되어 있습니다.");
	                break;
	            case "success":
	                response.put("status", "success");
	                response.put("message", "책이 성공적으로 저장되었습니다.");
	                break;
	            default:
	                response.put("status", "error");
	                response.put("message", "책 저장 중 오류가 발생했습니다.");
	        }

	        return ResponseEntity.ok(response);
	    }
	  
	
	  
	  //읽고 있는 책에서 수정 버튼 클릭시
	  /*
	  @PostMapping("/updateBookProgress")
	  public ResponseEntity<Map<String, String>> updateBookProgress(
	          @RequestParam Integer shelfNum,
	          @RequestParam(required = false) Integer readPages,
	          @RequestParam(required = false) String startDate,
	          @RequestParam Integer bookNum,
	          HttpSession session) {

	      System.out.println(">>> 북쉘프 컨트롤러 수정함수 호출");
	      System.out.println("Updating book progress - shelfNum: " + shelfNum + ", readPages: " + readPages + ", startDate: " + startDate + ", bookNum: " + bookNum);

	      String userId = (String) session.getAttribute("userId");
	      if (userId == null) {
	          return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
	                  .body(Map.of("status", "error", "message", "로그인이 필요합니다."));
	      }

	      try {
	    	  System.out.println("try 문장 들어옴");
	          if (startDate != null && !startDate.isEmpty()) {
	              SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
	              Date date = inputFormat.parse(startDate);
	              startDate = inputFormat.format(date);
	              System.out.println("Formatted startDate: " + startDate);
	          }

	          Map<String, Object> params = new HashMap<>();
	          params.put("userId", userId);
	          params.put("shelfNum", shelfNum);
	          params.put("readPages", readPages);
	          params.put("startDate", startDate);
	          params.put("bookNum", bookNum);

	          boolean result = bookshelfService.updateBookProgress(params);

	          System.out.println("북쉘프 컨트롤러 독서진행상황: " + result);

	          if (result) {
	              return ResponseEntity.ok(Map.of("status", "success", "message", "독서 진행 상황이 업데이트되었습니다."));
	          } else {
	              return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	                      .body(Map.of("status", "failure", "message", "업데이트에 실패했습니다."));
	          }
	      } catch (Exception e) {
	          System.err.println("Error updating book progress: " + e.getMessage());
	          e.printStackTrace();
	          return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                  .body(Map.of("status", "error", "message", "업데이트 중 오류가 발생했습니다: " + e.getMessage()));
	      }
	  } */
	    @PostMapping("/updateBooks")
	    public ResponseEntity<Map<String, Object>> updateBooks(@RequestBody Map<String, Object> requestData, HttpSession session) {
	        String userId = (String) session.getAttribute("userId");
	        if (userId == null) {
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
	                    .body(Map.of("status", "error", "message", "로그인이 필요합니다."));
	        }

	        try {
	            Integer shelfNum = (Integer) requestData.get("shelfNum");
	            Integer readPages = (Integer) requestData.get("readPages");
	            String startDate = (String) requestData.get("startDate");
	            boolean isCompleted = (boolean) requestData.get("isCompleted");
	            Integer rating = requestData.get("rating") != null ? Integer.valueOf(String.valueOf(requestData.get("rating"))) : null;

	            Map<String, Object> params = new HashMap<>();
	            params.put("userId", userId);
	            params.put("shelfNum", shelfNum);
	            params.put("readPages", readPages);
	            params.put("startDate", startDate);
	            params.put("isCompleted", isCompleted);
	            params.put("rating", rating);

	            boolean result = bookshelfService.updateBookProgress(params);

	            if (result) {
	                // 업데이트 후 책 정보를 다시 조회
	                BookshelfVO updatedBook = bookshelfService.getBookByShelfNum(shelfNum);
	                System.out.println("####Updated book info: " + updatedBook);
	                Map<String, Object> response = new HashMap<>();
	                response.put("status", "success");
	                response.put("message", "독서 진행 상황이 업데이트되었습니다.");
	                response.put("updatedBook", updatedBook);
	                return ResponseEntity.ok(response);
	            } else {
	                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	                        .body(Map.of("status", "failure", "message", "업데이트에 실패했습니다."));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body(Map.of("status", "error", "message", "업데이트 중 오류가 발생했습니다: " + e.getMessage()));
	        }
	    }
	  
	  //나의 서재에서 삭제 버튼 클릭시
	  @PostMapping("/deleteBook")
	  @ResponseBody
	  public String deleteBook(
			  @RequestParam(required=false) Integer shelfNum, 
              @RequestParam(required=false) Integer bookNum) {
		  System.out.println(">>>북쉘프 컨트롤러 삭제함수 호출");
		  System.out.println("Deleting book - shelfNum: " + shelfNum + ", bookNum: " + bookNum);
		  try {
		        if (shelfNum != null) {
		            // 읽은 책 삭제 (메모도 함께 삭제)
		            boolean result = bookshelfService.deleteBook(shelfNum);
		            System.out.println("Deleting from bookshelf result: " + result);
		            return result ? "success" : "failure";
		        } else if (bookNum != null) {
		            // 읽고 싶은 책 삭제 (wishlist에서 삭제)
		            boolean result = wishlistService.deleteWishlistBook(bookNum);
		            System.out.println("Deleting from wishlist result: " + result);
		            return result ? "success" : "failure";
		        }
		        return "failure";
		    } catch (Exception e) {
		        System.err.println("Error deleting book: " + e.getMessage());
		        e.printStackTrace();
		        return "error";
		    }
	  }
	  
	  //탭에서 수정 삭제 일어나도 전체탭팬으로 가는 게 아니라 해당 탭팬에 머물 수 있게 하는 함수 
	  @GetMapping("/refreshTab")
	  public String refreshTab(@RequestParam String tabId, Model model, HttpSession session) {
	      System.out.println("refreshTab 메서드 호출됨. 요청된 tabId: " + tabId);

	      // 세션에서 사용자 정보 가져오기
	      String userId = (String) session.getAttribute("userId");
	      Integer userNum = (Integer) session.getAttribute("userNum");
	      System.out.println("세션 정보 - userId: " + userId + ", userNum: " + userNum);

	      // 로그인 상태 확인
	      if (userId == null) {
	          System.out.println("로그인되지 않은 사용자. 로그인 페이지로 리다이렉트");
	          return "redirect:/login";
	      }

	      // 날짜 포맷 설정
	      SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
	      System.out.println("날짜 포맷 설정 완료");

	      // 요청된 탭에 따라 다른 처리
	      switch (tabId) {
	          case "nav-read":
	              System.out.println("읽은 책 탭 새로고침 시작");
	              List<BookshelfVO> readBooks = bookshelfService.getReadBooksDetails(userId);
	              formatDates(readBooks, inputFormat, outputFormat);
	              model.addAttribute("readBooks", readBooks);
	              System.out.println("읽은 책 데이터 로드 완료. 책 수: " + readBooks.size());
	              return "pages/readBooksTab";

	          case "nav-reading":
	              System.out.println("읽고 있는 책 탭 새로고침 시작");
	              List<BookshelfVO> readingBooks = bookshelfService.getReadingBooksStatus(userNum);
	              formatDates(readingBooks, inputFormat, outputFormat);
	              model.addAttribute("readingBooks", readingBooks);
	              System.out.println("읽고 있는 책 데이터 로드 완료. 책 수: " + readingBooks.size());
	              return "pages/readingBooksTab";

	          case "nav-wishlist":
	              System.out.println("읽고 싶은 책 탭 새로고침 시작");
	              List<BookshelfVO> wishlistBooks = bookshelfService.getWishlistBooks(userId);
	              formatDates(wishlistBooks, inputFormat, outputFormat);
	              model.addAttribute("wishlistBooks", wishlistBooks);
	              System.out.println("읽고 싶은 책 데이터 로드 완료. 책 수: " + wishlistBooks.size());
	              return "pages/wishlistBooksTab";

	          default:
	              System.out.println("알 수 없는 탭 ID: " + tabId);
	              return "error";
	      }
	  }

	  /**
	   * 책 목록의 날짜 형식을 변환하는 헬퍼 메서드
	   * @param books 날짜 형식을 변환할 책 목록
	   * @param inputFormat 입력 날짜 형식
	   * @param outputFormat 출력 날짜 형식
	   */
	  private void formatDates(List<BookshelfVO> books, SimpleDateFormat inputFormat, SimpleDateFormat outputFormat) {
	      System.out.println("날짜 형식 변환 시작");
	      for (BookshelfVO book : books) {
	          try {
	              if (book.getStartDate() != null) {
	                  Date startDate = inputFormat.parse(book.getStartDate());
	                  book.setStartDate(outputFormat.format(startDate));
	              }
	              if (book.getEndDate() != null) {
	                  Date endDate = inputFormat.parse(book.getEndDate());
	                  book.setEndDate(outputFormat.format(endDate));
	              }
	              if (book.getAddedDate() != null) {
	                  Date addedDate = inputFormat.parse(book.getAddedDate());
	                  book.setAddedDate(outputFormat.format(addedDate));
	              }
	          } catch (ParseException e) {
	              System.err.println("날짜 변환 중 오류 발생: " + e.getMessage());
	              e.printStackTrace();
	          }
	      }
	      System.out.println("날짜 형식 변환 완료");
	  }
}

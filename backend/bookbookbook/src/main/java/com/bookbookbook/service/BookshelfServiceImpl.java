package com.bookbookbook.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookbookbook.dao.BookshelfDAO;
import com.bookbookbook.domain.BookshelfVO;
import com.bookbookbook.domain.MemoVO;


@Service
public class BookshelfServiceImpl implements BookshelfService{
	
	

	
	@Autowired
	private BookshelfDAO bookshelfDAO;
	
	  // 나의 서재 전체 탭팬
    public List<BookshelfVO> getUserData(String userId) {
        System.out.println(">>> getUserData ServiceImpl 호출");
        List<BookshelfVO> userData = bookshelfDAO.getUserData(userId);
        System.out.println(">>> DAO에서 반환된 데이터: " + userData);
        return userData;
    }
    
    // 나의 서재 읽은 책 탭팬
    public List<BookshelfVO> getReadBooksDetails(String userId) {
        System.out.println(">>> getReadBooksDetails ServiceImpl 호출");
        return bookshelfDAO.getReadBooksDetails(userId);
    }
    
    /*
    public List<BookshelfVO> getReadingBooksDetails(String userId) {
        System.out.println(">>> getReadingBooksDetails ServiceImpl 호출");
        return bookshelfDAO.getReadingBooksDetails(userId);
    }
    */
    public List<BookshelfVO> getWishlistBooks(String userId) {
    	System.out.println(">>>getWishlistBooks ServiceImpl 호출");
        return bookshelfDAO.getWishlistBooks(userId);
    }
    

    // 읽은 책에서 메모 저장
    @Override
    public void saveMemo(MemoVO memo, String userId) {
    	 try {
    	        System.out.println("BookshelfServiceImpl 서비스: 메모 저장 호출");
    	        System.out.println("메모 내용: " + memo.getMemoContent());
    	        Map<String, Object> params = new HashMap<>();
    	        params.put("memo", memo);
    	        params.put("userId", userId);
    	        System.out.println(">>>params: " + params);
    	        bookshelfDAO.insertMemo(params);
    	        System.out.println("BookshelfServiceImpl: 메모 저장 완료");
    	    } catch (Exception e) {
    	        System.err.println("메모 저장 중 오류 발생: " + e.getMessage());
    	        throw new RuntimeException("메모 저장에 실패했습니다.", e);
    	    }
    }
    
    // 읽은 책 저장
    public String saveBook(BookshelfVO bookshelfVO) {
        Map<String, Object> params = new HashMap<>();
        params.put("bookNum", bookshelfVO.getBookNum());
        params.put("userNum", bookshelfVO.getUserNum());
        
        // 이미 저장된 책인지 확인 (읽은 책 또는 읽고 있는 책)
        int count = bookshelfDAO.checkBookExists(params);
        
        if (count > 0) {
            // 이미 저장된 책의 상태 확인
            String status = bookshelfDAO.getBookStatus(params);
            if ("Y".equals(status)) {
                return "이미 읽은 책으로 저장되어 있습니다.";
            } else {
                return "이미 읽고 있는 책으로 저장되어 있습니다.";
            }
        }

        // 책 저장
        bookshelfDAO.saveBook(bookshelfVO);
        return "책이 성공적으로 저장되었습니다.";
    }

	/*
	 * public String saveBook(BookshelfVO bookshelfVO) { Map<String, Object> params
	 * = new HashMap<>(); params.put("bookNum", bookshelfVO.getBookNum());
	 * params.put("userNum", bookshelfVO.getUserNum());
	 * System.out.println("saveBook , params: " + params);
	 * 
	 * // 이미 저장된 책인지 확인 int count = bookshelfDAO.checkBookExists(params);
	 * System.out.println("saveBook checkBookExists 반환된 count : " + count);
	 * 
	 * if (count > 0) { return "이미 저장된 책입니다."; }
	 * 
	 * // 책 저장 bookshelfDAO.saveBook(bookshelfVO); return "책이 성공적으로 저장되었습니다."; }
	 */
    
    // 읽은 권수에 따른 레벨업
    @Override
    public int getReadBooksByUserNum(int userNum) {
        return bookshelfDAO.getReadBooksByUserNum(userNum);
    }

    @Override
    public void updateUserLevel(int userLevel, int userNum) {
        Map<String, Object> params = new HashMap<>();
        params.put("userLevel", userLevel);
        params.put("userNum", userNum);
        bookshelfDAO.updateUserLevel(params);
    }
    
    //
    @Override
    public int calculateBooksToNextLevel(int userNum) {
        int readBooksNum = bookshelfDAO.getReadBooksByUserNum(userNum);
        
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
    
    //책 정보 조회
    public BookshelfVO getBookByShelfNum(Integer shelfNum) {
        return bookshelfDAO.selectBookByShelfNum(shelfNum);
    }


	//읽고 있는 책 저장
    public String saveReadingBook(BookshelfVO bookshelfVO) {
        try {
            System.out.println("북쉘프 서비스임플 saveReadingBook 호출");
            
            Map<String, Object> params = new HashMap<>();
            params.put("userId", bookshelfVO.getUserId());
            params.put("bookNum", bookshelfVO.getBookNum());
            
            // 이미 저장된 책인지 확인 (읽은 책 또는 읽고 있는 책)
            int check = bookshelfDAO.checkBookExists(params);
            
            if (check > 0) {
                // 이미 저장된 책의 상태 확인
                String status = bookshelfDAO.getBookStatus(params);
                if ("Y".equals(status)) {
                    return "이미 읽은 책으로 저장되어 있습니다.";
                } else {
                    return "이미 읽고 있는 책으로 저장되어 있습니다.";
                }
            }

            bookshelfDAO.saveReadingBook(bookshelfVO);
            System.out.println("북쉘프 서비스임플 saveReadingBook 저장 완료");
            return "success";
        } catch (Exception e) {
            System.err.println("saveReadingBook 저장 중 오류 발생: " + e.getMessage());
            throw new RuntimeException("saveReadingBook 저장에 실패했습니다.", e);
        }
    }
    
    @Override
    public boolean checkBookExists(Integer bookNum, Integer userNum) {
        Map<String, Object> params = new HashMap<>();
        params.put("bookNum", bookNum);
        params.put("userNum", userNum);
        return bookshelfDAO.checkBookExists(params) > 0;
    }
	/*
	 * public String saveReadingBook(BookshelfVO bookshelfVO) { try {
	 * System.out.println("북쉘프 서비스임플 saveReadingBook 호출");
	 * 
	 * 
	 * // 이미 읽고 있는 책으로 저장됐는지 확인 Map<String, Object> params = new HashMap<>();
	 * params.put("userId", bookshelfVO.getUserId()); params.put("bookNum",
	 * bookshelfVO.getBookNum());
	 * 
	 * //읽고 있는 책인지 확인 params.put("readStatus", "N"); System.out.println("params : "
	 * + params); System.out.println("dao 실행 전"); int check =
	 * bookshelfDAO.checkBookExists(params);
	 * 
	 * System.out.println("dao 실행 후 checkBookExists 결과 : " + check); if (check > 0)
	 * { System.out.println("읽고 있는 책으로 이미 저장되어 있음"); return "already_reading"; }
	 * 
	 * bookshelfDAO.saveReadingBook(bookshelfVO);
	 * System.out.println("북쉘프 서비스임플 saveReadingBook 저장 완료"); return "success"; }
	 * catch (Exception e) { System.err.println("saveReadingBook 저장 중 오류 발생: " +
	 * e.getMessage()); throw new RuntimeException("saveReadingBook 저장에 실패했습니다.",
	 * e); } }
	 */
	
	//읽고 있는 책 진행바
	public List<BookshelfVO> getReadingBooksStatus(Integer userNum) {
        System.out.println("### 북쉘프 서비스 getReadingBooksStatus");
        List<BookshelfVO> readingBooksStatus = bookshelfDAO.getReadingBooksStatus(userNum);
        for (BookshelfVO book : readingBooksStatus) {
            System.out.println("책 제목: " + book.getBookTitle() + 
                               ", 읽은 페이지: " + book.getReadPages() + 
                               ", 전체 페이지: " + book.getBookPage());
        }
        return readingBooksStatus;
    }
	
	//읽고 있는 책 수정
	  @Override
	    public boolean updateBookProgress(Map<String, Object> params) {
	        // #[수정] 완료 여부에 따라 readStatus 및 endDate 설정
	        boolean isCompleted = (boolean) params.get("isCompleted");
	        if (isCompleted) {
	            params.put("readStatus", "Y");
	            params.put("endDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	            // #[수정] 별점 업데이트 로직 추가
	            Integer rating = (Integer) params.get("rating");
	            if (rating != null) {
	                params.put("rating", rating);
	            }
	        } else {
	            params.put("readStatus", "N");
	            params.put("endDate", null);
	        }

	        return bookshelfDAO.updateBookProgress(params) > 0;
	    }
	
	//삭제
	@Transactional // 트랜잭션 관리를 위해 추가
    @Override
    public boolean deleteBook(Integer shelfNum) {
        try {
            // 로그: 메서드 시작
            System.out.println("deleteBook 메서드 시작 - shelfNum: " + shelfNum);

            // 1. 먼저 관련된 메모 삭제
            int deletedMemos = bookshelfDAO.deleteMemosByShelfNum(shelfNum);
            System.out.println("삭제된 메모 수: " + deletedMemos);

            // 2. 그 다음 책 삭제
            int result = bookshelfDAO.deleteBook(shelfNum);
            System.out.println("책 삭제 결과: " + result + " (1이면 성공, 0이면 실패)");

            boolean success = result > 0;
            System.out.println("deleteBook 메서드 종료 - 성공 여부: " + success);
            return success;
        } catch (Exception e) {
            // 예외 발생 시 로그
            System.err.println("deleteBook 메서드에서 예외 발생: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
	}
}

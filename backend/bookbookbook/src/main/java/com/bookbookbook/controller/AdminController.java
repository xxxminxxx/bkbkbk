package com.bookbookbook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bookbookbook.domain.AdminVO;
import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.domain.VisitVO;
import com.bookbookbook.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@CrossOrigin(origins="http://localhost:3000")
@RestController //@Controller + @ResponseBody

public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//리액트에서 로그인을 요청하는 메서드 POST사용
	@PostMapping("/login")
	public ResponseEntity<Map<String,Object>> login(@RequestBody AdminVO vo,HttpSession session){
		
		System.out.println("가져온 id: " + vo.getAdminId());
		System.out.println("가져온 password:" + vo.getAdminPass());
		Map<String,Object> response = new HashMap<>();
		
		// 로그인 수행
		boolean isAuthenticated = adminService.searchId(vo.getAdminId(),vo.getAdminPass());
		
		if(isAuthenticated) {
			AdminVO authenticatedAdmin = adminService.getAdminById(vo.getAdminId());
			session.setAttribute("admin", authenticatedAdmin);
			response.put("success", true);
			response.put("message", "로그인 성공");
			response.put("admin", authenticatedAdmin);
			return ResponseEntity.ok(response);
		}else {
			response.put("success", false);
			response.put("message", "로그인 실패: 아이디 또는 비밀번호가 잘못되었습니다.");
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
			
		}
		

	}
	
	//리액트에서 로그아웃을 요청하는 메서드 POST사용
	 @PostMapping("/logouted")
	    public ResponseEntity<Map<String, Object>> logout(HttpSession session) {
	        Map<String, Object> response = new HashMap<>();

	        try {
	            // 세션에서 admin 속성 제거
	            session.removeAttribute("admin");
	            
	            // 세션 무효화
	            session.invalidate();

	            response.put("success", true);
	            response.put("message", "로그아웃 성공");
	        } catch (Exception e) {
	            response.put("success", false);
	            response.put("message", "로그아웃 실패: " + e.getMessage());
	            return ResponseEntity.badRequest().body(response);
	        }

	        return ResponseEntity.ok(response);
	    }
	
	
	//리액트에서 회원정보를 요청하는 메서드 GET사용
	
	@GetMapping("/users")
	public List<UserVO> getUserList(){
		UserVO vo = new UserVO();
		List<UserVO> result = adminService.getUserList(vo);
		return result;
	}
	
	@GetMapping("/reports")
	public List<ReportVO> getReportList(){
		ReportVO vo = new ReportVO();
		List<ReportVO> result = adminService.getReportList(vo);
		return result;
	}
	
	//리액트에서 관리자 정보를 요청하는 메서드 GET사용
	@GetMapping("/getAdmins")
	public List<AdminVO> getAdminList(){
		AdminVO vo = new AdminVO();
		List<AdminVO> result = adminService.getAdminList(vo);
		return result;
	}
	
	//리액트에서 회원생일정보를 요청하는 메소드 GET사용
	@GetMapping("/birthday")
	public List<UserVO> getBirthList(){
		UserVO vo = new UserVO();
		List<UserVO> result = adminService.getBirthList(vo);
		return result;
	}
	
	//리액트에서 도서정보를 요청하는 메소드 GET사용
	@GetMapping("/books")
	public List<BookVO> getBookList(){
		System.out.println("도서 정보 호출");
		BookVO vo = new BookVO();
		List<BookVO> result = adminService.getBookList(vo);
		return result;	
	}
	

	 @GetMapping("/search")
	 	public ResponseEntity<List<UserVO>> searchUsers(
	            @RequestParam String searchCategory,
	            @RequestParam String searchKeyword) {
	        
	        System.out.println("1받은 카테고리: " + searchCategory);
	        System.out.println("1받은 키워드: " + searchKeyword);

	        HashMap<String, String> map = new HashMap<>();
	        
	        map.put("searchCategory", searchCategory);
	        map.put("searchKeyword", searchKeyword);

	        List<UserVO> result = adminService.getSearchList(map);
	        return ResponseEntity.ok(result);
	    }
	 
	 @GetMapping("/searchb")
	 public ResponseEntity<List<BookVO>> searchBooks(
			 @RequestParam String searchCategory,
			 @RequestParam String searchKeyword			 
			 ){
		 	
		 	HashMap<String,String> map = new HashMap<>();
		 	map.put("searchCategory", searchCategory);
		 	map.put("searchKeyword", searchKeyword);
		 	
		 	List<BookVO> result = adminService.getbSearchList(map);
		 	return ResponseEntity.ok(result);
	 		}
	 
	 
	 @GetMapping("/visitor-count")
	 public VisitVO getVisitorCount(){
	     VisitVO vo = new VisitVO();
	     try {
	         VisitVO result = adminService.getVisitorCount(vo);
	         return result;
	     } catch (Exception e) {
	         System.err.println("방문자 수 조회 중 오류 발생: " + e.getMessage());
	         e.printStackTrace();
	         return new VisitVO(); // 또는 적절한 오류 응답
	     }
	 }
	 
	 @GetMapping("/mcount")
	 public VisitVO getVisitorCountM() {
	     VisitVO vo = new VisitVO();
	     try {
	         VisitVO result = adminService.getVisitorCountM(vo);
	         return result;
	     } catch (Exception e) {
	         System.out.println("이번달 방문자수 조회 중 오류 발생: " + e.getMessage());
	         e.printStackTrace(); // 스택 트레이스 출력
	         return new VisitVO(); // 오류 시 빈 VisitVO 객체 반환
	     }
	 }
	 
	 //레벨 분포도
	 @GetMapping("/user-levels")
	 public List<Map<String, Object>> getLevelCount() {
		    try {
		        List<Map<String, Object>> result = adminService.getLevelCount();
		        return result;
		    } catch(Exception ex) {
		        System.out.println("유저 레벨 호출중 오류 발생:" + ex.getMessage());
		        return new ArrayList<>();
		    }
		}
	 
	 //월별 방문자수
	 @GetMapping("/EachMonthCount")
	 public ResponseEntity<Map<String,Integer>> getMonthCount(
			 @RequestParam int year,
			 @RequestParam int month){
		 int count = adminService.getMonthCount(year,month);
		 Map<String, Integer> response = new HashMap<>();
	     response.put("count", count);
	     return ResponseEntity.ok(response); 
	 }
	 
	 //회원 정보 수정
	 @PostMapping("/update")
	 public ResponseEntity<UserVO> updateUser(
			 @RequestParam String userId,
			 @RequestParam String userName,
			 @RequestParam String userTel,
			 @RequestParam String userLevel
			 ) {
		 
		 UserVO vo = new UserVO();
		 vo.setUserId(userId);
		 vo.setUserName(userName);
		 vo.setUserTel(userTel);
		 vo.setUserLevel(Integer.parseInt(userLevel));
		 
		 UserVO result = adminService.updateUser(vo);
		 
		 return ResponseEntity.ok(result);
	 }
	 
	 //관리자 추가
	 @PutMapping("/insert")
	 public String insert(
			 @RequestParam String id,
			 @RequestParam String name,
			 @RequestParam String pass,
			 @RequestParam String tel
			 ) {
		 
		 AdminVO vo = new AdminVO();
		 vo.setAdminId(id);
		 vo.setAdminName(name);
		 vo.setAdminPass(pass);
		 vo.setAdminTel(tel);
		 
		 adminService.insertAdmin(vo);
		 return "ok";
		 
	 }
	 
	 
	 //회원 정보 삭제
	 @DeleteMapping("/delete")
	 public String deleteUser(
			 @RequestParam String userId
			 ){
		 
		 UserVO vo = new UserVO();
		 vo.setUserId(userId);
		 
		 adminService.deleteUser(vo);
		 return "ok";
	 }
	 
	 //회원 정지 기능
	 @PostMapping("/stop")
	 public String stop(
			 @RequestParam String userId,
			 @RequestParam String stop
			 ){
		 
		 UserVO vo = new UserVO();
		 vo.setUserId(userId);
		 vo.setBanStatus(stop);
		 adminService.updateStop(vo);
		 
		 return "ok";
	 }
	 
	 //신고당한 회원 정지 기능
	 @PostMapping("/report")
	 public String report(
			 @RequestParam Integer reportedNum
			 ) {
		 
		 ReportVO vo = new ReportVO();
		 vo.setReportedNum(reportedNum);

		 
		 adminService.updateReport(vo);
		 return "ok"; 
	 }
	 
	 //회원 정지 해제
	 @PostMapping("/release")
	 public String release(
			 @RequestParam String userId,
			 @RequestParam String stop
			 ){
		 
		 UserVO vo = new UserVO();
		 vo.setUserId(userId);
		 vo.setBanStatus(stop);
		 
		 adminService.updateRelease(vo);
		 
		 return "ok";
	 }
	 

	 
	 
}

package com.bookbookbook.controller;

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
			System.out.println("Login response: " + response); // 응답 데이터를 로그로 출력
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
		System.out.println("여기는 컨트롤러"+result);
		return result;
	}
	
	//리액트에서 관리자 정보를 요청하는 메서드 GET사용
	@GetMapping("/getAdmins")
	public List<AdminVO> getAdminList(){
		AdminVO vo = new AdminVO();
		List<AdminVO> result = adminService.getAdminList(vo);
		System.out.println("여기는관리자정보가져온다"+result);
		return result;
	}
	
	//리액트에서 회원생일정보를 요청하는 메소드 GET사용
	@GetMapping("/birthday")
	public List<UserVO> getBirthList(){
		UserVO vo = new UserVO();
		List<UserVO> result = adminService.getBirthList(vo);
		System.out.println("생일"+result);
		return result;
	}
	
	//리액트에서 도서정보를 요청하는 메소드 GET사용
	@GetMapping("/books")
	public List<BookVO> getBookList(){
		System.out.println("도서 정보 호출");
		BookVO vo = new BookVO();
		List<BookVO> result = adminService.getBookList(vo);
		System.out.println("여기는 컨트롤러"+result);
		return result;	
	}
	
	//옵션선택후 키워드 입력시 해당 되는 사용자정보 출력하는 메서드 GET사용
	/*
	@GetMapping("/search")
	public List<UserVO> searchUsers(
			@RequestParam String searchCategory,
			@RequestParam String searchKeyword){
		System.out.println("받은 카테고리"+searchCategory);
		System.out.println("받은 키워드"+searchKeyword);
		
		HashMap map = new HashMap<>();
		map.put("searchCategory", searchCategory);
		map.put("searchKeyword", searchKeyword);
		
		List<UserVO> result = adminService.getSearchList(map);
		return result;
		
	}*/
	 @GetMapping("/search")
	    // public ResponseEntity<List<UserVO>> searchUsers(
	 	public ResponseEntity<List<UserVO>> searchUsers(
	            @RequestParam String searchCategory,
	            @RequestParam String searchKeyword) {
	        
	        System.out.println("1받은 카테고리: " + searchCategory);
	        System.out.println("1받은 키워드: " + searchKeyword);

	        HashMap<String, String> map = new HashMap<>();
	        
	        /*
	     // 카테고리에 따라 적절한 필드 이름으로 변환
	        String dbFieldName;
	        switch (searchCategory) {
	            case "회원명":
	                dbFieldName = "userName";
	                break;
	            case "이메일":
	                dbFieldName = "userId";  // 이메일이 userId 필드에 저장된다고 가정
	                break;
	            case "가입일":
	                dbFieldName = "joinedDate";
	                break;
	            default:
	                dbFieldName = searchCategory;  // 기본값으로 원래 카테고리 사용
	        }*/
	        
	        map.put("searchCategory", searchCategory);
	        map.put("searchKeyword", searchKeyword);

	        List<UserVO> result = adminService.getSearchList(map);
	        System.out.println(result);
	        return ResponseEntity.ok(result);
	        //return "ok";
	    }
	 
	 @GetMapping("/searchb")
	 public ResponseEntity<List<BookVO>> searchBooks(
			 @RequestParam String searchCategory,
			 @RequestParam String searchKeyword			 
			 ){
		 	System.out.println("받은 도서 카테고리" + searchCategory);
		 	System.out.println("받은 도서 키워드" +searchKeyword);
		 	
		 	HashMap<String,String> map = new HashMap<>();
		 	map.put("searchCategory", searchCategory);
		 	map.put("searchKeyword", searchKeyword);
		 	
		 	List<BookVO> result = adminService.getbSearchList(map);
		 	System.out.println(result);
		 	return ResponseEntity.ok(result);
	 		}
	 
	 
	 @GetMapping("/visitor-count")
	 public VisitVO getVisitorCount(){
	     System.out.println("호출되었음");
	     VisitVO vo = new VisitVO();
	     try {
	         VisitVO result = adminService.getVisitorCount(vo);
	         System.out.println("조회 결과: " + result);
	         return result;
	     } catch (Exception e) {
	         System.err.println("방문자 수 조회 중 오류 발생: " + e.getMessage());
	         e.printStackTrace();
	         return new VisitVO(); // 또는 적절한 오류 응답
	     }
	 }
	 
	 @GetMapping("/mcount")
	 public VisitVO getVisitorCountM() {
	     System.out.println("호출되었음");
	     VisitVO vo = new VisitVO();
	     try {
	         VisitVO result = adminService.getVisitorCountM(vo);
	         System.out.println("조회 결과:" + result);
	         return result;
	     } catch (Exception e) {
	         System.out.println("이번달 방문자수 조회 중 오류 발생: " + e.getMessage());
	         e.printStackTrace(); // 스택 트레이스 출력
	         return new VisitVO(); // 오류 시 빈 VisitVO 객체 반환
	     }
	 }
	 
	 //회원 정보 수정
	 @PostMapping("/update")
	 public ResponseEntity<UserVO> updateUser(
			 @RequestParam String userId,
			 @RequestParam String userName,
			 @RequestParam String userTel,
			 @RequestParam String userLevel
			 ) {
		 System.out.println("받은 ID" + userId);
		 System.out.println("받은 이름" +userName);
		 System.out.println("받은 카테고리" + userTel);
		 System.out.println("받은 레벨" +userLevel);
		 
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
		 
		 System.out.println("받은 ID" + id);
		 System.out.println("받은 name" +name);
		 System.out.println("받은 pass" + pass);
		 System.out.println("받은 tel" +tel);
		 
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
		 System.out.println("받은 ID "+userId);
		 
		 UserVO vo = new UserVO();
		 vo.setUserId(userId);
		 
		 adminService.deleteUser(vo);
		 System.out.println("삭제가 성공적으로 완료되었습니다.");
		 return "ok";
	 }
	 
	 //회원 정지 기능
	 @PostMapping("/stop")
	 public String stop(
			 @RequestParam String userId,
			 @RequestParam String stop
			 ){
		 
		 System.out.println("가져온 id"+userId);
		 System.out.println("가져온 스탑 반응"+stop);
		 
		 UserVO vo = new UserVO();
		 vo.setUserId(userId);
		 vo.setBanStatus(stop);
		 
		 adminService.updateStop(vo);
		 
		 return "ok";
	 }
	 
	 //회원 정지 해제
	 @PostMapping("/release")
	 public String release(
			 @RequestParam String userId,
			 @RequestParam String stop
			 ){
		 
		 System.out.println("가져온 id"+userId);
		 System.out.println("가져온 스탑 반응"+stop);
		 
		 UserVO vo = new UserVO();
		 vo.setUserId(userId);
		 vo.setBanStatus(stop);
		 
		 adminService.updateRelease(vo);
		 
		 return "ok";
	 }
	 
}

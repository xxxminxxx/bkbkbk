package com.bookbookbook.service;

import java.util.HashMap;
import java.util.List;

import com.bookbookbook.domain.AdminVO;
import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.domain.VisitVO;

public interface AdminService {
	
	//로그인 요청시 Id와 Password DB에서 맞는지 확인
	boolean searchId(String adminId, String adminPass);
	AdminVO getAdminById(String adminId);
	
	//회원 정보 리스트로 가져오기
	List<UserVO> getUserList(UserVO vo);
	
	//도서 정보 리스트로 가져오기
	List<BookVO> getBookList(BookVO vo);
	
	//특정키워드로 검색시 해당되는 회원정보 리스트 가져오기
	List<UserVO> getSearchList(HashMap map);
	
	//일일 방문자수 들고오기
	VisitVO getVisitorCount(VisitVO vo);
	//월일 방문자수 들고오기
	VisitVO getVisitorCountM(VisitVO vo);
	
	//특정키워드로 검색시 해당되는 도서정보 리스트 가져오기
	List<BookVO> getbSearchList(HashMap map);
	
	//유저 업데이트
	UserVO updateUser(UserVO vo);
	
	//유저 삭제
	void deleteUser(UserVO vo);
	
	//관리자 추가
	void insertAdmin(AdminVO vo);
	//회원 정지
	void updateStop(UserVO vo);
	//회원 정지 해제
	void updateRelease(UserVO vo);
	//회원 생일정보 가져오기
	List<UserVO> getBirthList(UserVO vo);
	//관리자 정보 가져오기
	List<AdminVO> getAdminList(AdminVO vo);
	

}

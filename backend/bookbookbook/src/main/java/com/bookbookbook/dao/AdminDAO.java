package com.bookbookbook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookbookbook.domain.AdminVO;
import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.domain.VisitVO;

@Mapper
public interface AdminDAO {
	//아이디
	public AdminVO findByAdminId(AdminVO vo);
	//사용자 정보 가져오기
	public List<UserVO> getUserList(UserVO vo);
	//도서 정보 가져오기
	public List<BookVO> getBookList(BookVO vo);
	
	// 특정키워드 검색
	public List<UserVO> getSearchList(HashMap map);
	
	//일일방문
	public VisitVO getVisitorCount(VisitVO vo);
	//월일방문
	public VisitVO getVisitorCountM(VisitVO vo);
	
	//도서정보 특정키워드검색
	public List<BookVO> getbSearchList(HashMap map);
	//사용자 정보 업데이트
	public UserVO updateUser(UserVO vo);
	//사용자 정보 삭제
	public void deleteUser(UserVO vo);
	
	//관리자 추가
	public void insertAdmin(AdminVO vo);
	
	//사용자 정지
	public void updateStop(UserVO vo);
	
	//사용자 정지해제
	public void updateRelease(UserVO vo);
	
	//사용자 생일정보가져와서 연령차트만들기
	public List<UserVO> getBirthList(UserVO vo);	
	
	//관리자 가져오기
	public List<AdminVO> getAdminList(AdminVO vo);
	//신고 정보 가져오기
	public List<ReportVO> getReportList(ReportVO vo);
	
	//신고당한 회원 정지후 테이블 업데이트
	public void updateReport(ReportVO vo);
	
	//레벨가져오기
	public List<Map<String, Object>> getLevelCount();
	
	public int getMonthCount(Map<String, Integer> params);
}

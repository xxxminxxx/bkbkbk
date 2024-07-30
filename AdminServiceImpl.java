package com.bookbookbook.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookbookbook.dao.AdminDAO;
import com.bookbookbook.domain.AdminVO;
import com.bookbookbook.domain.BookVO;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.domain.VisitVO;

@Service
public class AdminServiceImpl implements AdminService{
	
		@Autowired
		private AdminDAO adminDAO;

		public boolean searchId(String adminId, String adminPass) {
			System.out.println("여기까지 받아왓슈: "+adminId);
			System.out.println("여기까지 받아왓슈: "+adminPass);
			
			
			AdminVO vo = new AdminVO();
			vo.setAdminId(adminId);
			vo.setAdminPass(adminPass);
			
			AdminVO id = adminDAO.findByAdminId(vo);
			
			System.out.println("id값은:"+id);
			if(id !=null) {
				return id.getAdminPass().equals(adminPass);
			}
			return false;
		}
		
		public AdminVO getAdminById(String adminId) {
			AdminVO vo = new AdminVO();
			vo.setAdminId(adminId);
			return adminDAO.findByAdminId(vo);
		}
		
		public List<UserVO>getUserList(UserVO vo){
			return adminDAO.getUserList(vo);
		}
		
		public List<BookVO>getBookList(BookVO vo){
			return adminDAO.getBookList(vo);
		}
		
		public List<UserVO> getSearchList(HashMap map){
			System.out.println(map);
			return adminDAO.getSearchList(map);
		}
		
		public List<BookVO> getbSearchList(HashMap map){
			System.out.println(map);
			return adminDAO.getbSearchList(map);
		}
		
		//일일 방문자수 들고오기
		public VisitVO getVisitorCount(VisitVO vo) {
			return adminDAO.getVisitorCount(vo);		
		}
		//월 총 방문자수 들고오기
		public VisitVO getVisitorCountM(VisitVO vo) {
			return adminDAO.getVisitorCountM(vo);
		}
		//사용자 정보업데이트
		@Override
		public UserVO updateUser(UserVO vo) {
			return adminDAO.updateUser(vo);
		}
		//사용자 정보 삭제
		@Override
		public void deleteUser(UserVO vo) {
			adminDAO.deleteUser(vo);
		}
		
		//관리자 추가
		@Override
		public void insertAdmin(AdminVO vo) {
			adminDAO.insertAdmin(vo);
		}

		//회원 정지
		public void updateStop(UserVO vo) {
			adminDAO.updateStop(vo);
		}
		
		//회원 정지 해제
		public void updateRelease(UserVO vo) {
			adminDAO.updateRelease(vo);
		}

		@Override
		public List<UserVO> getBirthList(UserVO vo) {
			return adminDAO.getBirthList(vo);
		}

		@Override
		public List<AdminVO> getAdminList(AdminVO vo) {
			return adminDAO.getAdminList(vo);
		}
		
		
}

package com.bookbookbook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookbookbook.dao.UserDAO;
import com.bookbookbook.domain.ReportVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	public void submitReport(ReportVO vo) {
		userDAO.submitReport(vo);
	}
}

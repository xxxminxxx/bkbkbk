package com.bookbookbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.service.UserService;

@RestController
public class UserController {
   
	@Autowired
	private UserService userService;
	
	//채팅 신고기능
	  @PostMapping("/submitReport")
	    @ResponseBody
		public void submitReport(@ModelAttribute ReportVO vo) {
		  System.out.println(vo.toString());
			userService.submitReport(vo);
		}
	
}

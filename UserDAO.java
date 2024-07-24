package com.bookbookbook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.bookbookbook.domain.ReportVO;
import com.bookbookbook.domain.UserVO;
import com.bookbookbook.domain.VisitVO;

@Mapper
public interface UserDAO {
	
	//####################################
	//회원가입, 로그인 관련
	public List<UserVO> getUserList(UserVO vo);
	public void registerUser(UserVO vo);
	public UserVO loginUser(String userId);
	public String findEmail(String userName, String userTel);
	public void updateUserOnlineStatus(String userId, boolean b);
	public UserVO findUserByNameIdAndTel(String userName, String userId, String userTel);
    public void updatePassword(String userId, String newPassword);

    //##############################
    //채팅
    public void submitReport(ReportVO vo);
    //방문자수등록
  	public void insertVisitLog(VisitVO vo);

}

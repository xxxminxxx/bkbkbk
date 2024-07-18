package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.domain.UserVO;

@Mapper
public interface UserDAO {
	
	public List<UserVO> getUserList(UserVO vo);

	public void registerUser(UserVO vo);

	public UserVO loginUser(String userId);

	public String findEmail(String userName, String userTel);

	public void updateUserOnlineStatus(String userId, boolean b);
	
	public UserVO findUserByNameIdAndTel(String userName, String userId, String userTel);
	
    public void updatePassword(String userId, String newPassword);
    
    int checkDuplicateUser(String userId, String userTel);
    
    public UserVO findUserByEmail(String email);
    public void updateUser(UserVO user);

	public int existsByUserId(String email);

 // DAO 채워넣기

}
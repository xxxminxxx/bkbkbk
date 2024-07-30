package com.bookbookbook.dao;

import com.bookbookbook.domain.UserStatVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserStatDAO {

	// 사용자 정보 조회
	public List<UserStatVO> getUserStatInfo1(UserStatVO userStatVO);

	//월별 권수 조회
	public List<UserStatVO> getUserStatInfo2(UserStatVO userStatVO);

}

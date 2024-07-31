package com.bookbookbook.dao;

import com.bookbookbook.domain.UserStatVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserStatDAO {

	// 페이지별 통계
	public List<UserStatVO> getUserStatInfo1(UserStatVO userStatVO);

	// 권수별 통계
	public List<UserStatVO> getUserStatInfo2(UserStatVO userStatVO);

}

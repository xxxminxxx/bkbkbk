package com.bookbookbook.service;

import com.bookbookbook.domain.*;
import jakarta.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface UserStatService {

	//권수별 통계
	List<UserStatVO> getUserStatInfo1(UserStatVO userStatVO);

	//페이지별 통계
	List<UserStatVO> getUserStatInfo2(UserStatVO userStatVO);

}


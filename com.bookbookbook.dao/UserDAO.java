package com.bookbookbook.dao;

import org.apache.ibatis.annotations.Mapper;

import com.bookbookbook.domain.ReportVO;

@Mapper
public interface UserDAO {
	
public void submitReport(ReportVO vo);
}

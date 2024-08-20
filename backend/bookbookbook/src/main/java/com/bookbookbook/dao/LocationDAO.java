package com.bookbookbook.dao;

import java.util.List;

import com.bookbookbook.domain.LocationVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LocationDAO {
	//주어진 도 이름에 해당하는 모든 시 조회
    List<LocationVO> getCitiesByDoName(String doName);
}
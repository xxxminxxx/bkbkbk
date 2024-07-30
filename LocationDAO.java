package com.bookbookbook.dao;

import java.util.List;

import com.bookbookbook.domain.LocationVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LocationDAO {
    List<LocationVO> getCitiesByDoName(String doName);
}

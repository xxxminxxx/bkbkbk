package com.bookbookbook.dao;

import java.util.List;

import com.bookbookbook.domain.LocationVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper

public interface LocationDAO {

    /*특정 도 또는 광역시에 속한 시/군/구 목록을 조회하는 메서드*/
    List<LocationVO> getCitiesByDoName(String doName);
}

package com.bookbookbook.service;

import com.bookbookbook.domain.LocationVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public interface LocationService {

 /*특정 도 또는 광역시에 속한 시/군/구 목록을 조회하는 메서드*/
 public List<LocationVO> getCitiesByDoName(String doName);

}

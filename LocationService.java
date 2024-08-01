package com.bookbookbook.service;

import com.bookbookbook.domain.LocationVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public interface LocationService {

 //주어진 도 이름에 해당하는 모든 시 조회
 public List<LocationVO> getCitiesByDoName(String doName);

}
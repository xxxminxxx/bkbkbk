package com.bookbookbook.service;

import com.bookbookbook.domain.LocationVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public interface LocationService {

 public List<LocationVO> getCitiesByDoName(String doName);

}

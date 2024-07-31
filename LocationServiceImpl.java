package com.bookbookbook.service;

import com.bookbookbook.domain.LocationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import com.bookbookbook.dao.LocationDAO;

@Service
public class LocationServiceImpl implements LocationService {

    // LocationDAO 의존성 주입
    @Autowired
    private LocationDAO locationDAO;

    /*특정 도 또는 광역시에 속한 시/군/구 목록을 조회하는 메서드*/
    public List<LocationVO> getCitiesByDoName(String doName) {
        System.out.println("getCitiesByDoName 실행 doname" + doName);

        List<LocationVO> result = locationDAO.getCitiesByDoName(doName);
        System.out.println("getCitiesByDoName " + result);

        return result;
    }
}

package com.bookbookbook.service;

import com.bookbookbook.domain.LocationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import com.bookbookbook.dao.LocationDAO;

@Service
public class LocationServiceImpl implements LocationService {

    @Autowired
    private LocationDAO locationDAO;


    public List<LocationVO> getCitiesByDoName(String doName) {
        System.out.println("getCitiesByDoName 실행 doname" + doName);

        List<LocationVO> result = locationDAO.getCitiesByDoName(doName);
        System.out.println("getCitiesByDoName " + result);

        return result;
    }
}
package com.bookbookbook.controller;

import com.bookbookbook.domain.LibraryVO;
import com.bookbookbook.domain.LocationVO;
import com.bookbookbook.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Controller
public class LocationController {

    @Autowired
    private LocationService locationService;  // LocationService 의존성 주입
    private RestTemplate restTemplate;        // RestTemplate 의존성 주입

    // 생성자를 통한 의존성 주입
    @Autowired
    public LocationController(LocationService locationService, RestTemplate restTemplate) {
        this.locationService = locationService;
        this.restTemplate = restTemplate;
    }

    @GetMapping("/getDistricts")
    @ResponseBody // 메서드의 반환값이 HTTP 응답 본문에 직접 작성됨
    // 해당 지역의 구/군 목록을 반환
    public List<LocationVO> getDistricts(@RequestParam String region) {
        //지정된 도/시에 속한 구/군 목록을 조회
        List<LocationVO> districts = locationService.getCitiesByDoName(region);
        return districts;
    }
    }

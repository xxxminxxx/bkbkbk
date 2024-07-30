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
    private LocationService locationService;
    private RestTemplate restTemplate;

    @Autowired
    public LocationController(LocationService locationService, RestTemplate restTemplate) {
        this.locationService = locationService;
        this.restTemplate = restTemplate;
    }

    @GetMapping("/getDistricts")
    @ResponseBody
    public List<LocationVO> getDistricts(@RequestParam String region) {
        List<LocationVO> districts = locationService.getCitiesByDoName(region);
        return districts;
    }
    }

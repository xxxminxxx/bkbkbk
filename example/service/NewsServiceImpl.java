package com.example.service;

import com.example.service.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.json.JSONObject;
import org.json.JSONArray;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Service
public class NewsServiceImpl implements NewsService {

    @Value("${naver.client.id}")
    private String clientId;

    @Value("${naver.client.secret}")
    private String clientSecret;

    private final String API_URL = "https://openapi.naver.com/v1/search/news.json";

    @Override
    public List<Map<String, String>> getLibraryNews() {
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.set("X-Naver-Client-Id", clientId);
        headers.set("X-Naver-Client-Secret", clientSecret);
        
        String url = API_URL + "?query=도서관&display=3";
        
        HttpEntity<String> entity = new HttpEntity<>("parameters", headers);
        
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        
        JSONObject jsonResponse = new JSONObject(response.getBody());
        JSONArray items = jsonResponse.getJSONArray("items");
        
        List<Map<String, String>> newsList = new ArrayList<>();
        
        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.getJSONObject(i);
            Map<String, String> news = new HashMap<>();
            news.put("title", item.getString("title"));
            news.put("description", item.getString("description"));
            newsList.add(news);
        }
        
        return newsList;
    }
}
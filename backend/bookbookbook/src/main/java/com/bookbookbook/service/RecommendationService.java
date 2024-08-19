package com.bookbookbook.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RecommendationService {
	/*
	 *  Flask 서버와 통신 담당 RecommendationService 
	 */

	private final RestTemplate restTemplate;
	// Flask 서버로 Http 요청 보냄
    private final String flaskBaseUrl = "http://192.168.0.227:5010";

    public RecommendationService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public List<Map<String, Object>> getRecommendations(Integer userNum) {
        System.out.println("getRecommendations 서비스임플 실행");
        try {
            String url = flaskBaseUrl + "/recommendations";
            System.out.println("Flask URL: " + flaskBaseUrl + "/recommendations");
            String response = restTemplate.getForObject(url, String.class);
            System.out.println("실행완료");
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> result = objectMapper.readValue(response, Map.class);

            System.out.println("getRecommendations 서비스임플 결과 :" + result);
            System.out.println("result 타입 : " + result.getClass());

            String num = String.valueOf(userNum);
            System.out.println("num에 해당하는 값 : " + result.containsKey(num));

            // userNum에 해당하는 값만 반환
            if (result.containsKey(num)) {
                Map<String, Object> userRecommendation = (Map<String, Object>) result.get(num);
                List<Map<String, Object>> recommendations = (List<Map<String, Object>>) userRecommendation.get("recommendations");

                System.out.println("recommendations 리스트 : " + recommendations);

                List<Map<String, Object>> bookRecommendations = recommendations.stream()
                        .map(rec -> {
                            Map<String, Object> bookRec = new HashMap<>();
                            bookRec.put("bookNum", rec.get("bookNum"));
                            bookRec.put("recommendationType", rec.get("recommendation_type"));
                            return bookRec;
                        })
                        .collect(Collectors.toList());

                    System.out.println("추출된 bookNum과 recommendationType 목록 : " + bookRecommendations);

               return bookRecommendations;
            }
        } catch (ResourceAccessException e) {
            log.error("Flask 서버에 연결할 수 없습니다: ", e);
            e.printStackTrace(); // 스택 트레이스 출력
        } catch (Exception e) {
            log.error("추천 정보를 가져오는 중 오류 발생: ", e);
            e.printStackTrace(); // 스택 트레이스 출력
        }
        
        // 모든 예외 상황과 userNum이 없는 경우에 대한 기본 반환값
        return new ArrayList<>();
    }
    
}

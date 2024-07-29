package com.bookbookbook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.json.JSONObject;
import org.json.JSONArray;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.HashMap;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import com.bookbookbook.domain.UserVO;


@Service
public class NewsServiceImpl implements NewsService {

    @Value("${naver.client.id}")
    private String clientId;

    @Value("${naver.client.secret}")
    private String clientSecret;

    private final String API_URL = "https://openapi.naver.com/v1/search/news.json";

    @Autowired
    private UserService userService;

    @Override
    public List<Map<String, String>> getLibraryNews() {
        return getNewsForQuery("도서+책+서적+-정치+-경제+-주식+-부동산");
    }

    @Override
    public List<Map<String, String>> getPersonalizedNews(String userId) {
        UserVO user = userService.findUserByEmail(userId);
        String personalQuery = (user != null) ? buildQueryFromUserPreferences(user) : "";
        String defaultQuery = "도서+책+서적+-정치+-경제+-주식+-부동산+-채용";

        List<Map<String, String>> personalNews = getNewsForQuery(personalQuery);
        
        // 개인화된 검색 결과가 3개 미만일 경우, 기본 키워드로 나머지를 채움
        if (personalNews.size() < 3) {
            List<Map<String, String>> defaultNews = getNewsForQuery(defaultQuery);
            for (Map<String, String> news : defaultNews) {
                if (personalNews.size() < 3 && !personalNews.contains(news)) {
                    personalNews.add(news);
                }
            }
        }
        
        return personalNews;
    }

    private String buildQueryFromUserPreferences(UserVO user) {
        StringBuilder queryBuilder = new StringBuilder("도서+책+서적"); // 보고싶은 키워드
        queryBuilder.append("-정치+-경제+-주식+-부동산"); // 상관없는 키워드 제외

        boolean hasAdditionalPreferences = false;

        if (user.getInterestHobby() != null && !user.getInterestHobby().isEmpty()) {
            queryBuilder.append("+").append(user.getInterestHobby());
            hasAdditionalPreferences = true;
        }
        
        if (user.getAddress() != null && !user.getAddress().isEmpty()) {
            queryBuilder.append("+").append(user.getAddress());
            hasAdditionalPreferences = true;
        }
        
        
        

        if (!hasAdditionalPreferences) {
            return "도서+책+서적+-정치+-경제+-주식+-부동산"; // 기본 키워드
        }

        return queryBuilder.toString().trim();
    }

    private List<Map<String, String>> getNewsForQuery(String query) {
        if (query.isEmpty()) {
            return new ArrayList<>();
        }

        try {
            RestTemplate restTemplate = new RestTemplate();

            HttpHeaders headers = new HttpHeaders();
            headers.set("X-Naver-Client-Id", clientId);
            headers.set("X-Naver-Client-Secret", clientSecret);

            String url = API_URL + "?query=" + query + "&display=100&sort=date";

            HttpEntity<String> entity = new HttpEntity<>("parameters", headers);

            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);

            JSONObject jsonResponse = new JSONObject(response.getBody());
            JSONArray items = jsonResponse.getJSONArray("items");

            List<Map<String, String>> newsList = new ArrayList<>();
            long oneYearAgo = System.currentTimeMillis() - (365L * 24 * 60 * 60 * 1000);

            for (int i = 0; i < items.length() && newsList.size() < 3; i++) {
                JSONObject item = items.getJSONObject(i);
                long pubDate = parseDate(item.getString("pubDate"));
                
                // 1년 이내의 기사만 포함
                if (pubDate > oneYearAgo) {
                    Map<String, String> news = new HashMap<>();
                    news.put("title", item.getString("title"));
                    news.put("description", item.getString("description"));
                    news.put("originallink", item.getString("originallink"));
                    news.put("pubDate", item.getString("pubDate"));
                    newsList.add(news);
                }
            }

            return newsList;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    private long parseDate(String dateString) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z", Locale.US);
            Date date = sdf.parse(dateString);
            return date.getTime();
        } catch (ParseException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
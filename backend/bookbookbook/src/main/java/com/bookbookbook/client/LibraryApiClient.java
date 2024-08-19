
  package com.bookbookbook.client;
  
  import java.time.LocalDate; import java.time.format.DateTimeFormatter;
  
  import org.springframework.beans.factory.annotation.Value; import
  org.springframework.stereotype.Component; import
  org.springframework.web.client.RestTemplate;
  
  @Component public class LibraryApiClient {
  
  @Value("${library.api.url}") private String apiUrl;
  
  @Value("${library.api.key}") private String apiKey;
  
  private final RestTemplate restTemplate;
  
  public LibraryApiClient() { this.restTemplate = new RestTemplate(); }
  
  
  public LibraryApiClient(RestTemplate restTemplate) { this.restTemplate =
  restTemplate; }
  
  
  public String getPopularBooks() { LocalDate endDate = LocalDate.now();
  LocalDate startDate = endDate.minusMonths(1); // 최근 1개월 데이터
  
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
  String startDt = startDate.format(formatter); String endDt =
  endDate.format(formatter);
  
  String url = String.format(
  "%s?authKey=%s&startDt=%s&endDt=%s&pageNo=1&pageSize=10&format=json", apiUrl,
  apiKey, startDt, endDt);
  
  return restTemplate.getForObject(url, String.class); } }

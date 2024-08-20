package com.bookbookbook.service;

import java.util.List;
import java.util.Map;

public interface NewsService {
	 List<Map<String, String>> getLibraryNews();

	List<Map<String, String>> getPersonalizedNews(String userId);
}

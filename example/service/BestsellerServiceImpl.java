package com.bookbookbook.service;

import com.bookbookbook.client.LibraryApiClient;
import com.bookbookbook.domain.BestsellerVO;
import com.bookbookbook.service.BestsellerService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BestsellerServiceImpl implements BestsellerService {
    private final LibraryApiClient libraryApiClient;
    private final ObjectMapper objectMapper;

    public BestsellerServiceImpl(LibraryApiClient libraryApiClient, ObjectMapper objectMapper) {
        this.libraryApiClient = libraryApiClient;
        this.objectMapper = objectMapper;
    }

    @Override
    public List<BestsellerVO> getPopularBooks() {
        String response = libraryApiClient.getPopularBooks();
        System.out.println("API Response: " + response);
        return parseBookList(response);
    }

    private List<BestsellerVO> parseBookList(String response) {
        List<BestsellerVO> books = new ArrayList<>();
        try {
            JsonNode root = objectMapper.readTree(response);
            JsonNode docs = root.path("response").path("docs");
            for (JsonNode docNode : docs) {
                JsonNode doc = docNode.path("doc");
                BestsellerVO book = new BestsellerVO();
                book.setBestNum(doc.path("ranking").asInt());
                book.setBestTitle(doc.path("bookname").asText());
                book.setBestIsbn(doc.path("isbn13").asText());
                book.setBestWriter(doc.path("authors").asText());
                book.setBestPublisher(doc.path("publisher").asText());
                book.setBestPubDate(doc.path("publication_year").asText());
                book.setBestfname(doc.path("bookImageURL").asText());
                book.setCateNum(doc.path("class_nm").asText());
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
    }
}
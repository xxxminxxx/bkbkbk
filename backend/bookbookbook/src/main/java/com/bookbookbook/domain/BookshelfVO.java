package com.bookbookbook.domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

/*
 * 
 * 클래스명: 	BookshelfVO
 * 역할:     	사용자의 책장 정보를 담고 있는 클래스
 */
@Data
public class BookshelfVO {
	
	private String startDate;
	private String endDate;
	    
	private Integer shelfNum;
	private Integer userNum;
	private Integer bookNum;
    private String userId; // 사용자 ID
    private Integer readPages; //사용자가 읽은 페이지수(다 읽었으면 book 테이블의 bookPage 페이지수와 같고, 그렇지 않으면 읽고 있는 책 )
    private Integer bookPage; //book테이블에 있는 bookPages
    private String characterStage; // 사용자 캐릭터 단계
    private String characterImage; // 사용자 캐릭터 이미지
    private String readBookTitles; // 읽은 책 제목들
    private String bookTitle; // 책 제목
    private String writer; // 저자
    private Integer rating; // 책 평점
    private String readBooks;
   
    private String bfrealname; // 책 커버 이미지 파일 실제 이름
    private String bname; // 책 커버 이미지 경로 
    private String addedDate; // 책이 추가된 날짜
    private String readStatus; //Y: 읽은 책 N: 읽고 있는 책
}

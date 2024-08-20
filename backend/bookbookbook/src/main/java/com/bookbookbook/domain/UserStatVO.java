package com.bookbookbook.domain;

import lombok.Data;

import java.time.LocalDate;

@Data
public class UserStatVO {
	private Integer shelfNum;      // 책장 번호
	private Integer userNum;       // 사용자 번호
	private Integer bookPage;      // 책 페이지 수
	private Integer bookNum;       // 책 번호
	private LocalDate startDate;   // 독서 시작일
	private LocalDate endDate;     // 독서 종료일
	private String readStatus;     // 독서 상태
	private Integer rating;        // 평점
	private String userId;         // 사용자 ID
	private Integer totalbookpage; // 총 책 페이지 수
	private String bookTitle;      // 책 제목
	private Integer percent;       // 읽은 비율(퍼센트)
	private String titleLengthStr; // 제목 일부 (10자)
	private String bookMonth;      // 책을 읽은 월
	private Integer bookCount;     // 읽은 책 수
	private String bookYear;      // 책을 읽은 년도
}
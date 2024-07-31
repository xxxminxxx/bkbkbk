package com.bookbookbook.domain;

import lombok.Data;

import java.time.LocalDate;

@Data
public class UserStatVO {

	private Integer shelfNum;      // 책장 번호
	private Integer userNum;       // 사용자 번호
	private Integer bookPage;      // 현재 읽은 페이지 수
	private Integer bookNum;       // 책 번호
	private LocalDate startDate;   // 독서 시작 날짜
	private LocalDate endDate;     // 독서 종료 날짜
	private String readStatus;     // 독서 상태 (예: 읽는 중, 완독 등)
	private Integer rating;        // 책 평점
	private String userId;         // 사용자 ID
	private Integer totalbookpage; // 책의 총 페이지 수
	private String bookTitle;      // 책 제목
	private Integer percent;       // 독서 진행률 (퍼센트)
	private String titleLengthStr; // 책 제목의 일부 (일정 길이로 자른 문자열)
	private String bookMonth;      // 책을 읽은 월
	private Integer bookCount;     // 특정 기간 동안 읽은 책의 수

}

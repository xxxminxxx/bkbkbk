package com.bookbookbook.domain;

import lombok.Data;

import java.time.LocalDate;

@Data
public class UserStatVO {

	private Integer shelfNum;
	private Integer userNum;
	private Integer bookPage;
	private Integer bookNum;
	private LocalDate startDate;
	private LocalDate endDate;
	private String readStatus;
	private Integer rating;
	private String userId;
	private Integer totalbookpage;
	private String bookTitle;
	private Integer percent;
	private String titleLengthStr;
	private String bookMonth;
	private Integer bookCount;

}

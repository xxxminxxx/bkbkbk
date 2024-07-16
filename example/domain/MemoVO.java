package com.example.domain;

import lombok.Data;

@Data
public class MemoVO {

	private Integer memoNum;
	private Integer bookNum;
	private Integer userNum;
	private Integer cateNum;
	private String memoContent;
	private String memoDate;
}

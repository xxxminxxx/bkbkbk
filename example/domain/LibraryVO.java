package com.example.domain;

import lombok.Data;

@Data
public class LibraryVO {
	
	private Integer libraryNum;
	private String libraryName;
	private String address;
	private float latitude;
	private float longitude;
	private String url;
	private String libraryTel;
	private Integer libraryCode;

}

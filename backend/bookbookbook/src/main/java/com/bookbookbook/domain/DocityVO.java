package com.bookbookbook.domain;

import jakarta.persistence.Entity;

import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name = "docity") 
public class DocityVO {


	@Id
	private Integer localCode; // 지역 코드

	private String doName;     // 시/도 이름
	private String city;       // 구/군 이름
	private String longitude;  // 경도
	private String latitude;   // 위도
}

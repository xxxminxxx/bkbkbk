package com.bookbookbook.domain;

import lombok.Data;


@Data
public class LocationVO {
    private Integer localCode;  // 지역 코드 (예: 행정구역 코드)
    private String doName;      // 도 또는 광역시 이름 (예: 서울특별시, 경기도)
    private String city;        // 시/군/구 이름 (예: 강남구, 수원시)
    private float longitude;    // 경도
    private float latitude;     // 위도
}

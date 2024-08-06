package com.bookbookbook.domain;

import lombok.Data;


@Data
public class LocationVO {
    private Integer localCode;           // 지역 코드
    private String doName;               // 도/광역시 이름
    private String city;                 // 시/군/구 이름
    private float longitude;             // 경도
    private float latitude;              // 위도
}

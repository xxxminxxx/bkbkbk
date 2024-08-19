package com.bookbookbook.domain;

import lombok.Data;


@Data
public class LocationVO {
    private Integer localCode;
    private String doName;
    private String city;
    private float longitude;
    private float latitude;
}
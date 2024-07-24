package com.bookbookbook.domain;

import lombok.Data;

@Data
public class BestsellerVO {
    private Integer bestNum;
    private String cateNum;
    private String bestTitle;
    private String bestIsbn;
    private String bestWriter;
    private String bestPublisher;
    private String bestPubDate;
    private String bestfname;
}
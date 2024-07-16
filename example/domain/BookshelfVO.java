package com.example.domain;

import lombok.Data;

@Data
public class BookshelfVO {
   private Integer shelfNum;
   private Integer bookNum;
   private Integer userNum;
   private Integer cateNum;
   private Integer page;
   private String startDate;
   private String endDate;
   private String readStatus;
   private Integer rating;
}
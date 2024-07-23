package com.bookbookbook.domain;

import lombok.Data;

@Data
public class MemoVO {

   private Integer memoNum;
   private Integer shelfNum;
   private Integer userNum;
   private String memoContent;
   private String memoDate;
}
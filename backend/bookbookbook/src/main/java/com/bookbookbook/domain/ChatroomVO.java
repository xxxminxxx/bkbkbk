package com.bookbookbook.domain;

import lombok.Data;

@Data
public class ChatroomVO {
   private Integer chatroomNum;
   private Integer bookNum;
   private Integer userNum;
   private Integer cateNum;
   private String chatroomName;
   private String cfrealname;
   private String cfname;
   private String chatFilePath;
   private String chatroomStatus;
}
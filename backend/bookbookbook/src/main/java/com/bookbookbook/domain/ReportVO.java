package com.bookbookbook.domain;

import lombok.Data;

@Data
public class ReportVO {

   private Integer reportedNum;
   //private Integer chatroomNum;
   private String reportedUser;
   private Integer reportedUserNum;
   private String reportTime;
   private String reportResult;
   private String reportType;
   private String reportUser;
   private Integer reportUserNum;
   private String adminReportResult;
   private String reportedMessage;
}

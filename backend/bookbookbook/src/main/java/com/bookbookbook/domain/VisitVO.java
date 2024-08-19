package com.bookbookbook.domain;

import java.util.Date;

import lombok.Data;

@Data
public class VisitVO {
   private int count;
   private int VISIT_ID;
   private String VISIT_IP;
   private Date VISIT_TIME;
   private String VISIT_SITE;
   private String VISIT_BROWSER;
}
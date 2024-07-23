package com.bookbookbook.domain;

import lombok.Data;

@Data
public class CalendarVO {
   private Integer 	calendarNum;
   private Integer 	userNum;
   private boolean	attendance;
   private String 	calendarDate;
   
}
package com.bookbookbook.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

@Data
public class WishlistVO {
	
	private Integer wishNum;
	
	private Integer userNum;
	private Integer bookNum;
	private String addedDate;
	
	
	//데이터베이스에 매핑되지 않게 transient 사용
	  @Transient
	    private String bookTitle;

	    @Transient
	    private String writer;

	    @Transient
	    private String bname;

}

package com.bookbookbook.domain;

import lombok.Data;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Data
@Entity
@Table(name = "book")  // 테이블 이름이 'book'이라면
public class BookVO {

	@Id  // 기본 키 설정
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer bookNum;
	
	
    private Integer cateNum;
    private String bookTitle;

    
    private String isbn;

    private String writer;
    private String publisher;
    private String publicationDate;
    
    @Column(columnDefinition = "LONGTEXT")
    private String bookPreview;
    private String bfrealname;
    private String bname; // 주소
    private Integer bookPage;
}

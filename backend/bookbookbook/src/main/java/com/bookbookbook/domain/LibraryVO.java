package com.bookbookbook.domain;

import lombok.Data;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Data
@Entity
@Table(name = "library") 
public class LibraryVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer libraryNum;  // 도서관 고유 번호

    private String libraryName;  // 도서관 이름
    private String address;      // 도서관 주소
    private float latitude;      // 위도 (지도 표시용)
    private float longitude;     // 경도 (지도 표시용)
    private String url;          // 도서관 웹사이트 URL
    private String libraryTel;   // 도서관 전화번호
    private Integer libraryCode; // 도서관 코드

    private String loanAvailable; // 대출 가능 여부
    private String hasBook;       // 도서 보유 여부

    private Integer localCode;    // 지역 코드


    @ManyToOne
    @JoinColumn(name = "bookNum", referencedColumnName = "bookNum")
    private BookVO book;          // 연관된 도서 정보

}

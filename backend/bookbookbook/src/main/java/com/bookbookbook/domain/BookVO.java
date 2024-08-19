package com.bookbookbook.domain;

import lombok.Data;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

/*
 * 클래스명:	BookVO
 * 역할:     	데이터베이스의 'book' 테이블과 매핑되는 엔티티로, 책의 정보를 담고 있는 클래스
 * 비고: 		JPA 사용
 */
@Data
@Entity
@Table(name = "book") 
public class BookVO {

    @Id  // 기본 키 설정
    @GeneratedValue(strategy=GenerationType.IDENTITY) // 기본 키를 데이터베이스에서 자동으로 생성하도록 설정
    private Integer bookNum; // 책 번호

    private Integer cateNum; // 카테고리 번호
    private String bookTitle; // 책 제목

    private String isbn; // ISBN 번호

    private String writer; // 저자
    private String publisher; // 출판사
    private String publicationDate; // 출판일

    @Column(columnDefinition = "LONGTEXT") 
    // 'bookPreview' 필드를 LONGTEXT 데이터 타입으로 설정
    private String bookPreview; // 책 소개글
    
    private String bfrealname; // 책 커버 이미지 파일 실제 이름 (예: k262932481_1.jpg)
    private String bname; // 책 커버 이미지 경로 (예: https://image.aladin.co.kr/product/34323/85/cover200/k262932481_1.jpg)

    private Integer bookPage; // 책 페이지 수
}

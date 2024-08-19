package com.bookbookbook.persistence;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.bookbookbook.domain.BookVO;

/*
 * 인터페이스명: BookRepository
 * 역할:     		 데이터베이스의 'book' 테이블에 접근하여 책 정보를 조회하는 메서드를 제공하는 인터페이스
 */
public interface BookRepository extends JpaRepository<BookVO, Integer> {

    /**
     * 역할:     책 제목에 특정 문자열이 포함된 책 목록을 대소문자 구분 없이 조회 (한글에 대소문자 없음에도 사용하는 이유: 유지보수, 사용자에게 일관된 검색 경험 제공, 영문자 검색 가능성 고려)
     * 메서드명: findByBookTitleContainingIgnoreCase
     * 인자:      bookTitle (검색할 책 제목의 부분 문자열)
     * 리턴형:     List<BookVO> (검색된 책 목록)
     */
	Page<BookVO> findByBookTitleContainingIgnoreCase(String bookTitle, Pageable pageable);

    /**
     * 역할:     저자명에 특정 문자열이 포함된 책 목록을 대소문자 구분 없이 조회
     * 메서드명: findByWriterContainingIgnoreCase
     * 인자:      writer (검색할 저자명의 부분 문자열)
     * 리턴형:     List<BookVO> (검색된 책 목록)
     */
    Page<BookVO> findByWriterContainingIgnoreCase(String writer, Pageable pageable);

    /**
     * 역할:     출판사명에 특정 문자열이 포함된 책 목록을 대소문자 구분 없이 조회
     * 메서드명: findByPublisherContainingIgnoreCase
     * 인자:      publisher (검색할 출판사명의 부분 문자열)
     * 리턴형:     List<BookVO> (검색된 책 목록)
     */
    Page<BookVO> findByPublisherContainingIgnoreCase(String publisher, Pageable pageable);

    /**
     * 역할:     책 소개글에 특정 문자열이 포함된 책 목록을 대소문자 구분 없이 조회
     * 메서드명: findByBookPreviewContainingIgnoreCase
     * 인자:      bookPreview (검색할 책 소개글의 부분 문자열)
     * 리턴형:     List<BookVO> (검색된 책 목록)
     */
    Page<BookVO> findByBookPreviewContainingIgnoreCase(String bookPreview, Pageable pageable);
}
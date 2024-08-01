package com.bookbookbook.service;

import java.util.List;

import com.bookbookbook.domain.DocityVO;
import com.bookbookbook.domain.LibraryVO;

public interface FindLocationService {
   // String findLibrariesByBook(String isbn, String localCode);
    //List<LibraryVO> findLibrariesByLocalCode(Integer localCode);
    List<String> findDistinctDoNames();
    List<DocityVO> findGugunsByDoName(String doName);
    List<Integer> getLibraryCodeByLocalCode(Integer localCode);
    LibraryVO  getLibraryByApi(String isbn, Integer libraryCode) ;
   // boolean checkBookAvailability(String isbn, Integer libraryCode);
   //List<LibraryVO> findLibrariesByDoName(String doName);
//   List<LibraryVO> findLibrariesWithBook(String isbn, Integer localCode);
}

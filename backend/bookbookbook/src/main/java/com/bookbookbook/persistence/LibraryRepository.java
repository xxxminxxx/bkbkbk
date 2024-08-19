package com.bookbookbook.persistence;

import com.bookbookbook.domain.LibraryVO;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LibraryRepository extends JpaRepository<LibraryVO, Integer> {
    List<LibraryVO> findByLocalCode(Integer localCode);

    @Query("SELECT l FROM LibraryVO l WHERE l.localCode IN (SELECT d.localCode FROM DocityVO d WHERE d.doName = :doName)")
    List<LibraryVO> findByDoName(@Param("doName") String doName);

    @Query("SELECT l.libraryCode FROM LibraryVO l WHERE l.localCode = :localCode")
    List<Integer> getLibraryCodeByLocalCode(@Param("localCode") Integer localCode);
    
 // 추가된 메서드
    @Query("SELECT l FROM LibraryVO l WHERE l.libraryCode = :libraryCode")
    LibraryVO findByLibraryCode(@Param("libraryCode") Integer libraryCode);
    
    //LibraryVO findByLibraryName(String libraryName);
}


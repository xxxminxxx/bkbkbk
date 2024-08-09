package com.bookbookbook.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bookbookbook.domain.DocityVO;

public interface DoCityRepository extends JpaRepository<DocityVO, Integer> {
	 
	List<DocityVO> findByDoName(String doName);

	    @Query("SELECT DISTINCT d.doName FROM DocityVO d")
	    List<String> findDistinctDoNames();
    
	    @Query("SELECT localCode, city,  doName, longitude, latitude FROM DocityVO WHERE doName = :doName")
	    List<Object[]> findGugunsByDoName(@Param("doName") String doName);

}
package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.LibraryDAO;

@Service
public class LibraryServiceImpl implements LibraryService{

	@Autowired
	private LibraryDAO libraryDAO;
}

package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.example.service.LibraryService;

@RestController
public class LibraryController {

	@Autowired
	private LibraryService libraryService;
}

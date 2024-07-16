package com.example.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.service.MainService;
import com.example.service.NewsService;
import com.example.service.UserService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	 @Autowired
	 private NewsService newsService;
	    
	 @RequestMapping("/main")
	 public String mainPage(Model model) {
	     List<Map<String, String>> newsList = newsService.getLibraryNews();
	     model.addAttribute("newsList", newsList);
	     return "index";
	    }
	
	@RequestMapping("/main1")
    public String main1Page() {
        return "index1";  // JSP 파일의 이름 (확장자 제외)
    }
	
	
	
	@RequestMapping("/pages/login")
    public String loginPage() {
        return "pages/page-login";  // JSP 파일의 이름 (확장자 제외)
    }
	
	
	@RequestMapping("/pages/signup")
    public String signupPage() {
        return "pages/page-signup"; 
    }
	
	@RequestMapping("/pages/find-password")
	public String findPWPage() {
        return "pages/page-find-password";  
    }
	
	@RequestMapping("/pages/find-email")
	public String findingEmailPage() {
        return "pages/page-find-email";  
    }
	
	@RequestMapping("/pages/find-character")
	public String myCharacterPage() {
		return "pages/page-my-character";
	}
	
	
}

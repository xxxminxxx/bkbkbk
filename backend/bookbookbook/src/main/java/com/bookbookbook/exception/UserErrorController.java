package com.bookbookbook.exception;


import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserErrorController implements ErrorController{

	 @RequestMapping("/error")
	    public String handleError(Model model) {
	        model.addAttribute("errorMessage", "페이지를 찾을 수 없습니다.");
	        return "pages/error-404";
	    }

	    public String getErrorPath() {
	        return "/error";
	    }
	
}

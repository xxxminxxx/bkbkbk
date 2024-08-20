package com.bookbookbook.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(GeneralException.class)
    public ModelAndView handleGeneralException(GeneralException ex, Model model) {
        model.addAttribute("errorMessage", ex.getMessage());
        return new ModelAndView("pages/error-404");
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(Exception ex, Model model) {
        model.addAttribute("errorMessage", ex.getMessage());
        return new ModelAndView("pages/error-404");
    }
}
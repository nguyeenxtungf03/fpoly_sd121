package com.fpoly.poly121.controller;

import com.fpoly.poly121.exception.ForbiddenException;
import org.springframework.http.HttpStatus;
import org.springframework.security.acls.model.NotFoundException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;


@ControllerAdvice
public class GlobalExceptionHandlerErrors {


    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public String handleException(Exception e, Model model) {
        model.addAttribute("error", "500");
        model.addAttribute("bigText", "Lỗi Nội Bộ của Máy Chủ");
        model.addAttribute("smallText", "Chúng tôi đang cố gắng khắc phục vấn đề. Vui lòng thử lại sau.");
        return "errors/error403";
    }

    @ExceptionHandler(AuthenticationException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public String handleAuthenticationException(AuthenticationException e, Model model) {
        model.addAttribute("error", "401");
        model.addAttribute("bigText", "Tài khoản không được phép truy cập ");
        model.addAttribute("smallText", "Xin lỗi, bạn không có quyền truy cập trang này. ");
        return "errors/error403";
    }

    @ExceptionHandler(ForbiddenException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public ModelAndView handleForbiddenException(ForbiddenException e, Model model) {
        ModelAndView modelAndView = new ModelAndView("errors/error403"); // Tên trang lỗi 403
        model.addAttribute("error", "403");
        model.addAttribute("bigText", "Từ chối truy cập - Không có quyền truy cập");
        model.addAttribute("smallText", "Xin lỗi, bạn không có quyền truy cập trang này.");
        return modelAndView;
    }


    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    @ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
    public ModelAndView handleMethodNotAllowedException(HttpRequestMethodNotSupportedException e, Model model) {
        ModelAndView modelAndView = new ModelAndView("errors/error403");
        model.addAttribute("error", "405");
        model.addAttribute("bigText", "Từ chối truy cập - Không có quyền truy cập");
        model.addAttribute("smallText", "Xin lỗi, phương thức bạn yêu cầu không được hỗ trợ.");
        return modelAndView;

    }


}

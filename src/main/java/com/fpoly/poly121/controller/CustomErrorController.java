package com.fpoly.poly121.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    @ExceptionHandler(NoHandlerFoundException.class )
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handleNotFoundError(Model model) {
        model.addAttribute("error", "404");
        model.addAttribute("bigText", "Đường dẫn không tồn tại");
        model.addAttribute("smallText", "Lỗi đường dẫn, vui lòng thử lại.");
        return "errors/error403"; // Sửa tên trang lỗi thành "error404"
    }

}

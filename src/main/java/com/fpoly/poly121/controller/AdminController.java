package com.fpoly.poly121.controller;

import com.fpoly.poly121.dto.request.TaiKhoanDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping
    public String view() {
        return "admin-page";
    }
//
//    @PostMapping("/dang-ky")
//    public String processRegistration(@ModelAttribute("registerForm") TaiKhoanDto dto) {
//        khachHangService.dangKyKhachHang(dto);
//        return "redirect:/auth/dang-nhap";
//    }
}

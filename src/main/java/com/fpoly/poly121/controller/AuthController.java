package com.fpoly.poly121.controller;

import com.fpoly.poly121.dto.request.TaiKhoanDto;
import com.fpoly.poly121.repository.TaiKhoanRepository;
import com.fpoly.poly121.service.KhachHangService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
@AllArgsConstructor
public class AuthController {

    private final KhachHangService khachHangService;

    @GetMapping("/dang-ky")
    public String viewRegister() {
        return "dang-ky";
    }

    @PostMapping("/dang-ky")
    public String processRegistration(@ModelAttribute("registerForm") TaiKhoanDto dto) {
        khachHangService.dangKyKhachHang(dto);
        return "redirect:/auth/dang-nhap";
    }

    @GetMapping("/dang-nhap")
    public String login() {
        return "dang-nhap";
    }

    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("registerForm", new TaiKhoanDto());
    }

}

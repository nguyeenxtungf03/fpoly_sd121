package com.fpoly.poly121.controller;

import com.fpoly.poly121.repository.KhachHangRepository;
import com.fpoly.poly121.repository.TaiKhoanRepository;
import com.fpoly.poly121.utils.SecurityUtil;
import org.springframework.ui.Model;

import java.util.Date;

public class SecurityAttributesUtil {
    public static void setSecurityAttributes(Model model, TaiKhoanRepository taiKhoanRepository, KhachHangRepository khachHangRepository) {
        model.addAttribute("isAdmin", SecurityUtil.checkIsAdmin(taiKhoanRepository));
        model.addAttribute("isStaff", SecurityUtil.checkIsStaff(taiKhoanRepository));
        model.addAttribute("isUser", SecurityUtil.checkIsUser(taiKhoanRepository));
        model.addAttribute("isAuth", SecurityUtil.checkIsAuth(taiKhoanRepository));
        model.addAttribute("username", SecurityUtil.getUsernameLogin());
        model.addAttribute("idKh", SecurityUtil.getIdKhachHangLogin(khachHangRepository, taiKhoanRepository));
        Date newDate = new Date();
        model.addAttribute("newDate", newDate);
    }
}

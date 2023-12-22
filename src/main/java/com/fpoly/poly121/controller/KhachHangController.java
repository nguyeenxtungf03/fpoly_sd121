package com.fpoly.poly121.controller;


import com.fpoly.poly121.model.KhachHang;
import com.fpoly.poly121.repository.KhachHangRepository;
import com.fpoly.poly121.repository.TaiKhoanRepository;
import com.fpoly.poly121.security.dto.TaiKhoan;
import com.fpoly.poly121.service.KhachHangService;
import com.fpoly.poly121.service.impl.KhachHangServiceImpl;
import com.fpoly.poly121.utils.SecurityUtil;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("khach-hang")
public class KhachHangController {

    @Autowired
    KhachHangServiceImpl khachHangService;
    List<KhachHang> listKh;

    @Autowired
    KhachHangRepository khachHangRepository;

    @Autowired
    TaiKhoanRepository taiKhoanRepository;



    @GetMapping("hien-thi")
    public String getPage(@RequestParam(defaultValue = "0") Integer page, Model model) {
        Page<KhachHang> page1 = khachHangService.getPage(page);
        listKh = page1.getContent();
        model.addAttribute("listKh", listKh);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        return "khach_hang/hien_thi";
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        KhachHang kh = khachHangService.detail(id);
        model.addAttribute("kh", kh);
        return "khach_hang/update";
    }

    @Transactional
    @GetMapping("trangThaiHuy")
    public String trangThaiHuy(@RequestParam Long idKh ){
        khachHangRepository.trangThaiHuy(idKh);
        return "redirect:/khach-hang/hien-thi";
    }

    @Transactional
    @GetMapping("trangThaiKichHoat")
    public String trangThaiKichHoat(@RequestParam Long idKh ){
        khachHangRepository.trangThaiKichHoat(idKh);
        return "redirect:/khach-hang/hien-thi";
    }

    @GetMapping("searchTK")
    public String searchTk(@RequestParam String key ,  Model model) {
       listKh = khachHangRepository.searchKh(key);
        model.addAttribute("listKh", listKh);
        return "khach_hang/hien_thi";
    }

    @GetMapping("searchTT")
    public String searchTT(@RequestParam String tt , Model model) {
        listKh = khachHangRepository.searchTT(tt);
        model.addAttribute("listKh", listKh);
        model.addAttribute("tt",tt);
        return "khach_hang/hien_thi";
    }



}

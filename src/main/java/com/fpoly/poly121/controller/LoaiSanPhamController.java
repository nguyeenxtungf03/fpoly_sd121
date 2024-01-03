package com.fpoly.poly121.controller;

import com.fpoly.poly121.model.LoaiSanPham;
import com.fpoly.poly121.repository.LoaiSanPhamRepository;
import com.fpoly.poly121.service.impl.LoaiSanPhamServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/loai-san-pham")
public class LoaiSanPhamController {
    @Autowired
    private LoaiSanPhamServiceImpl service;

    @Autowired
    private LoaiSanPhamRepository loaiSanPhamRepository;


    @GetMapping("hien-thi")
    public String getAll(@RequestParam(defaultValue = "0") Integer page, Model model) {
        Page<LoaiSanPham> page1 = service.getAll(page);
        List<LoaiSanPham> lstloaisp = page1.getContent();
        model.addAttribute("lstloaisp", lstloaisp);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        return "loai-san-pham/loai-san-pham";
    }


    @GetMapping("/add")
    public String add(ModelMap modelMap) {
        return "loai-san-pham/loai-san-pham";
    }

    @PostMapping("/add")
    public String add(Model model, @ModelAttribute() LoaiSanPham loaiSanPham) {
        LoaiSanPham lsp = loaiSanPhamRepository.tenLsp(loaiSanPham.getTenLoai());
        if (lsp == null){
            service.add(loaiSanPham);
        }
        return "redirect:/loai-san-pham/hien-thi" ; }

    @GetMapping("detail/{id}")
    public String detail(@RequestParam(defaultValue = "0") Integer page,ModelMap model, @PathVariable Long id) {
        LoaiSanPham loaisp = service.detail(id);
        model.addAttribute("updloaisp", loaisp);
        Page<LoaiSanPham> page1 = service.getAll(page);
        List<LoaiSanPham> lstloaisp = page1.getContent();
        model.addAttribute("lstloaisp", lstloaisp);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        return "loai-san-pham/loai-san-pham";
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable Long id, @ModelAttribute() LoaiSanPham loaisp) {
        service.update(loaisp);
        return "redirect:/loai-san-pham/hien-thi";
    }


    @GetMapping("/search")
    public String search(@RequestParam String tenLoai, Model model) {
        List<LoaiSanPham> lst = service.search(tenLoai);
        model.addAttribute("lstloaisp", lst);
        return "loai-san-pham/loai-san-pham";
    }
}

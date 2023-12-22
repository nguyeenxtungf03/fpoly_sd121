package com.fpoly.poly121.controller;

import com.fpoly.poly121.model.ThuongHieu;
import com.fpoly.poly121.service.ChatLieuService;
import com.fpoly.poly121.service.ThuongHieuService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("thuong-hieu")
public class ThuongHieuController {
    @Autowired
    private ThuongHieuService thuongHieuService;
    List<ThuongHieu> listTh;

    @GetMapping("hien-thi")
    public String getAll(@RequestParam(defaultValue = "0") Integer page, Model model) {
        Page<ThuongHieu> page1 = thuongHieuService.getAll(page);
        listTh = page1.getContent();
        model.addAttribute("listTh", listTh);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        return "thuong_hieu/hien-thi";
    }

    @PostMapping("add")
    public String add(@Validated @ModelAttribute ThuongHieu thuongHieu, BindingResult bindingResult, @RequestParam(defaultValue = "0") Integer page, Model model) {
        if (bindingResult.hasErrors()) {
            Page<ThuongHieu> page1 = thuongHieuService.getAll(page);
            listTh = page1.getContent();
            model.addAttribute("listTh", listTh);
            model.addAttribute("page", page);
            model.addAttribute("page1", page1.getTotalPages());
            model.addAttribute("errors" ,"Không để trống");
            return "thuong_hieu/hien-thi";
        }
        thuongHieuService.add(thuongHieu);
        return "redirect:/thuong-hieu/hien-thi";
    }


    @PostMapping("update/{id}")
    public String update(@PathVariable Long id,@Validated @ModelAttribute ThuongHieu thuongHieu, BindingResult bindingResult, @RequestParam(defaultValue = "0") Integer page, Model model) {
        if (bindingResult.hasErrors()) {
            Page<ThuongHieu> page1 = thuongHieuService.getAll(page);
            listTh = page1.getContent();
            ThuongHieu thuongHieu1 = thuongHieuService.detail(id);
            model.addAttribute("th", thuongHieu1);
            model.addAttribute("listTh", listTh);
            model.addAttribute("page", page);
            model.addAttribute("page1", page1.getTotalPages());
            model.addAttribute("errors" ,"Không để trống");
            return "thuong_hieu/hien-thi";
        }
        thuongHieuService.update(thuongHieu);
        return "redirect:/thuong-hieu/hien-thi";
    }
    @GetMapping("delete/{id}")
    public String delete(@PathVariable Long id, Model model) {
        model.addAttribute("listId", "Update");
        thuongHieuService.delete(id);
        return "redirect:/thuong-hieu/hien-thi";
    }


    @GetMapping("search")
    public String search(@RequestParam String tenThuongHieu, Model model) {
        listTh = thuongHieuService.search(tenThuongHieu);
        model.addAttribute("listTh", listTh);
        return "thuong_hieu/hien-thi";
    }

    @GetMapping("detail/{id}")
    public String detail(@RequestParam(defaultValue = "0") Integer page, @PathVariable Long id, Model model) {
        Page<ThuongHieu> page1 = thuongHieuService.getAll(page);
        listTh = page1.getContent();
        model.addAttribute("listTh", listTh);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        ThuongHieu thuongHieu = thuongHieuService.detail(id);
        model.addAttribute("th", thuongHieu);
        model.addAttribute("update", "Update chat lieu");
        thuongHieuService.detail(id);
        return "thuong_hieu/hien-thi";
    }
}

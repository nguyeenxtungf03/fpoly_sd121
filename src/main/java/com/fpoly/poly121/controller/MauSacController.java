package com.fpoly.poly121.controller;



import com.fpoly.poly121.model.MauSac;
import com.fpoly.poly121.repository.MauSacReponsitory;
import com.fpoly.poly121.service.MauSacService;
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
@RequestMapping("mau-sac")
public class MauSacController {
    @Autowired
    private MauSacService mauSacService;
    List<MauSac> listMs;

    @Autowired
    private MauSacReponsitory mauSacReponsitory;

    @GetMapping("hien-thi")
    public String getAll(@RequestParam(defaultValue = "0") Integer page, Model model) {
        Page<MauSac> page1 = mauSacService.getPage(page);
        listMs = page1.getContent();
        model.addAttribute("listMs", listMs);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        return "mau_sac/hien-thi";
    }

    @PostMapping("add")
    public String add(@Validated @ModelAttribute MauSac mauSac, BindingResult bindingResult ,Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors", "Khong de trong !");
            return "mau_sac/hien-thi";
        } else {
            MauSac ms = mauSacReponsitory.tenMs(mauSac.getTenMauSac());
            if (ms == null){
                mauSacService.add(mauSac);
            }
            return "redirect:/mau-sac/hien-thi";
        }
    }

    @PostMapping("update/{id}")
    public String update(@RequestParam(defaultValue = "0") Integer page, @PathVariable Long id, @Valid @ModelAttribute MauSac mauSac ,BindingResult bindingResult ,Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors","Khong de trong !");
            MauSac mauSac1 = mauSacService.detail(id);
            model.addAttribute("ms", mauSac1);
            Page<MauSac> page1 = mauSacService.getPage(page);
            listMs = page1.getContent();
            model.addAttribute("listMs", listMs);
            model.addAttribute("page", page);
            model.addAttribute("page1", page1.getTotalPages());
            return "mau_sac/hien-thi";
        } else {
            mauSacService.update(mauSac);
            return "redirect:/mau-sac/hien-thi";
        }

    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable Long id, Model model) {
        model.addAttribute("listId", "Update");
        mauSacService.delete(id);
        return "redirect:/mau-sac/hien-thi";
    }


    @GetMapping("form-add")
    public String formAdd() {
        return "mau_sac/add";
    }
    @GetMapping("form-update/{id}")
    public String formUpdate( @PathVariable Long id , Model model) {
        MauSac mauSac = mauSacService.detail(id);
        model.addAttribute("ms", mauSac);
        return "mau_sac/update";
    }

    @GetMapping("search")
    public String search(@RequestParam String tenMauSac, Model model) {
        listMs = mauSacService.search(tenMauSac);
        model.addAttribute("listMs", listMs);
        return "mau_sac/hien-thi";
    }

    @GetMapping("detail/{id}")
    public String detail(@RequestParam(defaultValue = "0") Integer page, @PathVariable Long id, Model model) {
        Page<MauSac> page1 = mauSacService.getPage(page);
        listMs = page1.getContent();
        model.addAttribute("listMs", listMs);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        MauSac mauSac = mauSacService.detail(id);
        model.addAttribute("ms", mauSac);
        return "mau_sac/hien-thi";
    }
}

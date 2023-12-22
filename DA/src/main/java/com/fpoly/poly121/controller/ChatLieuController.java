package com.fpoly.poly121.controller;

import com.fpoly.poly121.model.ChatLieu;
import com.fpoly.poly121.service.ChatLieuService;
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
@RequestMapping("chat-lieu")
public class ChatLieuController {
    @Autowired
    private ChatLieuService chatLieuService;
    List<ChatLieu> listCl;

    @GetMapping("index")
    public String getAll(@RequestParam(defaultValue = "0") Integer page, Model model) {
        Page<ChatLieu> page1 = chatLieuService.getAll(page);
        listCl = page1.getContent();
        model.addAttribute("listCl", listCl);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        return "chat_lieu/index";
    }

    @PostMapping("add")
    public String add(@Validated @ModelAttribute ChatLieu chatLieu, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "chat_lieu/add";
        }
        chatLieuService.add(chatLieu);
        return "redirect:/chat-lieu/index";
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable Integer id, @Valid @ModelAttribute ChatLieu chatLieu) {
        chatLieuService.update(chatLieu);
        return "redirect:/chat-lieu/index";
    }

    @PostMapping("update/")
    public String updateEmpty(@RequestParam(defaultValue = "0") Integer page, Model model) {
        model.addAttribute("errorsUpdate", "Chưa đủ thông tin cần cập nhật !");
        Page<ChatLieu> page1 = chatLieuService.getAll(page);
        listCl = page1.getContent();
        model.addAttribute("listCl", listCl);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        return "chat_lieu/index";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable Integer id, Model model) {
        model.addAttribute("listId", "Update");
        chatLieuService.delete(id);
        return "redirect:/chat-lieu/index";
    }


    @GetMapping("form-add")
    public String formAdd() {
        return "chat_lieu/add";
    }

    @GetMapping("search")
    public String search(@RequestParam String tenChatLieu, Model model) {
        listCl = chatLieuService.search(tenChatLieu);
        model.addAttribute("listCl", listCl);
        return "chat_lieu/index";
    }

    @GetMapping("detail/{id}")
    public String detail(@RequestParam(defaultValue = "0") Integer page, @PathVariable Integer id, Model model) {
        Page<ChatLieu> page1 = chatLieuService.getAll(page);
        listCl = page1.getContent();
        model.addAttribute("listCl", listCl);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        ChatLieu chatLieu = chatLieuService.detail(id);
        model.addAttribute("cl", chatLieu);
        model.addAttribute("update", "Update chat lieu");
        chatLieuService.detail(id);
        return "chat_lieu/index";
    }
}

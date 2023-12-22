package com.fpoly.poly121.service.impl;


import com.fpoly.poly121.model.ChatLieu;
import com.fpoly.poly121.repository.ChatLieuRepository;
import com.fpoly.poly121.service.ChatLieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatLieuServiceImpl implements ChatLieuService {
    @Autowired
    private ChatLieuRepository chatLieuRepository;


    @Override
    public Page<ChatLieu> getAll(Integer page) {
        Pageable pageable = PageRequest.of(page, 5);
        return chatLieuRepository.findAll(pageable);
    }

    @Override
    public List<ChatLieu> getList() {
        return chatLieuRepository.findAll();
    }

    @Override
    public void add(ChatLieu chatLieu) {
        chatLieuRepository.save(chatLieu);

    }

    @Override
    public void update(ChatLieu chatLieu) {
        chatLieuRepository.save(chatLieu);

    }

    @Override
    public void delete(Integer id) {
        chatLieuRepository.deleteById(id);

    }

    @Override
    public ChatLieu detail(Integer id) {
        return chatLieuRepository.getById(id);
    }

    @Override
    public List<ChatLieu> search( String tenChatLieu) {
        return chatLieuRepository.search(tenChatLieu);
    }
}

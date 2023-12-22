package com.fpoly.poly121.service;


import com.fpoly.poly121.model.ChatLieu;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ChatLieuService {
    Page<ChatLieu> getAll(Integer page);
    void add(ChatLieu chatLieu);
    void update(ChatLieu chatLieu);
    void delete(Integer id);
    ChatLieu detail(Integer id);
    List<ChatLieu> search (String tenChatLieu);
    List<ChatLieu> getList();
}

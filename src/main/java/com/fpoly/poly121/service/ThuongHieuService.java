package com.fpoly.poly121.service;


import com.fpoly.poly121.model.ThuongHieu;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ThuongHieuService {
    Page<ThuongHieu> getAll(Integer page);
    void add(ThuongHieu thuongHieu);
    void update(ThuongHieu thuongHieu);
    void delete(Long id);
    ThuongHieu detail(Long id);
    List<ThuongHieu> search (String tenChatLieu);
    List<ThuongHieu> getList();
}

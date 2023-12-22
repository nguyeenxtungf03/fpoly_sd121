package com.fpoly.poly121.service;


import com.fpoly.poly121.model.SanPham;
import org.springframework.data.domain.Page;

import java.util.List;

public interface SanPhamService {
    Page<SanPham> getAll(Integer page);
    List<SanPham> getAll();
    void add(SanPham sanPham);
    void update(SanPham sanPham);
    void delete(Long id);
    SanPham detail(Long id);
    List<SanPham> search ( String tenSanPham);
}

package com.fpoly.poly121.service;


import com.fpoly.poly121.model.LoaiSanPham;
import org.springframework.data.domain.Page;

import java.util.List;

public interface LoaiSanPhamService {
    Page<LoaiSanPham> getAll(Integer page);
    List<LoaiSanPham> getAll();
    void add(LoaiSanPham LoaiSanPham);
    void update(LoaiSanPham LoaiSanPham);
    void delete(Long id);
    LoaiSanPham detail(Long id);
    List<LoaiSanPham> search ( String tenSanPham);
}

package com.fpoly.poly121.service;

import com.fpoly.poly121.model.KhuyenMai;
import org.springframework.data.domain.Page;

import java.util.List;

public interface KhuyenMaiService {
    Page<KhuyenMai> getAll(Integer page);
    void add(KhuyenMai khuyenMai);
    void update(KhuyenMai khuyenMai);
    void  delete(Long id);
    KhuyenMai detail(Long id);


}

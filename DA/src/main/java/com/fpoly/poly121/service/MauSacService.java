package com.fpoly.poly121.service;


import com.fpoly.poly121.model.MauSac;
import org.springframework.data.domain.Page;

import java.util.List;

public interface MauSacService {
    Page<MauSac> getPage(Integer page);
    List<MauSac> getAll();
    void add(MauSac sanPham);
    void update(MauSac sanPham);
    void delete(Long id);
    MauSac detail(Long id);
    List<MauSac> search ( String tenMauSac);
}

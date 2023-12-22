package com.fpoly.poly121.service;

import com.fpoly.poly121.model.KichThuoc;
import org.springframework.data.domain.Page;

import java.util.List;

public interface KichThuocService {
    Page<KichThuoc> getAll(Integer page);

    void add(KichThuoc kichThuoc);

    void update(KichThuoc kichThuoc, Long id);

    void delete(long id);

    KichThuoc detail(long id);

    List<KichThuoc> search(String tenKichThuoc);
    List<KichThuoc> getList();
}

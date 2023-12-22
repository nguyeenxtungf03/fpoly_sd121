package com.fpoly.poly121.service.impl;
import com.fpoly.poly121.model.LoaiSanPham;
import com.fpoly.poly121.service.LoaiSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoaiSanPhamServiceImpl implements LoaiSanPhamService {
    @Autowired
    private com.fpoly.poly121.repository.LoaiSanPhamRepository loaiSanPhamRepository;


    @Override
    public Page<LoaiSanPham> getAll(Integer page) {
        Pageable pageable = PageRequest.of(page,5);
        return loaiSanPhamRepository.findAll(pageable);
    }

    @Override
    public void add(LoaiSanPham LoaiSanPham) {
        loaiSanPhamRepository.save(LoaiSanPham);

    }

    @Override
    public void update(LoaiSanPham LoaiSanPham) {
        loaiSanPhamRepository.save(LoaiSanPham);

    }

    @Override
    public List<LoaiSanPham> getAll() {
        return loaiSanPhamRepository.findAll();
    }

    @Override
    public void delete(Long id) {
        loaiSanPhamRepository.deleteById(id);

    }

    @Override
    public LoaiSanPham detail(Long id) {
        return loaiSanPhamRepository.getById(id);
    }

    @Override
    public List<LoaiSanPham> search( String tenSanPham) {
        return loaiSanPhamRepository.search(tenSanPham);
    }
}

package com.fpoly.poly121.service.impl;

import com.fpoly.poly121.model.SanPham;
import com.fpoly.poly121.repository.SanPhamReponsitory;
import com.fpoly.poly121.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SanPhamServiceImpl implements SanPhamService {
    @Autowired
    private SanPhamReponsitory sanPhamRepository;


    @Override
    public Page<SanPham> getAll(Integer page) {
        Pageable pageable = PageRequest.of(page,5);
        return sanPhamRepository.findAll(pageable);
    }

    @Override
    public void add(SanPham sanPham) {
        sanPhamRepository.save(sanPham);

    }

    @Override
    public void update(SanPham sanPham) {
        sanPhamRepository.save(sanPham);

    }

    @Override
    public List<SanPham> getAll() {
        return sanPhamRepository.findAll();
    }

    @Override
    public void delete(Long id) {
        sanPhamRepository.deleteById(id);

    }

    @Override
    public SanPham detail(Long id) {
        return sanPhamRepository.getById(id);
    }

    @Override
    public List<SanPham> search( String tenSanPham) {
        return sanPhamRepository.search(tenSanPham);
    }
}

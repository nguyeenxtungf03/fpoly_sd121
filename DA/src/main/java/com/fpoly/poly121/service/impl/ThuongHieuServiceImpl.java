package com.fpoly.poly121.service.impl;


import com.fpoly.poly121.model.ThuongHieu;
import com.fpoly.poly121.repository.ThuongHieuRepository;
import com.fpoly.poly121.service.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ThuongHieuServiceImpl implements ThuongHieuService {
    @Autowired
    private ThuongHieuRepository thuongHieuRepository;


    @Override
    public Page<ThuongHieu> getAll(Integer page) {
        Pageable pageable = PageRequest.of(page, 5);
        return thuongHieuRepository.findAll(pageable);
    }

    @Override
    public List<ThuongHieu> getList() {
        return thuongHieuRepository.findAll();
    }

    @Override
    public void add(ThuongHieu thuongHieu) {
        thuongHieuRepository.save(thuongHieu);

    }

    @Override
    public void update(ThuongHieu thuongHieu) {
        thuongHieuRepository.save(thuongHieu);

    }

    @Override
    public void delete(Long id) {
        thuongHieuRepository.deleteById(id);

    }

    @Override
    public ThuongHieu detail(Long id) {
        return thuongHieuRepository.getById(id);
    }

    @Override
    public List<ThuongHieu> search( String tenThuongHieu) {
        return thuongHieuRepository.search(tenThuongHieu);
    }
}

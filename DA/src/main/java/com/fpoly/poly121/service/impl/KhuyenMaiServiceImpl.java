package com.fpoly.poly121.service.impl;


import com.fpoly.poly121.model.KhuyenMai;
import com.fpoly.poly121.repository.KhuyenMaiRepository;
import com.fpoly.poly121.service.KhuyenMaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class KhuyenMaiServiceImpl implements KhuyenMaiService {

    @Autowired
    KhuyenMaiRepository khuyenMaiRepository;

    @Override
    public Page<KhuyenMai> getAll(Integer page) {
        Pageable pageable = PageRequest.of(page, 10);
        return khuyenMaiRepository.findAll(pageable) ;
    }

    @Override
    public void add(KhuyenMai khuyenMai) {
        khuyenMaiRepository.save(khuyenMai);

    }

    @Override
    public void update(KhuyenMai khuyenMai) {
        khuyenMaiRepository.save(khuyenMai);
    }

    @Override
    public void delete(Long id) {
        khuyenMaiRepository.deleteById(id);

    }

    @Override
    public KhuyenMai detail(Long id) {
        return khuyenMaiRepository.getById(id);
    }
}

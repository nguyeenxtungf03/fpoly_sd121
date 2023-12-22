package com.fpoly.poly121.service.impl;

import com.fpoly.poly121.model.KhachHang;
import com.fpoly.poly121.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KhachHangServiceImpl {

    @Autowired
    KhachHangRepository khachHangRepository;


    public List<KhachHang> getAll() {
        return khachHangRepository.findAll();
    }

    public Page<KhachHang> getPage(Integer page){
        Pageable pageable = PageRequest.of(page,10);
        return khachHangRepository.findAllKh(pageable);
    }

    public void update(KhachHang khachHang) {
        khachHangRepository.save(khachHang);
    }


    public KhachHang detail(Long id) {
        return khachHangRepository.getById(id);
    }
}

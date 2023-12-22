package com.fpoly.poly121.service.impl;

import com.fpoly.poly121.model.GioHang;
import com.fpoly.poly121.repository.GioHangRepository;
import com.fpoly.poly121.service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GioHangServiceImpl implements GioHangService {

    @Autowired
    private GioHangRepository gioHangRepository;

    @Override
    public List<GioHang> getAll() {
        return gioHangRepository.findAll();
    }


}

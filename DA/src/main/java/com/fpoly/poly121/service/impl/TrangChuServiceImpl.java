package com.fpoly.poly121.service.impl;

import com.fpoly.poly121.model.GioHang;
import com.fpoly.poly121.model.KhachHang;
import com.fpoly.poly121.model.SanPham;
import com.fpoly.poly121.model.SanPhamChiTiet;
import com.fpoly.poly121.repository.*;
import com.fpoly.poly121.security.dto.TaiKhoan;
import com.fpoly.poly121.service.TrangChuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrangChuServiceImpl implements TrangChuService {
    @Autowired
    TrangChuRepository trangChuRepository;

    @Autowired
    SanPhamChiTietReponsitory sanPhamChiTietReponsitory;

//    -------Nam------

    @Override
    public List<SanPhamChiTiet> getAllAoNamMoiNhat() {
        return trangChuRepository.getAllAoNamMoiNhat();
    }

    @Override
    public List<SanPhamChiTiet> getAllQuanNamMoiNhat() {
        return trangChuRepository.getAllQuanNamMoiNhat();
    }

    @Override
    public List<SanPhamChiTiet> getAllNamNhieuNhat() {
        return null;
    }



//    -----Nu------

    @Override
    public List<SanPhamChiTiet> getAllAoNuMoiNhat() {
        return trangChuRepository.getAllAoNuMoiNhat();
    }

    @Override
    public List<SanPhamChiTiet> getAllQuanNuMoiNhat() {
        return trangChuRepository.getAllQuanNuMoiNhat();
    }

    @Override
    public List<SanPhamChiTiet> getAllNuNhieuNhat() {
        return null;
    }

    @Override
    public SanPhamChiTiet detail(Long id) {
        return trangChuRepository.getById(id);
    }

//   ----All------

    @Override
    public List<SanPhamChiTiet> getAll() {
        return sanPhamChiTietReponsitory.findAll() ;
    }
}

package com.fpoly.poly121.service;

import com.fpoly.poly121.model.GioHang;
import com.fpoly.poly121.model.KhachHang;
import com.fpoly.poly121.model.SanPhamChiTiet;
import com.fpoly.poly121.security.dto.TaiKhoan;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TrangChuService {

//    ------Nam-----
    List<SanPhamChiTiet> getAllAoNamMoiNhat();

    List<SanPhamChiTiet> getAllQuanNamMoiNhat();

    List<SanPhamChiTiet> getAllNamNhieuNhat();


//   -------Nu------
    List<SanPhamChiTiet> getAllAoNuMoiNhat();

    List<SanPhamChiTiet> getAllQuanNuMoiNhat();

    List<SanPhamChiTiet> getAllNuNhieuNhat();

    SanPhamChiTiet detail(Long id);


//  ------All------
    List<SanPhamChiTiet> getAll();





}

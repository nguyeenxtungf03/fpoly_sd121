package com.fpoly.poly121.service;

import com.fpoly.poly121.dto.request.GioHangChiTietDto;
import com.fpoly.poly121.dto.request.HoaDonChiTietDto;
import com.fpoly.poly121.model.GioHang;
import com.fpoly.poly121.model.GioHangChiTiet;
import com.fpoly.poly121.model.SanPhamChiTiet;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface GioHangChiTietService {
    List<GioHangChiTiet> getAll(String tk);

    void add(GioHangChiTiet gioHangChiTiet) ;

    void update(GioHangChiTiet gioHangChiTiet );

    GioHangChiTiet findAllByIdGioHangAndIdSanPhamChiTiet( Long idGioHang, Long idSpct);

    void delete( SanPhamChiTiet idSpct);

    List<GioHangChiTietDto> getGioHangChiTiet(String tk);

    String detailTkGh(String id);

    void deleteByIdGioHang( String idGioHang);
}

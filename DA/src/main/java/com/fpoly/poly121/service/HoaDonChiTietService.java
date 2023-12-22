package com.fpoly.poly121.service;

import com.fpoly.poly121.dto.request.HoaDonChiTietDto;
import com.fpoly.poly121.dto.request.TopSpDto;
import com.fpoly.poly121.model.HoaDon;
import com.fpoly.poly121.model.HoaDonChiTiet;


import java.util.Date;
import java.util.List;

public interface HoaDonChiTietService {
    List<HoaDonChiTiet> getAll();

    List<HoaDonChiTiet> searchidHD(HoaDon idHD);

    List<HoaDonChiTiet> searchHDCT(Date dateBd, Date dateKt);

    List<HoaDonChiTietDto> getHoaDonChiTiet();

    List<TopSpDto> getSoLuong();

    List<TopSpDto> getSoLuongTrangThai();



}

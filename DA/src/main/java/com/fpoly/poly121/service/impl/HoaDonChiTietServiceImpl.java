package com.fpoly.poly121.service.impl;

import com.fpoly.poly121.dto.request.HoaDonChiTietDto;
import com.fpoly.poly121.dto.request.TopSpDto;
import com.fpoly.poly121.model.ChatLieu;
import com.fpoly.poly121.model.HoaDon;
import com.fpoly.poly121.model.HoaDonChiTiet;
import com.fpoly.poly121.model.KichThuoc;
import com.fpoly.poly121.model.LoaiSanPham;
import com.fpoly.poly121.model.MauSac;
import com.fpoly.poly121.model.SanPham;
import com.fpoly.poly121.model.SanPhamChiTiet;
import com.fpoly.poly121.model.ThuongHieu;
import com.fpoly.poly121.repository.HoaDonChiTietReponsitory;
import com.fpoly.poly121.service.HoaDonChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class HoaDonChiTietServiceImpl implements HoaDonChiTietService {


    @Autowired
    private HoaDonChiTietReponsitory hoaDonChiTietReponsitory;



    @Override
    public List<HoaDonChiTietDto> getHoaDonChiTiet() {
        List<Object[]> results = hoaDonChiTietReponsitory.getHoaDonChiTiet();
        List<HoaDonChiTietDto> hoaDonChiTietDtos = new ArrayList<>();

        for (Object[] result : results) {
            HoaDonChiTietDto dto = new HoaDonChiTietDto();
            dto.setId((Long) result[0]);
            dto.setHo((String) result[1]);
            dto.setTenDem((String) result[2]);
            dto.setTen((String) result[3]);
            dto.setNgaySinh(( Date) result[4]);
            dto.setEmail((String) result[5]);
            dto.setSdt((String) result[6]);
            dto.setSoLuong((Long) result[7]);
            dto.setThanhTien((Long) result[8]);
            dto.setTrangThai((Integer) result[9]);
            dto.setDiem((Long) result[10]);
            hoaDonChiTietDtos.add(dto);
        }

        return hoaDonChiTietDtos;
    }


    @Override
    public List<TopSpDto> getSoLuong() {
        List<Object[]> results = hoaDonChiTietReponsitory.getSoLuong();
        List<TopSpDto> topSpDtos = new ArrayList<>();

        for (Object[] result : results) {
            TopSpDto dto = new TopSpDto();
            dto.setIdSanPhamChiTiet((SanPhamChiTiet) result[0]);
            dto.setIdSanPham((SanPham) result[1]);
            dto.setIdLoaiSanPham((LoaiSanPham) result[2]);
            dto.setIdMauSac((MauSac) result[3]);
            dto.setIdKichThuoc((KichThuoc) result[4]);
            dto.setIdChatLieu((ChatLieu) result[5]);
            dto.setIdThuongHieu((ThuongHieu) result[6]);
            dto.setSoLuong((Long) result[7]);
            dto.setGiaBan((Long) result[8]);
            dto.setAnhSanPham((String) result[9]);
            topSpDtos.add(dto);
        }

        return topSpDtos;
    }

    @Override
    public List<HoaDonChiTiet> getAll() {
        return hoaDonChiTietReponsitory.findAll();
    }

    @Override
    public List<HoaDonChiTiet> searchidHD(HoaDon idHD) {
        return hoaDonChiTietReponsitory.searchidHd(idHD);
    }

    @Override
    public List<HoaDonChiTiet> searchHDCT(Date dateBd, Date dateKt) {
        return hoaDonChiTietReponsitory.searchHDCT(dateBd,dateKt);
    }

    @Override
    public List<TopSpDto> getSoLuongTrangThai() {
        List<Object[]> results = hoaDonChiTietReponsitory.getSoLuongTrangThai();
        List<TopSpDto> topSpDtos2 = new ArrayList<>();

        for (Object[] result : results) {
            TopSpDto dto = new TopSpDto();
            dto.setIdSanPhamChiTiet((SanPhamChiTiet) result[0]);
            dto.setIdSanPham((SanPham) result[1]);
            dto.setIdLoaiSanPham((LoaiSanPham) result[2]);
            dto.setIdMauSac((MauSac) result[3]);
            dto.setIdKichThuoc((KichThuoc) result[4]);
            dto.setIdChatLieu((ChatLieu) result[5]);
            dto.setIdThuongHieu((ThuongHieu) result[6]);
            dto.setSoLuong((Long) result[7]);
            dto.setGiaBan((Long) result[8]);
            dto.setAnhSanPham((String) result[9]);
            dto.setTrangThai((Long) result[10]);
            topSpDtos2.add(dto);
        }

        return topSpDtos2;    }
}

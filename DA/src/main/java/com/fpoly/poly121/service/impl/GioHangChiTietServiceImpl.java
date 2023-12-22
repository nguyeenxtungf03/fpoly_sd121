package com.fpoly.poly121.service.impl;

import com.fpoly.poly121.dto.request.GioHangChiTietDto;
import com.fpoly.poly121.dto.request.HoaDonChiTietDto;
import com.fpoly.poly121.model.GioHang;
import com.fpoly.poly121.model.GioHangChiTiet;
import com.fpoly.poly121.model.SanPhamChiTiet;
import com.fpoly.poly121.repository.GioHangChiTietRepository;
import com.fpoly.poly121.service.GioHangChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Service
public class GioHangChiTietServiceImpl implements GioHangChiTietService {

    @Autowired
    GioHangChiTietRepository gioHangChiTietRepository;

    @Override
    public List<GioHangChiTiet> getAll(String tk) {
        return gioHangChiTietRepository.findAll();
    }

    @Override
    public void add(GioHangChiTiet gioHangChiTiet) {
        gioHangChiTietRepository.save(gioHangChiTiet);

    }

    @Override
    public GioHangChiTiet findAllByIdGioHangAndIdSanPhamChiTiet(Long idGioHang, Long idSpct) {
        return gioHangChiTietRepository.findAllByIdGioHangAndIdSanPhamChiTiet(idGioHang, idSpct);
    }

    @Override
    public void update(GioHangChiTiet gioHangChiTiet) {
        gioHangChiTietRepository.save(gioHangChiTiet);
    }


    @Override
    public void delete(SanPhamChiTiet idSpct) {
        gioHangChiTietRepository.deleteByIdSanPhamChiTiet(idSpct);

    }

    @Override
    public List<GioHangChiTietDto> getGioHangChiTiet( String tk) {
        List<Object[]> results = gioHangChiTietRepository.listGhct(tk);
        List<GioHangChiTietDto> gioDonChiTietDtos = new ArrayList<>();

        for (Object[] result : results) {
            GioHangChiTietDto dto = new GioHangChiTietDto();
            dto.setIdGioHang((GioHang) result[0]);
            dto.setIdSanPhamChiTiet((SanPhamChiTiet) result[1]);
            dto.setSoLuong((Long) result[2]);
            gioDonChiTietDtos.add(dto);
        }
        return gioDonChiTietDtos ;
    }

    @Override
    public String detailTkGh(String id) {
        return gioHangChiTietRepository.detailTkGh(id);
    }

    @Override
    public  void deleteByIdGioHang( String idGioHang){
        gioHangChiTietRepository.deleteByIdGioHang(idGioHang);
    }


}

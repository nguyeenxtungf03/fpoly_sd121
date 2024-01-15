package com.fpoly.poly121.service.impl;

import com.fpoly.poly121.dto.request.HoaDonChiTietDto;
import com.fpoly.poly121.dto.request.SanPhamDto;
import com.fpoly.poly121.dto.request.TopSpDto;
import com.fpoly.poly121.model.*;
import com.fpoly.poly121.repository.SanPhamChiTietReponsitory;
import com.fpoly.poly121.service.SanPhamChiTietService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class SanPhamChiTietServiceImpl implements SanPhamChiTietService {
    @Autowired
    private SanPhamChiTietReponsitory sanPhamChiTietRepository;



    @Override
    public Page<SanPhamChiTiet> getAll(Integer page) {
        Pageable pageable = PageRequest.of(page, 10);
        return sanPhamChiTietRepository.findAll(pageable);
    }

    @Override
    public void add2(SanPhamChiTiet sanPhamChiTiet) {
        sanPhamChiTietRepository.save(sanPhamChiTiet);
    }

    @Override
    public void add(SanPhamChiTiet sanPhamChiTiet, MultipartFile file) {

        String relativePath = "assets/images/imgSp/";

        try {
            String fileName = file.getOriginalFilename();
            String absolutePath = FileUtils.getFile("../../../../DATN/fpoly_sd121/src/main/webapp/", relativePath).getCanonicalPath();
            File uploadDir = new File(absolutePath);
            FileUtils.forceMkdir(uploadDir);
            uploadDir.setWritable(true);

            File uploadedFile = new File(uploadDir, fileName);
            uploadedFile.setWritable(true);
            file.transferTo(uploadedFile);
            System.out.println("File uploaded to: " + uploadedFile.getAbsolutePath());
            sanPhamChiTiet.setAnhSanPham(fileName);
            sanPhamChiTietRepository.save(sanPhamChiTiet);
        } catch (IOException e) {
            sanPhamChiTiet.setAnhSanPham("anh_trong.png");
            sanPhamChiTietRepository.save(sanPhamChiTiet);
            e.printStackTrace();
        }

    }

    public void addAnh(MultipartFile file) {

        String relativePath = "assets/images/imgSp/";

        try {
            String fileName = file.getOriginalFilename();
            String absolutePath = FileUtils.getFile("../../../../DATN/fpoly_sd121/src/main/webapp/", relativePath).getCanonicalPath();
            File uploadDir = new File(absolutePath);
            FileUtils.forceMkdir(uploadDir);
            uploadDir.setWritable(true);

            File uploadedFile = new File(uploadDir, fileName);
            uploadedFile.setWritable(true);
            file.transferTo(uploadedFile);
            System.out.println("File uploaded to: " + uploadedFile.getAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void update(SanPhamChiTiet sanPhamChiTiet) {
        sanPhamChiTietRepository.save(sanPhamChiTiet);

    }

    @Override
    public void delete(Long id) {
        sanPhamChiTietRepository.deleteById(id);
    }


    @Override
    public SanPhamChiTiet detail(Long id) {
        return sanPhamChiTietRepository.getById(id);
    }

    @Override
    public List<SanPhamChiTiet> search(String keyword) {
        return sanPhamChiTietRepository.search(keyword);
    }


    public SanPhamChiTiet getSanPhamById(Long id) {
        return sanPhamChiTietRepository.findById(id).orElse(null);
    }

    public Page<SanPhamDto> getSp(Pageable pageable) {
        Page<Object[]> results = sanPhamChiTietRepository.listSp(pageable);

        return results.map(result -> {
            SanPhamDto dto = new SanPhamDto();
            dto.setIdSanPham((SanPham) result[0]);
            dto.setIdLoaiSanPham((LoaiSanPham) result[1]);
            dto.setIdThuongHieu((ThuongHieu) result[2]);
            dto.setIdChatLieu((ChatLieu) result[3]);
            dto.setSoLuong((Long) result[4]);
            dto.setTrangThai((Long) result[5]);
            return dto;
        });
    }

    public List<SanPhamDto> boLocSp(SanPham sanPham , LoaiSanPham loaiSanPham, ThuongHieu thuongHieu,ChatLieu chatLieu , Long trangThai) {
        List<Object[]> results = sanPhamChiTietRepository.boLocSanPham(sanPham,loaiSanPham,thuongHieu,chatLieu,trangThai);
        List<SanPhamDto> sanPhamDtos = new ArrayList<>();

        for (Object[] result : results) {
            SanPhamDto dtoSp = new SanPhamDto();
            dtoSp.setIdSanPham((SanPham) result[0]);
            dtoSp.setIdLoaiSanPham((LoaiSanPham) result[1]);
            dtoSp.setIdThuongHieu((ThuongHieu) result[2]);
            dtoSp.setIdChatLieu((ChatLieu) result[3]);
            dtoSp.setSoLuong((Long) result[4]);
            dtoSp.setTrangThai((Long) result[5]);
            sanPhamDtos.add(dtoSp);
        }
        return sanPhamDtos;

    }
}

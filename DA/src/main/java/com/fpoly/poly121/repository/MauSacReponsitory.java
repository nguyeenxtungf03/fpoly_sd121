package com.fpoly.poly121.repository;

import com.fpoly.poly121.model.MauSac;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MauSacReponsitory extends JpaRepository<MauSac,Long> {
    @Query("select cl from MauSac cl where  cl.tenMauSac like %:tenMauSac%  ")
    List<MauSac> search(String tenMauSac );
    
    MauSac findByTenMauSac(String tenMauSac);


    @Query("select spct.idMauSac from SanPhamChiTiet  spct where spct.idSanPham.id = :idSanPham  ")
    List<MauSac> findMauSacBySanPham(Long idSanPham);

    @Query("select spct.idMauSac from SanPhamChiTiet  spct where spct.idSanPham.id = :idSanPham  and spct.idKichThuoc.id = :idKichThuoc ")
    List<MauSac> findMauSacBySanPhamAndKichThuoc(Long idSanPham , Long idKichThuoc);

}

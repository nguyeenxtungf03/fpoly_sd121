package com.fpoly.poly121.repository;

import com.fpoly.poly121.model.KichThuoc;
import com.fpoly.poly121.model.MauSac;
import com.fpoly.poly121.model.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface KichThuocRepository extends JpaRepository<KichThuoc, Long> {
    @Query("select kt from KichThuoc kt where kt.tenKichThuoc like %:tenKichThuoc%")
    List<KichThuoc> search(String tenKichThuoc);

    KichThuoc findByTenKichThuoc(String tenKichThuoc);


    @Query("select spct.idKichThuoc from SanPhamChiTiet  spct where spct.idSanPham.id = :idSanPham ")
    List<KichThuoc> findKichThuocBySanPham(Long idSanPham);

    @Query("select spct.idKichThuoc from SanPhamChiTiet  spct where spct.idSanPham.id = :idSanPham  and spct.idMauSac.id = :idMauSac")
    List<KichThuoc> findKichThuocBySanPhamAnhMauSac(Long idSanPham , Long idMauSac);

    @Query("select sp from KichThuoc  sp where sp.tenKichThuoc = :tenKichThuoc")
    KichThuoc tenKt(String  tenKichThuoc);


}
package com.fpoly.poly121.repository;


import com.fpoly.poly121.model.GioHang;
import com.fpoly.poly121.model.GioHangChiTiet;
import com.fpoly.poly121.model.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface GioHangChiTietRepository extends JpaRepository<GioHangChiTiet, Long> {
    @Query("SELECT ct.idGioHang, ct.idSanPhamChiTiet, SUM(ct.soLuong) AS Tong " +
            "FROM GioHangChiTiet ct " +
            "WHERE ct.idGioHang.idKhachHang.tenTaiKhoan.tenTaiKhoan = :tk " +
            "GROUP BY ct.idGioHang, ct.idSanPhamChiTiet, ct.idGioHang.idKhachHang.tenTaiKhoan")
    List<Object[]> listGhct(String tk);


    @Transactional
    @Modifying
    @Query("DELETE FROM GioHangChiTiet gh WHERE gh.idSanPhamChiTiet = :idSpct")
    void deleteByIdSanPhamChiTiet(SanPhamChiTiet idSpct);

    @Query("SELECT gh.id FROM GioHang gh WHERE gh.idKhachHang.tenTaiKhoan.tenTaiKhoan = :tenTaiKhoan")
    String detailTkGh(@Param("tenTaiKhoan") String tenTaiKhoan);


    @Transactional
    @Modifying
    @Query("DELETE FROM GioHangChiTiet gh WHERE gh.idGioHang.id = :idGioHang")
    void deleteByIdGioHang(String idGioHang);

    @Query("select ghct \n" +
            "from GioHangChiTiet  ghct where ghct.idGioHang.id  = :idGioHang and ghct.idSanPhamChiTiet.id = :idSpct")
    GioHangChiTiet findAllByIdGioHangAndIdSanPhamChiTiet(Long idGioHang, Long idSpct);

    @Modifying
    @Transactional
    @Query("UPDATE GioHangChiTiet SET soLuong = :soLuongMoi WHERE idGioHang.id = :gioHangId AND idSanPhamChiTiet.id = :sanPhamId")
    void updateWithQuery( Long soLuongMoi,Long gioHangId,Long sanPhamId);


    @Query("select ghct.soLuong from GioHangChiTiet ghct where ghct.idGioHang.id = :idGioHang and ghct.idSanPhamChiTiet.id = :idSanPhamChiTiet  ")
    Long soLuongGh(Long idGioHang , Long idSanPhamChiTiet);

    @Query("select ghct.idSanPhamChiTiet.soLuong from GioHangChiTiet ghct where ghct.idGioHang.id = :idGioHang and ghct.idSanPhamChiTiet.id = :idSanPhamChiTiet  ")
    Long soLuongSp(Long idGioHang , Long idSanPhamChiTiet);


    @Query("select ghct.idSanPhamChiTiet.idSanPham.tenSanPham from GioHangChiTiet ghct where ghct.idSanPhamChiTiet.id = :idSp and  ghct.idGioHang.id = :idGioHang")
    String tenSp(Long idSp , Long idGioHang);

}

package com.fpoly.poly121.repository;

import com.fpoly.poly121.model.GioHang;
import com.fpoly.poly121.model.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface GioHangRepository extends JpaRepository<GioHang , Long> {

    @Query("select gh.id from GioHang gh where gh.idKhachHang.tenTaiKhoan.tenTaiKhoan = :tk")
    Long findIdGioHangByTaiKhoan( String tk);



}

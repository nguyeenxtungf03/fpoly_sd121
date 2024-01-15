package com.fpoly.poly121.repository;

import com.fpoly.poly121.model.LichSuDonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LichSuDonHangRepository extends JpaRepository<LichSuDonHang ,Long> {

    @Query("select lshd from LichSuDonHang lshd where lshd.idDonHang = :idHoaDon ")
    List<LichSuDonHang> findLichSuDonHangByIdAndIdDonHang(Long idHoaDon);
}

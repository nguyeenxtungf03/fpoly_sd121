package com.fpoly.poly121.repository;

import com.fpoly.poly121.model.KhachHang;
import com.fpoly.poly121.security.dto.TaiKhoan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, Long> {
    KhachHang findFirstByTenTaiKhoanAndDaXoa(TaiKhoan taiKhoan, Integer daXoa);

    @Query("select kh\n" +
            "from  KhachHang kh   \n" +
            "where kh.tenTaiKhoan.tenTaiKhoan = :tk")
    KhachHang findIdKhachHangByTaiKhoan(String tk);

    @Query("select kh\n" +
            "from  KhachHang kh   \n" +
            "where kh.tenTaiKhoan.tenTaiKhoan = :tk1")
    KhachHang findTenTaiKhoanByTk(String tk1);

    @Query("select kh.id\n" +
            "from  KhachHang kh   \n" +
            "where kh.tenTaiKhoan.tenTaiKhoan = :tk")
    Long findIdKhachHangByTenTaiKhoan(String tk);

    @Query("select kh.trangThai\n" +
            "from  KhachHang kh   \n" +
            "where kh.tenTaiKhoan.tenTaiKhoan = :tk")
    Integer findTrangThaiKhachHangByTenTaiKhoan(String tk);

    @Query("select kh\n" +
            "from  KhachHang kh   \n" +
            "where kh.trangThai = 1 or  kh.trangThai = 2 ")
    Page<KhachHang> findAllKh(Pageable pageable);

    @Modifying
    @Query("update KhachHang  set trangThai = 2 where id = :idKh")
    void trangThaiHuy(Long idKh);

    @Modifying
    @Query("update KhachHang  set trangThai = 1 where id = :idKh")
    void trangThaiKichHoat(Long idKh);


    @Query("select kh\n" +
            "from  KhachHang kh   \n" +
            "where kh.tenTaiKhoan.tenTaiKhoan = :key or kh.sdt = :key or kh.ten = :key or kh.email = :key or kh.ho = :key or kh.tenDem = :key")
    List<KhachHang> searchKh(String key);

    @Query("select kh\n" +
            "from  KhachHang kh   \n" +
            "where kh.trangThai = :tt")
    List<KhachHang> searchTT(String tt);


}

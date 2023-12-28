package com.fpoly.poly121.repository;

import com.fpoly.poly121.model.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface HoaDonReponsitory extends JpaRepository<HoaDon ,Long> {

    // Search HD theo khoang ( dd//mm//yy )
    @Query("select hd from HoaDon hd where  hd.ngayTao >= :dateBd and hd.ngayTao <= :dateKt and hd.trangThai = 6 ")
    List<HoaDon> searchHD(Date dateBd, Date dateKt);


    @Query("SELECT hd " +
            "FROM HoaDon hd " +
            "WHERE (:key = ''  or hd.sdtNguoiNhan like %:key%  ) " +
            "AND (:loaiHoaDon IS NULL OR hd.loaiHoaDon = :loaiHoaDon) " +
            "AND (:dateBd IS NULL OR hd.ngayTao >= :dateBd ) " +
            "AND (:dateKt IS NULL OR hd.ngayTao <= :dateKt ) "  +
            "AND (:trangThai IS NULL OR hd.trangThai = :trangThai ) ")
    List<HoaDon> boLocHd(
            @Param("key") String key,
            @Param("loaiHoaDon") Long loaiHoaDon,
            @Param("dateBd") Date dateBd,
            @Param("dateKt") Date dateKt,
            @Param("trangThai") Long trangThai);

    @Query("SELECT COUNT(DISTINCT hd.idKhachHang) AS unique_customer_count " +
            "FROM HoaDon hd " +
            "JOIN hd.idKhachHang  where hd.ngayCapNhat >= :dateBd and hd.ngayCapNhat <= :dateKt and hd.trangThai <> 7 ")
    Long countUniqueCustomers(Date dateBd, Date dateKt);


    @Query("SELECT COUNT(DISTINCT hd.idKhachHang) AS unique_customer_count " +
            "FROM HoaDon hd " +
            "JOIN hd.idKhachHang where hd.trangThai <> 7")
    Long countUniqueCustomersAll();

    @Query("select hd from HoaDon hd WHERE hd.trangThai = 6 ")
    List<HoaDon> doanhThuHt();

    @Query("select hd from HoaDon hd WHERE hd.trangThai = 6  ")
    List<HoaDon> hoaDonDaBan();

    @Query("select hd from HoaDon hd WHERE hd.ngayCapNhat >= :dateBd and hd.ngayCapNhat <= :dateKt and hd.trangThai = 6  ")
    List<HoaDon> hoaDonDaBanSearch(Date dateBd, Date dateKt);


    @Query("select hdct from HoaDonChiTiet hdct where  hdct.idHoaDon.trangThai <> 7 and hdct.idHoaDon.trangThai <> 1")
    List<HoaDonChiTiet>  sanPhamDaBan();

    @Query("select hd \n" +
            "from HoaDon hd where hd.idKhachHang.tenTaiKhoan.tenTaiKhoan = :tk order by hd.ngayTao desc \n")
    List<HoaDon> findHoaDonByTaiKhoan( String tk);

    @Query("select hd\n" +
            "from HoaDon hd\n" +
            "order by hd.ngayTao desc")
    Page<HoaDon> listHd(Pageable pageable);

    @Query("select hd from HoaDon  hd where hd.trangThai = :trangThai order by hd.ngayTao desc")
    List<HoaDon> trangThaiHoaDon(Long trangThai);


    @Modifying
    @Query("update HoaDon  set trangThai = :trangThai  where id = :idHoaDon ")
    void updateTrangThai(@Param("trangThai") Long trangThai,@Param("idHoaDon") Long idHoaDon );

    @Modifying
    @Query("update HoaDon  set ngayCapNhat = :ngayCapNhat  where id = :idHoaDon ")
    void updateNgay(@Param("ngayCapNhat") Date ngayCapNhat,@Param("idHoaDon") Long idHoaDon );

    List<HoaDon> findByTrangThai(Integer trangThai);

}
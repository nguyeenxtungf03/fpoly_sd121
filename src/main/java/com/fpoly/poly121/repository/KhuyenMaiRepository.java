package com.fpoly.poly121.repository;

import com.fpoly.poly121.model.HoaDon;
import com.fpoly.poly121.model.KhuyenMai;
import com.fpoly.poly121.model.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface KhuyenMaiRepository extends JpaRepository<KhuyenMai , Long> {

    @Modifying
    @Query("UPDATE SanPhamChiTiet spct SET spct.idKhuyenMai = NULL WHERE spct.idKhuyenMai.id = :idKm")
    void voHieuHoa(@Param("idKm") Long idKm);

    @Query("select km from KhuyenMai km where km.id = :idKm ")
    KhuyenMai km(Long idKm);

    @Query("select km from KhuyenMai km where km.tenKhuyenMai = :tenKhuyenMai ")
    KhuyenMai checkTenKm(String tenKhuyenMai);


    @Query("select spct.id from SanPhamChiTiet spct where spct.idKhuyenMai.id = :idKm  ")
    Long idSpct(Long idKm);

    @Query("select km from KhuyenMai km where km.id = :idKm ")
    List<KhuyenMai> kmCheck(Long idKm);



    @Query("SELECT km " +
            "FROM KhuyenMai km " +
            "WHERE (:tenKm = '' OR km.tenKhuyenMai = :tenKm  ) " +
            "AND (:idKm IS NULL OR km.id = :idKm) " +
            "AND (:loaiKm = '' or km.loaiKhuyenMai = :loaiKm) " +
            "AND (:giaTriToiThieu IS NULL OR km.giaTri >= :giaTriToiThieu )  " +
            "AND (:giaTriToiDa IS NULL OR km.giaTri <= :giaTriToiDa) " +
            "AND (:dateBd IS NULL OR km.ngayBatDau >= :dateBd ) " +
            "AND (:dateKt IS NULL OR km.ngayKetThuc <= :dateKt ) "  +
            "AND (:trangThai IS NULL OR km.trangThai = :trangThai) ")
    List<KhuyenMai> boLocKm(
            @Param("tenKm") String tenKm,
            @Param("idKm") Long idKm,
            @Param("loaiKm") String loaiKm,
            @Param("giaTriToiThieu") Long giaTriToiThieu,
            @Param("giaTriToiDa") Long giaTriToiDa,
            @Param("dateBd") Date dateBd,
            @Param("dateKt") Date dateKt,
            @Param("trangThai") Integer trangThai);

    List<KhuyenMai> findByIdIn(List<Long> ids);
}

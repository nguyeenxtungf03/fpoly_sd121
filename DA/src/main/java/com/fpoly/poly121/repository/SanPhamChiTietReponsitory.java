package com.fpoly.poly121.repository;


import com.fpoly.poly121.model.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.Random;

@Repository
public interface SanPhamChiTietReponsitory  extends JpaRepository<SanPhamChiTiet , Long> {

    @Query("SELECT ct FROM SanPhamChiTiet ct WHERE ct.idSanPham in (select sp.id from SanPham sp where sp.tenSanPham like %:keyword%) " +
            "OR ct.idLoaiSanPham in (select sp.id from LoaiSanPham sp where sp.tenLoai like %:keyword%) " +
            "OR ct.idChatLieu in (select sp.id from ChatLieu sp where sp.tenChatLieu like %:keyword%) " +
            "OR ct.idKichThuoc in (select sp.id from KichThuoc sp where sp.tenKichThuoc like %:keyword%) " +
            "OR ct.idMauSac in (select sp.id from MauSac sp where sp.tenMauSac like %:keyword%) " +
            "OR ct.idThuongHieu in (select sp.id from ThuongHieu sp where sp.tenThuongHieu like %:keyword%) " )
    List<SanPhamChiTiet> search( String keyword);


    @Query("select ct.idSanPham.tenSanPham ,ct.idLoaiSanPham.tenLoai  , ct.idMauSac.tenMauSac,ct.idKichThuoc.tenKichThuoc,ct.idThuongHieu.tenThuongHieu,ct.idChatLieu.tenChatLieu  \n" +
            "from SanPhamChiTiet ct\n" +
            "group by ct.idSanPham.tenSanPham,ct.idLoaiSanPham.tenLoai,ct.idMauSac.tenMauSac,ct.idKichThuoc.tenKichThuoc,ct.idThuongHieu.tenThuongHieu,ct.idChatLieu.tenChatLieu" +
            " having ct.idSanPham.tenSanPham = :tenSanPham  and ct.idLoaiSanPham.tenLoai = :tenLoai and ct.idMauSac.tenMauSac = :tenMauSac and " +
            "ct.idKichThuoc.tenKichThuoc = :tenKichThuoc and ct.idThuongHieu.tenThuongHieu = :tenThuongHieu and ct.idChatLieu.tenChatLieu = :tenChatLieu")
    SanPhamChiTiet sp(String tenSanPham, String tenLoai, String tenMauSac, String tenKichThuoc, String tenThuongHieu, String tenChatLieu );


    @Query("SELECT spct FROM SanPhamChiTiet spct where spct.idSanPham.id = :idSp and spct.idLoaiSanPham.id =:idLsp and spct.idThuongHieu.id = :idTh and spct.idChatLieu.id = :idCl ")
    List<SanPhamChiTiet> findSanPhamChiTietByIdSanPham(Long idSp , Long idLsp , Long idTh , Integer idCl);



    @Query("SELECT spct FROM SanPhamChiTiet spct " +
            "WHERE spct.idMauSac.id = :idMs AND spct.idKichThuoc.id = :idKt AND spct.idSanPham.id = :idSp")
    List<SanPhamChiTiet> findSanPhamChiTietByIdSanPhamAndIdKichThuocAndIdMauSac(@Param("idSp") Long idSp,
                                                                                @Param("idMs") Long idMs,
                                                                                @Param("idKt") Long idKt);

    default SanPhamChiTiet findRandomSanPhamChiTietByIdSanPhamAndIdKichThuocAndIdMauSac(@Param("idSp") Long idSp,
                                                                                        @Param("idMs") Long idMs,
                                                                                        @Param("idKt") Long idKt) {
        List<SanPhamChiTiet> resultList = findSanPhamChiTietByIdSanPhamAndIdKichThuocAndIdMauSac(idSp, idMs, idKt);

        if (!resultList.isEmpty()) {
            int randomIndex = new Random().nextInt(resultList.size());
            return resultList.get(randomIndex);
        }

        return null;
    }


    @Query("select spct from SanPhamChiTiet spct WHERE spct.idKhuyenMai.id = :idKm")
    List<SanPhamChiTiet> dsSpctKm(Long idKm);

    @Modifying
    @Query("Update SanPhamChiTiet spct set spct.idKhuyenMai = NULL WHERE spct.id =:idSp ")
    void deleteKmSp(Long idSp);

    @Query("select spct.idSanPham , spct.idLoaiSanPham , spct.idThuongHieu,spct.idChatLieu , sum( spct.soLuong ) as SoLuong ,spct.trangThai\n" +
            "from SanPhamChiTiet spct \n" +
            "group by spct.idSanPham , spct.idLoaiSanPham , spct.idThuongHieu , spct.idChatLieu ,spct.trangThai")
    Page<Object[]> listSp(Pageable pageable);



    @Query("select ct  \n" +
            "from SanPhamChiTiet ct\n" +
            "where ct.idSanPham.id = :idSanPham and ct.idLoaiSanPham.id = :idLoaiSanPham and ct.idMauSac.id = :idMauSac and ct.idKichThuoc.id = :idKichThuoc and ct.idThuongHieu.id = :idThuongHieu and ct.idChatLieu.id = :idChatLieu  ")
    SanPhamChiTiet spCheck(Long idSanPham, Long idLoaiSanPham, Long idMauSac, Long idKichThuoc, Long idThuongHieu, Integer idChatLieu );


    @Query("SELECT ct " +
            "FROM SanPhamChiTiet ct " +
            "WHERE (:idSanPham IS NULL OR ct.idSanPham = :idSanPham) " +
            "AND (:idLoai IS NULL OR ct.idLoaiSanPham = :idLoai) " +
            "AND (:tenMauSac IS NULL OR ct.idMauSac = :tenMauSac) " +
            "AND (:idKichThuoc IS NULL OR ct.idKichThuoc = :idKichThuoc) " +
            "AND (:idThuongHieu IS NULL OR ct.idThuongHieu = :idThuongHieu) " +
            "AND (:idChatLieu IS NULL OR ct.idChatLieu = :idChatLieu) " +
            "AND (:trangThai IS NULL OR ct.trangThai = :trangThai) " +
            "AND (:danhMuc IS NULL OR ct.idLoaiSanPham.danhMuc = :danhMuc) " +
            "AND (:gioiTinh IS NULL OR ct.idLoaiSanPham.gioiTinh = :gioiTinh) " +
            "AND (:toiThieu IS NULL OR ct.giaBan >= :toiThieu) " +
            "AND (:toiDa IS NULL OR ct.giaBan <= :toiDa)")
    List<SanPhamChiTiet> boLoc(
            @Param("idSanPham") SanPham idSanPham,
            @Param("idLoai") LoaiSanPham idLoai,
            @Param("tenMauSac") MauSac idMauSac,
            @Param("idKichThuoc") KichThuoc idKichThuoc,
            @Param("idThuongHieu") ThuongHieu idThuongHieu,
            @Param("idChatLieu") ChatLieu idChatLieu,
            @Param("trangThai") Long trangThai,
            @Param("danhMuc") String danhMuc,
            @Param("gioiTinh") String gioiTinh,
            @Param("toiThieu") Long toiThieu,
            @Param("toiDa") Long toiDa);


    @Query("select hdct from HoaDonChiTiet hdct where hdct.idHoaDon.id = :idHd   ")
    List<HoaDonChiTiet> findHdctByidHd(Long idHd );

    List<SanPhamChiTiet> findByIdSanPham(SanPham idSp);

    SanPhamChiTiet findFirstByIdSanPhamAndAndIdMauSacAndIdKichThuoc(SanPham sanPham, MauSac mauSac, KichThuoc kichThuoc);

    List<SanPhamChiTiet> findByIdIn(List<Long> ids);

}



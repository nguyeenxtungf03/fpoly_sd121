package com.fpoly.poly121.repository;

import com.fpoly.poly121.model.HoaDon;
import com.fpoly.poly121.model.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface HoaDonChiTietReponsitory extends JpaRepository<HoaDonChiTiet, Long> {

    @Query("select hdct from HoaDonChiTiet hdct where hdct.idHoaDon = :idHD")
    List<HoaDonChiTiet> searchidHd(HoaDon idHD);

    @Query("select hdct from HoaDonChiTiet hdct where hdct.idSanPhamChiTiet.id = :idSpct")
    List<HoaDonChiTiet> findAllByIdSanPhamChiTiet(Long idSpct);

    @Query("SELECT hdct from HoaDonChiTiet  hdct where hdct.ngayTao >= :dateBd and hdct.ngayTao <= :dateKt and hdct.idHoaDon.trangThai <> 7 and hdct.idHoaDon.trangThai <> 1")
    List<HoaDonChiTiet> searchHDCT(Date dateBd, Date dateKt);


    @Query("SELECT kh.id, MAX(kh.ho) AS ho, MAX(kh.tenDem) AS tenDem, MAX(kh.ten) AS ten, " +
            "MAX(kh.ngaySinh) AS ngaySinh, MAX(kh.email) AS email, MAX(kh.sdt) AS sdt, " +
            "SUM(ct.soLuong) AS soLuong, SUM(hd.thanhTien) AS thanhTien,MAX(kh.trangThai) as trangThai, " +
            "SUM(hd.thanhTien / 10000) AS diem " +
            "FROM HoaDonChiTiet ct " +
            "JOIN ct.idHoaDon.idKhachHang kh " +
            "JOIN ct.idHoaDon hd " +
            "where ct.idHoaDon.trangThai = 6" +
            "GROUP BY kh.id " +
            "ORDER BY SUM(hd.thanhTien) DESC")
    List<Object[]> getHoaDonChiTiet();

          @Query("select ct.idSanPhamChiTiet,sp.idSanPham,sp.idLoaiSanPham,sp.idMauSac,sp.idKichThuoc,sp.idChatLieu,sp.idThuongHieu,sum(ct.soLuong) as TongSL ,sp.giaBan,sp.anhSanPham \n" +
            "from HoaDonChiTiet ct join  ct.idSanPhamChiTiet sp\n" +
            " where  ct.idHoaDon.trangThai = 6\n" +
            "group by ct.idSanPhamChiTiet,sp.idSanPham,sp.idLoaiSanPham,sp.idMauSac,sp.idKichThuoc,sp.idChatLieu,sp.idThuongHieu,sp.giaBan,sp.anhSanPham\n" +
            "order by sum(ct.soLuong) desc")
    List<Object[]> getSoLuong();


    @Query("select ct.idSanPhamChiTiet,sp.idSanPham,sp.idLoaiSanPham,sp.idMauSac,sp.idKichThuoc,sp.idChatLieu,sp.idThuongHieu,sum(ct.soLuong) as TongSL ,sp.giaBan,sp.anhSanPham ,sp.trangThai \n" +
            "from HoaDonChiTiet ct join  ct.idSanPhamChiTiet sp\n " +
            "where sp.trangThai = 0" +
            "group by ct.idSanPhamChiTiet,sp.idSanPham,sp.idLoaiSanPham,sp.idMauSac,sp.idKichThuoc,sp.idChatLieu,sp.idThuongHieu,sp.giaBan,sp.anhSanPham ,sp.trangThai \n" +
            "order by sum(ct.soLuong) desc")
    List<Object[]> getSoLuongTrangThai();

    List<HoaDonChiTiet> findByIdHoaDon(HoaDon hoaDon);

}

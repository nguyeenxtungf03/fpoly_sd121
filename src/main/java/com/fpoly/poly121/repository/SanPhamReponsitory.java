package com.fpoly.poly121.repository;

import com.fpoly.poly121.dto.SanPhamValue;
import com.fpoly.poly121.model.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamReponsitory extends JpaRepository<SanPham , Long> {
    @Query("select cl from SanPham cl where  cl.tenSanPham like %:tenSanPham%  ")
    List<SanPham> search( String tenSanPham );

    @Query("select sp from SanPham  sp where sp.tenSanPham = :tenSanPham")
    SanPham tensp(String  tenSanPham);

    SanPham findByTenSanPham(String tenSanPham);

    @Query(value = " select sp.id as idSp, sp.tenSanPham as ten, min(spct.anhSanPham) as anh, min(spct.giaBan) as gia" +
            " from SanPham sp join SanPhamChiTiet spct  on sp = spct.idSanPham " +
            " where 1 = 1 " +
            " and ( :tenSp is null or :tenSp = '' or lower(sp.tenSanPham) like concat('%', lower(:tenSp), '%' ) ) " +
            " group by sp.tenSanPham, sp.id " +
            " order by max (spct.ngayTao) desc ")
    Page<SanPhamValue> searchBanHang(String tenSp, Pageable pageable);

    @Query(value = " select sp.id as idSp, min(spct.id) as idSpct, max (spct.idKhuyenMai.id) as idKhuyenMai, sp.tenSanPham as ten, min(spct.anhSanPham) as anh, min(spct.giaBan) as gia" +
            " from SanPham sp join SanPhamChiTiet spct  on sp = spct.idSanPham " +
            " where 1 = 1 " +
            " and spct.idLoaiSanPham.gioiTinh = '1' " +
            " and spct.idLoaiSanPham.danhMuc = '1' " +
            " and spct.trangThai = 0 " +
            " group by sp.tenSanPham, sp.id " +
            " order by max (spct.ngayTao) desc\n")
    List<SanPhamValue> getAoNamMoi();

    @Query(value = " select sp.id as idSp, min(spct.id) as idSpct, max (spct.idKhuyenMai.id) as idKhuyenMai, sp.tenSanPham as ten, min(spct.anhSanPham) as anh, min(spct.giaBan) as gia" +
            " from SanPham sp join SanPhamChiTiet spct  on sp = spct.idSanPham " +
            " where 1 = 1 " +
            " and spct.idLoaiSanPham.gioiTinh = '1' " +
            " and spct.idLoaiSanPham.danhMuc = '2' " +
            " and spct.trangThai = 0 " +
            " group by sp.tenSanPham, sp.id " +
            " order by max (spct.ngayTao) desc\n")
    List<SanPhamValue> getQuanNamMoi();

    @Query(value = " select sp.id as idSp, min(spct.id) as idSpct, max (spct.idKhuyenMai.id) as idKhuyenMai, sp.tenSanPham as ten, min(spct.anhSanPham) as anh, min(spct.giaBan) as gia" +
            " from SanPham sp join SanPhamChiTiet spct  on sp = spct.idSanPham " +
            " where 1 = 1 " +
            " and spct.idLoaiSanPham.gioiTinh = '2' " +
            " and spct.idLoaiSanPham.danhMuc = '1' " +
            " and spct.trangThai = 0 " +
            " group by sp.tenSanPham, sp.id " +
            " order by max (spct.ngayTao) desc\n")
    List<SanPhamValue> getAoNuMoi();

    @Query(value = " select sp.id as idSp, min(spct.id) as idSpct, max (spct.idKhuyenMai.id) as idKhuyenMai, sp.tenSanPham as ten, min(spct.anhSanPham) as anh, min(spct.giaBan) as gia" +
            " from SanPham sp join SanPhamChiTiet spct  on sp = spct.idSanPham " +
            " where 1 = 1 " +
            " and spct.idLoaiSanPham.gioiTinh = '2' " +
            " and spct.idLoaiSanPham.danhMuc = '2' " +
            " and spct.trangThai = 0 " +
            " group by sp.tenSanPham, sp.id " +
            " order by max (spct.ngayTao) desc\n")
    List<SanPhamValue> getQuanNuMoi();

}

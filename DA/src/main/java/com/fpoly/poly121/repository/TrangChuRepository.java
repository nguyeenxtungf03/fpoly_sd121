package com.fpoly.poly121.repository;
import com.fpoly.poly121.model.SanPhamChiTiet;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TrangChuRepository extends JpaRepository<SanPhamChiTiet,Long> {

//    ----------Nam----------

    @Query("select ct \n" +
            "from SanPhamChiTiet ct join ct.idLoaiSanPham lsp \n" +
            "where lsp.gioiTinh = '1' and lsp.danhMuc = '1' and ct.trangThai = 0" +
            "order by ct.ngayTao desc\n")
    List<SanPhamChiTiet> getAllAoNamMoiNhat();


    @Query("select ct \n" +
            "from SanPhamChiTiet ct join ct.idLoaiSanPham lsp \n" +
            "where lsp.gioiTinh = '1' and lsp.danhMuc = '2' and ct.trangThai = 0" +
            "order by ct.ngayTao desc\n")
    List<SanPhamChiTiet> getAllQuanNamMoiNhat();

    @Query("SELECT spct FROM SanPhamChiTiet spct " +
            "INNER JOIN SanPham sp ON spct.id = sp.id where spct.idLoaiSanPham.gioiTinh = 'True'" +
            "order by spct.ngayTao DESC")
    List<SanPhamChiTiet> getAllNamNhieuNhat();



//    --------Nu------------

    @Query("select ct \n" +
            "from SanPhamChiTiet ct join ct.idLoaiSanPham lsp \n" +
            "where lsp.gioiTinh = '2' and lsp.danhMuc = '1' and ct.trangThai = 0" +
            "order by ct.ngayTao desc\n")
    List<SanPhamChiTiet> getAllAoNuMoiNhat();

    @Query("select ct \n" +
            "from SanPhamChiTiet ct join ct.idLoaiSanPham lsp \n" +
            "where lsp.gioiTinh = '2' and lsp.danhMuc = '2' and ct.trangThai = 0" +
            "order by ct.ngayTao desc\n")
    List<SanPhamChiTiet> getAllQuanNuMoiNhat();
}


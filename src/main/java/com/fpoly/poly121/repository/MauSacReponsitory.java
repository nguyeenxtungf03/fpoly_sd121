package com.fpoly.poly121.repository;

import com.fpoly.poly121.model.MauSac;

import com.fpoly.poly121.model.SanPham;
import com.fpoly.poly121.model.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MauSacReponsitory extends JpaRepository<MauSac,Long> {
    @Query("select cl from MauSac cl where  cl.tenMauSac like %:tenMauSac%  ")
    List<MauSac> search(String tenMauSac );
    
    MauSac findByTenMauSac(String tenMauSac);


    @Query("select spct.idMauSac from SanPhamChiTiet  spct where spct.idSanPham.id = :idSanPham and spct.idLoaiSanPham.id =:idLsp and spct.idThuongHieu.id = :idTh and spct.idChatLieu.id = :idCl and spct.trangThai = 0 ")
    List<MauSac> findMauSacBySanPhamAndKichThuoc(Long idSanPham ,  Long idLsp,  Long idTh, Integer idCl );

    @Query("select spct from SanPhamChiTiet  spct where spct.idSanPham.id = :idSanPham and spct.idLoaiSanPham.id =:idLsp and spct.idThuongHieu.id = :idTh and spct.idChatLieu.id = :idCl and spct.trangThai = 0 ")
    List<SanPhamChiTiet> findAnh(Long idSanPham , Long idLsp, Long idTh, Integer idCl );


    @Query("select sp from MauSac  sp where sp.tenMauSac = :tenMauSac")
    MauSac tenMs(String  tenMauSac);

}

package com.fpoly.poly121.repository;

import com.fpoly.poly121.model.ChatLieu;
import com.fpoly.poly121.model.SanPham;
import com.fpoly.poly121.model.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ThuongHieuRepository extends JpaRepository<ThuongHieu, Long> {
    @Query("select th from ThuongHieu th where th.tenThuongHieu like %:tenThuongHieu%")
    List<ThuongHieu> search(String tenThuongHieu );

    ThuongHieu findByTenThuongHieu(String tenThuongHieu);

    @Query("select sp from ThuongHieu  sp where sp.tenThuongHieu = :tenThuongHieu")
    ThuongHieu tenTh(String  tenThuongHieu);

}


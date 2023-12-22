package com.fpoly.poly121.repository;

import com.fpoly.poly121.model.LoaiSanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LoaiSanPhamRepository extends JpaRepository<LoaiSanPham,Long> {

    @Query("SELECT c from LoaiSanPham c where c.tenLoai like %:tenLoai%")
    List<LoaiSanPham> search(String tenLoai);


    LoaiSanPham findByTenLoai(String tenLoai);

}
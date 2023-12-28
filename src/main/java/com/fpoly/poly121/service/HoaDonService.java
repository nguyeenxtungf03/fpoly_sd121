package com.fpoly.poly121.service;

import com.fpoly.poly121.model.HoaDon;
import com.fpoly.poly121.model.HoaDonChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface HoaDonService {
    Page<HoaDon> getAll(Integer page);

    List<HoaDon> searchHD(Date dateBd , Date dateKt);


    HoaDon detail(Long id);

    List<HoaDon> getAll1();

    Long countUniqueCustomers(Date dateBd , Date dateKt);

    Long countUniqueCustomersAll();

    List<HoaDon> findHoaDonByTaiKhoan( String tk);


}

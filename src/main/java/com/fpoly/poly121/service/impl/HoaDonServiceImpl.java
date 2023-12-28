package com.fpoly.poly121.service.impl;

import com.fpoly.poly121.model.HoaDon;
import com.fpoly.poly121.model.HoaDonChiTiet;
import com.fpoly.poly121.repository.HoaDonChiTietReponsitory;
import com.fpoly.poly121.repository.HoaDonReponsitory;
import com.fpoly.poly121.service.HoaDonService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class HoaDonServiceImpl implements HoaDonService {

    @Autowired
    private HoaDonReponsitory hoaDonReponsitory;


    @Override
    public Page<HoaDon> getAll(Integer page) {
        Pageable pageable = PageRequest.of(page,10);
        return hoaDonReponsitory. listHd(pageable) ;
    }


    @Override
    public List<HoaDon> getAll1() {
        return hoaDonReponsitory.findAll();
    }

    @Override
    public List<HoaDon> searchHD(Date dateBd, Date dateKt) {
       return  hoaDonReponsitory.searchHD(dateBd,dateKt);
    }


    @Override
    public Long countUniqueCustomers(Date dateBd, Date dateKt) {
        return hoaDonReponsitory.countUniqueCustomers(dateBd,dateKt);
    }

    @Override
    public Long countUniqueCustomersAll() {
        return hoaDonReponsitory.countUniqueCustomersAll();
    }


    @Override
    public HoaDon detail(Long id) {
        return hoaDonReponsitory.getById(id);
    }

    /// hoa don theo tk
    @Override
    public List<HoaDon> findHoaDonByTaiKhoan(String tk) {
        return hoaDonReponsitory.findHoaDonByTaiKhoan(tk);
    }


}

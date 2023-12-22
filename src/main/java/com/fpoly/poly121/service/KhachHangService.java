package com.fpoly.poly121.service;

import com.fpoly.poly121.dto.request.TaiKhoanDto;
import com.fpoly.poly121.model.KhachHang;
import com.fpoly.poly121.model.NhanVien;
import com.fpoly.poly121.repository.KhachHangRepository;
import com.fpoly.poly121.repository.TaiKhoanRepository;
import com.fpoly.poly121.security.dto.TaiKhoan;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
@AllArgsConstructor
public class KhachHangService {

    private final TaiKhoanRepository taiKhoanRepository;
    private final KhachHangRepository khachHangRepository;
    private final PasswordEncoder passwordEncoder;

    public void dangKyKhachHang(TaiKhoanDto dto) {
        TaiKhoan taiKhoan = taiKhoanRepository.save(dto.toTaiKhoan(passwordEncoder).setChucVu("ROLE_USER"));
        KhachHang khachHang = new KhachHang()
                .setTenTaiKhoan(taiKhoan)
                .setSdt(taiKhoan.getSdt())
                .setNgayTao(new Date())
                .setTrangThai(1)
                .setDaXoa(0);
        khachHangRepository.save(khachHang);
    }
}

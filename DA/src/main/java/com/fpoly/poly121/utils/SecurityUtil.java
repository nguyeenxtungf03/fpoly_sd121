package com.fpoly.poly121.utils;

import com.fpoly.poly121.model.KhachHang;
import com.fpoly.poly121.repository.KhachHangRepository;
import com.fpoly.poly121.repository.TaiKhoanRepository;
import com.fpoly.poly121.security.dto.TaiKhoan;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Objects;

public class SecurityUtil {
    public static boolean checkIsAdmin(TaiKhoanRepository taiKhoanRepository) {
        boolean isAdmin = false;
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            TaiKhoan taiKhoan = taiKhoanRepository.findByTenTaiKhoan(userDetails.getUsername());
            isAdmin = Objects.equals("ROLE_ADMIN",taiKhoan.getChucVu());
        } catch (Exception e) {
        }
        return isAdmin;
    }

    public static boolean checkIsStaff(TaiKhoanRepository taiKhoanRepository) {
        boolean isStaff = false;
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            TaiKhoan taiKhoan = taiKhoanRepository.findByTenTaiKhoan(userDetails.getUsername());
            isStaff = Objects.equals("ROLE_STAFF",taiKhoan.getChucVu());
        } catch (Exception e) {
        }
        return isStaff;
    }

    public static boolean checkIsAuth(TaiKhoanRepository taiKhoanRepository) {
        boolean isAuth = false;
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            TaiKhoan taiKhoan = taiKhoanRepository.findByTenTaiKhoan(userDetails.getUsername());
            isAuth = true;
        } catch (Exception e) {
        }
        return isAuth;
    }

    public static boolean checkIsUser(TaiKhoanRepository taiKhoanRepository) {
        boolean isUser = false;
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            TaiKhoan taiKhoan = taiKhoanRepository.findByTenTaiKhoan(userDetails.getUsername());
            isUser = Objects.equals("ROLE_USER",taiKhoan.getChucVu());
        } catch (Exception e) {
        }
        return isUser;
    }

    public static String getUsernameLogin() {
        String username = "";
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            username = userDetails.getUsername();
        } catch (Exception e) {
        }
        return username;
    }

    public static Long getIdKhachHangLogin(KhachHangRepository khachHangRepository, TaiKhoanRepository taiKhoanRepository) {
        Long id = null;
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            TaiKhoan taiKhoan = taiKhoanRepository.findByTenTaiKhoan(userDetails.getUsername());
            KhachHang khachHang = khachHangRepository.findFirstByTenTaiKhoanAndDaXoa(taiKhoan, 0);
            id = khachHang.getId();
        } catch (Exception e) {
        }
        return id;
    }

    public static TaiKhoan getAccountLogin(TaiKhoanRepository taiKhoanRepository) {
        TaiKhoan taiKhoan = new TaiKhoan();
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            taiKhoan = taiKhoanRepository.findByTenTaiKhoan(userDetails.getUsername());
        } catch (Exception e) {
        }
        return taiKhoan;
    }
}

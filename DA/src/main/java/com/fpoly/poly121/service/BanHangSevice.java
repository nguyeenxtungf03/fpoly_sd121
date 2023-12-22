package com.fpoly.poly121.service;

import com.fpoly.poly121.constant.InvoiceStatus;
import com.fpoly.poly121.dto.response.SanPhamResponse;
import com.fpoly.poly121.model.HoaDon;
import com.fpoly.poly121.model.HoaDonChiTiet;
import com.fpoly.poly121.model.SanPhamChiTiet;
import com.fpoly.poly121.repository.HoaDonChiTietReponsitory;
import com.fpoly.poly121.repository.HoaDonReponsitory;
import com.fpoly.poly121.repository.SanPhamChiTietReponsitory;
import com.fpoly.poly121.repository.TaiKhoanRepository;
import com.fpoly.poly121.utils.SecurityUtil;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class BanHangSevice {

    private final SanPhamChiTietReponsitory sanPhamChiTietRepository;
    private final HoaDonReponsitory hoaDonRepository;
    private final HoaDonChiTietReponsitory hoaDonChiTietRepository;
    private final TaiKhoanRepository taiKhoanRepository;

    public List<SanPhamResponse> getListGioHang(HttpSession session) {
        List <SanPhamResponse> result = (List<SanPhamResponse>) session.getAttribute("listSpr");
        if (result == null) result = new ArrayList<>();
        return result;
    }

    public void themVaoGio(Long idSpct, Long soLuongMua, HttpSession session) {
        List<SanPhamResponse> listSpr = (List<SanPhamResponse>) session.getAttribute("listSpr");
        if (listSpr == null) listSpr = new ArrayList<>();
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findById(idSpct).get();
        SanPhamResponse spr = null;
        for (SanPhamResponse s : listSpr) {
            if (Objects.equals(s.getIdSpct(), idSpct)) spr = s;
        }
        if (!Objects.isNull(spr)) {
            listSpr.remove(spr);
            listSpr.add(spr.setSoLuong(spr.getSoLuong() + soLuongMua));
        } else {
            Long gia = sanPhamChiTiet.getGiaBan();
            Long giaTruocKM = gia;
            if (!Objects.isNull(sanPhamChiTiet.getIdKhuyenMai()) && sanPhamChiTiet.getIdKhuyenMai().getNgayBatDau().before(new Date())) {
                if (sanPhamChiTiet.getIdKhuyenMai().getLoaiKhuyenMai().equals("percentage")) {
                    gia = sanPhamChiTiet.getGiaBan() - (sanPhamChiTiet.getGiaBan() * sanPhamChiTiet.getIdKhuyenMai().getGiaTri() / 100);
                } else {
                    gia = sanPhamChiTiet.getGiaBan() - sanPhamChiTiet.getIdKhuyenMai().getGiaTri();
                }
                if (gia < 0) gia = 0L;
            }
            listSpr.add(new SanPhamResponse()
                    .setIdSpct(idSpct)
                    .setTen(sanPhamChiTiet.getIdSanPham().getTenSanPham())
                    .setMauSac(sanPhamChiTiet.getIdMauSac().getTenMauSac())
                    .setKichThuoc(sanPhamChiTiet.getIdKichThuoc().getTenKichThuoc())
                    .setSoLuong(soLuongMua)
                    .setGiaTruocKM(giaTruocKM)
                    .setGia(gia));
        }
        sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() - soLuongMua);
        sanPhamChiTietRepository.save(sanPhamChiTiet);
        session.setAttribute("listSpr", listSpr);
    }

    public void boKhoiGio(Long idSpct, HttpSession session) {
        List<SanPhamResponse> listSpr = (List<SanPhamResponse>) session.getAttribute("listSpr");
        if (listSpr == null) listSpr = new ArrayList<>();
        SanPhamResponse spr = null;
        for (SanPhamResponse s : listSpr) {
            if (Objects.equals(s.getIdSpct(), idSpct)) spr = s;
        }
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findById(idSpct).get();
        if (!Objects.isNull(spr)) {
            sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() + spr.getSoLuong());
            sanPhamChiTietRepository.save(sanPhamChiTiet);
            listSpr.remove(spr);
            session.setAttribute("listSpr", listSpr);
        }
    }

    @Transactional
    public void luuHoaDon(String action, String idHdc, String giamGia, String ghiChu, HttpSession session) {
        if (!idHdc.trim().equals("")) {
            HoaDon hoaDon = hoaDonRepository.findById(Long.parseLong(idHdc)).get();
            List<HoaDonChiTiet> listHdct = hoaDonChiTietRepository.findByIdHoaDon(hoaDon);
            for (HoaDonChiTiet hdct : listHdct) {
                hoaDonChiTietRepository.delete(hdct);
            }
            hoaDonRepository.delete(hoaDon);
        }
        HoaDon hoaDon = new HoaDon();
        String userLogin = SecurityUtil.getUsernameLogin();
        List<SanPhamResponse> listSpr = (List<SanPhamResponse>) session.getAttribute("listSpr");
        if (listSpr == null) listSpr = new ArrayList<>();
        if (Objects.equals(action, "thanhToan")) {
            hoaDon.setTrangThai(InvoiceStatus.DA_THANH_TOAN.value);
            hoaDon = hoaDonRepository.save(hoaDon);
        } else if (Objects.equals(action, "choThanhToan")){
            hoaDon.setTrangThai(InvoiceStatus.CHO_THANH_TOAN.value);
            hoaDon = hoaDonRepository.save(hoaDon);
            if (Objects.isNull(ghiChu) || ghiChu.trim().isEmpty()) {
                LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM-hh:mm:ss");
                String formattedDateTime = now.format(formatter);
                hoaDon.setMaHoaDon(formattedDateTime);
            } else hoaDon.setMaHoaDon(ghiChu);
        } else {
            //todo: rollback quantity
            listSpr = new ArrayList<>();
            session.setAttribute("listSpr", listSpr);
            return;
        }
        Long tongTien = listSpr.stream().mapToLong(x -> x.getGia() * x.getSoLuong()).sum();
        hoaDon.setTongTien(tongTien);
        hoaDon.setThanhTien(tongTien);
        hoaDon.setTenTaiKhoanTaoHD(SecurityUtil.getAccountLogin(taiKhoanRepository));
        hoaDon.setNguoiTao(userLogin);
        hoaDon.setNgayTao(new Date());
        hoaDon.setLoaiHoaDon(2L);
        hoaDon = hoaDonRepository.save(hoaDon);
        List<SanPhamChiTiet> listSanPhamChiTiet = sanPhamChiTietRepository.findByIdIn(listSpr.stream().map(SanPhamResponse::getIdSpct).collect(Collectors.toList()));
        Map<Long, SanPhamChiTiet> mapIdSpct = listSanPhamChiTiet.stream().collect(Collectors.toMap(SanPhamChiTiet::getId, Function.identity()));
        List<HoaDonChiTiet> listHoaDonChiTiet = new ArrayList<>();
        for (SanPhamResponse spr : listSpr) {
            listHoaDonChiTiet.add(new HoaDonChiTiet()
                    .setIdHoaDon(hoaDon)
                    .setIdSanPhamChiTiet(mapIdSpct.get(spr.idSpct))
                    .setSoLuong(spr.getSoLuong())
                    .setDonGia(spr.getGia())
                    .setTrangThai(1)
                    .setNguoiTao(userLogin)
                    .setNgayTao(new Date()));
        }
        hoaDonChiTietRepository.saveAll(listHoaDonChiTiet);
        listSpr = new ArrayList<>();
        session.setAttribute("listSpr", listSpr);
    }
}

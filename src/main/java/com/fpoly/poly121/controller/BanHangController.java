package com.fpoly.poly121.controller;

import com.fpoly.poly121.constant.InvoiceStatus;
import com.fpoly.poly121.dto.SanPhamValue;
import com.fpoly.poly121.dto.response.SanPhamResponse;
import com.fpoly.poly121.model.*;
import com.fpoly.poly121.repository.*;
import com.fpoly.poly121.service.BanHangSevice;
import com.fpoly.poly121.utils.FormatUtil;
import com.fpoly.poly121.utils.SecurityUtil;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/ban-hang")
@AllArgsConstructor
public class BanHangController {

    private final SanPhamReponsitory sanPhamReponsitory;
    private final SanPhamChiTietReponsitory sanPhamChiTietRepository;
    private final KichThuocRepository kichThuocRepository;
    private final MauSacReponsitory mauSacReponsitory;
    private final BanHangSevice banHangSevice;
    private final HoaDonReponsitory hoaDonRepository;
    private final HoaDonChiTietReponsitory hoaDonChiTietRepository;
    private final TaiKhoanRepository taiKhoanRepository;

    @GetMapping
    public String view(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(required = false) String tenSp,
                       @RequestParam(required = false) String idHdc,
                       HttpSession session,
                       Model model) {
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 6);
        Page<SanPhamValue> pageSp = sanPhamReponsitory.searchBanHang(tenSp, pageable);
        model.addAttribute("pageSp",pageSp);
        String username = SecurityUtil.getUsernameLogin();
        if (username.equals("")) {
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Phiên đăng nhập đã hết hạn, vui lòng đăng nhập để tiếp tục !");
            return "redirect:/auth/dang-nhap";
        } else if (!SecurityUtil.checkIsAdmin(taiKhoanRepository)){
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Quyền truy cập không hợp lệ !");
            return "redirect:/auth/dang-nhap";
        }
        List<HoaDon> listHoaDonCho = hoaDonRepository.findByTrangThai(InvoiceStatus.CHO_THANH_TOAN.value.intValue());
        model.addAttribute("username", username);
        model.addAttribute("listHoaDonCho", listHoaDonCho);
        model.addAttribute("idHdc",idHdc);
        if (!Objects.isNull(idHdc)) {
            Optional<HoaDon> hoaDon = hoaDonRepository.findById(Long.parseLong(idHdc));
            if (hoaDon.isPresent()) {
                List<HoaDonChiTiet> listHdct = hoaDonChiTietRepository.findByIdHoaDon(hoaDon.get());
                List<SanPhamResponse> listSpr = new ArrayList<>();
                for (HoaDonChiTiet hdct : listHdct) {
                    SanPhamChiTiet spct = hdct.getIdSanPhamChiTiet();
                    listSpr.add(new SanPhamResponse()
                            .setIdSpct(spct.getId())
                            .setTen(spct.getIdSanPham().getTenSanPham())
                            .setAnh(spct.getAnhSanPham())
                            .setMauSac(spct.getIdMauSac().getTenMauSac())
                            .setKichThuoc(spct.getIdKichThuoc().getTenKichThuoc())
                             .setGia(spct.getGiaBan())
                            .setSoLuong(hdct.getSoLuong().longValue()));
                }
                session.setAttribute("listSpr", listSpr);
            }
        }
        Long tongTien = banHangSevice.getListGioHang(session).stream().mapToLong(x -> x.getGia() * x.getSoLuong()).sum();
        Long giamGia = 0L;
        model.addAttribute("listSpgh", banHangSevice.getListGioHang(session));
        model.addAttribute("tongTien", tongTien);
        model.addAttribute("giamGia",giamGia);
        model.addAttribute("canTra", tongTien - giamGia);
        return "ban-hang/view";
    }

    @GetMapping("/spct/{idSp}")
    public String viewSpct(@PathVariable Long idSp,
                           @RequestParam(required = false) Long size,
                           @RequestParam(required = false) Long color,
                           @RequestParam(required = false) Long idHdc,
                           Model model) {
        String username = SecurityUtil.getUsernameLogin();
        if (username.equals("")) {
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Phiên đăng nhập đã hết hạn, vui lòng đăng nhập để tiếp tục !");
            return "redirect:/auth/dang-nhap";
        } else if (!SecurityUtil.checkIsAdmin(taiKhoanRepository)){
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Quyền truy cập không hợp lệ !");
            return "redirect:/auth/dang-nhap";
        }
        List<HoaDon> listHoaDonCho = hoaDonRepository.findByTrangThai(InvoiceStatus.CHO_THANH_TOAN.value.intValue());
        model.addAttribute("username", SecurityUtil.getUsernameLogin());
        model.addAttribute("listHoaDonCho", listHoaDonCho);
        if (!Objects.isNull(size) && !Objects.isNull(color)) {
            SanPham sp = sanPhamReponsitory.findById(idSp).get();
            KichThuoc kt = kichThuocRepository.findById(size).get();
            MauSac ms = mauSacReponsitory.findById(color).get();
            List<SanPhamChiTiet> list = sanPhamChiTietRepository.findByIdSanPham(sp);
            SanPhamChiTiet spct = sanPhamChiTietRepository.findFirstByIdSanPhamAndAndIdMauSacAndIdKichThuoc(sp, ms, kt);
            if(Objects.isNull(spct)) {
                spct = list.get(0);
                spct.setSoLuong(0L);
            }
            if (!Objects.isNull(spct.getIdKhuyenMai()) && spct.getIdKhuyenMai().getNgayBatDau().before(new Date())) {
                KhuyenMai km = spct.getIdKhuyenMai();
                long giaKM;
                if (km.getLoaiKhuyenMai().equals("percentage")) {
                    giaKM = spct.getGiaBan() - (spct.getGiaBan() * km.getGiaTri() / 100);
                } else {
                    giaKM = spct.getGiaBan() - km.getGiaTri();
                }
                if (giaKM < 0) giaKM = 0;
                model.addAttribute("giaKM", FormatUtil.formatVND(giaKM));
                model.addAttribute("mess", km.getLoaiKhuyenMai().equals("percentage") ? km.getGiaTri() + "%" : FormatUtil.formatVND(km.getGiaTri()));
            } else {
                model.addAttribute("giaKM", null);
            }
            model.addAttribute("mainImg",spct.getAnhSanPham());
            model.addAttribute("tenSp",sp.getTenSanPham());
            model.addAttribute("listImg",list.stream().map(SanPhamChiTiet::getAnhSanPham).distinct().collect(Collectors.toList()));
            model.addAttribute("listSize",list.stream().map(SanPhamChiTiet::getIdKichThuoc).distinct().collect(Collectors.toList()));
            model.addAttribute("listColor",list.stream().map(SanPhamChiTiet::getIdMauSac).distinct().collect(Collectors.toList()));
            model.addAttribute("price", FormatUtil.formatVND(spct.getGiaBan()));
            model.addAttribute("quantity", spct.getSoLuong().toString());
            model.addAttribute("idSpct", spct.getId().toString());
            model.addAttribute("mainSizeId", size);
            model.addAttribute("mainColorId", color);
            model.addAttribute("displayProductInfo", true);
        } else {
            SanPham sp = sanPhamReponsitory.findById(idSp).get();
            List<SanPhamChiTiet> list = sanPhamChiTietRepository.findByIdSanPham(sp);
            model.addAttribute("mainImg",list.stream().map(SanPhamChiTiet::getAnhSanPham).findFirst().get());
            model.addAttribute("tenSp",sp.getTenSanPham());
            model.addAttribute("listImg",list.stream().map(SanPhamChiTiet::getAnhSanPham).distinct().collect(Collectors.toList()));
            model.addAttribute("listSize",list.stream().map(SanPhamChiTiet::getIdKichThuoc).distinct().collect(Collectors.toList()));
            model.addAttribute("listColor",list.stream().map(SanPhamChiTiet::getIdMauSac).distinct().collect(Collectors.toList()));
            model.addAttribute("price", null);
            model.addAttribute("quantity", null);
            model.addAttribute("displayProductInfo", false);
        }
        model.addAttribute("idHdc", idHdc);
        return "ban-hang/spct";
    }

    @PostMapping("/them-vao-gio")
    public String addToCart(@RequestParam(required = false) Long idSpct,
                            @RequestParam(required = false) Long soLuongMua,
                            @RequestParam(required = false) String idHdc,
                            HttpSession session, Model model,
                            @RequestHeader(value = HttpHeaders.REFERER, required = false) final String referrer) {
        String username = SecurityUtil.getUsernameLogin();
        if (username.equals("")) {
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Phiên đăng nhập đã hết hạn, vui lòng đăng nhập để tiếp tục !");
            return "redirect:/auth/dang-nhap";
        } else if (!SecurityUtil.checkIsAdmin(taiKhoanRepository)){
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Quyền truy cập không hợp lệ !");
            return "redirect:/auth/dang-nhap";
        }
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findById(idSpct).get();
        if (sanPhamChiTiet.getSoLuong() < soLuongMua) {
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Số lượng sản phẩm không đủ !");
            return "redirect:" + referrer;
        }
        banHangSevice.themVaoGio(idSpct, soLuongMua, session);
        try {


            if (!idHdc.trim().equals("")) {
                HoaDon hoaDon = hoaDonRepository.findById(Long.parseLong(idHdc)).get();
                HoaDonChiTiet hdct = hoaDonChiTietRepository.save(new HoaDonChiTiet()
                        .setIdHoaDon(hoaDon)
                        .setIdSanPhamChiTiet(sanPhamChiTiet)
                        .setSoLuong(soLuongMua)
                        .setDonGia(sanPhamChiTiet.getGiaBan())
                        .setNguoiTao(SecurityUtil.getUsernameLogin())
                        .setNgayTao(new Date())
                        .setTrangThai(1)
                        .setDaXoa(Boolean.FALSE));
                return "redirect:/ban-hang?idHdc=" + idHdc;
            }
            return "redirect:/ban-hang";
        }catch (Exception e){
            session.setAttribute("errorsss" , "Dang nhap de ban hang");
            return "redirect:/ban-hang";

        }
    }

    @GetMapping("san-pham-trong-gio/{idSpct}/xoa")
    public String deleteFromCart(@PathVariable Long idSpct,
                                 HttpSession session, Model model) {
        String username = SecurityUtil.getUsernameLogin();
        if (username.equals("")) {
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Phiên đăng nhập đã hết hạn, vui lòng đăng nhập để tiếp tục !");
            return "redirect:/auth/dang-nhap";
        } else if (!SecurityUtil.checkIsAdmin(taiKhoanRepository)){
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Quyền truy cập không hợp lệ !");
            return "redirect:/auth/dang-nhap";
        }
        banHangSevice.boKhoiGio(idSpct, session);
        return "redirect:/ban-hang";
    }

    @PostMapping("luu-hoa-don")
    public String saveInvoice(@RequestParam(name = "action") String action,
                              @RequestParam(name = "idHdc", required = false) String idHdc,
                              @RequestParam(name = "giamGia", required = false) String giamGia,
                              @RequestParam(name = "ghiChu" ,required = false) String ghiChu,
                              HttpSession session, Model model) {
        String username = SecurityUtil.getUsernameLogin();
        if (username.equals("")) {
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Phiên đăng nhập đã hết hạn, vui lòng đăng nhập để tiếp tục !");
            return "redirect:/auth/dang-nhap";
        } else if (!SecurityUtil.checkIsAdmin(taiKhoanRepository)){
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Quyền truy cập không hợp lệ !");
            return "redirect:/auth/dang-nhap";
        }
        try {
            banHangSevice.luuHoaDon(action, idHdc, giamGia, ghiChu, session);
            return "redirect:/ban-hang";
        }catch (Exception e){
            session.setAttribute("errorsss" , "Dang nhap de thanh toan");
        }
        return "redirect:/ban-hang";
    }

    @GetMapping("/xoa-hoa-don-cho/{idHdc}")
    public String xoaHoaDonCho(@PathVariable Long idHdc, Model model) {
        String username = SecurityUtil.getUsernameLogin();
        if (username.equals("")) {
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Phiên đăng nhập đã hết hạn, vui lòng đăng nhập để tiếp tục !");
            return "redirect:/auth/dang-nhap";
        } else if (!SecurityUtil.checkIsAdmin(taiKhoanRepository)){
            model.addAttribute("err", true);
            model.addAttribute("errMess", "Quyền truy cập không hợp lệ !");
            return "redirect:/auth/dang-nhap";
        }
        HoaDon hoaDon = hoaDonRepository.findById(idHdc).get();
        List<HoaDonChiTiet> list = hoaDonChiTietRepository.findByIdHoaDon(hoaDon);
        for (HoaDonChiTiet hdct : list) {
            SanPhamChiTiet sanPhamChiTiet = hdct.getIdSanPhamChiTiet();
            sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() + hdct.getSoLuong());
            hoaDonChiTietRepository.delete(hdct);
        }
        hoaDonRepository.delete(hoaDon);
        return "redirect:/ban-hang";
    }
}

package com.fpoly.poly121.controller;


import com.fpoly.poly121.dto.request.GioHangChiTietDto;
import com.fpoly.poly121.dto.request.HoaDonChiTietDto;
import com.fpoly.poly121.dto.request.TopSpDto;
import com.fpoly.poly121.model.*;
import com.fpoly.poly121.repository.*;
import com.fpoly.poly121.service.HoaDonChiTietService;
import com.fpoly.poly121.service.HoaDonService;
import com.fpoly.poly121.utils.SecurityUtil;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Transactional
@Controller
@RequestMapping("hoa-don")
public class HoaDonController {

    @Autowired
    private HoaDonService hoaDonService;
    private List<HoaDon> listHd;
    private List<HoaDon> listHd1;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private TaiKhoanRepository taiKhoanRepository;

    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;
    private List<HoaDonChiTiet> listHdct;

    @Autowired
    private HoaDonReponsitory hoaDonReponsitory;

    @Autowired
    private SanPhamChiTietReponsitory sanPhamChiTietReponsitory;

    @Autowired
    private LichSuDonHangRepository lichSuDonHangRepository;


    @GetMapping("hien-thi")
    public String getAll(@RequestParam(defaultValue = "0") Integer page, Model model) {
        Page<HoaDon> page1 = hoaDonService.getAll(page);
        listHd = page1.getContent();
        model.addAttribute("listHd", listHd);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        return "hoa_don/hien_thi";
    }

    @GetMapping("bo-loc-hd")
    public String boLochd( @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date dateBd, @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") @RequestParam(required = false) Date dateKt, Model model,
                          @RequestParam(required = false) String key ,
                          @RequestParam(required = false) Long loaiHoaDon  ,
                          @RequestParam(required = false) Long trangThai   ) {

        listHd = hoaDonReponsitory.boLocHd(key,loaiHoaDon,dateBd,dateKt,trangThai);
        model.addAttribute("listHd", listHd);
        model.addAttribute("key",key);
        model.addAttribute("loaiHoaDon",loaiHoaDon);
        model.addAttribute("dateBd",dateBd);
        model.addAttribute("dateKt",dateKt);
        model.addAttribute("trangThai",trangThai);
        return "hoa_don/hien_thi";

    }

    @GetMapping("searchHDCT")
    public String detail(@RequestParam(required = false) HoaDon idHD,@RequestParam(defaultValue = "0") Integer page, Model model) {
        listHdct = hoaDonChiTietService.searchidHD(idHD);
        model.addAttribute("listHdct", listHdct);

        HoaDon hoaDon = hoaDonService.detail(idHD.getId());
        model.addAttribute("hd", hoaDon);

        List<LichSuDonHang> listLshd = lichSuDonHangRepository.findLichSuDonHangByIdAndIdDonHang(idHD.getId());
        model.addAttribute("listLshd", listLshd);

        Page<HoaDon> page1 = hoaDonService.getAll(page);
        listHd = page1.getContent();
        model.addAttribute("listHd", listHd);

        listHd1 = hoaDonService.getAll1();
        model.addAttribute("listHd1", listHd1);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        return "hoa_don/hdct";

    }

    @GetMapping("thong-ke")
    public String thongKe(Model model) {
        //san pham da ban trang thai ht
        listHdct = hoaDonReponsitory.sanPhamDaBan();
        model.addAttribute("listHdct", listHdct);

        // doanh thu tt ht
        listHd1 = hoaDonReponsitory.doanhThuHt();
        model.addAttribute("listHd1", listHd1);

        // hoa don da ban ko tinh tt huy
        List<HoaDon> hoaDonDaBan = hoaDonReponsitory.hoaDonDaBan();
        model.addAttribute("hoaDonDaBan", hoaDonDaBan);


        // khach hang tinh khi dk va mua hang != 7
        Long countUniqueCustomersAll = hoaDonService.countUniqueCustomersAll();
        model.addAttribute("countUniqueCustomers", countUniqueCustomersAll);
        return "thong_ke/hien_thi";
    }

    @GetMapping("searchTK")
    public String searchTk(@RequestParam() @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date dateBd, @RequestParam() @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date dateKt, Model model) {

        //  doanh thu tt ht
        listHd1 = hoaDonReponsitory.doanhThuHtSearch(dateBd, dateKt);
        model.addAttribute("listHd1", listHd1);

        // hoa don da ban ko tinh tt huy
        List<HoaDon> hoaDonDaBan = hoaDonReponsitory.hoaDonDaBanSearch(dateBd,dateKt);
        model.addAttribute("hoaDonDaBan", hoaDonDaBan);

        // khach hang tinh khi dk va mua hang != 7
        Long countUniqueCustomers = hoaDonService.countUniqueCustomers(dateBd, dateKt);
        model.addAttribute("countUniqueCustomers", countUniqueCustomers);

        //san pham da ban trang thai ht
        listHdct = hoaDonReponsitory.sanPhamDaBanSearch(dateBd, dateKt);
        model.addAttribute("listHdct", listHdct);
        return "thong_ke/hien_thi";

    }

    @GetMapping("top10-kh")
    public String top10KH(Model model) {
        // khach hang mua hang thanh cong
        List<HoaDonChiTietDto> listTop10Kh = hoaDonChiTietService.getHoaDonChiTiet();
        model.addAttribute("listTop10Kh", listTop10Kh);
        return "thong_ke/top10";
    }

    @GetMapping("top10-sp")
    public String top10SP(Model model) {
        // san pham mua thanh cong
        List<TopSpDto> listTop10Sp = hoaDonChiTietService.getSoLuong();
        model.addAttribute("listTop10Sp", listTop10Sp);
        return "thong_ke/top10";
    }

    @GetMapping("trang-thai")
    public String trangThai(@RequestParam(required = false) Long trangThai,@RequestParam(required = false) Long loaiHoaDon , Model model){
       listHd =  hoaDonReponsitory.trangThaiHoaDon(loaiHoaDon,trangThai );
        model.addAttribute("loaiHoaDon",loaiHoaDon);
       model.addAttribute("listHd",listHd);
       model.addAttribute("trangThai" ,trangThai);
       return "hoa_don/hien_thi";
    }

    @GetMapping("loai-hoa-don")
    public String loaiHoaDonOnline(@RequestParam(required = false) Long trangThai,@RequestParam(required = false) Long loaiHoaDon , Model model){
        listHd =  hoaDonReponsitory.trangThaiHoaDon(loaiHoaDon,trangThai );
        model.addAttribute("loaiHoaDon",loaiHoaDon);
        model.addAttribute("listHd",listHd);
        model.addAttribute("trangThai" ,trangThai);
        return "hoa_don/hien_thi";
    }


    @PostMapping("trang-thai-don-hang")
    public String trangThaiHoaDon(@RequestParam(required = false) Long trangThai,
                                  @RequestParam(required = false) Long idHoaDon,
                                  @RequestParam(required = false) String moTa,
                                  Model model,
                                  @RequestParam(required = false) String trangThaiBack) {
        try {
            List<HoaDonChiTiet> listHdct = sanPhamChiTietReponsitory.findHdctByidHd(idHoaDon);
            model.addAttribute("listHdct", listHdct);

            HoaDon hoaDon = hoaDonService.detail(idHoaDon);
            Long trangThaiHd = hoaDon.getTrangThai();
            Long timeNgayCapNhat = hoaDon.getNgayCapNhat().getTime(); // tg cap nhat moi nhat
            model.addAttribute("timeNgayCapNhat",timeNgayCapNhat);
            Long timeHienTai = new Date().getTime();  // tg hien tai
            model.addAttribute("timeHienTai",timeHienTai);

            if (timeHienTai - timeNgayCapNhat >= 30L * 60 * 1000  && trangThaiHd == 6) {
                model.addAttribute("error", "Đơn hàng này không thể cập nhật ! ");

                List<LichSuDonHang> listLshd = lichSuDonHangRepository.findLichSuDonHangByIdAndIdDonHang(idHoaDon);
                model.addAttribute("listLshd", listLshd);

                HoaDon hoaDon1 = hoaDonReponsitory.getById(idHoaDon);
                model.addAttribute("hd", hoaDon1);

                return "hoa_don/hdct";
            }
                String tk = SecurityUtil.getUsernameLogin();
                if (!tk.isEmpty() && !moTa.isEmpty() && !moTa.isBlank() && !trangThai.equals(hoaDon.getTrangThai()) && trangThaiHd >= 1 && trangThaiHd <= 6) {
                    int moTaLength = moTa.length();

                    if (trangThai == 7 && moTaLength <= 100) {
                        model.addAttribute("error", "Mô tả phải nhập tối thiểu 100 kí tự ");

                        List<LichSuDonHang> listLshd = lichSuDonHangRepository.findLichSuDonHangByIdAndIdDonHang(idHoaDon);
                        model.addAttribute("listLshd", listLshd);

                        HoaDon hoaDon1 = hoaDonReponsitory.getById(idHoaDon);
                        model.addAttribute("hd", hoaDon1);

                        return "hoa_don/hdct";
                    }
                    if (trangThai > hoaDon.getTrangThai() && moTaLength <= 10) {
                        model.addAttribute("error", "Mô tả phải nhập tối thiểu 10 kí tự ");

                        List<LichSuDonHang> listLshd = lichSuDonHangRepository.findLichSuDonHangByIdAndIdDonHang(idHoaDon);
                        model.addAttribute("listLshd", listLshd);

                        HoaDon hoaDon1 = hoaDonReponsitory.getById(idHoaDon);
                        model.addAttribute("hd", hoaDon1);

                        return "hoa_don/hdct";
                    }
                    if (trangThai < hoaDon.getTrangThai() && moTaLength <= 50) {
                        model.addAttribute("error", "Mô tả phải nhập tối thiểu 50 kí tự ");

                        List<LichSuDonHang> listLshd = lichSuDonHangRepository.findLichSuDonHangByIdAndIdDonHang(idHoaDon);
                        model.addAttribute("listLshd", listLshd);

                        HoaDon hoaDon1 = hoaDonReponsitory.getById(idHoaDon);
                        model.addAttribute("hd", hoaDon1);

                        return "hoa_don/hdct";


                    } else {
                        KhachHang kh = khachHangRepository.findIdKhachHangByTaiKhoan(tk);

                        if (trangThai == 7 && trangThaiBack == null) {
                            // san pham trong gio hang
                            List<HoaDonChiTiet> listHdctt = sanPhamChiTietReponsitory.findHdctByidHd(idHoaDon);
                            for (HoaDonChiTiet hoaDonChiTiet : listHdctt) {
                                SanPhamChiTiet spct = hoaDonChiTiet.getIdSanPhamChiTiet();
                                spct.setSoLuong(spct.getSoLuong() + hoaDonChiTiet.getSoLuong());
                                sanPhamChiTietReponsitory.save(spct);
                            }
                            LichSuDonHang ls = new LichSuDonHang();
                            ls.setNguoiTao(kh.getHo() + " " + kh.getTenDem() + " " + kh.getTen());
                            ls.setNgayTao(new Date());
                            ls.setIdDonHang(idHoaDon);
                            ls.setTrangThaiDonHang(7L);
                            ls.setGhiChu(moTa);
                            lichSuDonHangRepository.save(ls);
                            hoaDon.setTrangThai(7L);
                            hoaDon.setNgayCapNhat(new Date());

                            model.addAttribute("error", "Đơn hàng đã được hủy thành công");

                            List<LichSuDonHang> listLshd = lichSuDonHangRepository.findLichSuDonHangByIdAndIdDonHang(idHoaDon);
                            model.addAttribute("listLshd", listLshd);

                            HoaDon hoaDon1 = hoaDonReponsitory.getById(idHoaDon);
                            model.addAttribute("hd", hoaDon1);

                            return "hoa_don/hdct";
                        }

                        if (trangThaiBack == null ) {
                            LichSuDonHang ls = new LichSuDonHang();
                            ls.setNguoiTao(kh.getHo() + " " + kh.getTenDem() + " " + kh.getTen());
                            ls.setNgayTao(new Date());
                            ls.setIdDonHang(idHoaDon);
                            ls.setTrangThaiDonHang(hoaDon.getTrangThai() + 1);
                            ls.setGhiChu(moTa);
                            lichSuDonHangRepository.save(ls);

                            hoaDon.setTrangThai(hoaDon.getTrangThai() + 1);
                            hoaDon.setNgayCapNhat(new Date());

                            model.addAttribute("pass", "Cập nhật đơn hàng thành công");
                        }
                        if (trangThaiBack != null && trangThaiHd > 1) {
                            LichSuDonHang ls = new LichSuDonHang();
                            ls.setNguoiTao(kh.getHo() + " " + kh.getTenDem() + " " + kh.getTen());
                            ls.setNgayTao(new Date());
                            ls.setIdDonHang(idHoaDon);
                            ls.setTrangThaiDonHang(hoaDon.getTrangThai() - 1);
                            ls.setGhiChu(moTa);
                            lichSuDonHangRepository.save(ls);

                            hoaDon.setTrangThai(hoaDon.getTrangThai() - 1);
                            hoaDon.setNgayCapNhat(new Date());

                            model.addAttribute("pass", "Cập nhật đơn hàng thành công");
                        }
                    }
                } else {
                    model.addAttribute("error", "Cập nhật đơn hàng không thành công");
                }

        } catch (Exception e) {
            model.addAttribute("error", "Cập nhật không thành công");

        }

        List<LichSuDonHang> listLshd = lichSuDonHangRepository.findLichSuDonHangByIdAndIdDonHang(idHoaDon);
        model.addAttribute("listLshd", listLshd);

        HoaDon hoaDon1 = hoaDonReponsitory.getById(idHoaDon);
        model.addAttribute("hd", hoaDon1);

        return "hoa_don/hdct";
    }

    @Transactional
    @PostMapping("trang-thai-don-hang-khach-hang")
    public String trangThaiHoaDonKhachHang( @RequestParam(required = false) Long idHoaDon,
                                            @RequestParam(required = false) String moTa,
                                            Model model) {
        SecurityAttributesUtil.setSecurityAttributes(model, taiKhoanRepository, khachHangRepository);

            try {
                if (moTa.isEmpty() || moTa.isBlank()) {
                    model.addAttribute("error", "Không để trống lý do ");

                } if (!moTa.isEmpty() && !moTa.isBlank()){
                    Long trangThaiHd = hoaDonReponsitory.findTrangThaibyIdHd(idHoaDon);
                    if (trangThaiHd == 1 || trangThaiHd == 2 || trangThaiHd == 3) {

                        List<HoaDonChiTiet> listHdct = sanPhamChiTietReponsitory.findHdctByidHd(idHoaDon);
                        for (HoaDonChiTiet hoaDonChiTiet : listHdct) {
                            SanPhamChiTiet spct = hoaDonChiTiet.getIdSanPhamChiTiet();
                            spct.setSoLuong(spct.getSoLuong() + hoaDonChiTiet.getSoLuong());
                            sanPhamChiTietReponsitory.save(spct);
                        }

                        hoaDonReponsitory.updateTrangThai(7L, idHoaDon);
                        hoaDonReponsitory.updateNgay(new Date(), idHoaDon);

                        LichSuDonHang ls = new LichSuDonHang();
                        ls.setNgayTao(new Date());
                        ls.setNguoiTao("Khách hàng");
                        ls.setIdDonHang(idHoaDon);
                        ls.setTrangThaiDonHang(7L);
                        ls.setGhiChu(moTa);
                        lichSuDonHangRepository.save(ls);
                    }

                    model.addAttribute("error", "Đơn hàng đã được hủy");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            HoaDon hoaDon = hoaDonService.detail(idHoaDon);
            model.addAttribute("hd", hoaDon);

            List<LichSuDonHang> listLshd = lichSuDonHangRepository.findLichSuDonHangByIdAndIdDonHang(idHoaDon);
            model.addAttribute("listLshd", listLshd);

            List<HoaDonChiTiet> listHdctSp = sanPhamChiTietReponsitory.findHdctByidHd(idHoaDon);
            model.addAttribute("listHdct", listHdctSp);

             return "hoa_don/hoa_don_chi_tiet_nguoi_dung";

    }

}

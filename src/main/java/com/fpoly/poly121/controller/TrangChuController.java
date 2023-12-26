package com.fpoly.poly121.controller;

import com.fpoly.poly121.dto.SanPhamValue;
import com.fpoly.poly121.dto.request.GioHangChiTietDto;
import com.fpoly.poly121.dto.request.TopSpDto;
import com.fpoly.poly121.model.*;
import com.fpoly.poly121.repository.*;
import com.fpoly.poly121.security.dto.TaiKhoan;
import com.fpoly.poly121.service.*;
import com.fpoly.poly121.service.impl.KhachHangServiceImpl;
import com.fpoly.poly121.utils.SecurityUtil;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/trang-chu")
public class TrangChuController {


    @Autowired
    private TaiKhoanRepository taiKhoanRepository;

    @Autowired
    private TrangChuService trangChuService;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired GioHangRepository gioHangRepository;

    @Autowired
    private GioHangChiTietService gioHangChiTietService;

    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;


    @Autowired
    private HoaDonReponsitory hoaDonReponsitory;

    @Autowired
    private HoaDonService hoaDonService;

    @Autowired
    private KhachHangServiceImpl khachHangService;

    @Autowired
    private SanPhamReponsitory sanPhamReponsitory;

    @Autowired
    private SanPhamChiTietReponsitory sanPhamChiTietReponsitory;

    @Autowired
    private KichThuocRepository kichThuocRepository;

    @Autowired
    private MauSacReponsitory mauSacReponsitory;

    @Autowired
    private SanPhamChiTietReponsitory sanPhamChiTietRepository;

    @Autowired
    private KhuyenMaiRepository khuyenMaiRepository;


    @GetMapping
    public String view(Model model) {
        List<SanPhamValue> listSpAoNam = sanPhamReponsitory.getAoNamMoi();
        List<SanPhamValue> listSpQuanNam = sanPhamReponsitory.getQuanNamMoi();
        List<SanPhamValue> listSpAoNu = sanPhamReponsitory.getAoNuMoi();
        List<SanPhamValue> listSpQuanNu = sanPhamReponsitory.getQuanNuMoi();
        List<Long> listIdKM = new ArrayList<>();
        List<SanPhamValue> listSP = new ArrayList<>();
        listSP.addAll(listSpAoNam);
        listSP.addAll(listSpQuanNam);
        listSP.addAll(listSpAoNu);
        listSP.addAll(listSpQuanNu);
        for (SanPhamValue spv : listSP) {
            if (!Objects.isNull(spv.getIdKhuyenMai())) listIdKM.add(spv.getIdKhuyenMai());
        }
        List<KhuyenMai> listKM = khuyenMaiRepository.findByIdIn(listIdKM);
        Map<Long, KhuyenMai> mapIdSpKm = new HashMap<>();
        for (SanPhamValue spv : listSP) {
            if (Objects.isNull(spv.getIdKhuyenMai())) continue;
            for (KhuyenMai km : listKM) {
                if (km.getId().equals(spv.getIdKhuyenMai())) mapIdSpKm.put(spv.getIdSp(), km);
            }
        }
        model.addAttribute("isAdmin", SecurityUtil.checkIsAdmin(taiKhoanRepository));
        model.addAttribute("isStaff", SecurityUtil.checkIsStaff(taiKhoanRepository));
        model.addAttribute("isUser", SecurityUtil.checkIsUser(taiKhoanRepository));
        model.addAttribute("isAuth", SecurityUtil.checkIsAuth(taiKhoanRepository));
        model.addAttribute("listSpAoNam", listSpAoNam);
        model.addAttribute("listSpQuanNam", listSpQuanNam);
        model.addAttribute("listSpAoNu", listSpAoNu);
        model.addAttribute("listSpQuanNu", listSpQuanNu);
        model.addAttribute("mapIdSpKm", mapIdSpKm);
        model.addAttribute("username", SecurityUtil.getUsernameLogin());
        model.addAttribute("idKh", SecurityUtil.getIdKhachHangLogin(khachHangRepository, taiKhoanRepository));

        Date newDate = new Date();
        model.addAttribute("newDate" , newDate);

        String tk = SecurityUtil.getUsernameLogin();
        if (tk.isEmpty()) {
            try {
                // Lấy đối tượng InetAddress đại diện cho máy tính hiện tại
                InetAddress localhost = InetAddress.getLocalHost();
                // Lấy địa chỉ IP của máy tính
                String ipAddress = localhost.getHostAddress();

                List<GioHangChiTietDto> listGhctDto = gioHangChiTietService.getGioHangChiTiet(ipAddress);
                model.addAttribute("listGhct", listGhctDto);

            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
        } else {

            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String username = authentication.getName();
            List<GioHangChiTietDto> listGhctDto = gioHangChiTietService.getGioHangChiTiet(username);
            model.addAttribute("listGhct", listGhctDto);

        }
        return "trang-chu";
    }

    @GetMapping("all-san-pham")
    public String viewAll(Model model) {
        model.addAttribute("isAdmin", SecurityUtil.checkIsAdmin(taiKhoanRepository));
        model.addAttribute("isStaff", SecurityUtil.checkIsStaff(taiKhoanRepository));
        model.addAttribute("isUser", SecurityUtil.checkIsUser(taiKhoanRepository));
        model.addAttribute("isAuth", SecurityUtil.checkIsAuth(taiKhoanRepository));
        model.addAttribute("username", SecurityUtil.getUsernameLogin());
        model.addAttribute("idKh", SecurityUtil.getIdKhachHangLogin(khachHangRepository, taiKhoanRepository));

        List<SanPhamChiTiet> listAllSp = trangChuService.getAll();
        model.addAttribute("listAllSp", listAllSp);

        String tk = SecurityUtil.getUsernameLogin();
        if (tk.isEmpty()) {
            try {
                // Lấy đối tượng InetAddress đại diện cho máy tính hiện tại
                InetAddress localhost = InetAddress.getLocalHost();
                // Lấy địa chỉ IP của máy tính
                String ipAddress = localhost.getHostAddress();

                List<GioHangChiTietDto> listGhctDto = gioHangChiTietService.getGioHangChiTiet(ipAddress);
                model.addAttribute("listGhct", listGhctDto);

            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
        } else {

            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String username = authentication.getName();
            List<GioHangChiTietDto> listGhctDto = gioHangChiTietService.getGioHangChiTiet(username);
            model.addAttribute("listGhct", listGhctDto);

        }

        return "page_trang_chu/allSanPham";
    }

    @GetMapping("chi-tiet")
    public String detailCt(Model model, @RequestParam (name = "idSanPham" ,required = false) Long idSanPham ,@RequestParam (name = "idKichThuoc",required = false) Long idKichThuoc ,
                         @RequestParam (name = "idMauSac" ,required = false) Long idMauSac ) {
        model.addAttribute("isAdmin", SecurityUtil.checkIsAdmin(taiKhoanRepository));
        model.addAttribute("isStaff", SecurityUtil.checkIsStaff(taiKhoanRepository));
        model.addAttribute("isUser", SecurityUtil.checkIsUser(taiKhoanRepository));
        model.addAttribute("isAuth", SecurityUtil.checkIsAuth(taiKhoanRepository));
        model.addAttribute("username", SecurityUtil.getUsernameLogin());
        model.addAttribute("idKh", SecurityUtil.getIdKhachHangLogin(khachHangRepository, taiKhoanRepository));

        Date newDate = new Date();
        model.addAttribute("newDate" , newDate);

        SanPhamChiTiet spct = sanPhamChiTietRepository.findRandomSanPhamChiTietByIdSanPhamAndIdKichThuocAndIdMauSac(idSanPham ,idMauSac,idKichThuoc);
        if(spct != null){
            model.addAttribute("spct", spct);
            Long idSanPham2  = spct.getIdSanPham().getId();

            List<MauSac> listms = mauSacReponsitory.findMauSacBySanPhamAndKichThuoc(idSanPham2,idKichThuoc) ;
            model.addAttribute("listms" ,listms);

            List<KichThuoc> listkt = kichThuocRepository.findKichThuocBySanPhamAnhMauSac(idSanPham2,idMauSac);
            model.addAttribute("listkt" ,listkt);

            String tk = SecurityUtil.getUsernameLogin();
            if (tk.isEmpty()){
                try {
                    InetAddress localhost = InetAddress.getLocalHost();
                    // Lấy địa chỉ IP của máy tính
                    String ipAddress = localhost.getHostAddress();

                    TaiKhoan taiKhoan = new TaiKhoan();
                    taiKhoan.setTenTaiKhoan(ipAddress);
                    taiKhoanRepository.save(taiKhoan);

                    KhachHang tenTk = khachHangRepository.findTenTaiKhoanByTk(ipAddress);
                    if (tenTk == null) {
                        KhachHang khachHang = new KhachHang();
                        khachHang.setTenTaiKhoan(taiKhoan.setTenTaiKhoan(ipAddress));
                        khachHangRepository.save(khachHang);

                        GioHang gioHang = new GioHang();
                        gioHang.setIdKhachHang(khachHang);
                        gioHangRepository.save(gioHang);
                    }

                    String idGioHang = gioHangChiTietService.detailTkGh(ipAddress);
                    model.addAttribute("idGioHang", idGioHang);

                    List<GioHangChiTietDto> listGhctDto = gioHangChiTietService.getGioHangChiTiet(ipAddress);
                    model.addAttribute("listGhct", listGhctDto);

                }catch (Exception e){
                    e.printStackTrace();
                }
            }else {


                Long idGioHang2 = gioHangRepository.findIdGioHangByTaiKhoan(tk);
                KhachHang idKhachHang = khachHangRepository.findIdKhachHangByTaiKhoan(tk);

                if (idGioHang2 != null) {
                    model.addAttribute("San pham da co");
                } else {
                    GioHang gioHang = new GioHang();
                    gioHang.setIdKhachHang(idKhachHang);
                    gioHangRepository.save(gioHang);
                }

                String idGioHang = gioHangChiTietService.detailTkGh(tk);
                model.addAttribute("idGioHang", idGioHang);

                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String username = authentication.getName();
                // Gọi service để lấy danh sách chi tiết giỏ hàng
                List<GioHangChiTietDto> listGhctDto = gioHangChiTietService.getGioHangChiTiet(username);
                model.addAttribute("listGhct", listGhctDto);
            }
            return "san_pham_chi_tiet/thongTinSp";


        }else {
           return "redirect:/trang-chu";
        }

    }
    @GetMapping("chi-tiet/{id}")
    public String detail(ModelMap model, @PathVariable Long id ) {
        model.addAttribute("isAdmin", SecurityUtil.checkIsAdmin(taiKhoanRepository));
        model.addAttribute("isStaff", SecurityUtil.checkIsStaff(taiKhoanRepository));
        model.addAttribute("isUser", SecurityUtil.checkIsUser(taiKhoanRepository));
        model.addAttribute("isAuth", SecurityUtil.checkIsAuth(taiKhoanRepository));
        model.addAttribute("username", SecurityUtil.getUsernameLogin());
        model.addAttribute("idKh", SecurityUtil.getIdKhachHangLogin(khachHangRepository, taiKhoanRepository));


        Date newDate = new Date();
        model.addAttribute("newDate" , newDate);

        SanPhamChiTiet spct = trangChuService.detail(id);
        model.addAttribute("spct", spct);

        Long idSanPham  = spct.getIdSanPham().getId();
        Long idKichThuoc = spct.getIdKichThuoc().getId();
        Long idMauSac = spct.getIdMauSac().getId();

        List<MauSac> listms = mauSacReponsitory.findMauSacBySanPhamAndKichThuoc(idSanPham,idKichThuoc) ;
        model.addAttribute("listms" ,listms);

        List<KichThuoc> listkt = kichThuocRepository.findKichThuocBySanPhamAnhMauSac(idSanPham,idMauSac);
        model.addAttribute("listkt" ,listkt);


        String tk = SecurityUtil.getUsernameLogin();
        if (tk.isEmpty()) {
            try {
                // Lấy đối tượng InetAddress đại diện cho máy tính hiện tại
                InetAddress localhost = InetAddress.getLocalHost();
                // Lấy địa chỉ IP của máy tính
                String ipAddress = localhost.getHostAddress();

                TaiKhoan taiKhoan = new TaiKhoan();
                taiKhoan.setTenTaiKhoan(ipAddress);
                taiKhoanRepository.save(taiKhoan);

                KhachHang tenTk = khachHangRepository.findTenTaiKhoanByTk(ipAddress);
                if (tenTk == null) {
                    KhachHang khachHang = new KhachHang();
                    khachHang.setTenTaiKhoan(taiKhoan.setTenTaiKhoan(ipAddress));
                    khachHangRepository.save(khachHang);

                    GioHang gioHang = new GioHang();
                    gioHang.setIdKhachHang(khachHang);
                    gioHangRepository.save(gioHang);
                }

                String idGioHang = gioHangChiTietService.detailTkGh(ipAddress);
                model.addAttribute("idGioHang", idGioHang);

                List<GioHangChiTietDto> listGhctDto = gioHangChiTietService.getGioHangChiTiet(ipAddress);
                model.addAttribute("listGhct", listGhctDto);

            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
        } else {

            Long idGioHang2 = gioHangRepository.findIdGioHangByTaiKhoan(tk);
            KhachHang idKhachHang = khachHangRepository.findIdKhachHangByTaiKhoan(tk);

            if (idGioHang2 != null) {
                model.addAttribute("San pham da co");
            } else {
                GioHang gioHang = new GioHang();
                gioHang.setIdKhachHang(idKhachHang);
                gioHangRepository.save(gioHang);
            }


            String idGioHang = gioHangChiTietService.detailTkGh(tk);
            model.addAttribute("idGioHang", idGioHang);

            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String username = authentication.getName();
            // Gọi service để lấy danh sách chi tiết giỏ hàng
            List<GioHangChiTietDto> listGhctDto = gioHangChiTietService.getGioHangChiTiet(username);
            model.addAttribute("listGhct", listGhctDto);


        }
        return "san_pham_chi_tiet/thongTinSp";
    }



    @GetMapping("hoa-don")
    private String hoaDon(Model model) {
        model.addAttribute("isAdmin", SecurityUtil.checkIsAdmin(taiKhoanRepository));
        model.addAttribute("isStaff", SecurityUtil.checkIsStaff(taiKhoanRepository));
        model.addAttribute("isUser", SecurityUtil.checkIsUser(taiKhoanRepository));
        model.addAttribute("isAuth", SecurityUtil.checkIsAuth(taiKhoanRepository));
        model.addAttribute("username", SecurityUtil.getUsernameLogin());
        model.addAttribute("idKh", SecurityUtil.getIdKhachHangLogin(khachHangRepository, taiKhoanRepository));
        String tk = SecurityUtil.getUsernameLogin();
        List<HoaDon> listHdtk = hoaDonService.findHoaDonByTaiKhoan(tk);
        model.addAttribute("listHdtk", listHdtk);
        return "hoa_don/hoa_don_nguoi_dung";

    }

    @GetMapping("hoa-don-chi-tiet")
    private String hoaDonChiTiet(@RequestParam() HoaDon idHD, Model model) {
        model.addAttribute("isAdmin", SecurityUtil.checkIsAdmin(taiKhoanRepository));
        model.addAttribute("isStaff", SecurityUtil.checkIsStaff(taiKhoanRepository));
        model.addAttribute("isUser", SecurityUtil.checkIsUser(taiKhoanRepository));
        model.addAttribute("isAuth", SecurityUtil.checkIsAuth(taiKhoanRepository));
        model.addAttribute("username", SecurityUtil.getUsernameLogin());
        model.addAttribute("idKh", SecurityUtil.getIdKhachHangLogin(khachHangRepository, taiKhoanRepository));

        List<HoaDonChiTiet> listHdct = hoaDonChiTietService.searchidHD(idHD);
        model.addAttribute("listHdct", listHdct);
        HoaDon hoaDon = hoaDonService.detail(idHD.getId());
        model.addAttribute("hd", hoaDon);
        return "hoa_don/hoa_don_chi_tiet_nguoi_dung";

    }

    @PostMapping("update-nguoi-dung")
    public String update(@ModelAttribute KhachHang khachHang, @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngaySinh, Model model) {

        String tk = SecurityUtil.getUsernameLogin();

        khachHang.setNgaySinh(ngaySinh);

        TaiKhoan tk2 = taiKhoanRepository.findTaiKhoanByTenTaiKhoan(tk);
        khachHang.setTenTaiKhoan(tk2);

        Long tk3 = khachHangRepository.findIdKhachHangByTenTaiKhoan(tk);
        khachHang.setId(tk3);

        Integer tt = khachHangRepository.findTrangThaiKhachHangByTenTaiKhoan(tk);
        khachHang.setTrangThai(tt);

        khachHangService.update(khachHang);
        return "redirect:/trang-chu/detail-nguoi-dung";
    }


    @GetMapping("detail-nguoi-dung")
    public String detail(Model model) {
        model.addAttribute("isAdmin", SecurityUtil.checkIsAdmin(taiKhoanRepository));
        model.addAttribute("isStaff", SecurityUtil.checkIsStaff(taiKhoanRepository));
        model.addAttribute("isUser", SecurityUtil.checkIsUser(taiKhoanRepository));
        model.addAttribute("isAuth", SecurityUtil.checkIsAuth(taiKhoanRepository));
        model.addAttribute("username", SecurityUtil.getUsernameLogin());
        model.addAttribute("idKh", SecurityUtil.getIdKhachHangLogin(khachHangRepository, taiKhoanRepository));

        String tk = SecurityUtil.getUsernameLogin();
        if (tk.isEmpty()) {
            return "redirect:/trang-chu";
        }
        Long tk2 = khachHangRepository.findIdKhachHangByTenTaiKhoan(tk);
        KhachHang kh = khachHangService.detail(tk2);
        model.addAttribute("kh", kh);
        return "khach_hang/update";
    }



}
package com.fpoly.poly121.controller;


import com.fpoly.poly121.dto.request.GioHangChiTietDto;
import com.fpoly.poly121.dto.response.HuyenResponse;
import com.fpoly.poly121.dto.response.TinhResponse;
import com.fpoly.poly121.dto.response.XaResponse;
import com.fpoly.poly121.model.*;
import com.fpoly.poly121.repository.*;
import com.fpoly.poly121.security.dto.TaiKhoan;
import com.fpoly.poly121.service.GHNService;
import com.fpoly.poly121.service.GioHangChiTietService;
import com.fpoly.poly121.service.SanPhamChiTietService;
import com.fpoly.poly121.service.impl.SanPhamChiTietServiceImpl;
import com.fpoly.poly121.utils.SecurityUtil;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;


import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.*;
import java.util.stream.Collectors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("gio-hang")
public class GioHangChiTietController {

    @Autowired
    private GioHangChiTietService gioHangChiTietService;


    @Autowired
    private SanPhamChiTietReponsitory sanPhamChiTietReponsitory;

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    private HoaDonReponsitory hoaDonReponsitory;

    @Autowired
    private HoaDonChiTietReponsitory hoaDonChiTietReponsitory;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private TaiKhoanRepository taiKhoanRepository;

    @Autowired
    private GioHangRepository gioHangRepository;
  
    @Autowired
    private  LichSuDonHangRepository lichSuDonHangRepository;

    @Autowired
    private SanPhamChiTietReponsitory sanPhamChiTietReponsitory;

    @Autowired
    private GHNService ghnService;


    public static class SecurityAttributesUtil {

        public static void setSecurityAttributes(Model model, TaiKhoanRepository taiKhoanRepository, KhachHangRepository khachHangRepository) {
            model.addAttribute("isAdmin", SecurityUtil.checkIsAdmin(taiKhoanRepository));
            model.addAttribute("isStaff", SecurityUtil.checkIsStaff(taiKhoanRepository));
            model.addAttribute("isUser", SecurityUtil.checkIsUser(taiKhoanRepository));
            model.addAttribute("isAuth", SecurityUtil.checkIsAuth(taiKhoanRepository));
            model.addAttribute("username", SecurityUtil.getUsernameLogin());
            model.addAttribute("idKh", SecurityUtil.getIdKhachHangLogin(khachHangRepository, taiKhoanRepository));
            Date newDate = new Date();
            model.addAttribute("newDate", newDate);
        }
    }

    public static class IPUtil {

        public static List<GioHangChiTietDto> getShoppingCartDetails(GioHangChiTietService gioHangChiTietService) {
            try {
                // Lấy đối tượng InetAddress đại diện cho máy tính hiện tại
                InetAddress localhost = InetAddress.getLocalHost();
                // Lấy địa chỉ IP của máy tính
                String ipAddress = localhost.getHostAddress();

                // Gọi service để lấy danh sách chi tiết giỏ hàng
                return gioHangChiTietService.getGioHangChiTiet(ipAddress);

            } catch (UnknownHostException e) {
                e.printStackTrace();
                // Handle exception or log the error
                return Collections.emptyList(); // Return an empty list in case of an exception
            }
        }
    }


    @GetMapping("hien-thi")
    public String getAll(Model model) {
        // lay thong tin tk
        SecurityAttributesUtil.setSecurityAttributes(model, taiKhoanRepository, khachHangRepository);

        String tk1 = SecurityUtil.getUsernameLogin();

        List<GioHangChiTietDto> listGhctDtoLay = null;

        if (tk1.isEmpty()) {
            List<GioHangChiTietDto> listGhctDto = IPUtil.getShoppingCartDetails(gioHangChiTietService);
            model.addAttribute("listGhct", listGhctDto);
            listGhctDtoLay = listGhctDto;
        } else {
            // lay ten tk
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String username = authentication.getName();

            List<GioHangChiTietDto> listGhctDto = gioHangChiTietService.getGioHangChiTiet(username);
            model.addAttribute("listGhct", listGhctDto);
            listGhctDtoLay = listGhctDto;
            }

        for (GioHangChiTietDto gioHangChiTietDto : listGhctDtoLay) {
            SanPhamChiTiet spct = gioHangChiTietDto.getIdSanPhamChiTiet();
            String tenSp = gioHangChiTietDto.getIdSanPhamChiTiet().getIdSanPham().getTenSanPham();
            Long soLuongSpCon = gioHangChiTietDto.getIdSanPhamChiTiet().getSoLuong();
            Long soLuongSpGioHang = gioHangChiTietDto.getSoLuong();
            String sanPham = gioHangChiTietDto.getIdSanPhamChiTiet().getIdSanPham().getTenSanPham();
            String mauSac = spct.getIdMauSac().getTenMauSac();
            String kichThuoc = spct.getIdKichThuoc().getTenKichThuoc();
            Long trangThai = spct.getTrangThai();

            if (soLuongSpCon < soLuongSpGioHang && soLuongSpCon > 0) {
                model.addAttribute("errors", "Số lượng sản phẩm ( " + tenSp + " ) chỉ còn " + soLuongSpCon);
            }
            if (soLuongSpCon < 1) {
                model.addAttribute("errors", "Số lượng sản phẩm ( " + tenSp + " ) đã bán hết ! ");
            }
            if (trangThai != 0L){
                model.addAttribute("errors", "Sản phẩm ( " + sanPham + " [ " + mauSac + " - " + kichThuoc + " ] " + " ) đã ngừng kinh doanh !");
            }
        }

        return "gio_hang/hien_thi";

    }

    @PostMapping("add")
    public ResponseEntity<String> add(@Valid @ModelAttribute GioHangChiTiet gioHangChiTiet, BindingResult bindingResult, Model model, @RequestParam(required = false) Long idGioHang, @RequestParam(required = false) Long idSanPhamChiTiet) {

        try {
            if (bindingResult.hasErrors()) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Lỗi khi thêm vào giỏ hàng");
            } else {
                String tk = SecurityUtil.getUsernameLogin();
                if (tk.isEmpty()) {
                    try {
                        // Lấy đối tượng InetAddress đại diện cho máy tính hiện tại

                        InetAddress localhost = InetAddress.getLocalHost();

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

                        } else {

                            GioHangChiTiet ghct = gioHangChiTietService.findAllByIdGioHangAndIdSanPhamChiTiet(idGioHang, idSanPhamChiTiet);
                            if (ghct == null) {
                                // so luong them
                                Long soLuongThem = gioHangChiTiet.getSoLuong();

                                // so luong san pham
                                Long soLuongSanPham = gioHangChiTietRepository.soLuongSpCon(idSanPhamChiTiet);

                                if (soLuongThem > soLuongSanPham) {
                                    return ResponseEntity.ok("Sản phẩm thêm trong giỏ hàng không vượt quá số lượng tồn kho !");
                                }
                                if (soLuongThem > 0 && soLuongThem <= soLuongSanPham) {
                                    gioHangChiTietService.add(gioHangChiTiet);
                                    return ResponseEntity.ok("Thêm sản phẩm vào giỏ hàng thành công ✓");
                                }

                            } else {
                                // lay so luong sp con
                                Long soLuongSanPham = gioHangChiTietRepository.soLuongSp(idGioHang, idSanPhamChiTiet);
                                // Lay so luong sp trong gio hang
                                Long soLuongGioHang = gioHangChiTietRepository.soLuongGh(idGioHang, idSanPhamChiTiet);
                                //so luong trong gio hang + so luong them
                                Long soLuongMoi = soLuongGioHang + gioHangChiTiet.getSoLuong();

                                if (soLuongMoi <= 0) {
                                    return ResponseEntity.ok("Số lượng tối đa là 1");
                                }
                                if (soLuongMoi > soLuongSanPham) {
                                    return ResponseEntity.ok("Sản phẩm thêm trong giỏ hàng không vượt quá số lượng tồn kho !");
                                }
                                if (soLuongMoi > 0 && soLuongMoi <= soLuongSanPham) {
                                    ghct.setSoLuong(soLuongMoi);
                                    gioHangChiTietService.update(ghct); // Cập nhật số lượng mới
                                    return ResponseEntity.ok("Thêm sản phẩm vào giỏ hàng thành công ✓");
                                }
                            }
                        }

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

                    GioHangChiTiet ghct = gioHangChiTietService.findAllByIdGioHangAndIdSanPhamChiTiet(idGioHang, idSanPhamChiTiet);
                    if (ghct == null) {
                        // so luong them
                        Long soLuongThem = gioHangChiTiet.getSoLuong();

                        // so luong san pham
                        Long soLuongSanPham = gioHangChiTietRepository.soLuongSpCon(idSanPhamChiTiet);

                        if (soLuongThem > soLuongSanPham) {
                            return ResponseEntity.ok("Sản phẩm thêm trong giỏ hàng không vượt quá số lượng tồn kho !");
                        }
                        if (soLuongThem > 0 && soLuongThem <= soLuongSanPham) {
                            gioHangChiTietService.add(gioHangChiTiet);
                            return ResponseEntity.ok("Thêm sản phẩm vào giỏ hàng thành công ✓");
                        }

                    } else { // Nếu sản phẩm đã có trong giỏ hàng, cộng thêm số

                        // Lay so luong sp trong gio hang
                        Long soLuongGioHang = gioHangChiTietRepository.soLuongGh(idGioHang, idSanPhamChiTiet);
                        // lay so luong sp con
                        Long soLuongSanPham = gioHangChiTietRepository.soLuongSp(idGioHang, idSanPhamChiTiet);
                        //so luong trong gio hang + so luong them
                        Long soLuongMoi = soLuongGioHang + gioHangChiTiet.getSoLuong();

                        if (soLuongMoi <= 0) {
                            model.addAttribute("errors", "Số lượng tối đa là 1");
                            return ResponseEntity.ok("Số lượng tối đa là 1");

                        }
                        if (soLuongMoi > soLuongSanPham) {
                            return ResponseEntity.ok("Sản phẩm thêm trong giỏ hàng không vượt quá số lượng tồn kho !");
                        }
                        if (soLuongMoi > 0 && soLuongMoi <= soLuongSanPham) {
                            ghct.setSoLuong(soLuongMoi);
                            gioHangChiTietService.update(ghct); // Cập nhật số lượng mới
                            return ResponseEntity.ok("Thêm sản phẩm vào giỏ hàng thành công");
                        }
                    }
                }

            }
            return ResponseEntity.ok("");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errors", e.getMessage());
            return ResponseEntity.ok(e.getMessage());
        }
    }

    @PostMapping("update-so-luong")
    public String updateSoLuong(@ModelAttribute("gioHangChiTiet") GioHangChiTiet gioHangChiTiet,
                                @RequestParam(required = false) Long idGioHang, @RequestParam(required = false) Long idSpct, @RequestParam(required = false) String soLuongThem, Model model) {

        try {
            SecurityAttributesUtil.setSecurityAttributes(model, taiKhoanRepository, khachHangRepository);

            String tk1 = SecurityUtil.getUsernameLogin();

            if (tk1.isEmpty()) {

                List<GioHangChiTietDto> listGhctDto = IPUtil.getShoppingCartDetails(gioHangChiTietService);
                model.addAttribute("listGhct", listGhctDto);

            } else {
                // khi dang nhap
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String username = authentication.getName();

                // Gọi service để lấy danh sách chi tiết giỏ hàng
                List<GioHangChiTietDto> listGhctDto = gioHangChiTietService.getGioHangChiTiet(username);
                model.addAttribute("listGhct", listGhctDto);
            }
            try {
                // Cố gắng chuyển đổi giá trị soLuong sang Long
                long soLuong = Long.parseLong(soLuongThem);

                // so luong spct trong gh
                Long soLuongSanPham = gioHangChiTietRepository.soLuongSp(idGioHang, idSpct);
                // ten sp trong gh
                String tenSp = gioHangChiTietRepository.tenSp(idSpct, idGioHang);
                if (soLuong <= soLuongSanPham && soLuong >= 1) {
                    gioHangChiTietRepository.updateWithQuery(soLuong, idGioHang, idSpct);
                    return "redirect:/gio-hang/hien-thi";
                }
                if (soLuong > soLuongSanPham) {
                    model.addAttribute("errors", " Số lượng sản phẩm ( " + tenSp + " )  trong kho còn là " + soLuongSanPham);
                }
                if (soLuong < 2) {
                    model.addAttribute("errors", " Số lượng sản phẩm tối thiểu là 1 ");
                }
            } catch (NumberFormatException e) {
                // Nếu có lỗi chuyển đổi kiểu, thêm thông báo lỗi vào model

                model.addAttribute("errors", "Dữ liệu không phù hợp !");
            }

            return "gio_hang/hien_thi";
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("errors" , e.getMessage());
            return "gio_hang/hien_thi";
        }
    }

    @GetMapping("delete/{idSpct}")
    public String delete(@PathVariable SanPhamChiTiet idSpct) {
        gioHangChiTietService.delete(idSpct);
        return "redirect:/gio-hang/hien-thi";
    }

    @Transactional
    @PostMapping("thanh-toan")
    public String buy(Model model, @RequestParam(required = false) String tinh,
                      @RequestParam(required = false) String huyen,
                      @RequestParam(required = false) String phuong,
                      @RequestParam(required = false) String diaChiNhan, @RequestParam(required = false) String sdtNguoiNhan,
                      @RequestParam(required = false) String hoNguoiNhan, @RequestParam(required = false) String tenNguoiNhan) {

        try {
            SecurityAttributesUtil.setSecurityAttributes(model, taiKhoanRepository, khachHangRepository);
            model.addAttribute("hoNguoiNhan", hoNguoiNhan);
            model.addAttribute("tenNguoiNhan", tenNguoiNhan);
            model.addAttribute("sdtNguoiNhan", sdtNguoiNhan);
            model.addAttribute("diaChiNhan", diaChiNhan);
            List<GioHangChiTietDto> listGhctDto = null;


            // lay tk khi dang nhap
            String tk = SecurityUtil.getUsernameLogin();

            if (tk.isEmpty()) { // tk khi ko dang nhap
                try {
                    // Lấy đối tượng InetAddress đại diện cho máy tính hiện tại
                    InetAddress localhost = InetAddress.getLocalHost();
                    // Lấy địa chỉ IP của máy tính
                    String ipAddress = localhost.getHostAddress();
                    // lay danh sach gio hang bang IP
                    listGhctDto = gioHangChiTietService.getGioHangChiTiet(ipAddress);

                    // check gio hang de trong
                    if (listGhctDto.isEmpty()) {
                        model.addAttribute("errors", "Giỏ hàng không để trống !");
                        return "gio_hang/hien_thi";
                    }

                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
            } else { // tk khi dang nhap
                // Gọi service để lấy danh sách chi tiết giỏ hàng
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String username = authentication.getName();

                // Lấy danh sách giỏ hàng chi tiết của người dùng
                listGhctDto = gioHangChiTietService.getGioHangChiTiet(username);
                model.addAttribute("listGhct", listGhctDto);

                // check gio hang de trong
                if (listGhctDto.isEmpty()) {
                    model.addAttribute("errors", "Giỏ hàng không để trống !");
                    return "gio_hang/hien_thi";
                }
            }

            // xy ly tao hoa don moi khi nguoi dung thanh toan
            HoaDon hoaDon = new HoaDon();
            hoaDonReponsitory.save(hoaDon);
            // tong so tien
            Long tongTien = 0L;

            // tong so san pham mua
            Long tongSoLuongMua = 0L;

            // tao khach hang de luu id khach hang khi tahnh toan thanh cong
            KhachHang idKhachHang = new KhachHang();

            // xu ly tung san pham trong gio hang
            boolean hasError = false;

            // tao list hoa don de luu khi khong xay ra loi trong qua trinh vong lap for
            List<HoaDonChiTiet> hoaDonChiTietList = new ArrayList<>();

            Long giaBanCon = 0L;
            String loaiKhuyenMai = null;
            Date ngayBatDau = null;
            Date ngayKetThuc = null;
            // bat dau xet tung san pham trong gio hang
            for (GioHangChiTietDto gioHangChiTietDto : listGhctDto) {
                SanPhamChiTiet spct = gioHangChiTietDto.getIdSanPhamChiTiet();
                Long soLuongMua = gioHangChiTietDto.getSoLuong();
                String sanPham = gioHangChiTietDto.getIdSanPhamChiTiet().getIdSanPham().getTenSanPham();
                String mauSac = spct.getIdMauSac().getTenMauSac();
                String kichThuoc = spct.getIdKichThuoc().getTenKichThuoc();
                Long giaBan = gioHangChiTietDto.getIdSanPhamChiTiet().getGiaBan();
                Long trangThai = spct.getTrangThai();
                KhuyenMai khuyenMai = gioHangChiTietDto.getIdSanPhamChiTiet().getIdKhuyenMai();

                if (trangThai != 0L){
                    model.addAttribute("errors", "Sản phẩm ( " + sanPham + " [ " + mauSac + " - " + kichThuoc + " ] " + " ) đã ngừng kinh doanh !");
                    hoaDonReponsitory.delete(hoaDon);
                    model.addAttribute("listGhct", listGhctDto);
                    model.addAttribute("newDate", new Date());
                    return "gio_hang/hien_thi";
                }

                Date ngayHienTai = new Date();
                // check khuyyen mai
                if (khuyenMai != null) {
                    ngayBatDau = gioHangChiTietDto.getIdSanPhamChiTiet().getIdKhuyenMai().getNgayBatDau();
                    ngayKetThuc = gioHangChiTietDto.getIdSanPhamChiTiet().getIdKhuyenMai().getNgayKetThuc();
                    loaiKhuyenMai = gioHangChiTietDto.getIdSanPhamChiTiet().getIdKhuyenMai().getLoaiKhuyenMai();
                } else {
                    loaiKhuyenMai = null;
                    ngayBatDau = null;
                    ngayKetThuc = null;
                }
                // Kiểm tra số lượng tồn kho
                if (soLuongMua <= spct.getSoLuong()) {
                    // Thêm thông tin vào hóa đơn chi tiết
                    HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                    hoaDonChiTiet.setIdHoaDon(hoaDon);
                    hoaDonChiTiet.setIdSanPhamChiTiet(spct);
                    hoaDonChiTiet.setSoLuong(soLuongMua);

                    // check giam gia theo % hay vnd
                    if (loaiKhuyenMai != null && loaiKhuyenMai.equals("percentage") && ngayBatDau.before(ngayHienTai) && ngayKetThuc.after(ngayBatDau)) {
                        Long giaTriGiam = gioHangChiTietDto.getIdSanPhamChiTiet().getIdKhuyenMai().getGiaTri();
                        Long giaGiamPercentage = giaBan * giaTriGiam / 100; // khuyen mai theo %

                        if (spct.getGiaBan() - giaTriGiam < 0) {
                            giaBanCon = 0L;
                            hoaDonChiTiet.setDonGia(0L);
                        } else {
                            giaBanCon = giaBan - giaGiamPercentage;
                            hoaDonChiTiet.setDonGia(spct.getGiaBan() - giaGiamPercentage);
                        }

                    } else if (loaiKhuyenMai != null && loaiKhuyenMai.equals("product") && ngayBatDau.before(ngayHienTai) && ngayKetThuc.after(ngayBatDau)) {
                        Long giaTriGiam = gioHangChiTietDto.getIdSanPhamChiTiet().getIdKhuyenMai().getGiaTri();
                        if (giaTriGiam > giaBan) {
                            giaBanCon = 0L;
                            hoaDonChiTiet.setDonGia(0L);
                        } else {
                            giaBanCon = giaBan - giaTriGiam;
                            hoaDonChiTiet.setDonGia(spct.getGiaBan() - giaTriGiam);  // khuyen mai theo gia tien
                        }
                    } else {
                        giaBanCon = giaBan;
                        hoaDonChiTiet.setDonGia(spct.getGiaBan());  // khong khuyen mai
                    }

                    hoaDonChiTiet.setGiaGoc(giaBan);
                    hoaDonChiTiet.setNgayTao(new Date());
                    hoaDonChiTiet.setNgayCapNhat(new Date());
                    hoaDonChiTietList.add(hoaDonChiTiet);


                    // tong tien mua
                    tongTien += soLuongMua * giaBanCon;

                    // tong so luong mua
                    tongSoLuongMua += soLuongMua;

                    // khach hang mua
                    idKhachHang = gioHangChiTietDto.getIdGioHang().getIdKhachHang();

                } else {
                    // thong bao khi so luong ton nho hon so luong mua
                    model.addAttribute("listGhct", listGhctDto);
                    model.addAttribute("errors", "Số lượng sản phẩm (" + sanPham + ") trong kho chỉ còn " + spct.getSoLuong() + " sản phẩm !");
                    // xoa hoa don vua tao khi qua trinh xay ra loi
                    hoaDonReponsitory.delete(hoaDon);
                    hasError = true;
                    break; // Kết thúc vòng lặp khi có lỗi
                }if (tongSoLuongMua >= 21) {
                    model.addAttribute("listGhct", listGhctDto);
                    // thong bao neu so luong mua >= 100
                    model.addAttribute("errors", "Tổng số lượng mua không quá 20 sản phẩm !");
                    hoaDonReponsitory.delete(hoaDon);
                    hasError = true;
                    break; // Kết thúc vòng lặp khi có lỗi
                }

            }

            // thong bao khi xay ra loi trong qua trinh
            if (hasError) { // khi xay ra loi
                hoaDonReponsitory.delete(hoaDon);
                model.addAttribute("listGhct", listGhctDto);
                model.addAttribute("errorssss", "Số lượng sản phẩm trong kho không đủ !");
            }if (tenNguoiNhan == null || hoNguoiNhan == null || diaChiNhan == null || sdtNguoiNhan == null || tinh == null || huyen == null || phuong == null) {
                    hoaDonReponsitory.delete(hoaDon);
                    model.addAttribute("errors", "Vui lòng điền đầy đủ thông tin để tiếp tục đặt hàng !");
                    model.addAttribute("listGhct", listGhctDto);
                    model.addAttribute("newDate", new Date());
                    return "gio_hang/hien_thi";
            }if (tenNguoiNhan.isBlank() || hoNguoiNhan.isBlank() || diaChiNhan.isBlank() || sdtNguoiNhan.isBlank() || tinh.isBlank() || huyen.isBlank() || phuong.isBlank()) {
                    hoaDonReponsitory.delete(hoaDon);
                    model.addAttribute("notBlank", "Chú ý : Các ô đánh dấu ( * ) không được để trống !");
                model.addAttribute("listGhct", listGhctDto);
                model.addAttribute("newDate", new Date());
                return "gio_hang/hien_thi";
            } if (!isValidPhoneNumber(sdtNguoiNhan)) {
                    hoaDonReponsitory.delete(hoaDon);
                    model.addAttribute("errors", "Số điện thoại không hợp lệ. Vui lòng kiểm tra lại.");
            } else { // khi khong xay ra loi nao
                // cap nhat so luong san pham khi thanh toan thanh cong
                for (GioHangChiTietDto gioHangChiTietDto : listGhctDto) {
                    SanPhamChiTiet spct = gioHangChiTietDto.getIdSanPhamChiTiet();
                    Long soLuongMua = gioHangChiTietDto.getSoLuong();

                    // check so luong ton so voi so luong mua
                    if (soLuongMua <= spct.getSoLuong()) {
                        // Nếu đủ tồn kho, cập nhật số lượng tồn kho
                        spct.setSoLuong(spct.getSoLuong() - soLuongMua);
                    }
                }

                List<TinhResponse> listTinh = ghnService.getProvinces();
                List<String> listIdTinh = listTinh.stream().map(TinhResponse::getId).toList();
                if (!listIdTinh.contains(tinh)) {
                    model.addAttribute("errors", "Vui lòng điền chính xác thông tin Địa chỉ nhận hàng !");
                    model.addAttribute("listGhct", listGhctDto);
                    return "gio_hang/hien_thi";
                }
                String tenTinh = listTinh.stream().filter(x -> x.getId().equals(tinh)).findFirst().get().getTenTinh();

                List<HuyenResponse> listHuyen = ghnService.getDistricts(tinh);
                List<String> listIdHuyen = listHuyen.stream().map(HuyenResponse::getId).toList();
                if (!listIdHuyen.contains(huyen)) {
                    model.addAttribute("errors", "Vui lòng điền chính xác thông tin Địa chỉ nhận hàng !");
                    model.addAttribute("listGhct", listGhctDto);
                    return "gio_hang/hien_thi";
                }
                String tenHuyen = listHuyen.stream().filter(x -> x.getId().equals(huyen)).findFirst().get().getTenHuyen();

                List<XaResponse> listXa = ghnService.getWards(huyen);
                List<String> listIdXa  = listXa.stream().map(XaResponse::getMaXa).toList();
                if (!listIdXa.contains(phuong)) {
                    model.addAttribute("errors", "Vui lòng điền chính xác thông tin Địa chỉ nhận hàng !");
                    model.addAttribute("listGhct", listGhctDto);
                    return "gio_hang/hien_thi";
                }
                String tenXa = listXa.stream().filter(x -> x.getMaXa().equals(phuong)).findFirst().get().getTenXa();

                Long phiVanCHuyen = ghnService.getTransportFee(huyen, phuong).getTongPhi();

                // tao hoa don moi
                hoaDon.setTrangThai(1L);
                hoaDon.setNgayTao(new Date());
                hoaDon.setNgayCapNhat(new Date());
                hoaDon.setIdKhachHang(idKhachHang);
                hoaDon.setNguoiNhan(hoNguoiNhan + " " + tenNguoiNhan);
                hoaDon.setSdtNguoiNhan(sdtNguoiNhan);
                hoaDon.setDiaChiNhan(tenTinh + ", " + tenHuyen + ", " + tenXa + ", " + diaChiNhan);
                hoaDon.setTongTien(tongTien);
                hoaDon.setPhiVanChuyen(phiVanCHuyen.intValue());
                hoaDon.setThanhTien(tongTien + phiVanCHuyen);
                hoaDon.setLoaiHoaDon(1L);
                // Luu hoa don
                hoaDonReponsitory.save(hoaDon);
                // Luu tat ca cac san pham vao hoa don chi tiet
                hoaDonChiTietReponsitory.saveAll(hoaDonChiTietList);
                // luu lich su hoa don
                LichSuDonHang ls = new LichSuDonHang();
                ls.setNgayTao(new Date());
                ls.setIdDonHang(hoaDon.getId());
                ls.setTrangThaiDonHang(1L);
                ls.setGhiChu("Chưa thanh toán");
                lichSuDonHangRepository.save(ls);

                // xoa gio hang sau khi thanh toan thanh cong
                if (tk.isEmpty()) {
                    try {
                        // Lấy đối tượng InetAddress đại diện cho máy tính hiện tại
                        InetAddress localhost = InetAddress.getLocalHost();
                        // Lấy địa chỉ IP của máy tính
                        String ipAddressPc = localhost.getHostAddress();
                        // xoa gio hang nguoi dung khong dang nhap
                        String gioHangId = gioHangChiTietService.detailTkGh(ipAddressPc);
                        gioHangChiTietService.deleteByIdGioHang(gioHangId);
                    } catch (UnknownHostException e) {
                        e.printStackTrace();
                    }
                } else {
                    // xoa gio hang khi nguoi dung dang nhap
                    String gioHangId = gioHangChiTietService.detailTkGh(tk);
                    gioHangChiTietService.deleteByIdGioHang(gioHangId);
                }
                // thong bao khi thanh toan thanh cong
                model.addAttribute("pass", "Đơn hàng đã đặt thành công !");
                model.addAttribute("idHoaDon", hoaDon.getId());
                model.addAttribute("listGhct", null);
                model.addAttribute("hoNguoiNhan", null);
                model.addAttribute("tenNguoiNhan", null);
                model.addAttribute("sdtNguoiNhan", null);
                model.addAttribute("diaChiNhan", null);
                model.addAttribute("diaChi", null);
                model.addAttribute("idHoaDon", hoaDon.getId());
                return "gio_hang/hien_thi";
            }
            model.addAttribute("listGhct", listGhctDto);
            model.addAttribute("newDate", new Date());
            return "gio_hang/hien_thi";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errors", e.getMessage());
            return "gio_hang/hien_thi";
        }

    }

    public static boolean isValidPhoneNumber(String phoneNumber) {
        String regex = "^0\\d{9}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }

}

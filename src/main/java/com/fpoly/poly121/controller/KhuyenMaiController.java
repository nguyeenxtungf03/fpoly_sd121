package com.fpoly.poly121.controller;


import com.fpoly.poly121.model.*;
import com.fpoly.poly121.repository.*;
import com.fpoly.poly121.service.*;
import com.fpoly.poly121.service.impl.SanPhamChiTietServiceImpl;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.scheduling.annotation.Scheduled;

import java.text.ParseException;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("khuyen-mai")
public class KhuyenMaiController {


    @Autowired
    KhuyenMaiService khuyenMaiService;
    List<KhuyenMai> listKm;

    @Autowired
    KhuyenMaiRepository khuyenMaiRepository;

    @Autowired
    SanPhamService sanPhamService;
    List<SanPham> listSp;

    @Autowired
    SanPhamChiTietReponsitory sanPhamChiTietReponsitory;
    List<SanPhamChiTiet> listSpct;

    @Autowired
    SanPhamChiTietServiceImpl sanPhamChiTietService;

    @Autowired
    ThuongHieuService thuongHieuService;
    List<ThuongHieu> listTh;


    @Autowired
    LoaiSanPhamService loaiSanPhamService;
    List<LoaiSanPham> listLsp;


    @Autowired
    ChatLieuService chatLieuService;
    List<ChatLieu> listCl;


    @GetMapping("hien-thi")
    public String getAll(@RequestParam(defaultValue = "0") Integer page, Model model ,HttpSession session) {
        Page<KhuyenMai> page1 = khuyenMaiService.getAll(page);
        listKm = page1.getContent();
        model.addAttribute("listKm", listKm);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());

        List<KhuyenMai> listKmAll = khuyenMaiRepository.findAll();
        model.addAttribute("listKmAll",listKmAll);
        session.removeAttribute("km");
        session.removeAttribute("selectedProductIds" );
        session.removeAttribute("ngayBatDau" );
        session.removeAttribute("ngayKetThuc" );
        model.addAttribute("newDate" , new Date());

        List<KhuyenMai> listKm = khuyenMaiRepository.findAll();
        for (KhuyenMai km :listKm){
            if (km.getNgayKetThuc().after(new Date())) {
                km.setTrangThai(1);
            }if (km.getNgayKetThuc().before(new Date())) {
                km.setTrangThai(2);
            }
        }
        List<SanPhamChiTiet> spctList = sanPhamChiTietReponsitory.findAll();
        // Kiểm tra và cập nhật idkhuyenmai trên spct
        for (SanPhamChiTiet spct : spctList) {
            KhuyenMai khuyenMai = spct.getIdKhuyenMai();
            if (khuyenMai != null && khuyenMai.getNgayKetThuc() != null) {
                // Chuyển đổi từ java.sql.Date sang java.time.LocalDate
                Date ngayKetThuc = khuyenMai.getNgayKetThuc();

                if (ngayKetThuc.before(new Date())) {
                    // Ngày kết thúc lớn hơn ngày hiện tại, đặt idKhuyenMai về null
                    spct.setIdKhuyenMai(null);
                    sanPhamChiTietReponsitory.save(spct);
                }
            }

        }
        return "khuyen_mai/hien_thi";

    }

    @GetMapping("bo-loc-km")
    public String boLocKm(@RequestParam(required = false) String tenKm  ,
                          @RequestParam(required = false) Long idKm  ,
                          @RequestParam(required = false ) String loaiKm  ,
                          @RequestParam(required = false) Long giaTriToiThieu  ,
                          @RequestParam(required = false) Long giaTriToiDa  ,
                          @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date dateBd  ,
                          @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date dateKt  ,
                          @RequestParam(required = false) Integer trangThai  ,
                          Model model) {

        List<KhuyenMai> listKmAll = khuyenMaiRepository.findAll();
        model.addAttribute("listKmAll",listKmAll);

        model.addAttribute("newDate" , new Date());
        model.addAttribute("dateBd", dateBd);
        model.addAttribute("dateKt", dateKt);
        model.addAttribute("tenKm",tenKm);
        model.addAttribute("giaTriToiThieu",giaTriToiThieu);
        model.addAttribute("giaTriToiDa",giaTriToiDa);
        model.addAttribute("loaiKm",loaiKm);
        model.addAttribute("idKm",idKm);
        model.addAttribute("trangThai",trangThai);

        listKm = khuyenMaiRepository.boLocKm(tenKm,idKm,loaiKm,giaTriToiThieu,giaTriToiDa,dateBd,dateKt,trangThai);
        model.addAttribute("listKm" ,listKm);
        return "khuyen_mai/hien_thi";
    }

    @PostMapping("add")
    public String add( @RequestParam(defaultValue = "0") Integer page, HttpSession session,
                      @RequestParam(name = "selectedProductIds", required = false) List<Long> selectedProductIds,
                      Model model ,@Validated @ModelAttribute KhuyenMai khuyenMai, BindingResult bindingResult) throws ParseException {

        Page<SanPhamChiTiet> page1 = sanPhamChiTietService.getAll(page);
        listSpct = page1.getContent();
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        model.addAttribute("listSpctPage", listSpct);

        model.addAttribute("listSp",listSp = sanPhamService.getAll());
        model.addAttribute("listLsp",listLsp =loaiSanPhamService.getAll());
        model.addAttribute("listTh",listTh = thuongHieuService.getList());
        model.addAttribute("listCl",listCl = chatLieuService.getList());

        List<SanPhamChiTiet> listSpctAll = sanPhamChiTietReponsitory.findAll();
        model.addAttribute("listSpct", listSpctAll);

        session.setAttribute("km", khuyenMai);
        session.setAttribute("selectedProductIds", selectedProductIds);

        if (bindingResult.hasErrors()) {
            Long giaTriKm = khuyenMai.getGiaTri();
            if (giaTriKm == null) {
                model.addAttribute("errors", "Giá trị khuyến mại phải là một số > 0 ");
            } else{
                model.addAttribute("errors", bindingResult.getFieldError().getDefaultMessage());
            }
            listSpct = page1.getContent();
            model.addAttribute("km",khuyenMai );
            model.addAttribute("selectedProductIds",selectedProductIds );
            return "khuyen_mai/form_add";
        } else {
            if (selectedProductIds != null && !selectedProductIds.isEmpty()) {
                Long idKm = khuyenMai.getId();

                String loaiKhuyenMai = khuyenMai.getLoaiKhuyenMai();
                Long giaTri = khuyenMai.getGiaTri();
                Date newDate = new Date();
                Date ngayBatDau = khuyenMai.getNgayBatDau();
                Date ngayKetThuc = khuyenMai.getNgayKetThuc();
                KhuyenMai tenKm = khuyenMaiRepository.checkTenKm(khuyenMai.getTenKhuyenMai());
                if (ngayBatDau.before(newDate)) {
                    model.addAttribute("errors", "Ngày bắt đầu phải trước hoặc bằng ngày hiện tại");
                    model.addAttribute("km", khuyenMai);
                    model.addAttribute("selectedProductIds", selectedProductIds);
                    return "khuyen_mai/form_add";
                }
                if (ngayKetThuc.before(ngayBatDau)) {
                    model.addAttribute("errors", "Ngày kết thúc phải trước ngày bắt đầu");
                    model.addAttribute("km", khuyenMai);
                    model.addAttribute("selectedProductIds", selectedProductIds);
                    return "khuyen_mai/form_add";
                }
                if (ngayKetThuc.before(newDate)) {
                    model.addAttribute("errors", "Ngày kết thúc phải lớn hơn hoặc bằng ngày hiện tại");
                    model.addAttribute("km", khuyenMai);
                    model.addAttribute("selectedProductIds", selectedProductIds);
                    return "khuyen_mai/form_add";
                }
                if (loaiKhuyenMai.equals("product") && giaTri > 10000000) {
                    model.addAttribute("errors", "Giá trị khuyến mại theo giá tiền không quá 10.000.000 VNĐ");
                    model.addAttribute("km", khuyenMai);
                    model.addAttribute("selectedProductIds", selectedProductIds);
                    return "khuyen_mai/form_add";
                }
                if (loaiKhuyenMai.equals("percentage") && giaTri > 100) {
                    model.addAttribute("errors", "Giá trị khuyến mại theo phần trăm không quá 100%");
                    model.addAttribute("km", khuyenMai);
                    model.addAttribute("selectedProductIds", selectedProductIds);
                    return "khuyen_mai/form_add";
                }
                boolean hasError = false;
                // Thêm khuyến mại mới
                List<KhuyenMai> kmcheck = khuyenMaiRepository.kmCheck(idKm);
                if (khuyenMai.getId() == null || kmcheck == null) {
                    if (tenKm != null) {
                        model.addAttribute("errors", "Tên khuyến mại đã tồn tại");
                        model.addAttribute("km", khuyenMai);
                        model.addAttribute("selectedProductIds", selectedProductIds);
                        return "khuyen_mai/form_add";
                    }else {
                        // Liên kết khuyến mại mới với các sản phẩm chi tiết được chọn
                        for (Long productId : selectedProductIds) {
                            // Lấy sản phẩm chi tiết từ cơ sở dữ liệu (hoặc qua service)
                            SanPhamChiTiet spct = sanPhamChiTietReponsitory.getReferenceById(productId);
                            if (spct.getGiaBan() < khuyenMai.getGiaTri() && loaiKhuyenMai.equals("product")) {
                                model.addAttribute("errors", " Giá trị khuyến mại theo giá tiền không hơn giá bán ");
                                hasError = true;
                            }
                        }

                        if (hasError){
                            khuyenMaiRepository.delete(khuyenMai);
                            model.addAttribute("errors", " Giá trị khuyến mại theo giá tiền không hơn giá bán ");
                            return "khuyen_mai/form_add";

                        }else {
                            khuyenMai.setTrangThai(1);
                            khuyenMaiService.add(khuyenMai);
                            for (Long productId : selectedProductIds) {
                                // Lấy sản phẩm chi tiết từ cơ sở dữ liệu (hoặc qua service)
                                SanPhamChiTiet spct = sanPhamChiTietReponsitory.getReferenceById(productId);
                                spct.setIdKhuyenMai(khuyenMai);
                                sanPhamChiTietReponsitory.save(spct);
                            }
                            model.addAttribute("pass", " Thêm khuyến mại thành công ");
                        }
                    }
                    } else {
                    KhuyenMai km = khuyenMaiRepository.km(idKm);
                    if (!km.getTenKhuyenMai().equals(khuyenMai.getTenKhuyenMai())) {
                        model.addAttribute("errors", "Không thay đổi tên khuyến mại sau khi đã thêm");
                        model.addAttribute("km", khuyenMai);
                        model.addAttribute("selectedProductIds", selectedProductIds);
                        model.addAttribute("km.tenKhuyenMai",km.getTenKhuyenMai());
                        return "khuyen_mai/form_add";
                    }

                    // Liên kết khuyến mại mới với các sản phẩm chi tiết được chọn
                    for (Long productId : selectedProductIds) {
                        // Lấy sản phẩm chi tiết từ cơ sở dữ liệu (hoặc qua service)
                        SanPhamChiTiet spct = sanPhamChiTietReponsitory.getReferenceById(productId);
                        if (spct.getGiaBan() < khuyenMai.getGiaTri() && loaiKhuyenMai.equals("product")) {
                            model.addAttribute("errors", " Giá trị khuyến mại theo giá tiền không hơn giá bán ");
                            hasError = true;
                        }
                    }

                    if (hasError){
                        model.addAttribute("errors", " Giá trị khuyến mại theo giá tiền không hơn giá bán ");
                        return "khuyen_mai/form_add";

                    }else {
                        khuyenMai.setTenKhuyenMai(km.getTenKhuyenMai());
                        khuyenMai.setTrangThai(1);
                        khuyenMaiService.add(khuyenMai);
                        KhuyenMai idKmsp = khuyenMaiRepository.km(idKm);
                        for (Long productId : selectedProductIds) {
                            // Lấy sản phẩm chi tiết từ cơ sở dữ liệu (hoặc qua service)
                            SanPhamChiTiet spct = sanPhamChiTietReponsitory.getReferenceById(productId);

                            // Liên kết khuyến mại với sản phẩm chi tiết
                            spct.setIdKhuyenMai(idKmsp);

                            // Cập nhật thông tin sản phẩm chi tiết
                            sanPhamChiTietReponsitory.save(spct);
                        }

                        model.addAttribute("pass", " Cập nhật khuyến mại thành công ");

                    }
                    }

                } else {
                    model.addAttribute("errors", "Chọn sản phẩm khuyến mại !");
                }
                return "khuyen_mai/form_add";
            }

        }




    @GetMapping("form-add")
    public String formAdd(@RequestParam( required = false) SanPham idSanPham ,
                          @RequestParam( required = false) LoaiSanPham idLoaiSanPham ,
                          @RequestParam( required = false) ThuongHieu idThuongHieu ,
                          @RequestParam( required = false) ChatLieu idChatLieu ,
                          @RequestParam(defaultValue = "0") Integer page, Model model  ) {
        model.addAttribute("listSp",listSp = sanPhamService.getAll());
        model.addAttribute("listLsp",listLsp =loaiSanPhamService.getAll());
        model.addAttribute("listTh",listTh = thuongHieuService.getList());
        model.addAttribute("listCl",listCl = chatLieuService.getList());

        model.addAttribute("idSanPham",idSanPham);
        model.addAttribute("idLoaiSanPham",idLoaiSanPham);
        model.addAttribute("idChatLieu",idChatLieu);
        model.addAttribute("idThuongHieu",idThuongHieu);

        if (idSanPham == null && idLoaiSanPham == null && idThuongHieu == null && idChatLieu == null ) {
            Page<SanPhamChiTiet> page1 = sanPhamChiTietService.getAll(page);
            model.addAttribute("page", page);
            model.addAttribute("page1", page1.getTotalPages());
            listSpct = page1.getContent();

        }else{
            listSpct = sanPhamChiTietReponsitory.boLoc(idSanPham,idLoaiSanPham,null,null,idThuongHieu,idChatLieu,0L,null,null,null,null);
        }
        model.addAttribute("listSpctPage", listSpct);
        return "khuyen_mai/form_add";
    }


    @PostMapping("update/{id}")
    public String update(@PathVariable Long id, Model model , @Valid @ModelAttribute KhuyenMai khuyenMai , BindingResult bindingResult) {
        listSpct = sanPhamChiTietReponsitory.findAll();

        if (bindingResult.hasErrors()){
            model.addAttribute("errors","Loi");
            return "redirect:/khuyen-mai/hien-thi";
        }
        for (SanPhamChiTiet spct : listSpct) {
            KhuyenMai khuyenMaiLay = spct.getIdKhuyenMai();
            if (khuyenMaiLay != null && khuyenMaiLay.getNgayKetThuc() != null) {
                // Chuyển đổi từ java.sql.Date sang java.time.LocalDate
                Date ngayKetThuc = khuyenMaiLay.getNgayKetThuc();
                if (ngayKetThuc.before(new Date())) {
                    // Ngày kết thúc lớn hơn ngày hiện tại, đặt idKhuyenMai về null
                    spct.setIdKhuyenMai(null);
                    khuyenMaiLay.setTrangThai(2);
                    sanPhamChiTietReponsitory.save(spct);
                }
            }
        }
        if (khuyenMai.getNgayKetThuc().after(new Date())) {
            String loaiKhuyenMai = khuyenMai.getLoaiKhuyenMai();
            Long giaTri = khuyenMai.getGiaTri();
            Date newDate = new Date();
            Date ngayBatDau = khuyenMai.getNgayBatDau();
            Date ngayKetThuc = khuyenMai.getNgayKetThuc();
            KhuyenMai tenKm = khuyenMaiRepository.km(khuyenMai.getId());
            if (!tenKm.getTenKhuyenMai().equals(khuyenMai.getTenKhuyenMai()) ) {
                model.addAttribute("errors", "Cập nhật thất bại !");
                return "redirect:/khuyen-mai/hien-thi";
            }if (ngayBatDau.before(newDate)) {
                model.addAttribute("errors", "Ngày bắt đầu phải trước hoặc bằng ngày hiện tại");
                return "redirect:/khuyen-mai/hien-thi";
            }if (ngayKetThuc.before(ngayBatDau)) {
                model.addAttribute("errors", "Ngày kết thúc phải trước ngày bắt đầu");
                return "redirect:/khuyen-mai/hien-thi";
            }
            if (ngayKetThuc.before(newDate)) {
                model.addAttribute("errors", "Ngày kết thúc phải lớn hơn hoặc bằng ngày hiện tại");
                return "redirect:/khuyen-mai/hien-thi";
            }
            if (loaiKhuyenMai.equals("product") && giaTri > 10000000) {
                model.addAttribute("errors", "Giá trị khuyến mại theo giá tiền không quá 10.000.000 VNĐ");
                model.addAttribute("km", khuyenMai);
                return "redirect:/khuyen-mai/hien-thi";
            }
            if (loaiKhuyenMai.equals("percentage") && giaTri > 100) {
                model.addAttribute("errors", "Giá trị khuyến mại theo phần trăm không quá 100%");
                model.addAttribute("km", khuyenMai);
                return "redirect:/khuyen-mai/hien-thi";
            } else {
                khuyenMai.setTrangThai(1);
                khuyenMai.setTenKhuyenMai(tenKm.getTenKhuyenMai());
                khuyenMaiService.update(khuyenMai);
            }
        }
        if (khuyenMai.getNgayKetThuc().before(new Date())) {
            khuyenMai.setTrangThai(2);
            model.addAttribute("errors","Khuyến mại đã vô hiệu hóa !");
        }

        return "redirect:/khuyen-mai/hien-thi";
    }

    @Transactional
    @GetMapping("delete/{id}")
    public String delete(@PathVariable Long id, Model model) {
        khuyenMaiRepository.voHieuHoa(id);
        khuyenMaiService.delete(id);
        return "redirect:/khuyen-mai/hien-thi";
    }

    @GetMapping("detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        KhuyenMai khuyenMai = khuyenMaiService.detail(id);
        model.addAttribute("km", khuyenMai);

        List<SanPhamChiTiet> dsSpctKm = sanPhamChiTietReponsitory.dsSpctKm(id);
        model.addAttribute("dsSpctKm" ,dsSpctKm);

        Date newDate = new Date();
        model.addAttribute("newDate",newDate);
        return "khuyen_mai/update";
    }

    @Transactional
    @PostMapping("deleteKmSp/{idSp}")
    public String deleteSp(@PathVariable Long idSp){
        sanPhamChiTietReponsitory.deleteKmSp(idSp);
        return "redirect:/khuyen-mai/hien-thi";
    }

    @Transactional
    @Scheduled(cron = "0 0/30 * * * ?") // Chạy mỗi 30 phút
    public void checkExpiredPromotions() {
        // Lấy danh sách sản phẩm chi tiết

        List<KhuyenMai> listKm = khuyenMaiRepository.findAll();
        for (KhuyenMai km :listKm){
            if (km.getNgayKetThuc().after(new Date())) {
                km.setTrangThai(1);
            }if (km.getNgayKetThuc().before(new Date())) {
                km.setTrangThai(2);
            }
        }

        List<SanPhamChiTiet> spctList = sanPhamChiTietReponsitory.findAll();
        // Kiểm tra và cập nhật idkhuyenmai trên spct
        for (SanPhamChiTiet spct : spctList) {
            KhuyenMai khuyenMai = spct.getIdKhuyenMai();
            if (khuyenMai != null && khuyenMai.getNgayKetThuc() != null) {
                // Chuyển đổi từ java.sql.Date sang java.time.LocalDate
                Date ngayKetThuc = khuyenMai.getNgayKetThuc();

                if (ngayKetThuc.before(new Date())) {
                    // Ngày kết thúc lớn hơn ngày hiện tại, đặt idKhuyenMai về null
                    spct.setIdKhuyenMai(null);
                    sanPhamChiTietReponsitory.save(spct);
                }
            }

        }

    }


}

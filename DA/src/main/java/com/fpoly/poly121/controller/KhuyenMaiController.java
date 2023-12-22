package com.fpoly.poly121.controller;


import com.fpoly.poly121.model.KhuyenMai;
import com.fpoly.poly121.model.SanPham;
import com.fpoly.poly121.model.SanPhamChiTiet;
import com.fpoly.poly121.repository.KhuyenMaiRepository;
import com.fpoly.poly121.repository.SanPhamChiTietReponsitory;
import com.fpoly.poly121.service.KhuyenMaiService;
import com.fpoly.poly121.service.SanPhamChiTietService;
import com.fpoly.poly121.service.SanPhamService;
import com.fpoly.poly121.service.impl.SanPhamChiTietServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.scheduling.annotation.Scheduled;

import java.time.LocalDate;
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


    @GetMapping("hien-thi")
    public String getAll(@RequestParam(defaultValue = "0") Integer page, Model model ,HttpSession session) {
        Page<KhuyenMai> page1 = khuyenMaiService.getAll(page);
        listKm = page1.getContent();
        model.addAttribute("listKm", listKm);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());

        List<KhuyenMai> listKmAll = khuyenMaiRepository.findAll();
        model.addAttribute("listKmAll",listKmAll);
        session.removeAttribute("km" );
        session.removeAttribute("selectedProductIds" );
        return "khuyen_mai/hien_thi";

    }

    @GetMapping("bo-loc-km")
    public String boLocKm(@RequestParam(required = false) String tenKm  ,
                          @RequestParam(required = false) Long idKm  ,
                          @RequestParam(required = false ) String loaiKm  ,
                          @RequestParam(required = false) Long giaTri  ,
                          @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateBd  ,
                          @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateKt  ,
                          @RequestParam(required = false) Integer trangThai  ,
                          Model model) {

        List<KhuyenMai> listKmAll = khuyenMaiRepository.findAll();
        model.addAttribute("listKmAll",listKmAll);

        model.addAttribute("tenKm",tenKm);
        model.addAttribute("dateBd",dateBd);
        model.addAttribute("dateKt",dateKt);
        model.addAttribute("giaTri",giaTri);
        model.addAttribute("loaiKm",loaiKm);
        model.addAttribute("idKm",idKm);
        model.addAttribute("trangThai",trangThai);

        listKm = khuyenMaiRepository.boLocKm(tenKm,idKm,loaiKm,giaTri,dateBd,dateKt,trangThai);
        model.addAttribute("listKm" ,listKm);
        return "khuyen_mai/hien_thi";
    }

    @PostMapping("add")
    public String add(@ModelAttribute KhuyenMai khuyenMai, @RequestParam(defaultValue = "0") Integer page, HttpSession session,
                      @RequestParam(name = "selectedProductIds", required = false) List<Long> selectedProductIds,
                      Model model) {
        Page<SanPhamChiTiet> page1 = sanPhamChiTietService.getAll(page);
        listSpct = page1.getContent();
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        model.addAttribute("listSpctPage", listSpct);

        List<SanPhamChiTiet> listSpctAll = sanPhamChiTietReponsitory.findAll();
        model.addAttribute("listSpct", listSpctAll);

        Long idKm = khuyenMai.getId();


        try {
            if (selectedProductIds != null && !selectedProductIds.isEmpty()  ) {
                // Thêm khuyến mại mới
                if (idKm == null) {
                    khuyenMai.setTrangThai(1);
                    khuyenMaiService.add(khuyenMai);
                    // Liên kết khuyến mại mới với các sản phẩm chi tiết được chọn
                    for (Long productId : selectedProductIds) {
                        // Lấy sản phẩm chi tiết từ cơ sở dữ liệu (hoặc qua service)
                        SanPhamChiTiet spct = sanPhamChiTietReponsitory.getReferenceById(productId);

                        // Liên kết khuyến mại với sản phẩm chi tiết
                        spct.setIdKhuyenMai(khuyenMai);

                        // Cập nhật thông tin sản phẩm chi tiết
                        sanPhamChiTietReponsitory.save(spct);
                    }
                } else {
                    KhuyenMai idKmsp = khuyenMaiRepository.km(idKm);

                    for (Long productId : selectedProductIds) {
                        // Lấy sản phẩm chi tiết từ cơ sở dữ liệu (hoặc qua service)
                        SanPhamChiTiet spct = sanPhamChiTietReponsitory.getReferenceById(productId);

                        // Liên kết khuyến mại với sản phẩm chi tiết
                        spct.setIdKhuyenMai(idKmsp);

                        // Cập nhật thông tin sản phẩm chi tiết
                        sanPhamChiTietReponsitory.save(spct);
                    }
                }
                    session.setAttribute("km", khuyenMai);
                    session.setAttribute("selectedProductIds", selectedProductIds);
                    model.addAttribute("pass", " Thêm thành công ");
                    return "khuyen_mai/form_add";

                }else{
                    session.setAttribute("km", khuyenMai);
                    model.addAttribute("errors", "Chọn sản phẩm khuyến mại !");
                    return "khuyen_mai/form_add";
                }


        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errors", "Không để trống tên và giá trị khuyến mại phải > 0 ! ");
            listSpct = page1.getContent();
            session.setAttribute("km",khuyenMai );
            session.setAttribute("selectedProductIds",selectedProductIds );
            return "khuyen_mai/form_add";
        }

    }


    @GetMapping("form-add")
    public String formAdd(@RequestParam( required = false, name = "keyword") String keyword,@RequestParam(defaultValue = "0") Integer page, Model model  ) {

        Page<SanPhamChiTiet> page1 = sanPhamChiTietService.getAll(page);
        if (keyword == null) {
            listSpct = page1.getContent();
            model.addAttribute("listSpctPage", listSpct);

            List<SanPhamChiTiet> listSpctAll = sanPhamChiTietReponsitory.findAll();
            model.addAttribute("listSpct", listSpctAll);

        }else{
            listSpct = sanPhamChiTietService.search(keyword.trim());
            model.addAttribute("listSpctPage", listSpct);

        }
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        return "khuyen_mai/form_add";
    }


    @PostMapping("update/{id}")
    public String update(@PathVariable Long id, @ModelAttribute KhuyenMai khuyenMai, Model model) {
        listSpct = sanPhamChiTietReponsitory.findAll();
        for (SanPhamChiTiet spct : listSpct) {
            KhuyenMai khuyenMaiLay = spct.getIdKhuyenMai();
            if (khuyenMaiLay != null && khuyenMaiLay.getNgayKetThuc() != null) {
                // Chuyển đổi từ java.sql.Date sang java.time.LocalDate
                LocalDate ngayKetThuc = khuyenMaiLay.getNgayKetThuc().toLocalDate();
                if (ngayKetThuc.isBefore(LocalDate.now())) {
                    // Ngày kết thúc lớn hơn ngày hiện tại, đặt idKhuyenMai về null
                    spct.setIdKhuyenMai(null);
                    khuyenMaiLay.setTrangThai(2);
                    sanPhamChiTietReponsitory.save(spct);
                }
            }
        }
        if (khuyenMai.getNgayKetThuc().after(new Date())) {
            khuyenMai.setTrangThai(1);
            khuyenMaiService.update(khuyenMai);
        }if (khuyenMai.getNgayKetThuc().before(new Date())) {
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
    @Scheduled(cron = "0 0 0 * * ?") // Chạy mỗi ngày lúc 00:00:00
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
                LocalDate ngayKetThuc = khuyenMai.getNgayKetThuc().toLocalDate();

                if (ngayKetThuc.isBefore(LocalDate.now())) {
                    // Ngày kết thúc lớn hơn ngày hiện tại, đặt idKhuyenMai về null
                    spct.setIdKhuyenMai(null);
                    sanPhamChiTietReponsitory.save(spct);
                }
            }

        }

    }


}

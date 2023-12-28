package com.fpoly.poly121.controller;


import com.fpoly.poly121.dto.request.GioHangChiTietDto;
import com.fpoly.poly121.dto.request.HoaDonChiTietDto;
import com.fpoly.poly121.dto.request.TopSpDto;
import com.fpoly.poly121.model.HoaDon;
import com.fpoly.poly121.model.HoaDonChiTiet;
import com.fpoly.poly121.model.KhachHang;
import com.fpoly.poly121.model.SanPhamChiTiet;
import com.fpoly.poly121.repository.HoaDonChiTietReponsitory;
import com.fpoly.poly121.repository.HoaDonReponsitory;
import com.fpoly.poly121.repository.KhachHangRepository;
import com.fpoly.poly121.repository.SanPhamChiTietReponsitory;
import com.fpoly.poly121.service.HoaDonChiTietService;
import com.fpoly.poly121.service.HoaDonService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private HoaDonChiTietService hoaDonChiTietService;
    private List<HoaDonChiTiet> listHdct;

    @Autowired
    private HoaDonReponsitory hoaDonReponsitory;

    @Autowired
    private SanPhamChiTietReponsitory sanPhamChiTietReponsitory;


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
    public String boLochd( @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateBd, @DateTimeFormat(pattern = "yyyy-MM-dd") @RequestParam(required = false) Date dateKt, Model model,
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
        // san pham da ban ko tinh tt huy va tt cxn
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
    public String searchTk(@RequestParam() @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateBd, @RequestParam() @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateKt, Model model) {

        //  doanh thu tt ht
        listHd1 = hoaDonService.searchHD(dateBd, dateKt);
        model.addAttribute("listHd1", listHd1);

        // hoa don da ban ko tinh tt huy
        List<HoaDon> hoaDonDaBan = hoaDonReponsitory.hoaDonDaBanSearch(dateBd,dateKt);
        model.addAttribute("hoaDonDaBan", hoaDonDaBan);

        // khach hang tinh khi dk va mua hang != 7
        Long countUniqueCustomers = hoaDonService.countUniqueCustomers(dateBd, dateKt);
        model.addAttribute("countUniqueCustomers", countUniqueCustomers);

        //san pham da ban ko tinh tt huy va tt cxn
        listHdct = hoaDonChiTietService.searchHDCT(dateBd, dateKt);
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
    public String trangThai(@RequestParam(required = false) Long trangThai, Model model){
       listHd =  hoaDonReponsitory.trangThaiHoaDon(trangThai);
       model.addAttribute("listHd",listHd);
       model.addAttribute("trangThai" ,trangThai);
       return "hoa_don/hien_thi";
    }

    @PostMapping("trang-thai-don-hang")
    public String trangThaiHoaDon(@RequestParam(required = false) Long trangThai,
                                  @RequestParam(required = false) Long idHoaDon,
                                  @RequestParam(required = false) String actions){
        hoaDonReponsitory.updateTrangThai(trangThai,idHoaDon);
        hoaDonReponsitory.updateNgay(new Date() , idHoaDon);
        if (trangThai == 7  && actions == null){
            // san pham trong gio hang
            List<HoaDonChiTiet> listHdct = sanPhamChiTietReponsitory.findHdctByidHd(idHoaDon);
            for (HoaDonChiTiet hoaDonChiTiet : listHdct) {
                SanPhamChiTiet spct = hoaDonChiTiet.getIdSanPhamChiTiet();
                spct.setSoLuong(spct.getSoLuong() + hoaDonChiTiet.getSoLuong());
                sanPhamChiTietReponsitory.save(spct);
            }
        }
        return "redirect:/hoa-don/hien-thi";
    }

    @Transactional
    @PostMapping("trang-thai-don-hang-khach-hang")
    public String trangThaiHoaDonKhachHang(@RequestParam(required = false) String trangThai , @RequestParam(required = false) Long idHoaDon , Model model) {
        try {
            try {
                long trangThaiHuy = Long.parseLong(trangThai);
                if (trangThaiHuy == 7) {
                    hoaDonReponsitory.updateTrangThai(trangThaiHuy, idHoaDon);
                    hoaDonReponsitory.updateNgay(new Date(), idHoaDon);
                    // san pham trong gio hang
                    List<HoaDonChiTiet> listHdct = sanPhamChiTietReponsitory.findHdctByidHd(idHoaDon);
                    for (HoaDonChiTiet hoaDonChiTiet : listHdct) {
                        SanPhamChiTiet spct = hoaDonChiTiet.getIdSanPhamChiTiet();
                        spct.setSoLuong(spct.getSoLuong() + hoaDonChiTiet.getSoLuong());
                        sanPhamChiTietReponsitory.save(spct);
                    }
                }
                if (trangThaiHuy != 7) {
                    model.addAttribute("Lỗi hủy đơn hàng ");
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/trang-chu";
    }

}

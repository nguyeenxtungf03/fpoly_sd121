package com.fpoly.poly121.controller;



import com.fpoly.poly121.dto.request.SanPhamDto;
import com.fpoly.poly121.dto.request.TopSpDto;
import com.fpoly.poly121.model.ChatLieu;
import com.fpoly.poly121.model.KichThuoc;
import com.fpoly.poly121.model.LoaiSanPham;
import com.fpoly.poly121.model.MauSac;
import com.fpoly.poly121.model.SanPham;
import com.fpoly.poly121.model.SanPhamChiTiet;
import com.fpoly.poly121.model.ThuongHieu;
import com.fpoly.poly121.repository.SanPhamChiTietReponsitory;
import com.fpoly.poly121.repository.SanPhamReponsitory;
import com.fpoly.poly121.service.ChatLieuService;
import com.fpoly.poly121.service.KichThuocService;
import com.fpoly.poly121.service.LoaiSanPhamService;
import com.fpoly.poly121.service.MauSacService;
import com.fpoly.poly121.service.SanPhamChiTietService;
import com.fpoly.poly121.service.SanPhamService;
import com.fpoly.poly121.service.ThuongHieuService;
import com.fpoly.poly121.service.impl.LayDuLieuExelTaiLenDatabaseService;
import com.fpoly.poly121.service.impl.SanPhamChiTietServiceImpl;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("san-pham-chi-tiet")
public class SanPhamChiTietController {
    @Autowired
    private SanPhamChiTietService sanPhamChiTietService;
    List<SanPhamChiTiet> listSpct;

    @Autowired
    private SanPhamChiTietReponsitory sanPhamChiTietReponsitory;

    @Autowired
    private SanPhamChiTietServiceImpl sanPhamChiTietServiceImpl;


    @Autowired
    private SanPhamService sanPhamService;
    List<SanPham> listSp;

    @Autowired
    private MauSacService mauSacService;
    List<MauSac> listMs;

    @Autowired
    private LoaiSanPhamService loaiSanPhamService;
    List<LoaiSanPham> listLsp;

    @Autowired
    private ThuongHieuService thuongHieuService;
    List<ThuongHieu> listTh;

    @Autowired
    private KichThuocService kichThuocService;
    List<KichThuoc> listKt;

    @Autowired
    private ChatLieuService chatLieuService;
    List<ChatLieu> listCl;

    @Autowired
    private LayDuLieuExelTaiLenDatabaseService layDuLieuExelTaiLenDatabaseService;


    @GetMapping("index")
    public String getAll(@RequestParam(defaultValue = "0") Integer page,
                         @RequestParam(required = false ) Long idSanPham ,
                         @RequestParam(required = false ) Long idLsp ,
                         @RequestParam(required = false ) Long idTh ,
                         @RequestParam(required = false ) Integer idCl ,
                          Model model) {
        listSpct = sanPhamChiTietReponsitory.findSanPhamChiTietByIdSanPham(idSanPham,idLsp,idTh,idCl);
        model.addAttribute("listSpct", listSpct);
        model.addAttribute("page", page);
        model.addAttribute("page1", 5);

        listSp = sanPhamService.getAll();
        model.addAttribute("listSp",listSp);

        listCl = chatLieuService.getList();
        model.addAttribute("listCl",listCl);

        listKt = kichThuocService.getList();
        model.addAttribute("listKt",listKt);

        listLsp = loaiSanPhamService.getAll();
        model.addAttribute("listLsp",listLsp);

        listMs = mauSacService.getAll();
        model.addAttribute("listMs",listMs);

        listTh = thuongHieuService.getList();
        model.addAttribute("listTh",listTh);

        model.addAttribute("idSp" , idSanPham);
        return "san_pham_chi_tiet/index";
    }

    @PostMapping("add")
    public String add( @RequestParam(required = false) MultipartFile file,@Valid @ModelAttribute SanPhamChiTiet sanPhamChiTiet, BindingResult bindingResult, Model model) {
        model.addAttribute("listSp",listSp = sanPhamService.getAll());
        model.addAttribute("listMs",listMs = mauSacService.getAll());
        model.addAttribute("listLsp",listLsp =loaiSanPhamService.getAll());
        model.addAttribute("listKt",listKt = kichThuocService.getList() );
        model.addAttribute("listTh",listTh = thuongHieuService.getList());
        model.addAttribute("listCl",listCl = chatLieuService.getList());
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors", bindingResult.getAllErrors());
        } else {
            Long idSanPham = sanPhamChiTiet.getIdSanPham().getId();
            Long idLoaiSanPham = sanPhamChiTiet.getIdLoaiSanPham().getId();
            Long idMauSac = sanPhamChiTiet.getIdMauSac().getId();
            Long idKichThuoc = sanPhamChiTiet.getIdKichThuoc().getId();
            Long idThuongHieu = sanPhamChiTiet.getIdThuongHieu().getId();
            Integer idChatLieu = sanPhamChiTiet.getIdChatLieu().getId();
            SanPhamChiTiet checkspct = sanPhamChiTietReponsitory.spCheck(idSanPham,idLoaiSanPham,idMauSac,idKichThuoc,idThuongHieu,idChatLieu);
            if(checkspct != null){
                model.addAttribute("error", "Sản phẩm đã tồn tại !");
            }else {
                sanPhamChiTietService.add(sanPhamChiTiet, file);
                model.addAttribute("pass", "Thêm thành công ✓");
            }

        }
        model.addAttribute("spct" ,sanPhamChiTiet);
        model.addAttribute("file" ,file);
        return "san_pham_chi_tiet/add";
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable Long id, @Valid @ModelAttribute SanPhamChiTiet sanPhamChiTiet, BindingResult bindingResult, Model model) {
        SanPhamChiTiet sanPhamChiTiet2 = sanPhamChiTietService.detail(id);
        model.addAttribute("spct", sanPhamChiTiet2);
        model.addAttribute("listSp",listSp = sanPhamService.getAll());
        model.addAttribute("listMs",listMs = mauSacService.getAll());
        model.addAttribute("listLsp",listLsp =loaiSanPhamService.getAll());
        model.addAttribute("listKt",listKt = kichThuocService.getList() );
        model.addAttribute("listTh",listTh = thuongHieuService.getList());
        model.addAttribute("listCl",listCl = chatLieuService.getList());
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors", bindingResult.getAllErrors());
            model.addAttribute("spct",sanPhamChiTiet);
        } else {
                model.addAttribute("pass", "Cập nhật thành công ✓ ");
                sanPhamChiTietService.add2(sanPhamChiTiet);
        }
        return "san_pham_chi_tiet/update";
    }


    @PostMapping("update2/{id}")
    public String updateAnh(@RequestParam MultipartFile file,@PathVariable Long id, @Valid @ModelAttribute SanPhamChiTiet sanPhamChiTiet, Model model) {
        model.addAttribute("listSp", listSp = sanPhamService.getAll());
        model.addAttribute("listMs", listMs = mauSacService.getAll());
        model.addAttribute("listLsp", listLsp = loaiSanPhamService.getAll());
        model.addAttribute("listKt", listKt = kichThuocService.getList());
        model.addAttribute("listTh", listTh = thuongHieuService.getList());
        model.addAttribute("listCl", listCl = chatLieuService.getList());
        model.addAttribute("pass", "Cập nhật ảnh thành công ✓ ");
        SanPhamChiTiet sanPhamChiTiet1 = sanPhamChiTietService.detail(id);
        model.addAttribute("spct", sanPhamChiTiet1);
        sanPhamChiTietService.add(sanPhamChiTiet,file);
        return "san_pham_chi_tiet/update";
    }


    @GetMapping("delete/{id}")
    public String delete(@RequestParam(defaultValue = "0") Integer page,@PathVariable Long id, Model model) {
        try {
            sanPhamChiTietService.delete(id);
            model.addAttribute( "errors","Xoá thành công ") ;
        }catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errors","Không được phép xóa sản phẩm này !");
        }
        Page<SanPhamChiTiet> page1 = sanPhamChiTietService.getAll(page);
        listSpct = page1.getContent();
        model.addAttribute("listSpct", listSpct);
        model.addAttribute("page", page);
        model.addAttribute("page1", page1.getTotalPages());
        return "redirect:/san-pham-chi-tiet/bo-loc?";
    }


    @GetMapping("form-add")
    public String formAdd( Model model) {
        model.addAttribute("listSp",listSp = sanPhamService.getAll());
        model.addAttribute("listMs",listMs = mauSacService.getAll());
        model.addAttribute("listLsp",listLsp =loaiSanPhamService.getAll());
        model.addAttribute("listKt",listKt = kichThuocService.getList());
        model.addAttribute("listTh",listTh = thuongHieuService.getList());
        model.addAttribute("listCl",listCl = chatLieuService.getList());
        return "san_pham_chi_tiet/add";
    }



    @GetMapping("search")
    public String search(@RequestParam("keyword") String keyword, Model model) {
        listSpct = sanPhamChiTietService.search(keyword);
        model.addAttribute("listSpct", listSpct);
        return "san_pham_chi_tiet/index";
    }


    @GetMapping("detail/{id}")
    public String detail( @PathVariable Long id, Model model) {
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietService.detail(id);
        model.addAttribute("spct", sanPhamChiTiet);
        model.addAttribute("listSp",listSp = sanPhamService.getAll());
        model.addAttribute("listMs",listMs = mauSacService.getAll());
        model.addAttribute("listLsp",listLsp =loaiSanPhamService.getAll());
        model.addAttribute("listKt",listKt = kichThuocService.getList() );
        model.addAttribute("listTh",listTh = thuongHieuService.getList());
        model.addAttribute("listCl",listCl = chatLieuService.getList());
        return "san_pham_chi_tiet/update";
    }

    @PostMapping("/uploadSpct")
    public String handleFileUpload(@RequestParam("file") MultipartFile file, Model model) {
        model.addAttribute("listSp",listSp = sanPhamService.getAll());
        model.addAttribute("listMs",listMs = mauSacService.getAll());
        model.addAttribute("listLsp",listLsp =loaiSanPhamService.getAll());
        model.addAttribute("listKt",listKt = kichThuocService.getList());
        model.addAttribute("listTh",listTh = thuongHieuService.getList());
        model.addAttribute("listCl",listCl = chatLieuService.getList());
        try {
            layDuLieuExelTaiLenDatabaseService.processExcelFile(file);
            model.addAttribute("mess" , layDuLieuExelTaiLenDatabaseService.getMessage());
            model.addAttribute("messNull" , layDuLieuExelTaiLenDatabaseService.getMessageNull());
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("mess" , "Lấy dữ liệu thất bại");
        }

        return "san_pham_chi_tiet/add";
    }

    @GetMapping("/hien-thi-sp")
    public String viewSp(Model model, @PageableDefault(size = 10) Pageable pageable) {
        Page<SanPhamDto> pageResult = sanPhamChiTietServiceImpl.getSp(pageable);
        model.addAttribute("listSpct", pageResult.getContent());
        model.addAttribute("currentPage", pageResult.getNumber() + 1); // Page numbers start from 1
        model.addAttribute("totalItems", pageResult.getTotalElements());
        model.addAttribute("totalPages", pageResult.getTotalPages());
        listSp = sanPhamService.getAll();
        model.addAttribute("listSp",listSp);

        listCl = chatLieuService.getList();
        model.addAttribute("listCl",listCl);

        listLsp = loaiSanPhamService.getAll();
        model.addAttribute("listLsp",listLsp);

        listTh = thuongHieuService.getList();
        model.addAttribute("listTh",listTh);

        return "san_pham_chi_tiet/hien_thi_sp";
    }

    @GetMapping("bo-loc")
    public String boLoc(@RequestParam(required = false) SanPham idSanPham ,
                        @RequestParam(required = false) LoaiSanPham idLoaiSanPham ,
                        @RequestParam(required = false) MauSac idMauSac ,
                        @RequestParam(required = false) KichThuoc idKichThuoc ,
                        @RequestParam(required = false) ThuongHieu idThuongHieu ,
                        @RequestParam(required = false) ChatLieu idChatLieu ,
                        @RequestParam(required = false) Long trangThai ,
                        @RequestParam(required = false) String danhMuc ,
                        @RequestParam(required = false) String gioiTinh ,
                        @RequestParam(required = false) Long toiThieu ,
                        @RequestParam(required = false) Long toiDa ,
                        Model model) {

        listSp = sanPhamService.getAll();
        model.addAttribute("listSp",listSp);

        listCl = chatLieuService.getList();
        model.addAttribute("listCl",listCl);

        listKt = kichThuocService.getList();
        model.addAttribute("listKt",listKt);

        listLsp = loaiSanPhamService.getAll();
        model.addAttribute("listLsp",listLsp);

        listMs = mauSacService.getAll();
        model.addAttribute("listMs",listMs);

        listTh = thuongHieuService.getList();
        model.addAttribute("listTh",listTh);

        listSpct = sanPhamChiTietReponsitory.boLoc(idSanPham,idLoaiSanPham,idMauSac,idKichThuoc,idThuongHieu,idChatLieu,trangThai,danhMuc,
                gioiTinh,toiThieu,toiDa);
        model.addAttribute("listSpct", listSpct);

        model.addAttribute("idSanPham",idSanPham);
        model.addAttribute("idMauSac",idMauSac);
        model.addAttribute("idLoaiSanPham",idLoaiSanPham);
        model.addAttribute("idChatLieu",idChatLieu);
        model.addAttribute("idKichThuoc",idKichThuoc);
        model.addAttribute("idThuongHieu",idThuongHieu);
        model.addAttribute("trangThai",trangThai);
        model.addAttribute("toiDa",toiDa);
        model.addAttribute("toiThieu",toiThieu);
        model.addAttribute("danhMuc",danhMuc);
        model.addAttribute("gioiTinh",gioiTinh);

        return "san_pham_chi_tiet/index";
    }

    @GetMapping("bo-loc-san-pham")
    public String boLocSanPham(@RequestParam(required = false) SanPham idSanPham ,
                        @RequestParam(required = false) LoaiSanPham idLoaiSanPham ,
                        @RequestParam(required = false) MauSac idMauSac ,
                        @RequestParam(required = false) KichThuoc idKichThuoc ,
                        @RequestParam(required = false) ThuongHieu idThuongHieu ,
                        @RequestParam(required = false) ChatLieu idChatLieu ,
                        @RequestParam(required = false) Long trangThai ,
                        @RequestParam(required = false) String danhMuc ,
                        @RequestParam(required = false) String gioiTinh ,
                        @RequestParam(required = false) Long toiThieu ,
                        @RequestParam(required = false) Long toiDa ,
                        Model model) {

        listSp = sanPhamService.getAll();
        model.addAttribute("listSp",listSp);

        listCl = chatLieuService.getList();
        model.addAttribute("listCl",listCl);

        listKt = kichThuocService.getList();
        model.addAttribute("listKt",listKt);

        listLsp = loaiSanPhamService.getAll();
        model.addAttribute("listLsp",listLsp);

        listMs = mauSacService.getAll();
        model.addAttribute("listMs",listMs);

        listTh = thuongHieuService.getList();
        model.addAttribute("listTh",listTh);

        listSpct = sanPhamChiTietReponsitory.boLoc(idSanPham,idLoaiSanPham,idMauSac,idKichThuoc,idThuongHieu,idChatLieu,trangThai,danhMuc,
                gioiTinh,toiThieu,toiDa);
        model.addAttribute("listSpct", listSpct);

        model.addAttribute("idSanPham",idSanPham);
        model.addAttribute("idMauSac",idMauSac);
        model.addAttribute("idLoaiSanPham",idLoaiSanPham);
        model.addAttribute("idChatLieu",idChatLieu);
        model.addAttribute("idKichThuoc",idKichThuoc);
        model.addAttribute("idThuongHieu",idThuongHieu);
        model.addAttribute("trangThai",trangThai);
        model.addAttribute("toiDa",toiDa);
        model.addAttribute("toiThieu",toiThieu);
        model.addAttribute("danhMuc",danhMuc);
        model.addAttribute("gioiTinh",gioiTinh);

        return "san_pham_chi_tiet/hien_thi_sp";
    }


}

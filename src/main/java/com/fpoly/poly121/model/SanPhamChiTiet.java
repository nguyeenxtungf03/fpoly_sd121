package com.fpoly.poly121.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Nationalized;
import org.hibernate.validator.cfg.defs.DecimalMinDef;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.NumberFormat;

import java.math.BigDecimal;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "san_pham_chi_tiet")
//@Accessors(chain = true)
public class SanPhamChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")

    private Long id;    @NotNull(message = "Không để trống sản phẩm")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_san_pham")
    private SanPham idSanPham;

    @NotNull(message = "Không để trống loại sản phẩm")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_loai_san_pham")
    private LoaiSanPham idLoaiSanPham;

    @NotNull(message = "Không để trống màu sắc")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_mau_sac")
    private MauSac idMauSac;

    @NotNull(message = "Không để trống kích thước")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_kich_thuoc")
    private KichThuoc idKichThuoc;

    @NotNull(message = "Không để trống thương hiệu")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_thuong_hieu")
    private ThuongHieu idThuongHieu;

    @NotNull(message = "Không để trống chất liệu")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_chat_lieu")
    private ChatLieu idChatLieu;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_khuyen_mai")
    private KhuyenMai idKhuyenMai;

    @NotNull(message = "Không để trống giá bán")
    @Min(value = 1 ,message = "Giá bán phải  > 0 ")
    @Column(name = "gia_ban")
    private Long giaBan;

    @NotNull(message = "Không để trống số lượng")
    @Min(value = 0 ,message = "Số lượng phải >= 0  ")
    @Column(name = "so_luong")
    private Long soLuong;


    @NotNull(message = "Không được để trống mô tả ")
    @NotBlank(message = "Không được để trống mô tả ")
    @Length( max = 100 , message = "Độ dài mô tả không quá 100 kí tự ")
    @Column(name = "mo_ta")
    private String moTa;


    @Column(name = "anh_san_pham")
    private String anhSanPham;

    @Column(name = "ngay_tao")
    private String ngayTao;

    @Column(name = "ngay_cap_nhat")
    private String ngayCapNhat;

    @NotNull(message = "Không được để trống trạng thái ")
    @Min(value = 0 ,message = "Không để trống trạng thái ")
    @Column(name = "trang_thai")
    private Long trangThai;


}
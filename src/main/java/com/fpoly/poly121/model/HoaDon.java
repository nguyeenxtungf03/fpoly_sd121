package com.fpoly.poly121.model;

import com.fpoly.poly121.security.dto.TaiKhoan;
import jakarta.persistence.*;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Nationalized;


import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "hoa_don")
@Accessors(chain = true)
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_khach_hang")
    private KhachHang idKhachHang;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ten_tai_khoan_tao_hd")
    private TaiKhoan tenTaiKhoanTaoHD;

    @Column(name = "tong_tien")
    private Long tongTien;

    @Column(name = "id_ma_giam_gia")
    private Long idMaGiamGia;

    @Column(name = "gia_giam")
    private Integer giaGiam;

    @Column(name = "nguoi_nhan")
    private String nguoiNhan;

    @Nationalized
    @Lob
    @Column(name = "dia_chi_nhan")
    private String diaChiNhan;

    @Lob
    @Column(name = "sdt_nguoi_nhan")
    private String sdtNguoiNhan;

    @Column(name = "phi_van_chuyen")
    private Integer phiVanChuyen;

    @Column(name = "thanh_tien")
    private Long thanhTien;

    @Lob
    @Column(name = "nguoi_tao")
    private String nguoiTao;

    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "hinh_thuc")
    private Long loaiHoaDon ;

    @Lob
    @Column(name = "nguoi_cap_nhat")
    private String nguoiCapNhat;

    @Column(name = "ngay_cap_nhat")
    private Date ngayCapNhat;

    @Column(name = "trang_thai")
    private Long trangThai;

    @Column(name = "da_xoa")
    private Boolean daXoa;

    @Column(name = "ma_hoa_don")
    private String maHoaDon;
}
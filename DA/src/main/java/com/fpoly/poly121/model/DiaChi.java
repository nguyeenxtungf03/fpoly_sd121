package com.fpoly.poly121.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "dia_chi")
public class DiaChi {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @Nationalized
    @Lob
    @Column(name = "ten_dia_chi")
    private String tenDiaChi;

    @Nationalized
    @Lob
    @Column(name = "loai_dia_chi")
    private String loaiDiaChi;

    @Column(name = "sdt", length = 15)
    private String sdt;

    @Lob
    @Column(name = "ma_tinh_thanh")
    private String maTinhThanh;

    @Lob
    @Column(name = "ma_quan_huyen")
    private String maQuanHuyen;

    @Lob
    @Column(name = "ma_phuong_xa")
    private String maPhuongXa;

    @Nationalized
    @Lob
    @Column(name = "ghi_chu")
    private String ghiChu;

    @Lob
    @Column(name = "nguoi_tao")
    private String nguoiTao;

    @Column(name = "ngay_tao")
    private LocalDate ngayTao;

    @Lob
    @Column(name = "nguoi_cap_nhat")
    private String nguoiCapNhat;

    @Column(name = "ngay_cap_nhat")
    private LocalDate ngayCapNhat;

    @Column(name = "trang_thai")
    private Integer trangThai;

    @Column(name = "da_xoa")
    private Boolean daXoa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_khach_hang")
    private KhachHang idKhachHang;

}
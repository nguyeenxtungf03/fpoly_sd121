package com.fpoly.poly121.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.math.BigDecimal;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "hang_khach_hang")
public class HangKhachHang {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @Lob
    @Column(name = "ten_hang")
    private String tenHang;

    @Nationalized
    @Lob
    @Column(name = "mo_ta")
    private String moTa;

    @Column(name = "diem_toi_thieu")
    private Integer diemToiThieu;

    @Column(name = "hinh_thuc_giam")
    private Boolean hinhThucGiam;

    @Column(name = "gia_tri_giam")
    private BigDecimal giaTriGiam;

    @Column(name = "gia_tri_giam_toi_da")
    private BigDecimal giaTriGiamToiDa;

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

}
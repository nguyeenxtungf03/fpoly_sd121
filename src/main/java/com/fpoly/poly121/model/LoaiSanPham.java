package com.fpoly.poly121.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "loai_san_pham")
public class LoaiSanPham {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Nationalized
    @Lob
    @NotBlank
    @NotNull
    @Column(name = "ten_loai")
    private String tenLoai;

    @Lob
    @Column(name = "nguoi_tao")
    private String nguoiTao;

    @Column(name = "gioi_tinh")
    private String gioiTinh;

    @Column(name = "danh_muc")
    private String danhMuc;

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
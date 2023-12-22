package com.fpoly.poly121.model;

import com.fpoly.poly121.security.dto.TaiKhoan;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "nhan_vien")
@Accessors(chain = true)
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ten_tai_khoan", referencedColumnName = "ten_tai_khoan")
    private TaiKhoan tenTaiKhoan;
    private String ten;
    @Column(name = "ten_dem")
    private String tenDem;
    private String ho;
    @Column(name = "ngay_sinh")
    private Date ngaySinh;
    private String sdt;
    private String email;
    @Column(name = "gioi_tinh")
    private Integer gioiTinh;
    @Column(name = "nguoi_tao")
    private String nguoiTao;
    @Column(name = "ngay_tao")
    private Date ngayTao;
    @Column(name = "nguoi_cap_nhat")
    private String nguoiCapNhat;
    @Column(name = "ngay_cap_nhat")
    private Date ngayCapNhat;
    @Column(name = "trang_thai")
    private Integer trangThai;
    @Column(name = "da_xoa")
    private Integer daXoa;
}

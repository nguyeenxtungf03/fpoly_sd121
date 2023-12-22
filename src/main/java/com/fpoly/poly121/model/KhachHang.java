package com.fpoly.poly121.model;

import com.fpoly.poly121.security.dto.TaiKhoan;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "khach_hang")
@Accessors(chain = true)
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ten_tai_khoan", referencedColumnName = "ten_tai_khoan")
    private TaiKhoan tenTaiKhoan;

    @Column(name = "ten")
    private String ten;

    @Column(name = "ten_dem")
    private String tenDem;

    @Column(name = "ho")
    private String ho;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "ngay_sinh")
    private Date ngaySinh;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "email")
    private String email;

    @Column(name = "gioi_tinh")
    private Boolean gioiTinh;

    @Column(name = "diem_tich_luy")
    private Long diemTichLuy;

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

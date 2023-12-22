package com.fpoly.poly121.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "khuyen_mai")

public class KhuyenMai {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @NotBlank
    @Column(name = "ten_khuyen_mai")
    private String tenKhuyenMai;

    @Column(name = "loai_khuyen_mai")
    private String loaiKhuyenMai;


    @Column(name = "ngay_bat_dau")
    private Date ngayBatDau ;

    @Column(name = "ngay_tao")
    private Date ngayTao ;

    @Column(name = "ngay_ket_thuc")
    private Date ngayKetThuc;

    @Digits(integer = 10, fraction = 0, message = "Giá trị phải là số nguyên không âm.")
    @Min(value = 0 ,message = "Giá trị > 0 ! ")
    @Column(name = "gia_tri")
    private Long giaTri;

    @Column(name = "trang_thai")
    private Integer trangThai;
}

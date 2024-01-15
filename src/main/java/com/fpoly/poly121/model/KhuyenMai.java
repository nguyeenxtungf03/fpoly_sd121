package com.fpoly.poly121.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import java.util.Date;

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

    @NotBlank(message = "Tên khuyến mại không để trống !")
    @NotNull (message = "Tên khuyến mại không để trống !")
    @Column(name = "ten_khuyen_mai")
    private String tenKhuyenMai;

    @NotBlank(message = "Loại khuyến mại không để trống !")
    @NotNull (message = "Loại khuyến mại không để trống !")
    @Column(name = "loai_khuyen_mai")
    private String loaiKhuyenMai;


    @NotNull (message = "Ngày bắt đầu không để trống !")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @Column(name = "ngay_bat_dau")
    private Date ngayBatDau ;



    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @NotNull (message = "Ngày kết thúc không để trống !")
    @Column(name = "ngay_ket_thuc")
    private Date ngayKetThuc;

    @NumberFormat(style = NumberFormat.Style.NUMBER)
    @Digits(integer = 10, fraction = 0, message = "Giá trị khuyến mại theo giá tiền không quá 10.000.000 VNĐ ")
    @NotNull (message = "Giá trị khuyến mại không để trống !")
    @Min(value = 1 ,message = "Giá trị khuyến mại phải > 0  ")
    @Column(name = "gia_tri")
    private Long giaTri;

    @Column(name = "trang_thai")
    private Integer trangThai;
}

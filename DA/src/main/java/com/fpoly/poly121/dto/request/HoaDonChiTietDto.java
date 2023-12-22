package com.fpoly.poly121.dto.request;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor


public class HoaDonChiTietDto {
    private Long id;
    private String ho;
    private String tenDem;
    private String ten;
    private Date ngaySinh;
    private String email;
    private String sdt;
    private Long soLuong;
    private Long thanhTien;
    private Long diem;
    private Integer trangThai;

}

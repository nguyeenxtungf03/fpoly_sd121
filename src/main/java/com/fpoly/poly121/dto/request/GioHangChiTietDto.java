package com.fpoly.poly121.dto.request;


import com.fpoly.poly121.model.GioHang;
import com.fpoly.poly121.model.SanPhamChiTiet;
import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GioHangChiTietDto {
    private GioHang idGioHang;
    private SanPhamChiTiet idSanPhamChiTiet;
    private Long soLuong;

}

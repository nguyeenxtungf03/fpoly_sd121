package com.fpoly.poly121.dto.request;


import com.fpoly.poly121.model.*;
import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SanPhamDto {

    private SanPham idSanPham;
    private LoaiSanPham idLoaiSanPham;
    private ThuongHieu idThuongHieu;
    private ChatLieu idChatLieu;
    private Long soLuong;
    private Long trangThai;
}

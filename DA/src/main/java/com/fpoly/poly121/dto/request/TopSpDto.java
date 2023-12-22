package com.fpoly.poly121.dto.request;


import com.fpoly.poly121.model.ChatLieu;
import com.fpoly.poly121.model.KichThuoc;
import com.fpoly.poly121.model.LoaiSanPham;
import com.fpoly.poly121.model.MauSac;
import com.fpoly.poly121.model.SanPham;
import com.fpoly.poly121.model.SanPhamChiTiet;
import com.fpoly.poly121.model.ThuongHieu;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TopSpDto {

    private SanPhamChiTiet idSanPhamChiTiet;
    private SanPham idSanPham;
    private LoaiSanPham idLoaiSanPham;
    private MauSac idMauSac;
    private KichThuoc idKichThuoc;
    private ChatLieu idChatLieu;
    private ThuongHieu idThuongHieu;
    private Long soLuong;
    private Long giaBan;
    private String anhSanPham;
    private Long trangThai;
}

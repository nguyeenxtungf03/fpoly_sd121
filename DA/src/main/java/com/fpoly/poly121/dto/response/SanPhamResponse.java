package com.fpoly.poly121.dto.response;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

@Getter @Setter
@Accessors(chain = true)
public class SanPhamResponse {
    public Long idSpct;
    public String ten;
    public String anh;
    public String mauSac;
    public String kichThuoc;
    public Long gia;
    public Long giaTruocKM;
    public Long  soLuong;
}

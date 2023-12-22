package com.fpoly.poly121.dto.request;

import com.fpoly.poly121.security.dto.TaiKhoan;
import lombok.Data;
import org.springframework.security.crypto.password.PasswordEncoder;

@Data
public class TaiKhoanDto {
    private String tenTaiKhoan;
    private String matKhau;
    private String sdt;

    public TaiKhoan toTaiKhoan(PasswordEncoder encoder) {
        return new TaiKhoan().setTenTaiKhoan(tenTaiKhoan)
                .setMatKhau(encoder.encode(matKhau))
                .setSdt(sdt);
    }
}

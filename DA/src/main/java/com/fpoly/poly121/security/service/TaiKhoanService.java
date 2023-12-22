package com.fpoly.poly121.security.service;

import com.fpoly.poly121.repository.TaiKhoanRepository;
import com.fpoly.poly121.security.dto.TaiKhoan;
import lombok.AllArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Objects;

@Service
@AllArgsConstructor
public class TaiKhoanService implements UserDetailsService {

    private final TaiKhoanRepository taiKhoanRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        TaiKhoan taiKhoan = taiKhoanRepository.findByTenTaiKhoan(username);
        if (Objects.isNull(taiKhoan)) throw new UsernameNotFoundException("User '" + username + "' not found");
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(taiKhoan.getChucVu()));
        return new User(taiKhoan.getTenTaiKhoan(), taiKhoan.getMatKhau(), authorities);
    }
}

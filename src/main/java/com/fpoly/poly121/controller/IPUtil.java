package com.fpoly.poly121.controller;

import com.fpoly.poly121.dto.request.GioHangChiTietDto;
import com.fpoly.poly121.service.GioHangChiTietService;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Collections;
import java.util.List;

public  class IPUtil {

    public static List<GioHangChiTietDto> getShoppingCartDetails(GioHangChiTietService gioHangChiTietService) {
        try {
            // Lấy đối tượng InetAddress đại diện cho máy tính hiện tại
            InetAddress localhost = InetAddress.getLocalHost();
            // Lấy địa chỉ IP của máy tính
            String ipAddress = localhost.getHostAddress();

            // Gọi service để lấy danh sách chi tiết giỏ hàng
            return gioHangChiTietService.getGioHangChiTiet(ipAddress);

        } catch (UnknownHostException e) {
            e.printStackTrace();
            // Handle exception or log the error
            return Collections.emptyList(); // Return an empty list in case of an exception
        }
    }
}
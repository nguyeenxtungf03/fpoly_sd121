package com.fpoly.poly121.controller;

import com.fpoly.poly121.dto.response.*;
import com.fpoly.poly121.service.GHNService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/ghn")
@AllArgsConstructor
public class GHNController {
    private final GHNService service;

    @GetMapping("/province")
    public Response<List<TinhResponse>> getListProvince() {
        return new Response<>(service.getProvinces());
    }

    @GetMapping("/district/{idTinh}")
    public Response<List<HuyenResponse>> getListDistrict(@PathVariable String idTinh) {
        return new Response<>(service.getDistricts(idTinh));
    }

    @GetMapping("/ward/{idHuyen}")
    public Response<List<XaResponse>> getListWard(@PathVariable String idHuyen) {
        return new Response<>(service.getWards(idHuyen));
    }

    @GetMapping("/transport-fee")
    public Response<PhiVanChuyenResponse> getTransportFee(@RequestParam(defaultValue = "0") String idHuyen,
                                                          @RequestParam(defaultValue = "0") String maXa) {
        return new Response<>(service.getTransportFee(idHuyen, maXa));
    }

}

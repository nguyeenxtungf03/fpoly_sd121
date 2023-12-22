package com.fpoly.poly121.controller;

import com.fpoly.poly121.service.impl.XuatExelVsWorldServiceImpl;
import com.itextpdf.text.DocumentException;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.io.OutputStream;


@Controller
public class XuatExelVsWordController {

    @Autowired
    private XuatExelVsWorldServiceImpl xuatExelVsWorldService;


    @GetMapping("/exportExcel")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        xuatExelVsWorldService.exportToExcel(response);
    }


    @GetMapping("/exportPdf")
    public void exportToPdf(HttpServletResponse response ) throws IOException, DocumentException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=person_data.pdf");
        OutputStream outputStream = response.getOutputStream();
        xuatExelVsWorldService.exportToPdf(outputStream);
    }

}

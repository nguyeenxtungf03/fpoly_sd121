package com.fpoly.poly121.service.impl;

import com.fpoly.poly121.model.SanPhamChiTiet;
import com.fpoly.poly121.repository.SanPhamChiTietReponsitory;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Service
public class XuatExelVsWorldServiceImpl {


    private final SanPhamChiTietReponsitory sanPhamChiTietReponsitory;

    @Autowired
    public XuatExelVsWorldServiceImpl(SanPhamChiTietReponsitory sanPhamChiTietReponsitory) {
        this.sanPhamChiTietReponsitory = sanPhamChiTietReponsitory;
    }


    public void exportToExcel(HttpServletResponse response) throws IOException {
        List<SanPhamChiTiet> sanPhamChiTiets = sanPhamChiTietReponsitory.findAll();

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Sản phẩm chi tiết");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("Tên sản phẩm");
        headerRow.createCell(1).setCellValue("Loại sản phẩm");
        headerRow.createCell(2).setCellValue("Màu sắc");
        headerRow.createCell(3).setCellValue("Kích thước");
        headerRow.createCell(4).setCellValue("Thương hiệu");
        headerRow.createCell(5).setCellValue("Chất liệu");
        headerRow.createCell(6).setCellValue("Giá bán");
        headerRow.createCell(7).setCellValue("Số lượng");
        headerRow.createCell(8).setCellValue("Mô tả");

        int rowNum = 1;
        for (SanPhamChiTiet spct : sanPhamChiTiets) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(spct.getIdSanPham().getTenSanPham());
            row.createCell(1).setCellValue(spct.getIdLoaiSanPham().getTenLoai());
            row.createCell(2).setCellValue(spct.getIdMauSac().getTenMauSac());
            row.createCell(3).setCellValue(spct.getIdKichThuoc().getTenKichThuoc());
            row.createCell(4).setCellValue(spct.getIdThuongHieu().getTenThuongHieu());
            row.createCell(5).setCellValue(spct.getIdChatLieu().getTenChatLieu());
            row.createCell(6).setCellValue(spct.getGiaBan());
            row.createCell(7).setCellValue(spct.getSoLuong());
            row.createCell(8).setCellValue(spct.getMoTa());
        }
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=Excel.xlsx");

        workbook.write(response.getOutputStream());
        workbook.close();
    }

    public void exportToPdf(OutputStream outputStream) throws DocumentException, IOException {
        Document document = new Document();
        PdfWriter.getInstance(document, outputStream);
        document.open();
        List<SanPhamChiTiet> sanPhamChiTiets = sanPhamChiTietReponsitory.findAll();

        // Tiêu đề
        Font titleFont = new Font(BaseFont.createFont("c:/windows/fonts/arial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED), 18, Font.BOLD, BaseColor.BLACK);
        Paragraph title = new Paragraph("Danh sách Sản phẩm chi tiết", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);

        // Thêm một bảng để hiển thị dữ liệu
        PdfPTable table = new PdfPTable(3); // 3 cột cho ID, Giá bán, Mô tả
        table.setWidthPercentage(100);

        // Header của bảng
        Font headerFont = new Font(BaseFont.createFont("c:/windows/fonts/arial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED), 14, Font.BOLD, BaseColor.WHITE);
        PdfPCell headerCell;
        String[] headers = {"ID", "Giá bán", "Mô tả"};
        for (String header : headers) {
            headerCell = new PdfPCell(new Phrase(header, headerFont));
            headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            headerCell.setBackgroundColor(BaseColor.GRAY);
            table.addCell(headerCell);
        }

        // Dữ liệu từ danh sách sản phẩm chi tiết
        Font dataFont = new Font(BaseFont.createFont("c:/windows/fonts/arial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED), 12);
        for (SanPhamChiTiet spct : sanPhamChiTiets) {
            table.addCell(new PdfPCell(new Phrase(String.valueOf(spct.getId()), dataFont)));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(spct.getGiaBan()), dataFont)));
            table.addCell(new PdfPCell(new Phrase(spct.getMoTa(), dataFont)));
        }

        document.add(table);
        document.close();
    }

}

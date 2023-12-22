package com.fpoly.poly121.service.impl;

import com.fpoly.poly121.model.ChatLieu;
import com.fpoly.poly121.model.KichThuoc;
import com.fpoly.poly121.model.LoaiSanPham;
import com.fpoly.poly121.model.MauSac;
import com.fpoly.poly121.model.SanPham;
import com.fpoly.poly121.model.SanPhamChiTiet;
import com.fpoly.poly121.model.ThuongHieu;
import com.fpoly.poly121.repository.ChatLieuRepository;
import com.fpoly.poly121.repository.KichThuocRepository;
import com.fpoly.poly121.repository.LoaiSanPhamRepository;
import com.fpoly.poly121.repository.MauSacReponsitory;
import com.fpoly.poly121.repository.SanPhamChiTietReponsitory;
import com.fpoly.poly121.repository.SanPhamReponsitory;
import com.fpoly.poly121.repository.ThuongHieuRepository;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;

@Service
public class LayDuLieuExelTaiLenDatabaseService {

    @Autowired
    private SanPhamReponsitory sanPhamRepository;

    @Autowired
    private SanPhamChiTietReponsitory sanPhamChiTietRepository;

    @Autowired
    private ChatLieuRepository chatLieuReponsitory;

    @Autowired
    private KichThuocRepository kichThuocReponsitory;

    @Autowired
    private ThuongHieuRepository thuongHieuReponsitory;

    @Autowired
    private MauSacReponsitory mauSacReponsitory;

    @Autowired
    private LoaiSanPhamRepository loaiSanPhamReponsitory;

    private String message;

    public String getMessage() {
        return message;
    }

    private String messageNull;

    public String getMessageNull() {
        return messageNull;
    }


    public void processExcelFile(MultipartFile file) throws IOException {
        try (InputStream inputStream = file.getInputStream()) {
            Workbook workbook = WorkbookFactory.create(inputStream);
            Sheet sheet = workbook.getSheetAt(0); // assuming data is in the first sheet

            int rowStart = sheet.getFirstRowNum() + 1; // skip the header row
            int rowEnd = sheet.getLastRowNum();
            for (int rowNum = rowStart; rowNum <= rowEnd; rowNum++) {
                Row row = sheet.getRow(rowNum);
                // Check if the row is not null
                if (row != null) {
                    try {
                        Cell cellTenSanPham = row.getCell(0);
                        Cell cellTenLoai = row.getCell(1);
                        Cell cellTenMauSac = row.getCell(2);
                        Cell cellTenKichThuoc = row.getCell(3);
                        Cell cellTenThuonghieu = row.getCell(4);
                        Cell cellTenChatlieu = row.getCell(5);
                        Cell cellGiaBan = row.getCell(6);
                        Cell cellMoTa = row.getCell(7);
                        try {
                            message = "";
                            messageNull = "";
                            if (cellTenSanPham == null) {
                                // Nếu sản phẩm chưa tồn tại
                                messageNull = "[" + "A" + (rowNum + 1) + "] " + "Sản phẩm không để trống ! ";
                                return;
                            }
                            if (cellTenLoai == null) {
                                // Nếu sản phẩm chưa tồn tại
                                messageNull = "[" + "B" + (rowNum + 1) + "] " + "Loại sản phẩm không để trống ! ";
                                return;
                            }
                            if (cellTenMauSac == null) {
                                // Nếu sản phẩm chưa tồn tại
                                messageNull = "[" + "C" + (rowNum + 1) + "]" + " Màu sắc không để trống ! ";
                                return;
                            }
                            if (cellTenKichThuoc == null) {
                                // Nếu sản phẩm chưa tồn tại
                                messageNull = "[" + "D" + (rowNum + 1) + "] " + "Kích thước không để trống ! ";
                                return;
                            }

                            if (cellTenThuonghieu == null) {
                                // Nếu sản phẩm chưa tồn tại
                                messageNull = "[" + "E" + (rowNum + 1) + "] " + "Thương Hiệu không để trống ! ";
                                return;
                            }
                            if (cellTenChatlieu == null) {
                                // Nếu sản phẩm chưa tồn tại
                                messageNull = "[" + "F" + (rowNum + 1) + "] " + "Chất liệu không để trống ! ";
                                return;
                            }

                            if (cellGiaBan == null) {
                                // Nếu sản phẩm chưa tồn tại
                                messageNull = "Giá bán không để trống ! ";
                                return;
                            }
                            if (cellTenSanPham != null && cellGiaBan != null  && cellTenLoai != null && cellTenKichThuoc != null && cellTenThuonghieu != null && cellTenMauSac != null && cellTenChatlieu != null) {
                                String tenSanPham = getCellValueAsString(cellTenSanPham);
                                String tenLoai = getCellValueAsString(cellTenLoai);
                                String tenMausac = getCellValueAsString(cellTenMauSac);
                                String tenKichThuoc = getCellValueAsString(cellTenKichThuoc);
                                String tenThuongHieu = getCellValueAsString(cellTenThuonghieu);
                                String tenChatLieu = getCellValueAsString(cellTenChatlieu);
                                Long giaBan = getCellValueAsLong(cellGiaBan);
                                String moTa = getCellValueAsString(cellMoTa);
                                SanPhamChiTiet spct1 = sanPhamChiTietRepository.sp(
                                        tenSanPham, tenLoai, tenMausac, tenKichThuoc, tenThuongHieu, tenChatLieu);

                                if (spct1 != null) {
                                    message = "Dòng " + (rowNum + 1) + ": Sản phẩm chi tiết đã tồn tại!";

                                } else {
                                    // Kiểm tra xem sản phẩm đã tồn tại trong cơ sở dữ liệu chưa
                                    SanPham existingSanPham = sanPhamRepository.findByTenSanPham(tenSanPham);
                                    LoaiSanPham existingLoaiSanPham = loaiSanPhamReponsitory.findByTenLoai(tenLoai);
                                    MauSac existingMauSac = mauSacReponsitory.findByTenMauSac(tenMausac);
                                    ThuongHieu existingThuongHieu = thuongHieuReponsitory.findByTenThuongHieu(tenThuongHieu);
                                    KichThuoc existingKichThuoc = kichThuocReponsitory.findByTenKichThuoc(tenKichThuoc);
                                    ChatLieu existingChatLieu = chatLieuReponsitory.findByTenChatLieu(tenChatLieu);
                                    //sự trùng lặp của sản phẩm chi tiết
                                    if (existingSanPham == null) {
                                        // Nếu sản phẩm chưa tồn tại
                                        messageNull = "[" + "A" + (rowNum + 1) + "]" + " : " + "Tên sản phẩm " + "'" + tenSanPham + "'" + " không tồn tại ";
                                        return;

                                    }
                                    if (existingLoaiSanPham == null) {
                                        // Nếu sản phẩm chưa tồn tại
                                        messageNull = "[" + "B" + (rowNum + 1) + "]" + " : " + "Loại sản phẩm " + "'" + tenLoai + "'" + " không tồn tại ";
                                        return;

                                    }
                                    if (existingMauSac == null) {
                                        // Nếu sản phẩm chưa tồn tại
                                        messageNull = "[" + "C" + (rowNum + 1) + "]" + " : " + "Màu sắc " + "'" + tenMausac + "'" + " không tồn tại ";
                                        return;

                                    }
                                    if (existingKichThuoc == null) {
                                        // Nếu sản phẩm chưa tồn tại
                                        messageNull = "[" + "D" + (rowNum + 1) + "]" + " : " + "Kích thước " + "'" + tenKichThuoc + "'" + " không tồn tại ";
                                        return;

                                    }

                                    if (existingThuongHieu == null) {
                                        // Nếu sản phẩm chưa tồn tại
                                        messageNull = "[" + "E" + (rowNum + 1) + "]" + " : " + "Thương hiệu " + "'" + tenThuongHieu + "'" + " không tồn tại ";
                                        return;

                                    }
                                    if (existingChatLieu == null) {
                                        // Nếu sản phẩm chưa tồn tại
                                        messageNull = "[" + "F" + (rowNum + 1) + "]" + " : " + "Chất liệu " + "'" + tenChatLieu + "'" + " không tồn tại ";
                                        return;
                                    }
                                    if (giaBan == null) {
                                        // Nếu sản phẩm chưa tồn tại
                                        messageNull = "[" + "G" + (rowNum + 1) + "]" + " : " + "Giá bán phải là số ";
                                        return;

                                    } else {
                                        SanPhamChiTiet spct = new SanPhamChiTiet();
                                        if (existingSanPham != null && existingLoaiSanPham != null && existingMauSac != null && existingThuongHieu != null && existingKichThuoc != null && existingChatLieu != null) {
                                            // Nếu sản phẩm đã tồn tại, thiết lập mối quan hệ với SanPham đã tồn tại
                                            spct.setIdLoaiSanPham(existingLoaiSanPham);
                                            spct.setIdSanPham(existingSanPham);
                                            spct.setIdChatLieu(existingChatLieu);
                                            spct.setIdMauSac(existingMauSac);
                                            spct.setIdKichThuoc(existingKichThuoc);
                                            spct.setIdThuongHieu(existingThuongHieu);
                                            spct.setGiaBan(giaBan);
                                            spct.setSoLuong(0L);
                                            spct.setMoTa(moTa);
                                            spct.setTrangThai(1L);
                                            sanPhamChiTietRepository.save(spct);
                                            messageNull = "";
                                            message = "Thêm thành công ";

                                        }

                                    }
                                }
                            }
                        } catch (Exception e) {
                            messageNull = "";
                            message = "Thêm thành công ";
                            e.printStackTrace();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } else {
                    message = "Thông tin sản phẩm bắt buộc từ dòng thứ 2 !";
                    return;
                }
            }
        } catch (Exception e) {
            message = "Lỗi đọc file Excel!";
            e.printStackTrace();
        }
    }

    private Long getCellValueAsLong(Cell cell) {
        if (cell.getCellType() == CellType.NUMERIC) {
            return Math.round(cell.getNumericCellValue());
        } else if (cell.getCellType() == CellType.STRING) {
            try {
                return Long.parseLong(cell.getStringCellValue());
            } catch (NumberFormatException e) {
                // Xử lý trường hợp không thể chuyển đổi thành số nguyên
                e.printStackTrace();
                return null;
            }
        } else {
            // Xử lý các trường hợp khác (kiểu BOOLEAN, ERROR, FORMULA, BLANK, ...)
            return null;
        }
    }

    private String getCellValueAsString(Cell cell) {
        if (cell.getCellType() == CellType.STRING) {
            return cell.getStringCellValue();
        } else if (cell.getCellType() == CellType.NUMERIC) {
            return String.valueOf(cell.getNumericCellValue());
        } else if (cell.getCellType() == CellType.BOOLEAN) {
            return String.valueOf(cell.getBooleanCellValue());
        } else {
            // Handle other cell types as needed
            return cell.getStringCellValue();
        }
    }

}
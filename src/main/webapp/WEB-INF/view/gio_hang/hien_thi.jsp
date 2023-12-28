<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

    <title>Hexashop - Product Detail Page</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/assets/css/font-awesome.css">

    <link rel="stylesheet" href="/assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="/assets/css/gio-hang.css">

    <link rel="stylesheet" href="/assets/css/owl-carousel.css">

    <link rel="stylesheet" href="/assets/css/lightbox.css">
    <!--

    TemplateMo 571 Hexashop

    https://templatemo.com/tm-571-hexashop

    -->
</head>

<body>


<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav" style="text-transform: uppercase">
                    <!-- ***** Logo Start ***** -->
                    <a href="/trang-chu" class="logo">
                        <img src="/assets/images/logo.png">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="/trang-chu">TRANG CHỦ</a></li>
                        <li class="scroll-to-section submenu">
                            <a href="#men">NAM</a>
                            <ul>
                                <li><a href="about.html">Áo khoác</a></li>
                                <li><a href="about.html">Áo phông</a></li>
                                <li><a href="about.html">Quần jean</a></li>
                            </ul>
                        </li>
                        <li class="scroll-to-section submenu">
                            <a href="#women">NỮ</a>
                            <ul>
                                <li><a href="about.html">Áo khoác</a></li>
                                <li><a href="about.html">Áo phông</a></li>
                                <li><a href="about.html">Quần jean</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="">VỀ POLY121</a>
                            <ul>
                                <li><a href="/trang-chu/all-san-pham">TẤT CẢ SẢN PHẨM</a></li>
                                <li><a href="about.html">BẢO VỆ KHÁCH HÀNG</a></li>
                                <li><a href="about.html">ƯU ĐÃI & CHÍNH SÁCH</a></li>
                                <li><a href="about.html">CÂU CHUYỆN</a></li>
                            </ul>
                        </li>
                        <li id="cart-item-count" class="scroll-to-section"><a href="/gio-hang/hien-thi">
                            <svg style="margin-top: -3px" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                 fill="currentColor" class="bi bi-bag-fill" viewBox="0 0 16 16">
                                <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/>
                            </svg>
                            GIỎ HÀNG</a><span id="cart-count">${fn:length(listGhct)}</span></li>
                        <c:if test="${!isAuth}">
                            <li class="scroll-to-section" style="margin-right: -25px"><a href="/auth/dang-ky">
                                <svg style="margin-top: -3px" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                     fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                    <path fill-rule="evenodd"
                                          d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                </svg>
                                ĐĂNG KÝ |</a></li>
                            <li class="scroll-to-section"><a href="/auth/dang-nhap">ĐĂNG NHẬP</a></li>
                        </c:if>
                        <c:if test="${isAuth}">
                            <li class="submenu">
                                <a href="#">
                                    <svg style="margin-top: -3px" xmlns="http://www.w3.org/2000/svg" width="20"
                                         height="20" fill="currentColor" class="bi bi-person-circle"
                                         viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                        <path fill-rule="evenodd"
                                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                    </svg>
                                    <c:if test="${isAdmin}"> ADMIN</c:if>
                                    <c:if test="${isStaff}"> NHÂN VIÊN</c:if>
                                    <c:if test="${isUser}"> CÁ NHÂN</c:if>
                                </a>
                                <ul>
                                    <c:if test="${isUser || isAdmin || isStaff}">
                                        <li><a href="/trang-chu/detail-nguoi-dung"
                                               style="font-size: 16px; text-transform: uppercase">Tàikhoản
                                            : ${username }</a></li>
                                    </c:if>
                                    <c:if test="${isUser || isAdmin || isStaff}">
                                        <li><a href="/trang-chu/hoa-don">HÓA ĐƠN</a></li>
                                    </c:if>
                                    <c:if test="${isAdmin}">
                                        <li><a href="/hoa-don/thong-ke">QUẢN LÝ</a></li>
                                    </c:if>
                                    <c:if test="${isAdmin || isStaff}">
                                        <li><a href="/ban-hang">BÁN HÀNG</a></li>
                                    </c:if>
                                    <li><a href="about.html">ĐỔI MẬT KHẨU</a></li>
                                    <c:if test="${isAdmin || isUser}">
                                        <li><a href="/logout">ĐĂNG XUẤT</a></li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>


<section style="margin-top: 100px" class="section" id="product">
    <div class="container">
        <div class="section-heading">
            <h2 style="text-align: center">Giỏ Hàng</h2>
        </div>
        <br>
        <span style="color: red ; margin: 0 0 5px 5px ; padding: 2px">
            <c:if test="${not empty errors}">
                [ ${errors} ]
            </c:if>
        </span>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Hình Ảnh</th>
                <th scope="col">Sản Phẩm</th>
                <th scope="col">Số Lượng</th>
                <th scope="col">Đơn Giá</th>
                <th scope="col">Thành Tiền</th>
                <th scope="col">Chức Năng</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listGhct}" var="gh">
                <tr>
                    <form action="/gio-hang/update-so-luong" method="post">
                        <td><a href="/trang-chu/chi-tiet/${gh.idSanPhamChiTiet.id}"><img
                                src="/assets/images/imgSp/${gh.idSanPhamChiTiet.anhSanPham}" alt="Product"
                                class="product-image"></a></td>
                        <td>${gh.idSanPhamChiTiet.idSanPham.tenSanPham} <c:if test="${gh.idSanPhamChiTiet.soLuong < 1}"><small style="color: red">( Hết hàng )</small></c:if> <br> [ ${gh.idSanPhamChiTiet.idMauSac.tenMauSac}
                            - ${gh.idSanPhamChiTiet.idKichThuoc.tenKichThuoc} ] <span
                                    style="color: #b3b7bb ;font-size: 12px">(Số lượng còn ${gh.idSanPhamChiTiet.soLuong})</span>
                        </td>
                        <td>
                            <div class="right-content">
                                <div class="quantity buttons_added">
                                    <input onchange="updateSelection()"  type="submit" value="-"
                                           class="minus">
                                    <input  type="number" step="1"
                                           name="soLuongThem" value="${gh.soLuong}"
                                           title="Qty" class="input-text qty text quantity-input" size="4"
                                           pattern="" inputmode="">
                                    <input onchange="updateSelection()" id="quantityAlert1"
                                           type="submit" value="+"
                                           class="plus">
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex">
                                <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.loaiKhuyenMai == null or gh.idSanPhamChiTiet.idKhuyenMai.ngayBatDau > newDate}">
                                    <fmt:formatNumber
                                            value="${gh.idSanPhamChiTiet.giaBan}"
                                            pattern="##,###,###"></fmt:formatNumber> ₫
                                </c:if>
                                <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.loaiKhuyenMai == 'percentage' and gh.idSanPhamChiTiet.idKhuyenMai.ngayBatDau < newDate}">
                                    <span> <small style="color: red ; text-decoration: line-through"><fmt:formatNumber
                                            value="${gh.idSanPhamChiTiet.giaBan}"
                                            pattern="##,###,###"></fmt:formatNumber> ₫</small>  <fmt:formatNumber
                                            value="${gh.idSanPhamChiTiet.giaBan - (gh.idSanPhamChiTiet.giaBan * gh.idSanPhamChiTiet.idKhuyenMai.giaTri / 100)}"
                                            pattern="##,###,###"></fmt:formatNumber>  ₫</span>
                                </c:if>
                                <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.loaiKhuyenMai == 'product' and gh.idSanPhamChiTiet.idKhuyenMai.ngayBatDau < newDate }">
                                <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.giaTri <= gh.idSanPhamChiTiet.giaBan}">
                                <span>
                                            <span> <small
                                                    style="color: red ; text-decoration: line-through"><fmt:formatNumber
                                                    value="${gh.idSanPhamChiTiet.giaBan}"
                                                    pattern="##,###,###"></fmt:formatNumber> ₫</small> <fmt:formatNumber
                                                    value="${gh.idSanPhamChiTiet.giaBan - gh.idSanPhamChiTiet.idKhuyenMai.giaTri}"
                                                    pattern="##,###,###"></fmt:formatNumber> ₫</span>
                                    </c:if>
                                    <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.giaTri > gh.idSanPhamChiTiet.giaBan}">
                                            <span> <small
                                                    style="color: red ; text-decoration: line-through"><fmt:formatNumber
                                                    value="${gh.idSanPhamChiTiet.giaBan}"
                                                    pattern="##,###,###"></fmt:formatNumber> ₫</small>
                                        <span> 0 ₫</span>
                                    </c:if>
                                </c:if>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex">
                                <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.loaiKhuyenMai == null or gh.idSanPhamChiTiet.idKhuyenMai.ngayBatDau > newDate}">
                                    <fmt:formatNumber
                                            value="${gh.idSanPhamChiTiet.giaBan * gh.soLuong}"
                                            pattern="##,###,###"></fmt:formatNumber> ₫
                                </c:if>
                                <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.loaiKhuyenMai == 'percentage' and gh.idSanPhamChiTiet.idKhuyenMai.ngayBatDau < newDate}">
                                <span> <fmt:formatNumber
                                        value="${(gh.idSanPhamChiTiet.giaBan - (gh.idSanPhamChiTiet.giaBan * gh.idSanPhamChiTiet.idKhuyenMai.giaTri / 100)) * gh.soLuong}"
                                        pattern="##,###,###"></fmt:formatNumber>  ₫</span>
                                </c:if>
                                <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.loaiKhuyenMai == 'product' and gh.idSanPhamChiTiet.idKhuyenMai.ngayBatDau < newDate }">
                                    <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.giaTri <= gh.idSanPhamChiTiet.giaBan}">
                                        <span><fmt:formatNumber
                                                value="${(gh.idSanPhamChiTiet.giaBan - gh.idSanPhamChiTiet.idKhuyenMai.giaTri) * gh.soLuong}"
                                                pattern="##,###,###"></fmt:formatNumber> ₫ </span>
                                    </c:if>
                                    <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.giaTri > gh.idSanPhamChiTiet.giaBan}">
                                        <span> 0 ₫</span>
                                    </c:if>
                                </c:if>
                            </div>
                        </td>

                        <div style="display: none">
                            <input type="hidden" name="idGioHang" value="${gh.idGioHang.id}">
                            <input type="hidden" name="idSpct"
                                   value="${gh.idSanPhamChiTiet.id}">
                        </div>
                        <button style="background: #34ce57 ;display: none" type="submit" id="submitButton"
                                class="btn-sm">Cập nhật
                        </button>
                    </form>
                    <td>
                        <form method="get" action="/gio-hang/delete/${gh.idSanPhamChiTiet.id}">
                            <button type="submit" class="btn-sm" style="background: crimson">Xóa</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            <c:forEach items="${listGhct}" var="gh">
                <td style="display: none">
                    <div class="d-flex">
                        <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.loaiKhuyenMai == null or gh.idSanPhamChiTiet.idKhuyenMai.ngayBatDau > newDate}">
                            <c:set var="productAmount" value="${gh.idSanPhamChiTiet.giaBan * gh.soLuong}"/>
                            <c:set var="totalAmount" value="${totalAmount + productAmount}"/>
                        </c:if>
                        <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.loaiKhuyenMai == 'percentage' and gh.idSanPhamChiTiet.idKhuyenMai.ngayBatDau < newDate}">
                            <c:set var="discountedAmount"
                                   value="${(gh.idSanPhamChiTiet.giaBan - (gh.idSanPhamChiTiet.giaBan * gh.idSanPhamChiTiet.idKhuyenMai.giaTri / 100)) * gh.soLuong}"/>
                            <c:set var="totalAmount" value="${totalAmount + discountedAmount}"/>
                        </c:if>
                        <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.loaiKhuyenMai == 'product' and gh.idSanPhamChiTiet.idKhuyenMai.ngayBatDau < newDate }">
                            <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.giaTri <= gh.idSanPhamChiTiet.giaBan}">
                                <c:set var="discountedAmount"
                                       value="${(gh.idSanPhamChiTiet.giaBan - gh.idSanPhamChiTiet.idKhuyenMai.giaTri) * gh.soLuong}"/>
                                <c:set var="totalAmount" value="${totalAmount + discountedAmount}"/>
                            </c:if>
                            <c:if test="${gh.idSanPhamChiTiet.idKhuyenMai.giaTri > gh.idSanPhamChiTiet.giaBan}">
                            </c:if>
                        </c:if>
                    </div>
                </td>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${not empty pass}">
            <p style="color: #34ce57 ;text-align: center ; font-size: xx-large ; padding: 20px">${pass}</p>
            <small style="font-size : 20px;justify-content: center;display: flex;flex-wrap: wrap;"><a href="http://localhost:8080/trang-chu/hoa-don-chi-tiet?idHD=${idHoaDon}">Theo dõi đơn hàng  <i class="bi bi-arrow-right-circle-fill"></i></a></small>
            <br>
        </c:if>
        <div class="text-left">
            <span>* Lưu ý : Tổng số lượng đơn hàng cho phép tối đa 20 sản phẩm </span>
        </div>
        <div class="text-right">
            <p><strong> <c:set var="totalQuantity" value="0"/>
                <c:forEach var="gh" items="${listGhct}">
                    <c:set var="totalQuantity"
                           value="${totalQuantity + gh.idSanPhamChiTiet.giaBan * gh.soLuong - (gh.idSanPhamChiTiet.idKhuyenMai.giaTri * gh.soLuong)}"/>
                </c:forEach></strong>
            </p>

            <c:if test="${not empty listGhct }">
                Tổng số tiền <span style="font-weight: 600"> : <fmt:formatNumber value="${totalAmount}"
                                                                                 pattern="##,###,###"></fmt:formatNumber> ₫
    </span><br>
                Phí vận chuyển : <span id="shippingFeeDisplay" style="font-weight: 600">0 ₫</span><br>
                Thành tiền <span style="font-weight: 600"> : <span id="totalAmount"><fmt:formatNumber
                    value="${totalAmount  }"
                    pattern="##,###,###"></fmt:formatNumber> ₫</span>
            </span><br>
            </c:if>
        </div>
    </div>
</section>
<section style="margin-top: 10px" class="section">
    <div class="container">
        <h2 class="mb-4">Thông tin khách hàng</h2>
        <form method="post" action="/gio-hang/thanh-toan">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="ho">* Họ và tên đệm:</label>
                    <input name="hoNguoiNhan" value="${hoNguoiNhan}" type="text" class="form-control" id="ho"
                           placeholder="Nhập họ và tên đệm của bạn"
                           required>
                </div>
                <div class="form-group col-md-6">
                    <label for="ten">* Tên:</label>
                    <input name="tenNguoiNhan" value="${tenNguoiNhan}" type="text" class="form-control" id="ten"
                           placeholder="Nhập tên của bạn"
                           required>
                </div>
            </div>
            <div class="form-group">
                <label for="sdt">* Số Điện Thoại:</label>
                <input name="sdtNguoiNhan" type="number" value="${sdtNguoiNhan}"
                       oninput="limitAndStartWithZero(this, 10)" class="form-control"
                       id="sdt" placeholder="Nhập số điện thoại"
                       required>
            </div>

            <div class="form-group">
                <label for="province">* Địa chỉ:</label>
                <div class="row-12" style="display: flex; justify-content: space-between">
                    <select class="col-md-4 form-control" name="tinh" id="province" required>
                    </select>
                    <select class="col-md-4 form-control" name="huyen" id="district" required>
                        <option value="">Chọn quận</option>
                    </select>
                    <select class="col-md-3 form-control" name="phuong" id="ward" required>
                        <option value="">Chọn phường</option>
                    </select>
                </div>
                <textarea name="diaChi" style="display: none" id="result" class="form-control" rows="3"
                          placeholder="Nhập địa chỉ của bạn"
                >${diaChi}</textarea>
                <br>
                <!-- Thêm phần hiển thị giá vận chuyển -->
                <div class="form-group">
                    <label for="shippingFeeInput">Phí Vận Chuyển: 0 VNĐ</label>
                    <input name="phiVanChuyen" style="display: none" value="0" type="text" class="form-control"
                           id="shippingFeeInput"
                           readonly>
                </div>
            </div>
            <label>* Địa Chỉ Cụ Thể:</label>

            <textarea name="diaChiNhan" class="form-control" rows="3" placeholder="Nhập địa chỉ của bạn"
            >${diaChiNhan} </textarea><br>
            <span style="color: red">${notBlank}</span>
            <div class="text-center">
                <button type="submit" style="background: black ; color: white ; border: black solid 2px"
                        onclick="confirmAction(event)"  class="btn btn-primary">Đặt Hàng
                </button>
            </div>
        </form>
    </div>
</section>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="first-item">
                    <div class="logo">
                        <img src="/assets/images/white-logo.png" alt="hexashop ecommerce templatemo">
                    </div>
                    <ul>
                        <li><a href="#">16501 Collins Ave, Sunny Isles Beach, FL 33160, United States</a></li>
                        <li><a href="#">hexashop@company.com</a></li>
                        <li><a href="#">010-020-0340</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3">
                <h4>Shopping &amp; Categories</h4>
                <ul>
                    <li><a href="#">Men’s Shopping</a></li>
                    <li><a href="#">Women’s Shopping</a></li>
                    <li><a href="#">Kid's Shopping</a></li>
                </ul>
            </div>
            <div class="col-lg-3">
                <h4>Useful Links</h4>
                <ul>
                    <li><a href="#">Homepage</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Help</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
            </div>
            <div class="col-lg-3">
                <h4>Help &amp; Information</h4>
                <ul>
                    <li><a href="#">Help</a></li>
                    <li><a href="#">FAQ's</a></li>
                    <li><a href="#">Shipping</a></li>
                    <li><a href="#">Tracking ID</a></li>
                </ul>
            </div>
            <div class="col-lg-12">
                <div class="under-footer">
                    <p>Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved.

                        <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a>
                    </p>
                    <ul>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-behance"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.26.1/axios.min.js"
        integrity="sha512-bPh3uwgU5qEMipS/VOmRqynnMXGGSRv+72H/N260MQeXZIK4PG48401Bsby9Nq5P5fz7hy5UGNmC/W1Z51h2GQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/assets/js/index.js"></script>

<!-- jQuery -->
<script src="/assets/js/jquery-2.1.0.min.js"></script>

<!-- Bootstrap -->
<script src="/assets/js/popper.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="/assets/js/owl-carousel.js"></script>
<script src="/assets/js/accordions.js"></script>
<script src="/assets/js/datepicker.js"></script>
<script src="/assets/js/scrollreveal.min.js"></script>
<script src="/assets/js/waypoints.min.js"></script>
<script src="/assets/js/jquery.counterup.min.js"></script>
<script src="/assets/js/imgfix.min.js"></script>
<script src="/assets/js/slick.js"></script>
<script src="/assets/js/lightbox.js"></script>
<script src="/assets/js/isotope.js"></script>
<script src="/assets/js/quantity.js"></script>

<!-- Global Init -->
<script src="/assets/js/custom.js"></script>
<script>
    function updateSelection() {
        // Thực hiện các thao tác cập nhật hoặc gọi hàm xử lý khi radio button thay đổi
        console.log('Radio button changed');
        // Thêm mã JavaScript của bạn tại đây, ví dụ như kích hoạt sự kiện của button
        document.getElementById('submitButton').click();
    }
</script>
<script>
    function confirmAction(event) {
        // Hiển thị hộp thoại xác nhận
        if (confirm("Bạn có chắc muốn đặt hàng?")) {
            // Nếu người dùng chấp nhận, thực hiện chuyển hướng
            window.location.href = event.currentTarget.querySelector('button').getAttribute('submit');
        }
        // Ngăn chặn sự kiện mặc định (nhảy trang)
        event.preventDefault();
    }
</script>
<script>

    $(function () {
        var selectedClass = "";
        $("p").click(function () {
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
            $("#portfolio div").not("." + selectedClass).fadeOut();
            setTimeout(function () {
                $("." + selectedClass).fadeIn();
                $("#portfolio").fadeTo(50, 1);
            }, 500);

        });
    });

</script>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<script>
    function limitAndStartWithZero(element, maxLength) {
        let inputValue = element.value.toString();

        if (inputValue.length > maxLength) {
            // Nếu độ dài vượt quá giới hạn, cắt bớt giá trị nhập vào
            element.value = inputValue.slice(0, maxLength);
        }

        if (inputValue.length > 0 && inputValue.charAt(0) !== '0') {
            // Nếu số không bắt đầu bằng 0, đặt giá trị nhập vào về 0
            element.value = '0';
            document.getElementById("error-message").innerHTML = "Số phải bắt đầu bằng 0.";
        } else {
            document.getElementById("error-message").innerHTML = "";
        }
    }
</script>

</body>
</html>

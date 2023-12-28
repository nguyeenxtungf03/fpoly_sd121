<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">

    <title>POLY121 SHOP</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="/assets/css/gio-hang.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">
    <!--

    TemplateMo 571 Hexashop

    https://templatemo.com/tm-571-hexashop

    -->
</head>

<body>

<!-- ***** Preloader Start ***** -->
<%--<div id="preloader">--%>
<%--    <div class="jumper">--%>
<%--        <div></div>--%>
<%--        <div></div>--%>
<%--        <div></div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- ***** Preloader End ***** -->


<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav" style="text-transform: uppercase">
                    <!-- ***** Logo Start ***** -->
                    <a href="/trang-chu" class="logo">
                        <img src="assets/images/logo.png">
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
                                        <li><a href="/trang-chu/detail-nguoi-dung"style="font-size: 16px; text-transform: uppercase">Tàikhoản : ${username }</a></li>
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
<!-- ***** Header Area End ***** -->
<!-- ***** Main Banner Area Start ***** -->
<div class="main-banner" id="top">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6">
                <div class="left-content">
                    <div class="thumb">
                        <div class="inner-content">
                            <h4>We Are POLY121</h4>
                            <span>Cùng trải nghiệm mua sắm với POLY121 nào !</span>
                            <div class="main-border-button">
                                <a href="#">Khám Phá Ngay !</a>
                            </div>
                        </div>
                        <img src="assets/images/left-banner-image.jpg" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="right-content">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="right-first-image">
                                <div class="thumb">
                                    <div class="inner-content">
                                        <h4>Nữ</h4>
                                        <span>Quần Áo Nữ Trẻ Trung, Sành Điệu</span>
                                    </div>
                                    <div class="hover-content">
                                        <div class="inner">
                                            <h4>Nữ</h4>
                                            <p>Quần áo nữ trẻ trung, sành điệu, luôn cập nhật xu hướng.</p>
                                            <div class="main-border-button">
                                                <a href="#">Khám Phá Thêm</a>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="assets/images/baner-right-image-01.jpg">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-first-image">
                                <div class="thumb">
                                    <div class="inner-content">
                                        <h4>Nam</h4>
                                        <span>Quần Áo Nam Khỏe Khoắn, Mạnh Mẽ</span>
                                    </div>
                                    <div class="hover-content">
                                        <div class="inner">
                                            <h4>Nam</h4>
                                            <p>Quần áo nữ khỏe khoắn, mạnh mẽ, luôn cập nhật xu hướng.</p>
                                            <div class="main-border-button">
                                                <a href="#">Khám Phá Thêm</a>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="assets/images/baner-right-image-02.jpg">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-first-image">
                                <div class="thumb">
                                    <div class="inner-content">
                                        <h4>Mới Nhất</h4>
                                        <span>Sản Phẩm Mới Nhất</span>
                                    </div>
                                    <div class="hover-content">
                                        <div class="inner">
                                            <h4>Mới Nhất</h4>
                                            <p>Sản phẩm mới nhất, luôn cập nhật xu hướng.</p>
                                            <div class="main-border-button">
                                                <a href="#">Khám Phá Thêm</a>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="assets/images/baner-right-image-03.jpg">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-first-image">
                                <div class="thumb">
                                    <div class="inner-content">
                                        <h4>Hot Nhất</h4>
                                        <span>Sản Phẩm Bán Chạy Nhất</span>
                                    </div>
                                    <div class="hover-content">
                                        <div class="inner">
                                            <h4>Hot Nhất</h4>
                                            <p>Sản phẩm được lựa chọn nhiều nhất.</p>
                                            <div class="main-border-button">
                                                <a href="#">Khám Phá Thêm</a>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="assets/images/baner-right-image-04.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ***** Men Area Starts ***** -->
<section class="section" id="men">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="section-heading">
                    <h2>Sản Phẩm Áo Nam Mới</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="men-item-carousel">
                    <div class="owl-men-item owl-carousel" data-browse="5">
                        <c:forEach items="${listSpAoNam}" var="sp">
                            <div class="item">
                                <a href="/trang-chu/chi-tiet/${sp.getIdSpct()}">
                                    <div class="thumb">
                                        <div class="position-relative">
                                            <img src="../../assets/images/imgSp/${sp.getAnh()}" alt="Product Image" class="img-fluid">
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai != null and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate}">
                                        <span class="badge badge-danger position-absolute" style="top: 10px; right: 10px;">
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'product' && mapIdSpKm.get(sp.getIdSp()).trangThai == 1}">Khuyến mãi ${mapIdSpKm.get(sp.getIdSp()).giaTri} VNĐ</c:if>
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'percentage' && mapIdSpKm.get(sp.getIdSp()).trangThai == 1}">Khuyến mãi ${mapIdSpKm.get(sp.getIdSp()).giaTri} %</c:if>
                                        </span>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <h4>${sp.getTen()}</h4>
                                        <div class="d-flex" >
                                            <span   ${mapIdSpKm.get(sp.getIdSp())  == null or mapIdSpKm.get(sp.getIdSp()).ngayBatDau > newDate ?'style=" text-decoration: none"':'style=" text-decoration: line-through;color : red;margin-right: 10px ;font-size : 15px"'}><fmt:formatNumber value="${sp.getGia()}" pattern="##,###,###"></fmt:formatNumber> VNĐ </span>

                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'percentage' and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate}">
                                                <span> <fmt:formatNumber value="${sp.getGia() - (sp.getGia() * mapIdSpKm.get(sp.getIdSp()).giaTri / 100)}" pattern="##,###,###"></fmt:formatNumber> VNĐ</span>
                                            </c:if>
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'product' and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate }">
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).giaTri <= sp.getGia()}">
                                                    <span> <fmt:formatNumber value="${sp.getGia() - mapIdSpKm.get(sp.getIdSp()).giaTri}" pattern="##,###,###"></fmt:formatNumber> VNĐ </span>
                                                </c:if>
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).giaTri > sp.getGia()}">
                                                    <span> 0 VNĐ</span>
                                                </c:if>
                                            </c:if>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="section" id="men-best-sellers">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="section-heading">
                    <h2>Sản Phẩm Quần Nam Mới</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="men-item-carousel">
                    <div class="owl-men-item owl-carousel" data-browse="5">
                        <c:forEach items="${listSpQuanNam}" var="sp">
                            <div class="item">
                                <a href="/trang-chu/chi-tiet/${sp.getIdSpct()}">
                                    <div class="thumb">
                                        <div class="position-relative">
                                            <img src="../../assets/images/imgSp/${sp.getAnh()}" alt="Product Image" class="img-fluid">
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai != null and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate}">
                                        <span class="badge badge-danger position-absolute" style="top: 10px; right: 10px;">
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'product' && mapIdSpKm.get(sp.getIdSp()).trangThai == 1}">Khuyến mãi ${mapIdSpKm.get(sp.getIdSp()).giaTri} VNĐ</c:if>
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'percentage' && mapIdSpKm.get(sp.getIdSp()).trangThai == 1}">Khuyến mãi ${mapIdSpKm.get(sp.getIdSp()).giaTri} %</c:if>
                                        </span>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <h4>${sp.getTen()}</h4>
                                        <div class="d-flex" >
                                            <span   ${mapIdSpKm.get(sp.getIdSp())  == null or mapIdSpKm.get(sp.getIdSp()).ngayBatDau > newDate ?'style=" text-decoration: none"':'style=" text-decoration: line-through;color : red;margin-right: 10px ;font-size : 15px"'}><fmt:formatNumber value="${sp.getGia()}" pattern="##,###,###"></fmt:formatNumber> VNĐ </span>

                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'percentage' and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate}">
                                                <span> <fmt:formatNumber value="${sp.getGia() - (sp.getGia() * mapIdSpKm.get(sp.getIdSp()).giaTri / 100)}" pattern="##,###,###"></fmt:formatNumber> VNĐ</span>
                                            </c:if>
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'product' and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate }">
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).giaTri <= sp.getGia()}">
                                                    <span> <fmt:formatNumber value="${sp.getGia() - mapIdSpKm.get(sp.getIdSp()).giaTri}" pattern="##,###,###"></fmt:formatNumber> VNĐ </span>
                                                </c:if>
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).giaTri > sp.getGia()}">
                                                    <span> 0 VNĐ</span>
                                                </c:if>
                                            </c:if>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** Men Area Ends ***** -->

<!-- ***** Women Area Starts ***** -->
<section class="section" id="women">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="section-heading">
                    <h2>Sản Phẩm Áo Nữ Mới</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="men-item-carousel">
                    <div class="owl-men-item owl-carousel" data-browse="5">
                        <c:forEach items="${listSpAoNu}" var="sp">
                            <div class="item">
                                <a href="/trang-chu/chi-tiet/${sp.getIdSpct()}">
                                    <div class="thumb">
                                        <div class="position-relative">
                                            <img src="../../assets/images/imgSp/${sp.getAnh()}" alt="Product Image" class="img-fluid">
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai != null and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate}">
                                        <span class="badge badge-danger position-absolute" style="top: 10px; right: 10px;">
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'product' && mapIdSpKm.get(sp.getIdSp()).trangThai == 1}">Khuyến mãi ${mapIdSpKm.get(sp.getIdSp()).giaTri} VNĐ</c:if>
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'percentage' && mapIdSpKm.get(sp.getIdSp()).trangThai == 1}">Khuyến mãi ${mapIdSpKm.get(sp.getIdSp()).giaTri} %</c:if>
                                        </span>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <h4>${sp.getTen()}</h4>
                                        <div class="d-flex" >
                                            <span   ${mapIdSpKm.get(sp.getIdSp())  == null or mapIdSpKm.get(sp.getIdSp()).ngayBatDau > newDate ?'style=" text-decoration: none"':'style=" text-decoration: line-through;color : red;margin-right: 10px ;font-size : 15px"'}><fmt:formatNumber value="${sp.getGia()}" pattern="##,###,###"></fmt:formatNumber> VNĐ </span>

                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'percentage' and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate}">
                                                <span> <fmt:formatNumber value="${sp.getGia() - (sp.getGia() * mapIdSpKm.get(sp.getIdSp()).giaTri / 100)}" pattern="##,###,###"></fmt:formatNumber> VNĐ</span>
                                            </c:if>
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'product' and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate }">
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).giaTri <= sp.getGia()}">
                                                    <span> <fmt:formatNumber value="${sp.getGia() - mapIdSpKm.get(sp.getIdSp()).giaTri}" pattern="##,###,###"></fmt:formatNumber> VNĐ </span>
                                                </c:if>
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).giaTri > sp.getGia()}">
                                                    <span> 0 VNĐ</span>
                                                </c:if>
                                            </c:if>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="section" id="women-best-sellers">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="section-heading">
                    <h2>Sản Phẩm Quần Nữ Mới</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="men-item-carousel">
                    <div class="owl-men-item owl-carousel" data-browse="5">
                        <c:forEach items="${listSpQuanNu}" var="sp">
                            <div class="item">
                                <a href="/trang-chu/chi-tiet/${sp.getIdSpct()}">
                                    <div class="thumb">
                                        <div class="position-relative">
                                            <img src="../../assets/images/imgSp/${sp.getAnh()}" alt="Product Image" class="img-fluid">
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai != null and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate}">
                                        <span class="badge badge-danger position-absolute" style="top: 10px; right: 10px;">
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'product' && mapIdSpKm.get(sp.getIdSp()).trangThai == 1}">Khuyến mãi ${mapIdSpKm.get(sp.getIdSp()).giaTri} VNĐ</c:if>
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'percentage' && mapIdSpKm.get(sp.getIdSp()).trangThai == 1}">Khuyến mãi ${mapIdSpKm.get(sp.getIdSp()).giaTri} %</c:if>
                                        </span>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <h4>${sp.getTen()}</h4>
                                        <div class="d-flex" >
                                            <span   ${mapIdSpKm.get(sp.getIdSp())  == null or mapIdSpKm.get(sp.getIdSp()).ngayBatDau > newDate ?'style=" text-decoration: none"':'style=" text-decoration: line-through;color : red;margin-right: 10px ;font-size : 15px"'}><fmt:formatNumber value="${sp.getGia()}" pattern="##,###,###"></fmt:formatNumber> VNĐ </span>

                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'percentage' and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate}">
                                                <span> <fmt:formatNumber value="${sp.getGia() - (sp.getGia() * mapIdSpKm.get(sp.getIdSp()).giaTri / 100)}" pattern="##,###,###"></fmt:formatNumber> VNĐ</span>
                                            </c:if>
                                            <c:if test="${mapIdSpKm.get(sp.getIdSp()).loaiKhuyenMai == 'product' and mapIdSpKm.get(sp.getIdSp()).ngayBatDau < newDate }">
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).giaTri <= sp.getGia()}">
                                                    <span> <fmt:formatNumber value="${sp.getGia() - mapIdSpKm.get(sp.getIdSp()).giaTri}" pattern="##,###,###"></fmt:formatNumber> VNĐ </span>
                                                </c:if>
                                                <c:if test="${mapIdSpKm.get(sp.getIdSp()).giaTri > sp.getGia()}">
                                                    <span> 0 VNĐ</span>
                                                </c:if>
                                            </c:if>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ***** Women Area Ends ***** -->

<!-- ***** Social Area Starts ***** -->
<section class="section" id="social">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-heading">
                    <h2>Social Media</h2>
                    <span>Details to details is what makes Hexashop different from the other themes.</span>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row images">
            <div class="col-2">
                <div class="thumb">
                    <div class="icon">
                        <a href="http://instagram.com">
                            <h6>Fashion</h6>
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                    <img src="assets/images/instagram-01.jpg" alt="">
                </div>
            </div>
            <div class="col-2">
                <div class="thumb">
                    <div class="icon">
                        <a href="http://instagram.com">
                            <h6>New</h6>
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                    <img src="assets/images/instagram-02.jpg" alt="">
                </div>
            </div>
            <div class="col-2">
                <div class="thumb">
                    <div class="icon">
                        <a href="http://instagram.com">
                            <h6>Brand</h6>
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                    <img src="assets/images/instagram-03.jpg" alt="">
                </div>
            </div>
            <div class="col-2">
                <div class="thumb">
                    <div class="icon">
                        <a href="http://instagram.com">
                            <h6>Makeup</h6>
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                    <img src="assets/images/instagram-04.jpg" alt="">
                </div>
            </div>
            <div class="col-2">
                <div class="thumb">
                    <div class="icon">
                        <a href="http://instagram.com">
                            <h6>Leather</h6>
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                    <img src="assets/images/instagram-05.jpg" alt="">
                </div>
            </div>
            <div class="col-2">
                <div class="thumb">
                    <div class="icon">
                        <a href="http://instagram.com">
                            <h6>Bag</h6>
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                    <img src="assets/images/instagram-06.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** Social Area Ends ***** -->


<!-- ***** Footer Start ***** -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="first-item">
                    <div class="logo">
                        <img src="assets/images/white-logo.png" alt="hexashop ecommerce templatemo">
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

<!-- jQuery -->
<script src="assets/js/jquery-2.1.0.min.js"></script>

<!-- Bootstrap -->
<script src="assets/js/popper.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/accordions.js"></script>
<script src="assets/js/datepicker.js"></script>
<script src="assets/js/scrollreveal.min.js"></script>
<script src="assets/js/waypoints.min.js"></script>
<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/imgfix.min.js"></script>
<script src="assets/js/slick.js"></script>
<script src="assets/js/lightbox.js"></script>
<script src="assets/js/isotope.js"></script>

<!-- Global Init -->
<script src="assets/js/custom.js"></script>

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

    const $owlCarousel = $('.owl-carousel').owlCarousel({
        items: 5,
        loop: false
    });

    $owlCarousel.trigger('refresh.owl.carousel');

</script>
</body>
</html>
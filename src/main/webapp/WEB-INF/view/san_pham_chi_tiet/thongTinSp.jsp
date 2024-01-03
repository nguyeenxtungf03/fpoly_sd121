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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">

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

<!-- ***** Preloader Start ***** -->

<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky" style="line-height: none">

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
<!-- ***** Header Area End ***** -->

<!-- ***** Main Banner Area Start ***** -->
<div style="padding-top: 23px" id="top">

</div>
<!-- ***** Main Banner Area End ***** -->


<!-- ***** Product Area Starts ***** -->
<section class="section" id="product">

    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="left-images">
                    <div class="position-relative">
                        <img src="/assets/images/imgSp/${spct.anhSanPham}" alt="">
                        <c:if test="${spct.idKhuyenMai.loaiKhuyenMai != null and spct.idKhuyenMai.ngayBatDau < newDate}">
                                        <span class="badge badge-danger position-absolute"
                                              style="top: 10px;left: 290px">
                                            <c:if test="${spct.idKhuyenMai.loaiKhuyenMai == 'product' && spct.idKhuyenMai.trangThai == 1}">Khuyến mãi ${spct.idKhuyenMai.giaTri} VNĐ</c:if>
                                            <c:if test="${spct.idKhuyenMai.loaiKhuyenMai == 'percentage' && spct.idKhuyenMai.trangThai == 1}">Khuyến mãi ${spct.idKhuyenMai.giaTri} %</c:if>
                                        </span>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="right-content">
                    <h4>
                        ${spct.idSanPham.tenSanPham}

                    </h4>
                    <span class="price">
                          <div class="d-flex">
                                        <span   ${spct.idKhuyenMai.loaiKhuyenMai  == null or spct.idKhuyenMai.ngayBatDau > newDate ?'style=" text-decoration: none"':'style=" text-decoration: line-through;color : red;margin-right: 10px ; font-size : 15px"'}><fmt:formatNumber value="${spct.giaBan}" pattern="##,###,###"></fmt:formatNumber> VNĐ </span>
                                        <c:if test="${spct.idKhuyenMai.loaiKhuyenMai == 'percentage' and spct.idKhuyenMai.ngayBatDau < newDate}">
                                            <span> <fmt:formatNumber value="${spct.giaBan - (spct.giaBan * spct.idKhuyenMai.giaTri / 100)}" pattern="##,###,###"></fmt:formatNumber> VNĐ</span>
                                        </c:if>
                                    <c:if test="${spct.idKhuyenMai.loaiKhuyenMai == 'product' and spct.idKhuyenMai.ngayBatDau < newDate }">
                                        <c:if test="${spct.idKhuyenMai.giaTri <= spct.giaBan}">
                                            <span> <fmt:formatNumber value="${spct.giaBan - spct.idKhuyenMai.giaTri}" pattern="##,###,###"></fmt:formatNumber> VNĐ </span>
                                        </c:if>
                                        <c:if test="${spct.idKhuyenMai.giaTri > spct.giaBan}">
                                            <span> 0 VNĐ</span>
                                        </c:if>
                                    </c:if>
                                    </div>
                    </span>
                    <span> Số lượng còn : ${spct.soLuong} <c:if test="${spct.soLuong < 1}">
                        <smail style="color: red ; font-weight: 600"> ( Hết hàng )</smail>
                    </c:if></span>
                    <div class="quote">
                        <form action="/trang-chu/chi-tiet" method="get">
                        <span>Màu sắc :  <c:forEach items="${listms}" var="ms">
                            <input name="idSanPham" type="hidden" value="${spct.idSanPham.id}">
                            <strong style="margin : 0 10px 0 5px ; font-weight: 500">   <input id="ms${ms.tenMauSac}"
                                                                                               type="radio"
                                                                                               name="idMauSac"
                                                                                               onchange="updateSelection()"
                                                                                               value="${ms.id}" ${spct.idMauSac.id == ms.id ? 'checked' : ''}>
                                 <label for="ms${ms.tenMauSac}">${ms.tenMauSac}</label> </strong>
                        </c:forEach>
                            </span>
                            <span> Kích cỡ :  <c:forEach items="${listkt}" var="kt">
                               <strong style="margin : 0 10px 0 5px ; font-weight: 500">  <input
                                       id="kt${kt.tenKichThuoc}" type="radio" onchange="updateSelection()"
                                       name="idKichThuoc"
                                       value="${kt.id}" ${spct.idKichThuoc.id == kt.id ? 'checked' :''}> <label
                                       for="kt${kt.tenKichThuoc}">${kt.tenKichThuoc}</label>
                               </strong>
                            </c:forEach>
                            <button type="submit" style="display: none" id="submitButton">Cập nhật</button>
                                    </span>
                        </form>
                        <p style="font-style: revert">Loại sản phẩm : ${spct.idLoaiSanPham.tenLoai} | Chất liệu
                            : ${spct.idChatLieu.tenChatLieu} |
                            Thương hiệu : ${spct.idThuongHieu.tenThuongHieu} </p>
                        <p style="font-style: revert">Mô tả : ${spct.moTa}</p>
                    </div>
                    <form id="addToCartForm" action="/gio-hang/add" method="post">
                        <div style="display: none">
                            <input name="idSanPhamChiTiet" value="${spct.id}">
                            <input name="idGioHang" value="${idGioHang}">
                        </div>
                        <div class="quantity-content">
                            <div class="left-content">
                                <h6>Số lượng </h6>
                            </div>
                            <div class="right-content">
                                <div class="quantity buttons_added">
                                    <input type="button" value="-" class="minus">
                                    <input type="number" step="1" min="1" max="${spct.soLuong}"
                                           name="soLuong" value="1"
                                           title="Qty" class="input-text qty text quantity-input" size="4"
                                           pattern="" inputmode="">
                                    <input id="quantityAlert1" type="button" value="+"
                                           class="plus">
                                </div>
                            </div>
                        </div>
                        <!-- Thêm một hidden input để lưu giá sản phẩm -->
                        <c:if test="${spct.soLuong > 0}">
                        <button class="btn btn-outline-success" type="submit">Thêm Vào Giỏ
                            Hàng
                        </button>
                        </c:if>
                    </form>
                    <c:if test="${spct.soLuong <= 0}">
                            <button disabled class="btn" style="color: red ;border: 1px solid red" >Sản phẩm đã bán hết
                            </button>
                    </c:if>
                    <br>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** Product Area Ends ***** -->

<!-- ***** Footer Start ***** -->
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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<div id="successToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true"
     data-delay="1000" style="position: fixed; top: 20px; right: 20px;    z-index: 1051;background: white">
    <div class="toast-body" >

    </div>
</div>
<script>
    function updateSelection() {
        // Thực hiện các thao tác cập nhật hoặc gọi hàm xử lý khi radio button thay đổi
        console.log('Radio button changed');
        // Thêm mã JavaScript của bạn tại đây, ví dụ như kích hoạt sự kiện của button
        document.getElementById('submitButton').click();
    }
</script>
<!-- Đảm bảo bạn đã bao gồm thư viện jQuery -->
<script>
    $(document).ready(function () {
        // Hiển thị Toast khi trạng thái đơn hàng được cập nhật thành công
        function showSuccessToast() {
            $('#successToast').toast('show');

            // Đặt thời gian tự động ẩn Toast sau 1 giây
            setTimeout(function () {
                $('#successToast').toast('hide');
            }, 1000);
        }

        // Bắt sự kiện khi Toast ẩn đi
        $('#successToast').on('hidden.bs.toast', function () {
            // Tải lại trang sau khi Toast ẩn đi
            location.reload();
        });

        // Bắt sự kiện khi form được submit
        $("#addToCartForm").submit(function (event) {
            // Ngăn chặn hành động mặc định của form (chuyển hướng trang)
            event.preventDefault();

            // Lấy dữ liệu từ form
            var formData = $(this).serialize();
            // Thực hiện POST request thông qua Ajax
            $.ajax({
                type: "POST",
                url: "/gio-hang/add",
                data: formData,
                success: function (response) {
                    $("#successToast .toast-body").text(response);
                    if (response === "Sản phẩm thêm trong giỏ hàng không vượt quá số lượng tồn kho !") {
                        // Áp dụng style khi response bằng một giá trị cụ thể
                        $("#successToast .toast-body").css("color", "red");
                    } else {
                        // Áp dụng style khi response không bằng giá trị cụ thể
                        $("#successToast .toast-body").css("color", "#34ce57");
                    }
                    // Hiển thị và tự động ẩn Toast thành công
                    showSuccessToast();
                },
                error: function (xhr) {
                    // Xử lý lỗi nếu có
                    console.error(xhr);
                    // Hiển thị thông báo lỗi từ server
                    if (xhr.responseText) {
                        $("#successToast .toast-body").text(xhr.responseText);
                        if (xhr.responseText === "Lỗi khi thêm vào giỏ hàng") {
                            // Áp dụng style khi response bằng một giá trị cụ thể
                            $("#successToast .toast-body").css("color", "red");
                        }
                        showSuccessToast();
                    } else {
                        alert("Có lỗi xảy ra.");
                    }
                }
            });
        });
    });
</script>


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

<style>
    .btn-outline-success {
        color: #2a2a2a;
        border-color: #343a40;

    }

    .quantity-content {
        margin-top: 30px;
        padding-top: 10px;
        border-top: 1px solid #eee;
        border-bottom: 1px solid #eee;
        width: 100%;
        padding-bottom: 10px;
        margin-bottom: 10px;
    }

    #product .right-content span {
        font-size: 16px;
        color: black;
        font-weight: 600;
        display: block;
        margin-top: 10px;
    }

    .btn {
        border-radius: 0;
    }

    .btn-outline-success:hover {
        color: white;
        background: #2c3034;
    }
</style>
</body>

</html>

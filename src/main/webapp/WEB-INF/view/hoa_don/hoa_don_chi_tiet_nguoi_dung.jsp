<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<!-- ***** Preloader Start ***** -->
<div id="preloader">
    <div class="jumper">
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>
<!-- ***** Preloader End ***** -->


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
                        <li class="scroll-to-section"><a href="/trang-chu" class="active">TRANG CHỦ</a></li>
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
                        <li class="scroll-to-section"><a href="/gio-hang/hien-thi">
                            <svg style="margin-top: -3px" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                 fill="currentColor" class="bi bi-bag-fill" viewBox="0 0 16 16">
                                <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/>
                            </svg>
                            GIỎ HÀNG</a></li>
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
                                    <li><a href="/trang-chu/detail-nguoi-dung"
                                           style="font-size: 16px; text-transform: uppercase">Tài
                                        khoản : ${username}</a></li>
                                    <c:if test="${isUser || isAdmin || isStaff}">
                                        <li><a href="/trang-chu/hoa-don">HÓA ĐƠN</a></li>
                                    </c:if>
                                    <c:if test="${isAdmin}">
                                        <li><a href="about.html">QUẢN LÝ</a></li>
                                    </c:if>
                                    <c:if test="${isAdmin || isStaff}">
                                        <li><a href="about.html">BÁN HÀNG</a></li>
                                    </c:if>
                                    <li><a href="about.html">ĐỔI MẬT KHẨU</a></li>
                                    <li><a href="/logout">ĐĂNG XUẤT</a></li>
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

<div class="page-heading" id="top">
</div>

<div class="container">
    <div class="section-heading">
        <h2 class="text-center">Chi Tiết Hóa Đơn</h2>
    </div>
    <div class="row">
        <div class="col-md-6">
            <p><strong>Tên Khách Hàng:</strong> ${hd.nguoiNhan}</p>
            <p><strong>Địa Chỉ:</strong> ${hd.diaChiNhan}</p>
            <p><strong>Số Điện Thoại:</strong> ${hd.sdtNguoiNhan}</p>
        </div>
        <div class="col-md-6 text-md-right">
            <strong ${hd.trangThai == 1 ? ' style="text-align:center ; color : #ffcc00" ' : hd.trangThai == 6 ? 'style="color: #34ce57;text-align:center"' :hd.trangThai == 7 ? 'style="color: red;text-align:center"' :''}  >
                ${hd.trangThai == 1 ? 'Chờ xác nhận ' : hd.trangThai == 2  ? 'Đơn hàng đã được xác nhận' :hd.trangThai == 2  ? 'Đơn hàng đã được xác nhận' :
                        hd.trangThai == 3  ? 'Đang chuẩn bị hàng' :hd.trangThai == 4  ? 'Vận chuyển' :
                                hd.trangThai == 5  ? 'Thanh toán' :hd.trangThai == 6 ? 'Hoàn thành' :hd.trangThai == 7 ? 'Đơn hàng đã bị hủy' :''}</strong><br>
            <p><strong>Mã Hóa Đơn:</strong> <span>${hd.id}</span></p>
            <p><strong>Ngày đặt hàng</strong> <span><fmt:formatDate value="${hd.ngayTao}"
                                                                    pattern="dd/MM/yyyy HH:mm:ss"/></span></p>
            <p><strong>Ngày cập nhật </strong> <span><fmt:formatDate value="${hd.ngayCapNhat}"
                                                                     pattern="dd/MM/yyyy HH:mm:ss"/></span></p>
            </span></p>
        </div>
        <div class="col-md-6">
            <p><strong>Tổng Tiền:</strong> <fmt:formatNumber value="${hd.tongTien}"
                                                             pattern="##,###,###"></fmt:formatNumber> ₫</p>
            <p><strong>Phí Vận Chuyển:</strong> <fmt:formatNumber value="${hd.phiVanChuyen}"
                                                                  pattern="##,###,###"></fmt:formatNumber> ₫</p>
            <p><strong>Thành Tiền:</strong> <fmt:formatNumber value="${hd.thanhTien}"
                                                              pattern="##,###,###"></fmt:formatNumber> ₫</p>
        </div>
        <div class="col-md-6"><br><br>
            <c:if test="${hd.trangThai == 1 and hd.loaiHoaDon == 1}">
                <div style="display: flex ; justify-content: end ">
                    <form  action="/hoa-don/trang-thai-don-hang-khach-hang" method="post">
                        <input name="trangThai" type="hidden" value="7">
                        <input name="idHoaDon" type="hidden" value="${hd.id}">
                        <button onclick="confirmAction(event)"  style="background: red ">Huỷ Đơn Hàng</button>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
    <br>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">Sản Phẩm</th>
            <th scope="col">Tên Sản Phẩm</th>
            <th scope="col">Số Lượng</th>
            <th scope="col">Đơn Giá</th>
            <th scope="col">Thành Tiền</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listHdct}" var="hdct">
            <tr>
                <th scope="row"><a href="/trang-chu/chi-tiet/${hdct.idSanPhamChiTiet.id}"><img
                        style=" max-width: 50px;max-height: 50px; object-fit: cover;"
                        src="/assets/images/imgSp/${hdct.idSanPhamChiTiet.anhSanPham}"></a></th>
                <td>${hdct.idSanPhamChiTiet.idSanPham.tenSanPham}</td>
                <td>${hdct.soLuong}</td>
                <td>
                    <c:if test="${hdct.donGia < hdct.giaGoc}">
                    <small style="color: red ; text-decoration: line-through ; margin-right: 3px"> <fmt:formatNumber  value="${hdct.giaGoc}" pattern="##,###,###"></fmt:formatNumber> ₫  </small>
                    </c:if>
                    <span> <fmt:formatNumber value="${hdct.donGia}" pattern="##,###,###"></fmt:formatNumber> ₫ </span> </td>
                </td>
                <td><fmt:formatNumber value="${hdct.soLuong * hdct.donGia}"
                                      pattern="##,###,###"></fmt:formatNumber> ₫
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${  empty username}">
        <span>- Để kiểm tra tình trạng đơn hàng của quý khách truy cập đường link dưới đây</span><br>
        - Link theo dõi đơn hàng : <a href="/trang-chu/hoa-don-chi-tiet?idHD=${hd.id}">
         http://localhost:8080/trang-chu/hoa-don-chi-tiet?idHD=${hd.id} </a>  <br>
        <span>- Khuyến khích : Đăng nhập tài khoản mua hàng để dễ dàng theo dõi !</span>
    </c:if>
</div>

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
    function confirmAction(event) {
        // Hiển thị hộp thoại xác nhận
        if (confirm("Bạn có chắc muốn hủy đơn hàng ${hd.id} ?")) {
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
</body>
</html>

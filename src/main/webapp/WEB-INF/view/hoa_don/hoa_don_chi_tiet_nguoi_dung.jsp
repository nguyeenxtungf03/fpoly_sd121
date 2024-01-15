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
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
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
         <span class="tt" ${hd.trangThai == 1 ? ' style="text-align:center ; color : #ffcc00" ' : hd.trangThai == 6 ? 'style="color: #34ce57;text-align:center"' : hd.trangThai == 7 ? 'style="color: red;text-align:center"' :''}>
                ${hd.trangThai == 1 ? 'Chờ xác nhận ' : hd.trangThai == 2  ? 'Đơn hàng đã được xác nhận' :
                        hd.trangThai == 3  ? 'Chờ vận chuyển' : hd.trangThai == 4  ? 'Vận chuyển' :
                                hd.trangThai == 5  ? 'Thanh toán' : hd.trangThai == 6 ? 'Hoàn thành' : hd.trangThai == 7 ? 'Đơn hàng đã bị hủy' :''}</span><br>
            <p><strong>Tên Khách Hàng:</strong> ${hd.nguoiNhan}</p>
            <p><strong>Địa Chỉ:</strong> ${hd.diaChiNhan}</p>
            <p><strong>Số Điện Thoại:</strong> ${hd.sdtNguoiNhan}</p>
        </div>
        <div class="col-md-6 text-md-right" >
            <br>
            <p><strong>Mã Hóa Đơn:</strong> <span>${hd.id}</span></p>
            <p><strong>Ngày đặt hàng</strong> <span><fmt:formatDate value="${hd.ngayTao}"
                                                                    pattern="dd/MM/yyyy HH:mm:ss"/></span></p>
            <p><strong>Ngày cập nhật </strong> <span><fmt:formatDate value="${hd.ngayCapNhat}"
                                                                     pattern="dd/MM/yyyy HH:mm:ss"/></span></p>
            </span></p><br>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                            style="padding: 5px 10px 5px 10px ; font-size: 15px"
                            class="btn btn-primary " type="button">Thông tin đơn hàng
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Quá trình giao hàng</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="progress">
                                        <c:forEach items="${listLshd}" var="ls">
                                            <div class="progress-bar"  ${ls.trangThaiDonHang == 6 ? 'style="background: #34ce57"' : ls.trangThaiDonHang == 7 ? 'style="background: red"' : ''}>
                                                    <%--icon dat hang--%>
                                                <c:if test="${ls.trangThaiDonHang == 1}">
                                                    <i class="fas fa-cart-arrow-down"></i>
                                                </c:if>
                                                    <%--icon xac nhan don hang--%>
                                                <c:if test="${ls.trangThaiDonHang == 2}">
                                                    <i class="fas fa-check"></i>
                                                </c:if>
                                                    <%--icon dong goi--%>
                                                <c:if test="${ls.trangThaiDonHang == 3}">
                                                    <i class="fas fa-box"></i>
                                                </c:if>
                                                    <%--icon van chuyen--%>
                                                <c:if test="${ls.trangThaiDonHang == 4}">
                                                    <i class="fas fa-truck"></i>
                                                </c:if>
                                                    <%--icon giao hang--%>
                                                <c:if test="${ls.trangThaiDonHang == 5}">
                                                    <i class="fas fa-user"></i>
                                                </c:if>
                                                    <%--icon hoan thanh--%>
                                                <c:if test="${ls.trangThaiDonHang == 6}">
                                                    <i class="fas fa-check-circle"></i>
                                                </c:if>
                                                    <%--icon huy don hang--%>
                                                <c:if test="${ls.trangThaiDonHang == 7}">
                                                    <i class="fas fa-times-circle"></i>
                                                </c:if>
                                                  <p style="font-size: 10px;font-weight: 400 ; color: white">${ ls.trangThaiDonHang == 1 ? 'Chờ xác nhận' : ls.trangThaiDonHang == 2 ? 'Xác nhận' : ls.trangThaiDonHang == 3 ? 'Chờ vận chuyển' : ls.trangThaiDonHang == 4 ? 'Vận chuyển' : ls.trangThaiDonHang == 5 ? 'Đã thanh toán' : ls.trangThaiDonHang == 6 ? 'Hoàn thành' : ls.trangThaiDonHang == 7 ? 'Hủy đơn hàng'  : ''}</p>
                                                <p style="font-size: 10px;font-weight: 400"><fmt:formatDate value="${ls.ngayTao}"
                                                                                                               pattern="dd-MM-yyyy HH:mm:ss"></fmt:formatDate></p>
                                            </div>
                                        </c:forEach>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
            <c:if test="${hd.trangThai == 1  or hd.trangThai == 2 or hd.trangThai == 3   }">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button style="padding: 5px 10px 5px 10px ; font-size: 15px"
                        class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal3"
                        data-bs-whatever="@mdo" type="button">Hủy đơn hàng
                </button>
            </div>
            </c:if>
            <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel3">Xác nhận hủy đơn hàng </h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <form  action="/hoa-don/trang-thai-don-hang-khach-hang" method="post">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label >Lí do hủy đơn hàng  </label>
                                    <textarea name="moTa" class="form-control" placeholder="Nhập lý do " required style="height: 150px"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="idHoaDon" value="${hd.id}">
                                <button onclick="confirmAction(event)" type="submit" class="btn btn-primary">Xác nhận</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

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
                <td>${hdct.idSanPhamChiTiet.idSanPham.tenSanPham} <small style="color: #565e64">(  ${hdct.idSanPhamChiTiet.idMauSac.tenMauSac} - ${hdct.idSanPhamChiTiet.idKichThuoc.tenKichThuoc} )</small></td>
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
<div  id="successToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true"
      data-delay="1000" style="position: fixed; top: 20px; right: 20px;  z-index: 1051;background: white">
    <div  ${error != null ? 'style="color: red"': 'style="color: #34ce57"'}  class="toast-body" >

    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        if (`${error}` !== '' || `${pass}` !== ''  ) {
            showSuccessToast('${error}${pass}');
        }

    });
    function showSuccessToast(message) {
        // Lấy phần tử có id là 'successToast'
        var successToast = document.getElementById("successToast");

        // Thiết lập nội dung của toast
        successToast.querySelector('.toast-body').innerText = message;

        // Hiển thị toast
        $(successToast).toast('show');

        // Đặt thời gian tự động ẩn toast sau 1 giây
        setTimeout(function () {
            $(successToast).toast('hide');
        }, 2000);
    }

</script>

<style>

    .tt{
        font-size: 20px;
        font-weight: 600;

    }
    .progress-bar {
        text-align: center;
        padding: 20px; /* Tăng padding cho ô tiến trình */
        position: relative;
        width: 14.2857% ;
        font-size: 12px;
    }

    .progress {
        height: 7rem;
    }

    .progress-bar i {
        font-size: 100px; /* Tăng kích thước biểu tượng */
        margin-bottom: 20px; /* Tăng khoảng cách dưới biểu tượng */
        display: block;
    }

    .progress-bar:hover {
        opacity: 0.8;
    }

    .progress-bar.active {
        background-color: #007bff;
        color: #fff;
        font-weight: bold;
    }

    .progress-bar.active i {
        color: #fff;
    }

    .progress-bar.complete {
        background-color: #28a745;
        color: #fff;
        font-weight: bold;
    }

    .progress-bar.complete i {
        color: #fff;
    }

    .progress-bar:not(:last-child)::before {
        content: '';
        position: absolute;
        top: 50%;
        right: 5%;
        transform: translateY(-50%);
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 5px 0 5px 5px; /* Giảm kích thước mũi tên bằng cách sửa đổi giá trị này */
        border-color: transparent transparent transparent #e9ecef;
    }

    .progress-bar:last-child::after {
        display: none;
    }

</style>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>

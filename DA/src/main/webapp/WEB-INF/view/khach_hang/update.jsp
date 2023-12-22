<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <title>POLY121 SHOP</title>


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
<div class="page-heading" id="top">

</div>
<!-- ***** Social Area Starts ***** -->
<section class="section" id="social">
    <div class="container" >
    <!--  Example Code -->
    <h1 style="text-align: center;">Thông tin tài khoản</h1>
    <div class="p-3 m-0 border-0 bd-example m-0 border-0">
        <form action="/trang-chu/update-nguoi-dung" method="post" class="row g-3">
                <div class="col-md-3">
                    <label for="inputAddress2" class="form-label">Họ</label>
                    <input name="ho" value="${kh.ho}" type="text" class="form-control" placeholder="Họ" aria-label="First name">
                </div>
                <div class="col-md-3">
                    <label for="inputAddress2" class="form-label">Tên đệm</label>
                    <input name="tenDem" value="${kh.tenDem}" type="text" class="form-control" placeholder="Tên đệm" aria-label="Last name">
                </div>
                <div class="col-md-6">
                    <label for="inputAddress2" class="form-label">Tên</label>
                    <input name="ten" value="${kh.ten}" type="text" class="form-control" placeholder="Tên" aria-label="Last name">
                </div>
            <div class="col-md-6">
                <label for="inputAddress2" class="form-label">Giới tính</label>
                <select name="gioiTinh" class="form-select" aria-label="Default select example">
                    <option selected ${kh.gioiTinh == true ? 'selected' : ''}  value="True">Nam</option>
                    <option ${kh.gioiTinh == false ? 'selected' : ''} value="false">Nữ</option>
                </select>
            </div>

            <div class="col-md-6">
                <label for="inputAddress2" class="form-label">Ngày sinh</label>
                <input name="ngaySinh" value="${kh.ngaySinh}" type="date" class="form-control" id="inputAddress2" >
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Email</label>
                <input name="email" value="${kh.email}" type="email" class="form-control" id="inputEmail4">
            </div>
            <div class="col-md-6">
                <label  class="form-label">Số điện thoại</label>
                <input name="sdt" value="${kh.sdt}" id="numberInput" type="number" oninput="limitAndStartWithZero(this, 10)"  class="form-control" >
            </div>

            <div  style="text-align: center;">
                <button style="background: black"  type="submit" class="btn btn-primary col-md-2">Lưu thông tin</button>
            </div>
        </form>
    </div>

    </div>
</section>
<!-- ***** Social Area Ends ***** -->
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

    const $owlCarousel = $('.owl-carousel').owlCarousel({
        items: 5,
        loop: false
    });

    $owlCarousel.trigger('refresh.owl.carousel');

</script>
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
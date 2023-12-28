<%@page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Dashboard - SB Admin</title>
    <link href="/assets/css/styles.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
    <link href="https://use.fontawesome.com/releases/v6.3.0/css/all.css" rel="stylesheet"
          integrity="sha384-e3R6p/4HAj5z7z4nTkkjLIg7kxAWFYV9aYMjSWbYq5RQ2HwxjN5fBsG2ToqFO+ea" crossorigin="anonymous"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <a class="navbar-brand ps-3" href="/trang-chu">
                <i class="bi bi-house-door"></i>
                Trang chủ
            </a>
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Cửa hàng quần áo</div>
                    <a class="nav-link" href="/ban-hang">
                        <div class="sb-nav-link-icon">
                            <i class="bi bi-shop"></i>
                        </div>
                        Bán hàng
                    </a>
                    <div class="sb-sidenav-menu-heading">Quản lí</div>

                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Quản lí sản phẩm
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="/san-pham-chi-tiet/hien-thi-sp">
                                <div class="sb-nav-link-icon">
                                    <i class="icon bi bi-box"></i>
                                </div>
                                Sản phẩm
                            </a>
                            <a class="nav-link" href="/kich-thuoc/hien-thi">
                                <div class="sb-nav-link-icon">
                                    <i class="icon bi bi-arrows-angle-contract"></i>
                                </div>
                                Kích thước
                            </a>
                            <a class="nav-link" href="/mau-sac/hien-thi">
                                <div class="sb-nav-link-icon">
                                    <i class="icon bi bi-palette"></i>
                                </div>
                                Màu sắc
                            </a>
                            <a class="nav-link" href="/thuong-hieu/hien-thi">
                                <div class="sb-nav-link-icon">
                                    <i class="icon bi bi-hdd"></i>
                                </div>
                                Thương hiệu
                            </a>
                            <a class="nav-link" href="/chat-lieu/index">
                                <div class="sb-nav-link-icon">
                                    <i class="icon bi bi-file-earmark-text"></i>
                                </div>
                                Chất liệu
                            </a><a class="nav-link" href="/loai-san-pham/hien-thi">
                            <div class="sb-nav-link-icon">
                                <i class="icon bi bi-grid-1x2"></i>
                            </div>
                            Loại sản phẩm
                        </a>
                        </nav>
                    </div>
                    <a class="nav-link" href="/khach-hang/hien-thi">
                        <div class="sb-nav-link-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        Tài khoản
                    </a>
                    <a class="nav-link" href="/khuyen-mai/hien-thi">
                        <div class="sb-nav-link-icon">
                            <i class="fas fa-chart-area"></i>
                        </div>
                        Khuyến mại
                    </a>
                    <div class="sb-sidenav-menu-heading">Lịch sử</div>
                    <a class="nav-link" href="/hoa-don/hien-thi">
                        <div class="sb-nav-link-icon">
                            <i class="fas fa-receipt"></i>
                        </div>
                        Hóa đơn
                    </a>
                    <a class="nav-link" href="/hoa-don/thong-ke">
                        <div class="sb-nav-link-icon">
                            <i class="fas fa-chart-bar"></i>
                        </div>
                        Thống kê
                    </a>
                </div>
            </div>
        </nav>
    </div>
</div>
    <style>
        .nav-link{
            text-decoration: none;
        }
    </style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/assets/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="/assets/demo/chart-area-demo.js"></script>
<script src="/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>

</body>
</html>

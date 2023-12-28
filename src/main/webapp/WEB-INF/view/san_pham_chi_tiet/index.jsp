<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="widtd=device-widtd, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="/assets/css/styles.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body style="width:auto">
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>

<div style="width: 84% ; float: right ;padding: 1rem 1rem 1rem 0rem">

    <div class="container">
        <a href="/san-pham-chi-tiet/hien-thi-sp" style="text-decoration: none ;color: black "> ↩ Danh sách sản phẩm </a>
        <form method="get" action="/san-pham-chi-tiet/bo-loc" class="filter-form">
            <div class="row">
                <div class="col-md-5">
                    <label>Sản phẩm</label>
                    <select id="idSanPham" name="idSanPham" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listSp}" var="sp">
                            <option  ${sp == idSanPham or sp.id == idSp ? 'selected' : ''}
                                    value="${sp.id}">${sp.tenSanPham}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-2">
                    <label>Màu sắc</label>
                    <select id="idMauSac" name="idMauSac" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listMs}" var="ms">
                            <option ${idMauSac == ms ? 'selected' : ''} value="${ms.id}">${ms.tenMauSac}</option>
                        </c:forEach> </select>
                </div>
                <div class="col-md-2">
                    <label>Kích Thước</label>
                    <select id="idKichThuoc" name="idKichThuoc" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listKt}" var="sp">
                            <option ${idKichThuoc == sp ? 'selected' : ''} value="${sp.id}">${sp.tenKichThuoc}</option>
                        </c:forEach> </select>
                </div>
                <div class="col-md-3">
                    <label>Loại sản phẩm</label>
                    <select id="idLoaiSanPham" name="idLoaiSanPham" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listLsp}" var="sp">
                            <option ${idLoaiSanPham == sp ? 'selected' : ''} value="${sp.id}">${sp.tenLoai}</option>
                        </c:forEach> </select>
                </div>

            </div>
            <div class="row">
                <div class="col-md-3">
                    <label>Thương hiệu</label>
                    <select id="idThuongHieu" name="idThuongHieu" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listTh}" var="sp">
                            <option ${idThuongHieu == sp ? 'selected' : ''}
                                    value="${sp.id}">${sp.tenThuongHieu}</option>
                        </c:forEach> </select>
                </div>
                <div class="col-md-3">
                    <label>Chất liệu</label>
                    <select id="idChatLieu" name="idChatLieu" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listCl}" var="sp">
                            <option ${idChatLieu == sp ? 'selected' : ''} value="${sp.id}">${sp.tenChatLieu}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-2">
                    <label>Trạng thái</label>
                    <select name="trangThai" class="form-control">
                        <option value="">--Tất cả--</option>
                        <option ${trangThai == 0 ?'selected' :''} value="0">Hoạt động</option>
                        <option ${trangThai == 1 ?'selected' :''} value="1">Không hoạt động</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="minPrice">Giá bán</label>
                        <div class="input-group">
                            <input name="toiThieu" value="${toiThieu}" type="number" class="form-control" id="minPrice"
                                   placeholder="Tối thiểu" min="1">
                            <div class="input-group-prepend">
                                <span class="input-group-text">-</span>
                            </div>
                            <input name="toiDa" value="${toiDa}" type="number" class="form-control" id="maxPrice"
                                   placeholder="Tối đa" min="1">
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
            <a class="btn btn-secondary ml-2" href="/san-pham-chi-tiet/bo-loc?idSanPham=${idSanPham.id}">Làm mới bộ lọc</a>
        </form>


    </div>
    <div class="danhSach">

        <H1 style="text-align: center ; color: black ; font-weight: 600">Sản phẩm chi tiết </H1>
        <table class="table table-hover">
            <tdead style="color: white">
                <tr style="background: #5c636a ">
                    <td style="color: white" scope="col">STT</td>
                    <td style="color: white" scope="col"> Ảnh</td>
                    <td style="color: white" scope="col">Tên sản phẩm</td>
                    <td style="color: white" scope="col">Loại sản phẩm</td>
                    <td style="color: white" scope="col">Thương hiệu</td>
                    <td style="color: white" scope="col"> Chất liệu</td>
                    <td style="color: white" scope="col"> Giá bán</td>
                    <td style="color: white" scope="col"> Khuyến mại</td>
                    <td style="color: white" scope="col"> Số lượng</td>
                    <td style="color: white" scope="col"> Mô tả</td>
                    <td style="color: white" scope="col"> Trạng thái</td>
                    <td style="color: white" scope="col">Chức năng</td>
                </tr>
            </tdead>
            <tbody>
            <c:forEach items="${listSpct}" var="spct" varStatus="i">
            <tr>

                <td scope="row">${i.index + 1}</td>
                <td scope="row"><a href="/san-pham-chi-tiet/detail/${spct.id}"><img style="width: 3rem ;height: 4rem"
                                                                                    src="../../../assets/images/imgSp/${spct.anhSanPham}"></a>
                </td>
                <td scope="row">${spct.idSanPham.tenSanPham} <br> [ ${spct.idMauSac.tenMauSac}
                    - ${spct.idKichThuoc.tenKichThuoc} ]
                </td>
                <td scope="row">${spct.idLoaiSanPham.tenLoai}</td>
                <td scope="row">${spct.idThuongHieu.tenThuongHieu}</td>
                <td scope="row">${spct.idChatLieu.tenChatLieu}</td>
                <td scope="row"><fmt:formatNumber>${spct.giaBan}</fmt:formatNumber></td>
                <td scope="row"><fmt:formatNumber>${spct.idKhuyenMai.giaTri}</fmt:formatNumber>
                    <c:if test="${spct.idKhuyenMai.loaiKhuyenMai == 'product'}">₫</c:if>
                    <c:if test="${spct.idKhuyenMai.loaiKhuyenMai == 'percentage'}">%</c:if>
                </td>
                <td scope="row"><fmt:formatNumber>${spct.soLuong}</fmt:formatNumber></td>
                <td scope="row">${spct.moTa}</td>
                <td scope="row">${spct.trangThai == 0 ? 'Hoạt động' :'Không hoạt động'}</td>


                <td scope="row"
                    style="display: flex;flex-direction: column ; gap: 1rem ; align-items: center ">
                    <button class="btn btn-outline-success"><a onclick="confirmAction(event)" class="navbar-brand"
                                                               href="/san-pham-chi-tiet/delete/${spct.id}"> <i
                            class="fas fa-trash"></i></a>
                    </button>
                    <button class="btn btn-outline-success"><a class="navbar-brand"
                                                               href="/san-pham-chi-tiet/detail/${spct.id}">
                        <i class="bi bi-pencil-square"></i></a>
                    </button>
                </td>

            </tr>
            </c:forEach>

        </table>
    </div>
</div>
<script>
    function confirmAction(event) {
        // Hiển thị hộp thoại xác nhận
        if (confirm("Bạn có chắc muốn xóa không?")) {
            // Nếu người dùng chấp nhận, thực hiện chuyển hướng
            window.location.href = event.currentTarget.querySelector('a').getAttribute('href');
        }
        // Ngăn chặn sự kiện mặc định (nhảy trang)
        event.preventDefault();
    }
</script>

<style>
    .btn {
        --bs-btn-padding-x: 0.5rem;
        --bs-btn-padding-y: 0.1rem;
    }

    .navbar > .container-fluid {
        justify-content: flex-start;
    }


</style>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
    }


    table.table {
        font-size: 14px;
        background-color: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .danhSach {
        margin-top: 10px;
        font-size: 14px;
        background-color: #ffffff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        padding: 10px;
        border-radius: 10px;
    }

    table.table tbody td {
        border: none;
        padding: 12px;
        text-align: center;
    }

    table.table tbody tr:nth-child(odd) {
        background-color: #f8f9fa;
    }


    table.table tbody tr:hover {
        background-color: #e9ecef;
    }

    .modal-footer a {
        text-decoration: none;
    }

    .filter-form {
        margin-top: 20px;
        margin-bottom: 20px;
    }

    body {
        background-color: #f8f9fa;
    }

    .container {
        background-color: #ffffff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        padding: 30px;
        border-radius: 10px;
    }

</style>
<script>
    $(document).ready(function () {
        $('#idSanPham').select2();
    });
    $(document).ready(function () {
        $('#idMauSac').select2();
    });
    $(document).ready(function () {
        $('#idKichThuoc').select2();
    });
    $(document).ready(function () {
        $('#idLoaiSanPham').select2();
    });
    $(document).ready(function () {
        $('#idChatLieu').select2();
    });
    $(document).ready(function () {
        $('#idThuongHieu').select2();
    });

</script>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>

</body>
</html>
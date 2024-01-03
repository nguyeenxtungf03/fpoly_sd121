<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; ISO-8859-1" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="/assets/css/styles.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body style="width:auto">
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>

<div style="width: 84% ; float: right ;padding: 1rem 1rem 1rem 0rem">

    <div class="container">
        <form method="get" action="/hoa-don/bo-loc-hd" class="filter-form">
            <div class="row">
                <div class="col-md-5">
                    <label>Tìm kiếm </label>
                    <input class="form-control" value="${key}" name="key">
                </div>
                <div class="col-md-2">
                    <label>Loại hóa đơn</label>
                    <select name="loaiHoaDon" class="form-control">
                        <option value="">--Tất cả--</option>
                        <option  ${loaiHoaDon == 1 ? 'selected':''} value="1">Mua hàng Online</option>
                        <option ${loaiHoaDon == 2 ? 'selected':''} value="2">Mua hàng tại quầy</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <label>Trạng thái</label>
                    <select name="trangThai" class="form-control">
                        <option value="">--Tất cả--</option>
                        <option  ${trangThai == 1 ? 'selected':''} value="1">Chờ xác nhận </option>
                        <option ${trangThai == 2 ? 'selected':''} value="2">Xác nhận </option>
                        <option ${trangThai == 3 ? 'selected':''} value="3">Chờ vận chuyển </option>
                        <option ${trangThai == 4 ? 'selected':''} value="4">Vận chuyển </option>
                        <option ${trangThai == 5 ? 'selected':''} value="5">Thanh toán </option>
                        <option ${trangThai == 6 ? 'selected':''} value="6">Hoàn thành </option>
                        <option ${trangThai == 7 ? 'selected':''} value="7">Hủy</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <label>Ngày bắt đầu</label>
                    <input class="form-control" name="dateBd" type="date" value="${dateBd}">
                </div>
                <div class="col-md-5">
                    <label>Ngày kết thúc</label>
                    <input class="form-control" name="dateKt" type="date" value="${dateKt}">
                </div>
            </div>
            <br>
            <div class="row filter-actions">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                    <a href="/hoa-don/hien-thi" class="btn btn-secondary ml-2">Làm mới bộ lọc</a>
                </div>
            </div>
        </form>

    </div>
        <br>
    <div class="container">
        <H1 style="text-align: center ; color: black;font-weight: 600">Danh sách hóa đơn </H1>
        <ul class="d-flex" style="list-style: none; gap:4px ; justify-content: center">
            <li>
                <form method="get" action="/hoa-don/loai-hoa-don">
                    <input type="hidden" name="loaiHoaDon" value="">
                    <input type="hidden" name="trangThai" value="${trangThai}">
                    <button  ${loaiHoaDon == null ? 'style="background: #adb5bd "' :''} class="form-control" type="submit">Tất cả</button>
                </form>
            </li>
            <li>
                <form method="get" action="/hoa-don/loai-hoa-don">
                    <input type="hidden" name="loaiHoaDon" value="1">
                    <input type="hidden" name="trangThai" value="${trangThai}">
                    <button  ${loaiHoaDon == 1 ? 'style="background: #008080"' :''} class="form-control" type="submit">Mua hàng Online</button>
                </form>
            </li>
            <li>
                <form method="get" action="/hoa-don/loai-hoa-don">
                    <input type="hidden" name="loaiHoaDon" value="2">
                    <input type="hidden" name="trangThai" value="${trangThai}">
                    <button ${loaiHoaDon == 2 ? 'style="background: #8B475D"' :''} class="form-control" type="submit">Mua hàng tại quầy </button>
                </form>
            </li>
        </ul>

        <ul class="d-flex" style="list-style: none; gap:4px ; justify-content: center">
            <li>
                <form method="get" action="/hoa-don/hien-thi">
                    <button  ${trangThai == null ? 'style="background: #adb5bd"' :''} class="form-control" type="submit">Tất cả</button>
                </form>
            </li>
            <li>
                <form method="get" action="/hoa-don/trang-thai">
                    <input type="hidden" name="loaiHoaDon" value="${loaiHoaDon}">
                    <input type="hidden" name="trangThai" value="1">
                    <button ${trangThai == 1 ? 'style="background: #adb5bd"' :''} class="form-control" type="submit">Chờ xác nhận</button>
                </form>
            </li>
            <li>
                <form method="get" action="/hoa-don/trang-thai">
                    <input type="hidden" name="loaiHoaDon" value="${loaiHoaDon}">
                    <input type="hidden" name="trangThai" value="2">
                    <button ${trangThai == 2 ? 'style="background: #adb5bd"' :''}   class="form-control" type="submit">Xác nhận</button>
                </form>
            </li>
            <li>
                <form method="get" action="/hoa-don/trang-thai">
                    <input type="hidden" name="loaiHoaDon" value="${loaiHoaDon}">
                    <input type="hidden" name="trangThai" value="3">
                    <button ${trangThai == 3 ? 'style="background: #adb5bd"' :''}  class="form-control" type="submit">Chờ vận chuyển</button>
                </form>
            </li>
            <li>
                <form method="get" action="/hoa-don/trang-thai">
                    <input type="hidden" name="loaiHoaDon" value="${loaiHoaDon}">
                    <input type="hidden" name="trangThai" value="4">
                    <button ${trangThai == 4 ? 'style="background: #adb5bd"' :''}  class="form-control" type="submit">Vận chuyển</button>
                </form>
            </li>
            <li>
                <form method="get" action="/hoa-don/trang-thai">
                    <input type="hidden" name="loaiHoaDon" value="${loaiHoaDon}">
                    <input type="hidden" name="trangThai" value="5">
                    <button ${trangThai == 5 ? 'style="background: #adb5bd"' :''}  class="form-control" type="submit">Thanh toán</button>
                </form>
            </li>
            <li>
                <form method="get" action="/hoa-don/trang-thai">
                    <input type="hidden" name="loaiHoaDon" value="${loaiHoaDon}">
                    <input type="hidden" name="trangThai" value="6">
                    <button ${trangThai == 6 ? 'style="background: #34ce57"' :''}  class="form-control" type="submit">Hoàn thành</button>
                </form>
            </li>
            <li>
                <form method="get" action="/hoa-don/trang-thai">
                    <input type="hidden" name="loaiHoaDon" value="${loaiHoaDon}">
                    <input type="hidden" name="trangThai" value="7">
                    <button ${trangThai == 7 ? 'style="background: red"' :''}  class="form-control" type="submit">Huỷ</button>
                </form>
            </li>
        </ul>

        <table class="table table-hover">
            <thead>
            <tr style="">
                <td  scope="col">ID</td>
                <td scope="col">Tên khách hàng</td>
                <td  scope="col">Số điện thoại</td>
                <td  scope="col">Loại hoá đơn</td>
                <td  scope="col">Ngày tạo</td>
                <td  scope="col">Thành tiền</td>
                <td scope="col">Chi tiết</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listHd}" var="hd">
            <tr>
                <td scope="row">${hd.id}</td>
                <td scope="row">${hd.nguoiNhan}</td>
                <td scope="row">${hd.sdtNguoiNhan}</td>
                <td scope="row"  ${hd.loaiHoaDon == 1 ? ' style="color:#008080  ;font-weight: 600" ':'style="color: #8B475D ;font-weight: 600"'} >${hd.loaiHoaDon == 1 ? 'Mua hàng Online' : 'Mua hàng tại quầy'}</td>
                <td scope="row">
                    <fmt:formatDate value="${hd.ngayTao}" pattern="dd/MM/yyyy HH:mm:ss" />
                </td>
                <td scope="row"><fmt:formatNumber value="${hd.thanhTien}" pattern="##,###,###"></fmt:formatNumber> ₫
                </td>

                <td>
                    <a style="text-decoration: none ;color: #c8cbcf "
                       href="/hoa-don/searchHDCT?idHD=${hd.id}"><i class="fas fa-info-circle"></i></a>
                </td>
            </tr>

            </c:forEach>

        </table>

        <c:if test="${ not empty page1 and not empty page}">
        <div style="display: flex; justify-content: space-between ; ">

            <div>
                <c:if test="${page > 0}">
                    <button class="btn btn-outline-success" type="button"><a class="navbar-brand"
                                                                             href="?page=${page - 1 }">Trang
                        truoc</a></button>
                </c:if>
            </div>
            <div>
                <c:if test="${ empty param.keyword}">
                    <c:forEach begin="0" end="${page1 - 1}" varStatus="i">
                        <button class="btn btn-outline-success"><a class="navbar-brand"
                                                                   href="/hoa-don/hien-thi?page=${i.index}">${i.index + 1}</a>
                        </button>
                    </c:forEach>
                </c:if>
            </div>


            <div>
                <c:if test="${page < page1 - 1}">
                    <button class="btn btn-outline-success" type="submit"><a class="navbar-brand"
                                                                             href="?page=${page + 1 }">Trang
                        sau</a></button>
                </c:if>
            </div>
        </div>
        </c:if>
    </div
</div>
</div>

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<style>
    /* Reset some default styles */

    body {
        font-family: 'Arial', sans-serif;
    }

    /* Shoppe-style table */
    table.table {
        font-size: 14px;
    }

    table.table thead td {
        padding: 10px;
        text-align: center;
        border: 1px solid #dee2e6;
        background: #b3b7bb;
    }


    table.table tbody td {
        padding: 10px;
        text-align: center;
        border: 1px solid #dee2e6;
    }
</style>


<style>
    .container {
        background-color: #ffffff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        padding: 30px;
        border-radius: 10px;
    }
    .table {
        background-color: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    ul a {
        text-decoration: none;
        color: black;
        border-radius: 2px;
        padding: 4px;
        border: 1px solid black;
    }


</style>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>
</html>

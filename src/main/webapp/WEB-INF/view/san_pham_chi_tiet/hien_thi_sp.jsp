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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</head>

<body style="width:auto">
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>
<div style="width: 84% ; float: right ;padding: 1rem 1rem 1rem 0rem">

    <div class="container">
        <form method="get" action="/san-pham-chi-tiet/bo-loc-san-pham" class="filter-form">
            <div class="row">
                <div class="col-md-3">
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
                    <label>Loại sản phẩm</label>
                    <select id="idLoaiSanPham" name="idLoaiSanPham" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listLsp}" var="sp">
                            <option ${idLoaiSanPham == sp ? 'selected' : ''} value="${sp.id}">${sp.tenLoai}</option>
                        </c:forEach> </select>
                </div>
                <div class="col-md-2">
                    <label>Thương hiệu</label>
                    <select id="idThuongHieu" name="idThuongHieu" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listTh}" var="sp">
                            <option ${idThuongHieu == sp ? 'selected' : ''}
                                    value="${sp.id}">${sp.tenThuongHieu}</option>
                        </c:forEach> </select>
                </div>
                <div class="col-md-2">
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
            </div>
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
            <a class="btn btn-secondary ml-2" href="/san-pham-chi-tiet/hien-thi-sp">Làm mới bộ lọc</a>
        </form>

    </div>


    <div class="sanPham" style="padding: 10px ; margin-top: 20px">
        <a class="btn btn-primary" href="/san-pham-chi-tiet/form-add"><i class="bi bi-plus-circle-fill"></i> Thêm Sản
            phẩm </a>
        <a class="btn btn-primary" style=" position : absolute;right: 30px ;  " href="/exportExcel"><i class="bi bi-upload"></i> Xuất Exel Sản Phẩm</a>
<%--        <a class="btn btn-primary" href="/exportPdf"><i--%>
<%--                class="bi bi-download"></i> Xuất Pdf</a>--%>

        <span style="color: red">${errors}</span>
        <H1 style="text-align: center ; color: black ; font-weight: 600">Danh sách sản phẩm </H1>
        <table class="table table-hover">
            <tdead style="color: white">
                <tr style="background: #5c636a ">
                    <td style="color: white" scope="col">STT</td>
                    <td style="color: white" scope="col">Tên sản phẩm</td>
                    <td style="color: white" scope="col">Loại sản phẩm</td>
                    <td style="color: white" scope="col">Thương hiệu</td>
                    <td style="color: white" scope="col"> Chất liệu</td>
                    <td style="color: white" scope="col"> Số lượng</td>
                    <td style="color: white" scope="col"> Trạng thái</td>
                    <td style="color: white" scope="col"> Chức năng</td>
                </tr>
            </tdead>
            <tbody>
            <c:forEach items="${listSpct}" var="spct" varStatus="i">
            <tr>
                <td>${i.index + 1}</td>
                <td scope="row" style="text-align: start">${spct.idSanPham.tenSanPham} </td>
                <td scope="row">${spct.idLoaiSanPham.tenLoai}</td>
                <td scope="row">${spct.idThuongHieu.tenThuongHieu}</td>
                <td scope="row">${spct.idChatLieu.tenChatLieu}</td>
                <td scope="row"><fmt:formatNumber>${spct.soLuong}</fmt:formatNumber></td>
                <td scope="row">${spct.trangThai == 0 ? 'Hoạt động' :'Không hoạt động'}</td>
                <td scope="row">
                    <form method="get" action="/san-pham-chi-tiet/index">
                        <input type="hidden" name="idSanPham" value="${spct.idSanPham.id}">
                        <input type="hidden" name="idLsp" value="${spct.idLoaiSanPham.id}">
                        <input type="hidden" name="idTh" value="${spct.idThuongHieu.id}">
                        <input type="hidden" name="idCl" value="${spct.idChatLieu.id}">
                        <button type="submit" class="detail-link btn btn-warning" style="background: white"><i
                                class="bi bi-pencil-square"></i></button>

                    </form>

            </tr>
            </c:forEach>

        </table>

        <c:if test="${totalPages > 1}">
        <div>
            <div class="pagination" style="display: flex ; gap: 10px ; font-weight: 600 ;justify-content: end ">
                <div class="${currentPage == 1 ? 'disabled' : ''}">
                    <a href="<c:if test='${currentPage > 1}'>/san-pham-chi-tiet/hien-thi-sp?page=${currentPage - 1}</c:if>">&laquo;</a>
                </div>
                <c:forEach var="pageNum" begin="1" end="${totalPages}">
                    <div class="${currentPage == pageNum ? 'active' : ''}">
                        <a href="/san-pham-chi-tiet/hien-thi-sp?page=${pageNum-1}">${pageNum}</a>
                    </div>
                </c:forEach>
                <div class="${currentPage == totalPages ? 'disabled' : ''}">
                    <a href="<c:if test='${currentPage < totalPages}'>/san-pham-chi-tiet/hien-thi-sp?page=${currentPage + 1}</c:if>">&raquo;</a>
                </div>
            </div>
            </c:if>
        </div>
    </div
</div>
<script>
    $(document).ready(function () {
        $('#idSanPham').select2();
    });
    $(document).ready(function () {
        $('#idLoaiSanPham').select2();
    });
    $(document).ready(function () {
        $('#idKichCo').select2();
    });
    $(document).ready(function () {
        $('#idChatLieu').select2();
    });
    $(document).ready(function () {
        $('#idThuongHieu').select2();
    });
</script>
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
        box-shadow: 1px 1px 4px 6px rgba(0, 0, 0, 0.1);
    }

    .sanPham {
        font-size: 14px;
        background-color: #ffffff;
        box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
        padding: 30px;
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

    .container {
        background-color: #ffffff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        padding: 30px;
        border-radius: 10px;
    }


</style>


</body>
</html>

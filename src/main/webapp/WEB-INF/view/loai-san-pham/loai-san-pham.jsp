<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

</head>

<body>
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>
<div style="width: 84% ; float: right ;padding: 0rem 1rem 1rem 0rem">
    <div class="section">
        <form style="left: 0" role="search" method="get" action="/loai-san-pham/search">
            <span>Tim Kiem</span> <input class="input" name="tenLoai" type="search" placeholder="Search"
                                         aria-label="Search"
                                         value="${param.tenLoai}" required>
            <button class="btn btn-primary" type="submit">Search</button>
            <a class="btn btn-primary" href="/loai-san-pham/hien-thi" style="text-decoration: none"> <i
                    class="bi bi-arrow-repeat"></i>
                Load</a>
        </form>

        <c:if test="${not empty updloaisp.id}">
            <form action="/loai-san-pham/update/${updloaisp.id}" method="post">
                <span>Id</span><br>
                <input disabled type="text" class="input" name="id" value="${updloaisp.id}"><BR>
                <span>Tên loại sản phẩm   </span><br>
                <input type="text" class="input" name="tenLoai" required value="${updloaisp.tenLoai}"><br>
                Giới tính<br> <input checked style="" type="radio" name="gioiTinh" value="1">Nam
                <input style="margin-left: 10px" type="radio" name="gioiTinh" value="0">Nữ <br><br>
                Danh mục <br> <input checked style="" type="radio" name="danhMuc" value="1">Áo
                <input style="margin-left: 10px" type="radio" name="danhMuc" value="2">Quần
                <input style="margin-left: 10px" type="radio" name="danhMuc" value="3">Đầm
                <input style="margin-left: 10px" type="radio" name="danhMuc" value="4">Váy <br><br>

                <button class="btn btn-primary" type="submit">Cập nhật</button>
            </form>
        </c:if>

        <c:if test="${empty updloaisp.id}">
            <form action="/loai-san-pham/add" method="post">
                <span>Tên loại sản phẩm  </span><br>
                <input class="input" required type="text" name="tenLoai"><br>
                Giới tính<br> <input checked style="padding: 0" type="radio" name="gioiTinh" value="1">Nam
                <input style="margin-left: 10px" type="radio" name="gioiTinh" value="0">Nữ <br><br>
                Danh mục <br> <input checked style="" type="radio" name="danhMuc" value="1">Áo
                <input style="margin-left: 10px" type="radio" name="danhMuc" value="2">Quần
                <input style="margin-left: 10px" type="radio" name="danhMuc" value="3">Đầm
                <input style="margin-left: 10px" type="radio" name="danhMuc" value="4">Váy <br><br>
                <button class="btn btn-primary" type="submit">Thêm</button>
            </form>
        </c:if>
        <h1 style="text-align: center">BẢNG LOẠI SẢN PHẨM</h1>
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên loại sản phẩm</th>
                <th>Giới tính</th>
                <th>Danh mục</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${lstloaisp}" var="lsp">
                <tr>
                    <td>${lsp.id}</td>
                    <td>${lsp.tenLoai}</td>
                    <td>${lsp.gioiTinh == 1 ? 'Nam' : 'Nữ'}</td>
                    <td>${lsp.danhMuc == 1 ? 'Áo' : lsp.danhMuc == 2 ?'Quần' : lsp.danhMuc == 3 ?'Đầm' : lsp.danhMuc == 4 ? 'Váy' :''  }</td>
                    <td>
                        <a href="/loai-san-pham/detail/${lsp.id}"><i class="bi bi-pencil-square"></i></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div style="display: flex; justify-content: space-between ; ">
            <div>
                <c:if test="${page > 0}">
                    <a href="/loai-san-pham/hien-thi?page=${page - 1 }"><i class="bi bi-arrow-left-circle"></i></a>
                </c:if>
            </div>

            <div style="display: flex ; gap: 0.5rem">
                <c:catch var="catchException">
                    <c:if test="${ empty param.tenLoai}">
                        <c:forEach begin="0" end="${page1 - 1}" varStatus="i">
                            <div><a href="/loai-san-pham/hien-thi?page=${i.index}">${i.index + 1}</a></div>
                        </c:forEach>
                    </c:if>
                </c:catch>
            </div>

            <div>
                <c:if test="${page < page1 - 1}">
                    <a href="/loai-san-pham/hien-thi?page=${page + 1 }"><i class="bi bi-arrow-right-circle"></i></a>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>

<style>
    .sb-sidenav .sb-sidenav-menu .nav .nav-link {
        text-decoration: none;
    }
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
    }


    .input {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        font-size: 16px;
        border: 1px solid #ced4da;
        border-radius: 4px;
    }

    .section {
        margin-top: 20px;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
    }

    form {
        margin-bottom: 20px;
    }

    button {
        padding: 10px;
        font-size: 16px;
        cursor: pointer;
    }


    th, td {
        padding: 12px;
        text-align: left;
    }

    th {
        background-color: #f8f9fa;
    }

    a {
        text-decoration: none;
        color: #007bff;
    }

    a:hover {
        text-decoration: underline;
    }

    @media (max-width: 576px) {
        input {
            width: 100%;
        }

        button {
            width: 100%;
        }

        .table {
            overflow-x: auto;
            display: block;
        }
    }

</style>
</html>

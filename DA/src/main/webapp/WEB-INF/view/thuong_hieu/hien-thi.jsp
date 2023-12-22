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
    <link rel="stylesheet" href="path/to/your/custom/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

</head>

<body>
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>
<div style="width: 84% ; float: right ;padding: 0rem 1rem 1rem 0rem">
    <div class="section">
        <form style="left: 0" role="search" method="get" action="/thuong-hieu/search">
            <span>Tim Kiem</span> <input name="tenThuongHieu" type="search" placeholder="Search"
                                         aria-label="Search"
                                         value="${param.tenThuongHieu}" required>
            <button class="btn btn-primary" type="submit">Search</button>
            <a class="btn btn-primary" href="/thuong-hieu/hien-thi" style="text-decoration: none"> <i
                    class="bi bi-arrow-repeat"></i>
                Load</a>
        </form>

        <c:if test="${not empty th.id}">
        <form action="/thuong-hieu/update/${th.id}" method="post">
            <span>Id</span><br>
            <input disabled type="text" name="tenThuongHieu" value="${th.id}"><BR>
            <span>Tên thương hiệu  </span><br>
            <input type="text" name="tenThuongHieu" required value="${th.tenThuongHieu}"><br>
            <span style="color: red">${errors}</span><br>
            <button class="btn btn-primary" type="submit">Cập nhật</button>
        </form>
        </c:if>

        <c:if test="${empty th.id}">
        <form action="/thuong-hieu/add" method="post">
            <span>Tên thương hiệu </span><br>
            <input type="text" required name="tenThuongHieu">
            <span style="color: red">${errors}</span><br>
            <button class="btn btn-primary" type="submit">Thêm</button>
        </form>
        </c:if>
        <div>

            <h1 style="text-align: center">BẢNG THƯƠNG HIỆU</h1>
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên thương hiệu</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listTh}" var="th">
                    <tr>
                        <td>${th.id}</td>
                        <td>${th.tenThuongHieu}</td>
                        <td>
                            <a href="/thuong-hieu/detail/${th.id}"><i class="bi bi-pencil-square"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div style="display: flex; justify-content: space-between ; ">
                <div>
                    <c:if test="${page > 0}">
                        <a href="/thuong-hieu/hien-thi?page=${page - 1 }"><i class="bi bi-arrow-left-circle"></i></a>
                    </c:if>
                </div>

                <div style="display: flex ; gap: 0.5rem">
                    <c:catch var="catchException">
                        <c:if test="${ empty param.tenThuongHieu}">
                            <c:forEach begin="0" end="${page1 - 1}" varStatus="i">
                                <div><a href="/thuong-hieu/hien-thi?page=${i.index}">${i.index + 1}</a></div>
                            </c:forEach>
                        </c:if>
                    </c:catch>
                </div>

                <div>
                    <c:if test="${page < page1 - 1}">
                        <a href="/thuong-hieu/hien-thi?page=${page + 1 }"><i class="bi bi-arrow-right-circle"></i></a>
                    </c:if>
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

    .section {
        margin-top: 20px;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
    }

    form {
        margin-bottom: 20px;
    }

    input {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        font-size: 16px;
        border: 1px solid #ced4da;
        border-radius: 4px;
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

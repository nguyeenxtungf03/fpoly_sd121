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

<body class="container" style="display: flex;flex-direction: column">
<div>
    <br>
    <c:if test="${not empty sp.id}">
        <form action="/san-pham/update/${sp.id}" method="post">
            <span>Id</span><br>
            <input disabled type="text" style="height: 0.5rem" name="tenSanPham" value="${sp.id}"><BR>
            <span>Tên sản phẩm </span><br>
            <input  type="text" style="height: 0.5rem ; width: 80%" name="tenSanPham"  required value="${sp.tenSanPham}"><br>
            <span style="color: red">${errors}</span><br>
            <button type="submit">Update</button>
        </form>
    </c:if>

    <c:if test="${empty sp.id}">
        <form action="/san-pham/add" method="post">
            <span>Tên sản phẩm </span><br>
            <input style="height: 0.5rem ;width: 80%" type="text" required name="tenSanPham"><br>
            <span style="color: red">${errors}</span><br>
            <button type="submit">Thêm</button>
        </form>
    </c:if>
</div>
<br>
<div>
    <form style="left: 0" role="search" method="get" action="/san-pham/search">
        <span>Tim Kiem</span> <input style="height: 1.5rem" name="tenSanPham" type="search" placeholder="Search"
                                     aria-label="Search"
                                     value="${param.tenSanPham}" required>
        <button type="submit">Search</button>
        <button ><a href="/san-pham/index" style="text-decoration: none"> <i class="bi bi-arrow-repeat"></i> Load</a></button>
    </form>

    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm </th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listSp}" var="sp">
            <tr>
                <td>${sp.id}</td>
                <td>${sp.tenSanPham}</td>
                <td>
                    <a href="/san-pham/detail/${sp.id}"><i class="bi bi-pencil-square"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div style="display: flex; justify-content: space-between ; ">
        <div>
            <c:if test="${page > 0}">
                <a href="?page=${page - 1 }"><i class="bi bi-arrow-left-circle"></i></a>
            </c:if>
        </div>

        <div style="display: flex ; gap: 0.5rem">
            <c:catch var="catchException">
                <c:if test="${ empty param.tenSanPham}">
                    <c:forEach begin="0" end="${page1 - 1}" varStatus="i">
                        <div> <a href="/san-pham/index?page=${i.index}">${i.index + 1}</a></div>
                    </c:forEach>
                </c:if>
            </c:catch>
        </div>

        <div>
            <c:if test="${page < page1 - 1}">
               <a href="?page=${page + 1 }"><i class="bi bi-arrow-right-circle"></i></a>
            </c:if>
        </div>
    </div>
</div>

</body>
<style>
    .sb-sidenav .sb-sidenav-menu .nav .nav-link {
        text-decoration: none;
    }
    .container {
        max-width: 500px; /* Set max-width for iPhone 6 landscape mode */
        margin: 0 auto;
    }


    input {
        width: 50%;
        padding: 0.375rem 0.75rem;
        margin-bottom: 0.5rem;
        font-size: 14px; /* Adjusted font size for better responsiveness */
        line-height: 1.5;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;
    }

    button {
        font-size: 14px; /* Adjusted font size for better responsiveness */
    }

    .table {
        width: 100%;
        margin-bottom: 1rem;
        color: #212529;
        border-collapse: collapse;
        font-size: 14px; /* Adjusted font size for better responsiveness */
    }

    .table,
    th,
    td {
        border: 1px solid #ced4da;
    }

    th,
    td {
        padding: 0.25rem; /* Adjusted padding */
        text-align: left;
    }

    th {
        background-color: #f8f9fa;
    }

    /* Responsive table */
    @media (max-width: 576px) {
        .table {
            overflow-x: auto;
            display: block;
        }
    }

</style>
</html>

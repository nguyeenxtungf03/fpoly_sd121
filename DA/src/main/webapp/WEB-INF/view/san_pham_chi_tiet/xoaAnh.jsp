<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="widtd=device-widtd, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body class="container" style=" padding: 2rem">
<a href="/san-pham-chi-tiet/index" style="text-decoration: none ;color: black "> ↩ Danh sách sản phẩm chi tiết </a>
<H1 style="text-align: center ; color: #198754">Thư mục ảnh </H1>
<table class="table table-hover">
    <tdead>
        <tr>
            <td scope="col"> Tên sản phẩm </td>
            <td scope="col"> Ảnh</td>
            <td scope="col">Chức năng</td>
        </tr>
    </tdead>
    <tbody>
    <c:forEach items="${listSpct}" var="spct">
    <tr style="flex-direction: row ">
        <td scope="row">${spct.idSanPham.tenSanPham}</td>
        <td scope="row"><img style="width: 6rem ;height: 8rem" src="/assets/images/imgSp/${spct.anhSanPham}"></td>
        <td scope="row">
            <button style=""><a class="navbar-brand"
                                href="/san-pham-chi-tiet/xoaAnh/${spct.id}">❌</a>
            </button>
        </td>
    </tr>
    </c:forEach>

</table>
<div style="display: flex; justify-content: space-between ; ">

    <div>
        <c:if test="${page > 0}">
            <button class="btn btn-outline-success" type="button"><a class="navbar-brand" href="?page=${page - 1 }">Trang
                truoc</a></button>
        </c:if>
    </div>
    <div>
        <c:forEach begin="0" end="${page1 - 1}" varStatus="i">
            <button class="btn btn-outline-success"><a class="navbar-brand"
                                                       href="/san-pham-chi-tiet/fileAnh?page=${i.index}">${i.index + 1}</a>
            </button>
        </c:forEach>
    </div>


    <div>
        <c:if test="${page < page1 - 1}">
            <button class="btn btn-outline-success" type="submit"><a class="navbar-brand" href="?page=${page + 1 }">Trang
                sau</a></button>
        </c:if>
    </div>
</div>

</body>
</html>

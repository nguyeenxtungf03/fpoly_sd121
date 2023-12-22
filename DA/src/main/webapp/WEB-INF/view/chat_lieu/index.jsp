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
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>

<body>
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>
<div style="width: 84% ; float: right ;padding: 0rem 1rem 1rem 0rem">
    <div class="section">
        <form style="left: 0" role="search" method="get" action="/chat-lieu/search">
            <span>Tìm kiếm </span> <input name="tenChatLieu" type="search" placeholder="Search"
                                          aria-label="Search"
                                          value="${param.tenChatLieu}" required>
            <button class="btn btn-primary" type="submit">Search</button>
            <a class="btn btn-primary" href="/chat-lieu/index" style="text-decoration: none"> <i
                    class="bi bi-arrow-repeat"></i> Load</a>
        </form>

        <c:if test="${not empty cl.id}">
            <form action="/chat-lieu/update/${cl.id}" method="post">
                <span>Id</span><br>
                <input disabled type="text" name="tenChatLieu" value="${cl.id}"><BR>
                <span>Tên chất liệu  </span><br>
                <input type="text" name="tenChatLieu" required value="${cl.tenChatLieu}">
                <span style="color: red">${errors}</span><br>
                <button class="btn btn-primary" type="submit">Cập nhật</button>
            </form>
        </c:if>

        <c:if test="${empty cl.id}">
            <form action="/chat-lieu/add" method="post">
                <span>Tên chất liệu  </span><br>
                <input type="text" required name="tenChatLieu">
                <span style="color: red">${errors}</span><br>
                <button class="btn btn-primary" type="submit">Thêm</button>
            </form>
        </c:if>
        <div>

            <h1 style="text-align: center">BẢNG CHẤT LIỆU</h1>
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên chất liệu</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listCl}" var="cl">
                    <tr>
                        <td>${cl.id}</td>
                        <td>${cl.tenChatLieu}</td>
                        <td>
                            <a href="/chat-lieu/detail/${cl.id}"><i class="bi bi-pencil-square"></i></a>
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
                        <c:if test="${ empty param.tenChatLieu}">
                            <c:forEach begin="0" end="${page1 - 1}" varStatus="i">
                                <div><a href="/chat-lieu/index?page=${i.index}">${i.index + 1}</a></div>
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

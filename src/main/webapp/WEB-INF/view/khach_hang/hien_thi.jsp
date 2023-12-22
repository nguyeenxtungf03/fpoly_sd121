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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
</head>
<body style="width:auto">
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>

<div style="width: 84% ; float: right ;padding: 1rem 1rem 1rem 0rem">

<div class="container">
    <br>

    <div class="d-flex ; align-content-center ; justify-content-between">
        <div>
            <form action="/khach-hang/searchTK">
                Tìm kiếm <input name="key" value="" type="search" placeholder="Search...">
                <button class="btn btn-secondary" style="color: black " type="submit"><i class="bi bi-search"></i> Tìm kiếm</button>
                <a class="btn btn-secondary" class="navbar-brand" href="/khach-hang/hien-thi">
                    <svg class="svg-inline--fa fa-arrows-rotate" aria-hidden="true" focusable="false" data-prefix="fas"
                         data-icon="arrows-rotate" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                         data-fa-i2svg="">
                        <path fill="currentColor"
                              d="M89.1 202.6c7.7-21.8 20.2-42.3 37.8-59.8c62.5-62.5 163.8-62.5 226.3 0L370.3 160H320c-17.7 0-32 14.3-32 32s14.3 32 32 32H447.5c0 0 0 0 0 0h.4c17.7 0 32-14.3 32-32V64c0-17.7-14.3-32-32-32s-32 14.3-32 32v51.2L398.4 97.6c-87.5-87.5-229.3-87.5-316.8 0C57.2 122 39.6 150.7 28.8 181.4c-5.9 16.7 2.9 34.9 19.5 40.8s34.9-2.9 40.8-19.5zM23 289.3c-5 1.5-9.8 4.2-13.7 8.2c-4 4-6.7 8.8-8.1 14c-.3 1.2-.6 2.5-.8 3.8c-.3 1.7-.4 3.4-.4 5.1V448c0 17.7 14.3 32 32 32s32-14.3 32-32V396.9l17.6 17.5 0 0c87.5 87.4 229.3 87.4 316.7 0c24.4-24.4 42.1-53.1 52.9-83.7c5.9-16.7-2.9-34.9-19.5-40.8s-34.9 2.9-40.8 19.5c-7.7 21.8-20.2 42.3-37.8 59.8c-62.5 62.5-163.8 62.5-226.3 0l-.1-.1L109.6 352H160c17.7 0 32-14.3 32-32s-14.3-32-32-32H32.4c-1.6 0-3.2 .1-4.8 .3s-3.1 .5-4.6 1z"></path>
                    </svg><!-- <i class="fas fa-sync"></i> Font Awesome fontawesome.com --> Load</a>

                <br><br>
            </form>
        </div>
        <div>
            <form action="/khach-hang/searchTT">
                Trạng thái : <input ${tt == 1 ?  'checked':'' } name="tt" value="1" type="radio" onchange="updateSelection()"> Kích hoạt
                <input name="tt" ${tt == 2 ?  'checked':'' }  value="2" type="radio" onchange="updateSelection()" > Huỷ kích hoạt
                <button class="btn btn-secondary" style="color: black ;display: none " type="submit"><i class="bi bi-search"  id="submitButton"></i> Tìm kiếm</button>
            </form>
            <br>
        </div>
    </div>
    <H1 style="text-align: center ; color: black;font-weight: 600">Danh sách tài khoản </H1>

    Tổng tài khoản : <span style="font-weight: 200"> ${fn:length(listKh)} </span><br><br>
    <table class="table table-hover">
        <thead>
        <tr style="background: #565e64">
            <td style="color: white" scope="col">Id</td>
            <td style="color: white" scope="col">Tên tài khoản</td>
            <td style="color: white" scope="col">Họ và Tên</td>
            <td style="color: white" scope="col">Ngày sinh</td>
            <td style="color: white" scope="col">Số điện thoại</td>
            <td style="color: white" scope="col">Email</td>
            <td style="color: white" scope="col">Giới tính</td>
            <td style="color: white" scope="col">Chức vụ</td>
            <td style="color: white" scope="col">Trạng thái</td>
            <td style="color: white" scope="col">Chức năng</td>
            <td style="color: white" scope="col"></td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listKh}" var="kh">
        <tr>
            <td scope="row">${kh.id}</td>
            <td scope="row">${kh.tenTaiKhoan.tenTaiKhoan}</td>
            <td scope="row">${kh.ho} ${kh.tenDem} ${kh.ten}</td>
            <td scope="row" class="rawDate">${kh.ngaySinh}</td>
            <td scope="row">${kh.sdt}</td>
            <td scope="row">${kh.email}</td>
            <td scope="row">${kh.gioiTinh == true ? 'Nam' :'Nữ'}</td>
            <td scope="row">${kh.tenTaiKhoan.chucVu == "ROLE_ADMIN" ? 'Quản lý' : kh.tenTaiKhoan.chucVu == "ROLE_STAFF" ? 'Nhân Viên' : 'Khách hàng'}</td>
            <td scope="row">${kh.trangThai == 1 ? 'Kích hoạt' :kh.trangThai == 2 ?'Không hoạt động' :''}</td>
            <td scope="row">
                <c:if test="${kh.trangThai == 1}">
                    <form action="/khach-hang/trangThaiHuy">
                        <input style="display: none" name="idKh" value="${kh.id}">
                        <button class="btn btn-secondary" type="submit">Hủy kích hoạt</button>
                    </form>
                </c:if>

                <c:if test="${kh.trangThai == 2}">
                    <form action="/khach-hang/trangThaiKichHoat">
                        <input style="display: none" name="idKh" value="${kh.id}">
                        <button class="btn btn-secondary" type="submit">kích hoạt</button>
                    </form>
                </c:if>
            </td>

        </tr>

        </c:forEach>

    </table>
    <c:if test="${not empty page1}">
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
                                                                   href="/khach-hang/hien-thi?page=${i.index}">${i.index + 1}</a>
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

    <script>
        var rawDateElements = document.getElementsByClassName('rawDate');

        // Lặp qua từng phần tử và thực hiện xử lý
        for (var i = 0; i < rawDateElements.length; i++) {
            var rawDate = rawDateElements[i].innerText;

            // Tạo một đối tượng Date từ chuỗi ngày tháng
            var dateObject = new Date(rawDate);

            // Định dạng ngày tháng và giờ
            var formattedDate = dateObject.toLocaleString('en-GB', {
                day: 'numeric',
                month: 'numeric',
                year: 'numeric',
            });

            rawDateElements[i].innerText = formattedDate;
        }

    </script>
</div>
</div>

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script>
    function updateSelection() {
        // Thực hiện các thao tác cập nhật hoặc gọi hàm xử lý khi radio button thay đổi
        console.log('Radio button changed');
        // Thêm mã JavaScript của bạn tại đây, ví dụ như kích hoạt sự kiện của button
        document.getElementById('submitButton').click();
    }
</script>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f5f5f5;
    }

    .table {
        background-color: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .table th, .table td {
        border: none;
        padding: 12px;
        text-align: center;
    }

    .table th {
        background-color: #ff6600; /* Màu cam của Shopee */
        color: #fff;
    }

    .table tbody tr:nth-child(odd) {
        background-color: #fff;
    }

    .table tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .table tbody tr:hover {
        background-color: #e9ecef; /* Màu cam nhạt khi hover */
    }

    .container {
        background-color: #ffffff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        padding: 30px;
        border-radius: 10px;
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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; ISO-8859-1" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="widtd=device-widtd, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body class="container">

<c:if test="${ not empty listTop10Kh}">
    <H1 style="text-align: center ; color: #198754">Top 10 khách hàng tiềm năng </H1>

    <table id="myTable" class="table table-hover">
        <tdead>
            <tr  style="text-align: center">
                <td scope="col">Họ và tên</td>
                <td scope="col">Số điện thoại</td>
                <td scope="col">Email</td>
                <td scope="col">Số lượng mua</td>
                <td scope="col">Tổng chi tiêu</td>
            </tr>
        </tdead>
        <tbody>

        <c:forEach items="${listTop10Kh}" var="kh" varStatus="i">
            <c:if test="${not empty kh.trangThai}">
            <tr  style="text-align: center">
                <td scope="row">${kh.ho} ${kh.tenDem}  ${kh.ten}</td>
                <td scope="row">${kh.sdt}</td>
                <td scope="row">${kh.email}</td>
                <td scope="row"><fmt:formatNumber value="${kh.soLuong}"
                                                  pattern="##,###,###"></fmt:formatNumber></td>
                <td scope="row"><fmt:formatNumber value="${kh.thanhTien}"
                                                  pattern="##,###,###"></fmt:formatNumber> ₫
                </td>
            </tr>
        </c:if>
        </c:forEach>
        </tbody>

    </table>
</c:if>

<c:if test="${ not empty listTop10Sp}">
    <H1 style="text-align: center ; color: #198754">Top 10 sản phẩm bán chạy </H1>
    <table id="myTable" class="table table-hover">
        <tdead>
            <tr style="text-align: center">
                <td scope="col">Stt</td>
                <td scope="col">Ảnh</td>
                <td scope="col">Tên sản phẩm </td>
                <td scope="col">Loại sản phẩm </td>
                <td scope="col">Chất liệu </td>
                <td scope="col">Thương hiệu </td>
                <td scope="col">Số lượng mua</td>
            </tr>
        </tdead>
        <tbody>

        <c:forEach items="${listTop10Sp}" var="sp" varStatus="i">
            <tr style="text-align: center">
                <td scope="row">${i.index + 1}</td>
                <td><img style=" max-width: 50px;max-height: 50px; object-fit: cover;"
                         src="/assets/images/imgSp/${sp.idSanPhamChiTiet.anhSanPham}"></td>
                <td scope="row">${sp.idSanPham.tenSanPham}<br> [ ${sp.idMauSac.tenMauSac} - ${sp.idKichThuoc.tenKichThuoc} ] </td>
                <td scope="row">${sp.idLoaiSanPham.tenLoai}</td>
                <td scope="row">${sp.idChatLieu.tenChatLieu}</td>
                <td scope="row">${sp.idThuongHieu.tenThuongHieu}</td>
                <td scope="row"><fmt:formatNumber value="${sp.soLuong}"
                                                  pattern="##,###,###"></fmt:formatNumber></td>

        </c:forEach>
        </tbody>

    </table>
</c:if>


<script>
    // Hàm để hiển thị 10 dòng đầu tiên của bảng
    function hienThi10DongDauTien() {
        var table = document.getElementById("myTable"); // ID của bảng
        var rows = table.getElementsByTagName("tr");

        // Hiển thị 10 dòng đầu tiên, ẩn các dòng còn lại
        for (var i = 0; i < rows.length; i++) {
            if (i <= 10) {
                rows[i].style.display = "";
            } else {
                rows[i].style.display = "none";
            }
        }
    }

    // Hàm được gọi khi trang JSP được tải
    window.onload = function () {
        hienThi10DongDauTien(); // Gọi hàm hiển thị ngay khi trang được tải
    };
</script>
</body>
</html>

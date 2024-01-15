<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Khuyến Mại</title>
    <!-- Link thư viện Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        body a {
            text-decoration: none;
        }

    </style>
</head>
<body>
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>
<div class="km" style="width: 84% ; float: right ;padding: 0.5rem 0.5rem 1rem 0">
    <div class="container">
    <form role="search" method="get" action="/khuyen-mai/form-add">
        <div class="row">
            <div class="col-5">
                <label>Sản phẩm</label>
                <select id="idSanPham" name="idSanPham" class="form-control">
                    <option value="">--Tất cả--</option>
                    <c:forEach items="${listSp}" var="sp">
                        <option  ${sp == idSanPham or sp.id == idSp ? 'selected' : ''}
                                value="${sp.id}">${sp.tenSanPham}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-3">
                <label>Loại sản phẩm</label>
                <select id="idLoaiSanPham" name="idLoaiSanPham" class="form-control">
                    <option value="">--Tất cả--</option>
                    <c:forEach items="${listLsp}" var="sp">
                        <option ${idLoaiSanPham == sp or sp.id == idLsp ? 'selected' : ''}
                                value="${sp.id}">${sp.tenLoai}</option>
                    </c:forEach> </select>
            </div>
            <div class="col-2">
                <label>Thương hiệu</label>
                <select id="idThuongHieu" name="idThuongHieu" class="form-control">
                    <option value="">--Tất cả--</option>
                    <c:forEach items="${listTh}" var="sp">
                        <option ${idThuongHieu == sp or sp.id == idTh ? 'selected' : ''}
                                value="${sp.id}">${sp.tenThuongHieu}</option>
                    </c:forEach> </select>
            </div>
            <div class="col-2">
                <label>Chất liệu</label>
                <select id="idChatLieu" name="idChatLieu" class="form-control">
                    <option value="">--Tất cả--</option>
                    <c:forEach items="${listCl}" var="sp">
                        <option ${idChatLieu == sp or sp.id == idCl ? 'selected' : ''}
                                value="${sp.id}">${sp.tenChatLieu}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="row" style="padding-top: 10px">
            <div class="col-5">
                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                <a class="btn btn-secondary ml-2" href="/khuyen-mai/form-add">Làm lại bộ lọc</a>
            </div>
        </div>
    </form>
    </div>
    <div class="container">
        <div class="row" style="padding-top: 8px">
            <div class="col-9" >
                <form id="myForm" action="/khuyen-mai/add" method="post" onsubmit="return validateDateRange()">
                    <table class="table table-hover ">
                        <tdead style="color: black  ">
                            <tr style="background: #c8cbcf  ">
                                <td scope="col"><input type="checkbox" id="checkAll"></td>
                                <td scope="col"> Ảnh</td>
                                <td scope="col">Tên sản phẩm</td>
                                <td scope="col">Giá bán</td>
                                <td scope="col">Thương hiệu</td>
                                <td scope="col">Chất liệu</td>
                            </tr>
                        </tdead>
                        <tbody>
                        <c:forEach items="${listSpctPage}" var="spct" varStatus="i">
                            <tr>
                                <td><input type="checkbox" class="checkbox" name="selectedProductIds"
                                           value="${spct.id}" ${fn:contains(selectedProductIds, spct.id) or fn:contains(spct.idKhuyenMai.id, km.id) && not empty km.id ? 'checked' : ''}>
                                </td>
                                <td><img
                                        style="width: 1.5rem ;height: 2rem"
                                        src="../../../assets/images/imgSp/${spct.anhSanPham}">
                                </td>
                                <td style="text-align: start">${spct.idSanPham.tenSanPham} ( ${spct.idMauSac.tenMauSac}
                                    - ${spct.idKichThuoc.tenKichThuoc} ) <c:if test="${not empty spct.idKhuyenMai}" > <span style="color:red;"> ( Khuyến mại  <fmt:formatNumber>${spct.idKhuyenMai.giaTri}</fmt:formatNumber>
                                <c:if test="${spct.idKhuyenMai.loaiKhuyenMai == 'product'}">₫</c:if>
                                        <c:if test="${spct.idKhuyenMai.loaiKhuyenMai == 'percentage'}">%</c:if> ) </span> </c:if>
                                </td>
                                <td scope="row"><fmt:formatNumber pattern="###,###,###"
                                                                  value="${spct.giaBan}"></fmt:formatNumber> ₫
                                </td>
                                <td scope="row">${spct.idThuongHieu.tenThuongHieu} </td>
                                <td scope="row">${spct.idChatLieu.tenChatLieu} </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
            </div>
            <div class="col-3">
                <div class="formKm">
                    <c:if test="${ empty km.id }">
                        <div class="col-md-12 "
                             style="text-align: center; font-weight:600;margin-top: 10px ; font-size: 20px"> Thêm
                            khuyến mại
                        </div>
                    </c:if>
                    <c:if test="${ not empty km.id }">
                        <div class="col-md-12 "
                             style="text-align: center; font-weight:600;margin-top: 10px ; font-size: 20px"> Cập
                            nhật khuyến mại
                        </div>
                    </c:if>
                    <input name="id" type="hidden" value="${km.id}">
                    <div class="col-md-12 mb-3">
                        <label for="productName">Tên khuyến mại</label>
                        <input placeholder="Nhập tên khuyến mại" id="yourInput" name="tenKhuyenMai" type="text"
                               value="${km.tenKhuyenMai}" class="form-control"
                               id="productName" required>
                    </div>
                    <div class="col-md-12 mb-3">
                  <span style="display: flex; gap : 10px; flex-direction: row;">
                      Loại KM :
                      <input checked
                             type="radio"
                             name="loaiKhuyenMai" ${km.loaiKhuyenMai == "product" ? 'checked':''}
                             value="product" onclick="limitPercentage()">VNĐ
                      <input style="margin-left: 20px;"
                             type="radio"
                             name="loaiKhuyenMai" ${km.loaiKhuyenMai == "percentage" ? 'checked':''}
                             value="percentage" onclick="limitPercentage()">%</span>
                    </div>
                    <div class="col-md-12 mb-3">
                        <label for="discountValue">Giá Trị Khuyến Mại:</label>
                        <input placeholder="Nhập giá trị khuyến mại" name="giaTri" min="1" value="${km.giaTri}"
                               type="number" max="100000000"
                               class="form-control" id="discountValue" required>
                    </div>
                    <div class="col-md-12 mb-3">
                        <label for="discountValue">Ngày bắt đầu</label>
                        <input type="datetime-local" id="startDate"
                               value="<fmt:formatDate value="${km.ngayBatDau}" pattern = "yyyy-MM-dd'T'HH:mm"></fmt:formatDate>"
                               name="ngayBatDau"
                               class="form-control" required>
                    </div>
                    <div class="col-md-12 mb-3">
                        <label for="discountValue">Ngày kết thúc</label>
                        <input type="datetime-local" id="endDate"
                               value="<fmt:formatDate value="${km.ngayKetThuc}" pattern = "yyyy-MM-dd'T'HH:mm"></fmt:formatDate>"
                               name="ngayKetThuc"
                               class="form-control" required>
                    </div>

                    <div class="col-md-12 mb-3" style="text-align: center; font-weight:600;">
                        <c:if test="${empty km.id }">
                            <button class="btn btn-primary" type="submit">Thêm</button>
                        </c:if>
                        <c:if test="${not empty km.id }">
                            <button class="btn btn-primary" type="submit">Cập nhật</button>
                        </c:if>
                    </div>
                </div>
            </form>
            </div>
        </div>

            <div style="display: flex; justify-content: space-between ;font-weight: 200 ">
                <c:if test="${ empty param.keyword  and not empty page1 and not empty page}">
                <div>
                    <c:if test="${page > 0}">
                        <button style="color: black ; height: 30px ; background: white ; border-radius: 5px"
                                type="button">
                            <a style="text-decoration: none ; color: black" href="?page=${page - 1 }">Trang
                                trước</a></button>
                    </c:if>
                </div>
                <div>
                    <c:forEach begin="0" end="8" varStatus="i">
                        <button ${i.index == page ?'style="background: #b3b7bb ;border-radius: 5px "' :''} type="button"
                                style="color: black ; height: 30px ; background: white ; border-radius: 5px">
                            <a style="text-decoration: none ; color: black "
                               href="/khuyen-mai/form-add?page=${i.index}">${i.index + 1}</a>
                        </button>
                    </c:forEach>
                </div>
                <div>
                    <c:if test="${page < page1 - 1}">
                        <button style="color: black ; height: 30px ; background: white ; border-radius: 5px"
                                type="button">
                            <a style="text-decoration: none ; color: black" href="?page=${page + 1 }">Trang
                                sau</a></button>
                    </c:if>
                </div>

            </div>

            </c:if>
            </form>
        </div>
    </div>
</div>

<%--Thong bao--%>
<div id="message" class="message"></div>

<style>

    form[role="search"] {
        margin-bottom: 1rem;
    }

    .container {
        background-color: #ffffff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        padding: 10px 15px 5px 15px;
        border-radius: 10px;
        margin-top: 10px;
    }


    /* Checkbox styles */
    .checkbox {
        margin-right: 5px;
    }

    /* Table border styles with raised effect */
    .table {
        border-collapse: collapse;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        border-radius: 10px;

    }

    .formKm {
        border-collapse: collapse;
        margin-bottom: 1rem;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        background-color: white;
        color: black;
        padding: 20px 0 20px 0;
        border: 1px solid #dee2e6;
    }


    .table th, .table td {
        border: 1px solid #dee2e6; /* Default border color */
        font-weight: 400;
        font-size: 13px;
        text-align: center;
    }

    .table th {
        background-color: #5c636a;
        color: white;
    }

</style>
<style>
    .message {
        position: fixed;
        top: 20px;
        width: 400px;
        right: 19px; /* Đặt vị trí ở góc phải */
        padding: 10px;
        background: white;
        border-radius: 5px; /* Độ cong các góc */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Đổ bóng */
        display: none;
        animation: fadeInOut 4s ease-out;
    }

    .message.xanh {
        color: #34ce57;
    }

    .message.do {
        color: red;
    }

    @keyframes fadeInOut {
        0% {
            opacity: 1;
        }
        90% {
            opacity: 1;
        }
        100% {
            opacity: 0;
            display: none;
        }
    }
</style>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>


<script>
    document.getElementById('checkAll').addEventListener('change', function () {
        var checkboxes = document.getElementsByClassName('checkbox');
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script>
    $(document).ready(function () {
        $('#idSanPham').select2();
    });
    $(document).ready(function () {
        $('#idThuongHieu').select2();
    });
    $(document).ready(function () {
        $('#idLoaiSanPham').select2();
    });
    $(document).ready(function () {
        $('#idChatLieu').select2();
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Lấy tham chiếu đến phần tử thông báo
        var messageElement = document.getElementById("message");

        // Lấy giá trị của ${pass} và ${errors}
        var passValue = "${pass}";
        var errorsValue = "${errors}";

        // Xác định màu sắc của thông báo
        var colorClass = passValue ? "xanh" : "do";

        // Thêm lớp CSS tương ứng
        messageElement.classList.add("message", colorClass);

        // Hiển thị và tự động ẩn thông báo nếu cần
        showMessage(passValue || errorsValue);

        // Hàm hiển thị và tự động ẩn thông báo
        function showMessage(message) {
            if (message) {
                // Hiển thị thông báo
                messageElement.innerHTML = message;
                messageElement.style.display = "block";

                // Tự động ẩn thông báo sau 1 giây
                setTimeout(function () {
                    messageElement.style.display = "none";
                }, 2000);
            }
        }
    });

</script>

<script>
    function limitPercentage() {
        // Lấy đối tượng input giá trị khuyến mãi
        var discountInput = document.getElementById('discountValue');

        // Lấy đối tượng radio button "VNĐ"
        var vndRadio = document.querySelector('input[name="loaiKhuyenMai"][value="product"]');

        // Lấy đối tượng radio button "%"
        var percentageRadio = document.querySelector('input[name="loaiKhuyenMai"][value="percentage"]');

        // Kiểm tra xem radio "VNĐ" đã được chọn hay không
        if (vndRadio.checked) {
            // Nếu đã chọn, xóa giới hạn giá trị
            discountInput.max = 100000000;
        } else if (percentageRadio.checked) {
            // Nếu đã chọn radio "%", áp dụng giới hạn giá trị là 100
            discountInput.max = 100;
        }
    }
</script>

</body>
</html>

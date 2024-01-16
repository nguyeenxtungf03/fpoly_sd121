<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="widtd=device-widtd, initial-scale=1">
    <title>Bootstrap demo</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
</head>

<body style="width:auto">
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>

<div style="width: 84% ; float: right ;padding: 1rem 1rem 1rem 0rem">

    <div class="container">
        <a href="/san-pham-chi-tiet/hien-thi-sp" style="text-decoration: none ;color: black "> ↩ Danh sách sản phẩm </a>
        <form method="get" action="/san-pham-chi-tiet/bo-loc" class="filter-form">
            <div class="row">
                <div class="col-md-5">
                    <label>Sản phẩm</label>
                    <select  id="idSanPham" name="idSanPham" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listSp}" var="sp">
                            <option  ${sp == idSanPham or sp.id == idSp.id ? 'selected' : ''}
                                    value="${sp.id}">${sp.tenSanPham}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-2">
                    <label>Màu sắc</label>
                    <select id="idMauSac" name="idMauSac" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listMs}" var="ms">
                            <option ${idMauSac == ms  ? 'selected' : ''} value="${ms.id}">${ms.tenMauSac}</option>
                        </c:forEach> </select>
                </div>
                <div class="col-md-2">
                    <label>Kích Thước</label>
                    <select id="idKichThuoc" name="idKichThuoc" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listKt}" var="sp">
                            <option ${idKichThuoc == sp ? 'selected' : ''} value="${sp.id}">${sp.tenKichThuoc}</option>
                        </c:forEach> </select>
                </div>
                <div class="col-md-3">
                    <label>Loại sản phẩm</label>
                    <select id="idLoaiSanPham" name="idLoaiSanPham" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listLsp}" var="sp">
                            <option ${idLoaiSanPham == sp or sp.id == idLsp.id ? 'selected' : ''} value="${sp.id}">${sp.tenLoai}</option>
                        </c:forEach> </select>
                </div>

            </div>
            <div class="row">
                <div class="col-md-3">
                    <label>Thương hiệu</label>
                    <select id="idThuongHieu" name="idThuongHieu" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listTh}" var="sp">
                            <option ${idThuongHieu == sp or sp.id == idTh.id ? 'selected' : ''}
                                    value="${sp.id}">${sp.tenThuongHieu}</option>
                        </c:forEach> </select>
                </div>
                <div class="col-md-3">
                    <label>Chất liệu</label>
                    <select id="idChatLieu" name="idChatLieu" class="form-control">
                        <option value="">--Tất cả--</option>
                        <c:forEach items="${listCl}" var="sp">
                            <option ${idChatLieu == sp or sp.id == idCl.id ? 'selected' : ''} value="${sp.id}">${sp.tenChatLieu}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-2">
                    <label>Trạng thái</label>
                    <select name="trangThai"class="form-select form-select-sm">
                        <option value="">--Tất cả--</option>
                        <option ${trangThai == 0 ?'selected' :''} value="0">Hoạt động</option>
                        <option ${trangThai == 1 ?'selected' :''} value="1">Không hoạt động</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="minPrice">Giá bán</label>
                        <div class="input-group">
                            <input name="toiThieu" value="${toiThieu}" type="number" class="form-control" id="minPrice"
                                   placeholder="Tối thiểu" min="1">
                            <div class="input-group-prepend">
                                <span class="input-group-text">-</span>
                            </div>
                            <input name="toiDa" value="${toiDa}" type="number" class="form-control" id="maxPrice"
                                   placeholder="Tối đa" min="1">
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
            <a class="btn btn-secondary ml-2" href="/san-pham-chi-tiet/bo-loc?idSanPham=${idSanPham.id}${idSp.id}&idLoaiSanPham=${idLoaiSanPham.id}${idLsp.id}&idThuongHieu=${idThuongHieu.id}${idTh.id}&idChatLieu=${idChatLieu.id}${idCl.id}&trangThai=${trangThai}">Làm lại bộ
                lọc</a>
        </form>

    </div>
    <div class="danhSach">
        <div class="d-grid  d-md-flex justify-content-md-start" style="padding-bottom: 20px">
        <button class="btn btn-primary me-md-2" onclick="toggleConversion()">Cập nhật giá bán và số lượng</button>
        </div>

        <form id="capNhat" method="post" action="/san-pham-chi-tiet/capNhatSoLuong" >
            <div class="d-grid  d-md-flex justify-content-md-end" style="padding-bottom: 20px">
                <button onclick="confirmAction2(event)" class="btn btn-success me-md-2" type="submit">Lưu cập nhật</button>
            </div>

            <div class="container"  style="text-align: center ; margin-bottom: 20px">
            <span style=" font-weight: 400 ;font-size: 15px ;margin-right: 35px"> <strong>Sản phẩm :</strong> ${idSp.tenSanPham} ${idSanPham.tenSanPham}</span>
            <span style=" font-weight: 400 ;font-size: 15px ; margin-right: 35px"> <strong>Loại sản phẩm :</strong> ${idLsp.tenLoai} ${idLoaiSanPham.tenLoai} </span>
            <span style=" font-weight: 400 ;font-size: 15px ; margin-right: 35px"> <strong>Chất liệu :</strong> ${idCl.tenChatLieu} ${idChatLieu.tenChatLieu} </span>
            <span style=" font-weight: 400 ;font-size: 15px"> <strong>Thương hiệu :</strong> ${idTh.tenThuongHieu} ${idThuongHieu.tenThuongHieu} </span>
        </div>

        <div class="danhSach" >
        <H1 style="text-align: center ; color: black ; font-weight: 600">Sản phẩm chi tiết </H1>
        <table class="table table-hover">
            <tdead style="color: white">
                <tr style="background: #5c636a ">
                    <td style="color: white" ><input  id="checkAll" type="checkbox"></td>
                    <td style="color: white" scope="col"> Ảnh</td>
                    <td style="color: white" scope="col">Tên sản phẩm</td>
                    <td style="color: white" scope="col">Màu sắc </td>
                    <td style="color: white" scope="col">Kích cỡ</td>
                    <td style="color: white" scope="col"> Giá bán</td>
                    <td style="color: white" scope="col"> Số lượng</td>
                    <td style="color: white" scope="col"> Trạng thái</td>
                    <td style="color: white" scope="col">Chức năng</td>
                </tr>
            </tdead>
            <tbody>
            <c:forEach items="${listSpct}" var="spct" varStatus="i">
            <tr>
                <td style="width: 10px" ><input name="checkBox" class="checkAll" type="checkbox" value="${spct.id}">
                    <input name="idSpctUpdate" type="hidden"  value="${spct.id}">
                </td>
                <td scope="row"><a href="/san-pham-chi-tiet/detail/${spct.id}"><img style="width: 3rem ;height: 4rem"
                                                                                    src="../../../assets/images/imgSp/${spct.anhSanPham}"></a>
                </td>
                <td scope="row">${spct.idSanPham.tenSanPham}
                    <span style="color: red">
                        <c:if test="${not empty spct.idKhuyenMai && spct.idKhuyenMai.ngayBatDau <= newDate }">
                    ( Khuyến mại <fmt:formatNumber>${spct.idKhuyenMai.giaTri}</fmt:formatNumber>
                    <c:if test="${spct.idKhuyenMai.loaiKhuyenMai == 'product'}">₫</c:if>
                    <c:if test="${spct.idKhuyenMai.loaiKhuyenMai == 'percentage'}">%</c:if>
                    )
                    </c:if>
                </span>
                </td>
                <td scope="row">${spct.idMauSac.tenMauSac}</td>
                <td scope="row">${spct.idKichThuoc.tenKichThuoc}</td>
                <td class="giaBan" > ${spct.giaBan}</td>
                <td class="soLuong">${spct.soLuong}</td>
                <td scope="row">${spct.trangThai == 0 ? 'Hoạt động' :'Không hoạt động'}</td>
        </form>

                <td scope="row"
                    style="display: flex;flex-direction: column ; gap: 1rem ; align-items: center ">
                    <form method="post" action="/san-pham-chi-tiet/delete"  >
                        <input name="idSpct" type="hidden" value="${spct.id}">
                        <input type="hidden" name="idSanPham" value="${spct.idSanPham.id}">
                        <input type="hidden" name="idLoaiSanPham" value="${spct.idLoaiSanPham.id}">
                        <input type="hidden" name="idThuongHieu" value="${spct.idThuongHieu.id}">
                        <input type="hidden" name="idChatLieu" value="${spct.idChatLieu.id}">
                        <input type="hidden" name="trangThai" value="${spct.trangThai}">
                        <button class="btn btn-outline-dark" onclick="confirmAction(event)" ><i class="bi bi-trash3"></i></button>
                    </form>

                    <span class="btn btn-outline-dark"><a class="navbar-brand"
                                                               href="/san-pham-chi-tiet/detail/${spct.id}">
                        <i class="bi bi-pencil-square"></i></a>
                    </span>
                </td>

            </tr>
            </c:forEach>

        </table>
        </div>

    </div>
</div>
<%--    thong bao xoa--%>
<div  id="successToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true"
     data-delay="1000" style="position: fixed; top: 20px; right: 20px;  z-index: 1051;background: white">
    <div class="toast-body" >

    </div>
</div>
<div  id="successToast2" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true"
      data-delay="1000" style="position: fixed; top: 20px; right: 20px;  z-index: 1051;background: white">
    <div class="toast-body" >

    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
<script>
    function confirmAction(event) {
        // Hiển thị hộp thoại xác nhận
        if (confirm("Bạn có chắc chắn muốn xoá sản phẩm này ?")) {
            // Nếu người dùng chấp nhận, thực hiện chuyển hướng
            window.location.href = event.currentTarget.querySelector('button').getAttribute('submit');
            alert("${error}")
        }
        // Ngăn chặn sự kiện mặc định (nhảy trang)
        event.preventDefault();
    }

    function confirmAction2(event) {
        // Hiển thị hộp thoại xác nhận
        if (confirm("Bạn có chắc chắn muốn cập nhật ?")) {
            // Nếu người dùng chấp nhận, thực hiện chuyển hướng
            window.location.href = event.currentTarget.querySelector('button').getAttribute('submit');
        }
        // Ngăn chặn sự kiện mặc định (nhảy trang)
        event.preventDefault();
    }

    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra giá trị và hiển thị alert nếu giá trị là null
        if (`${error}` === "Xóa sản phẩm thành công") {
            showSuccessToast("Xóa sản phẩm thành công");
        }
        if (`${error}` === "Sản phẩm này không được phép xóa !") {
            showErrorToast("Sản phẩm này không được phép xóa !");
        }

    });

    function showSuccessToast(message) {
        // Lấy phần tử có id là 'successToast'
        var successToast = document.getElementById("successToast2");

        // Thiết lập nội dung của toast
        successToast.querySelector('.toast-body').innerText = message;

        // Hiển thị toast
        $(successToast).toast('show');

        successToast.style.color = '#34ce57';

        // Đặt thời gian tự động ẩn toast sau 1 giây
        setTimeout(function () {
            $(successToast).toast('hide');
        }, 1000);
    }

    // Hàm để hiển thị thông báo lỗi
    function showErrorToast(message) {
        // Lấy phần tử có id là 'successToast'
        var successToast = document.getElementById("successToast2");

        // Thiết lập nội dung của toast
        successToast.querySelector('.toast-body').innerText = message;

        // Thiết lập màu nền của toast thành đỏ
        successToast.style.color = 'red';

        // Hiển thị toast
        $(successToast).toast('show');

        // Đặt thời gian tự động ẩn toast sau 1 giây
        setTimeout(function () {
            $(successToast).toast('hide');
        }, 1000);
    }

</script>

<script>
    var converted = false; // Biến để kiểm tra xem đã chuyển đổi hay chưa

    function toggleConversion() {
        // Lấy tất cả các ô td trong bảng
        var cells = document.querySelectorAll('.giaBan');
        var cells2 = document.querySelectorAll('.soLuong');

        // Kiểm tra trạng thái chuyển đổi và thực hiện hành động tương ứng
        if (!converted) {
            // Nếu chưa chuyển đổi, thực hiện chuyển đổi thành input
            cells.forEach(function(cell, index) {
                // Lấy giá trị hiện tại của ô td
                var currentValue = cell.textContent.trim();

                // Tạo một đối tượng input
                var inputElement = document.createElement("input");
                    // Ngược lại, sử dụng type="number"
                    inputElement.type = "number";
                    inputElement.name = "giaBan";
                    inputElement.value = currentValue;
                // Gán input vào ô td
                cell.innerHTML = "";
                cell.appendChild(inputElement);
            });

            // Nếu chưa chuyển đổi, thực hiện chuyển đổi thành input
            cells2.forEach(function(cell ,index) {
                // Lấy giá trị hiện tại của ô td
                var currentValue = cell.textContent.trim();

                // Tạo một đối tượng input
                var inputElement = document.createElement("input");
                // Ngược lại, sử dụng type="number"
                inputElement.type = "number";
                inputElement.name = "soLuong";
                inputElement.value = currentValue;
                // Gán input vào ô td
                cell.innerHTML = "";
                cell.appendChild(inputElement);
            });
            converted = true;
        } else {
            // Nếu đã chuyển đổi, thực hiện chuyển ngược lại thành giá trị ban đầu trong td
            cells.forEach(function(cell, index) {
                // Kiểm tra xem ô đó có phải là checkbox hay không
                if (index === 0 && cell.firstChild.type === "checkbox") {
                    // Nếu là checkbox, lấy giá trị từ checkbox
                    var isChecked = cell.firstChild.checked;
                    cell.textContent = isChecked ? "true" : "false";
                } else {
                    // Ngược lại, lấy giá trị từ input thông thường
                    var currentValue = cell.firstChild.value;

                    // Thiết lập giá trị của ô td thành giá trị hiện tại
                    cell.textContent = currentValue;
                }
            });
            cells2.forEach(function(cell, index) {
                // Kiểm tra xem ô đó có phải là checkbox hay không
                if (index === 0 && cell.firstChild.type === "checkbox") {
                    // Nếu là checkbox, lấy giá trị từ checkbox
                    var isChecked = cell.firstChild.checked;
                    cell.textContent = isChecked ? "true" : "false";
                } else {
                    // Ngược lại, lấy giá trị từ input thông thường
                    var currentValue = cell.firstChild.value;

                    // Thiết lập giá trị của ô td thành giá trị hiện tại
                    cell.textContent = currentValue;
                }
            });

            converted = false;
        }
    }

</script>

<script>
    document.getElementById('checkAll').addEventListener('change', function () {
        var checkboxes = document.getElementsByClassName('checkAll');
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });
</script>

<script>
    $(document).ready(function () {
        // Hiển thị Toast khi trạng thái đơn hàng được cập nhật thành công
        function showSuccessToast() {
            $('#successToast').toast('show');

            // Đặt thời gian tự động ẩn Toast sau 1 giây
            setTimeout(function () {
                $('#successToast').toast('hide');
            }, 1000);
        }

        // Bắt sự kiện khi Toast ẩn đi
        $('#successToast').on('hidden.bs.toast', function () {
            // Tải lại trang sau khi Toast ẩn đi
            location.reload();
        });

        // Bắt sự kiện khi form được submit
        $('#capNhat').submit(function (event) {
            // Ngăn chặn hành động mặc định của form (chuyển hướng trang)
            event.preventDefault();

            // Lấy dữ liệu từ form
            var formData = $(this).serialize();

            // Thực hiện POST request thông qua Ajax
            $.ajax({
                type: "POST",
                url: "/san-pham-chi-tiet/capNhatSoLuong",
                data: formData,
                success: function (response) {
                    $("#successToast .toast-body").text(response);
                    if (response === "Lưu và cập nhật thành công !") {
                        // Áp dụng style khi response bằng một giá trị cụ thể
                        $("#successToast .toast-body").css("color", "#34ce57");
                    } else {
                        // Áp dụng style khi response không bằng giá trị cụ thể
                        $("#successToast .toast-body").css("color", "red");
                    }

                    showSuccessToast();
                },
                error: function (error) {
                    console.error(error);
                    alert("Đã xảy ra lỗi . Vui lòng thử lại !");
                }
            });
        });
    });
</script>


<style>
    .btn {
        --bs-btn-padding-x: 0.5rem;
        --bs-btn-padding-y: 0.1rem;
    }

    .navbar > .container-fluid {
        justify-content: flex-start;
    }

    input{
        width: 100px;
    }

</style>
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

    .danhSach {
        margin-top: 10px;
        font-size: 14px;
        background-color: #ffffff;
        box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
        padding: 10px;
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

    .filter-form {
        margin-top: 20px;
        margin-bottom: 20px;
    }

    body {
        background-color: #f8f9fa;
    }

    .container {
        background-color: #ffffff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        padding: 30px;
        border-radius: 10px;
    }

</style>
<script>
    $(document).ready(function () {
        $('#idSanPham').select2();
    });
    $(document).ready(function () {
        $('#idMauSac').select2();
    });
    $(document).ready(function () {
        $('#idKichThuoc').select2();
    });
    $(document).ready(function () {
        $('#idLoaiSanPham').select2();
    });
    $(document).ready(function () {
        $('#idChatLieu').select2();
    });
    $(document).ready(function () {
        $('#idThuongHieu').select2();
    });

</script>


</body>
</html>
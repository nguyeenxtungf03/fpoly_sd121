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

        .promo-form {
            display: flex;
            justify-content: right;
        }

    </style>
</head>
<body>
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>
<div class="km" style="width: 84% ; float: right ;padding: 1rem 1rem 1rem 0rem">
    <div class="container">
        <form class="d-flex" style="flex-direction: row; gap: 0.5rem ; height: 2rem ;align-items: center"
              role="search" method="get" action="/khuyen-mai/form-add">
            Tìm kiếm <input name="keyword" type="search" placeholder="Tìm kiếm " aria-label="Search"
                            value="${param.keyword}" required>
            <button class="btn btn-outline-success" type="submit"><i class="bi bi-search"></i> Search</button>
            <button class="btn btn-outline-success"><a style="text-decoration: none"
                                                       href="/khuyen-mai/form-add">Load</a>
            </button>

        </form>

        <form id="myForm" action="/khuyen-mai/add" method="post" onsubmit="return validateDateRange()">
            <div class="promo-form" style="padding-top: 5px">
                <table class="table table-hover col-9" style="margin-right: 10px">
                    <tdead style="color: white  ">
                        <tr style="background: #5c636a  ">
                            <td style="color: white" scope="col"><input type="checkbox" id="checkAll"> STT</td>
                            <td style="color: white" scope="col"> Ảnh</td>
                            <td style="color: white" scope="col">Tên sản phẩm</td>
                            <td style="color: white" scope="col">Thương hiệu</td>
                            <td style="color: white" scope="col">Chất liệu</td>
                            <td style="color: white" scope="col">Trạng thái</td>
                        </tr>
                    </tdead>
                    <tbody> ${idSpct}
                    <c:forEach items="${listSpctPage}" var="spct" varStatus="i">
                        <tr>
                            <td><input type="checkbox" class="checkbox" name="selectedProductIds"
                                       value="${spct.id}" ${fn:contains(selectedProductIds, spct.id) ? 'checked' : ''}>${spct.id}
                            </td>
                            <td scope="row"><img
                                    style="width: 3rem ;height: 4rem"
                                    src="../../../assets/images/imgSp/${spct.anhSanPham}">
                            </td>
                            <td scope="row">${spct.idSanPham.tenSanPham} <br> [ ${spct.idMauSac.tenMauSac}
                                - ${spct.idKichThuoc.tenKichThuoc} ]
                            </td>
                            <td scope="row">${spct.idThuongHieu.tenThuongHieu} </td>
                            <td scope="row">${spct.idChatLieu.tenChatLieu} </td>
                            <td scope="row">${spct.trangThai == 0 ?'Hoạt động' : 'Ngừng kinh doanh'}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <!-- Form thêm khuyến mại -->
                <div class="col-md-3 mb-3" style="padding: 20px;height: 35rem ">
                    <div class="form-column">
                        <div class="col-md-12 mb-3" style="text-align: center; font-weight:600;"> Thêm khuyến mại</div>
                        <div class="col-md-12 mb-3">
                            <label for="productName">Tên khuyến mại</label>
                            <input name="id" type="hidden" value="${km.id}" class="form-control"
                                   id="" >

                            <input name="tenKhuyenMai" type="text" value="${km.tenKhuyenMai}" class="form-control"
                                   id="productName" required>
                        </div>
                        <div class="col-md-12 mb-3">
                  <span style="display: flex; gap : 10px; flex-direction: row;">
                      Loại KM :
                      <input checked
                             type="radio"
                             name="loaiKhuyenMai"
                             value="product" onclick="limitPercentage()">VNĐ
                      <input style="margin-left: 20px;"
                             type="radio"
                             name="loaiKhuyenMai"
                             value="percentage" onclick="limitPercentage()">%</span>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="discountValue">Giá Trị Khuyến Mại:</label>
                            <input name="giaTri" min="1" value="${km.giaTri}" type="number" max="10000000"
                                   class="form-control" id="discountValue" required>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="discountValue">Ngày bắt đầu</label>
                            <input type="date" id="startDate" value="${km.ngayBatDau}" name="ngayBatDau"
                                   class="form-control" required>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="discountValue">Ngày kết thúc</label>
                            <input type="date" id="endDate" value="${km.ngayKetThuc}" name="ngayKetThuc"
                                   class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-12 mb-3">
                        <span style="color: red"> ${errors}</span>
                        <span style="color: #34ce57"> ${pass}</span>
                    </div>

                    <div class="col-md-12 mb-3" style="text-align: center; font-weight:600;">
                        <button class="btn btn-primary" type="submit">Thêm</button>
                    </div>

                </div>
            </div>
            <div style="display: flex; justify-content: space-between ;font-weight: 200 ">
                <c:if test="${  empty param.keyword  and not empty page1}">
                    <div>
                        <c:if test="${page > 0}">
                            <button class="btn btn-outline-success" type="button"><a href="?page=${page - 1 }">Trang
                                truoc</a></button>
                        </c:if>
                    </div>
                    <div>
                            <c:forEach begin="0" end="10" varStatus="i">
                                <button type="button" class="btn btn-outline-success"><a
                                        href="/khuyen-mai/form-add?page=${i.index}">${i.index + 1}</a>
                                </button>
                            </c:forEach>
                    </div>
                    <div>
                        <c:if test="${page < page1 - 1}">
                            <button class="btn btn-outline-success" type="button"><a href="?page=${page + 1 }">Trang
                                sau</a></button>
                        </c:if>
                    </div>

            </div>

            <div style="display: none">
                <c:forEach items="${listSpct}" var="spct" varStatus="i">
                    <tr>
                        <td><input type="checkbox" class="checkbox" name="selectedProductIds"
                                   value="${spct.id}"> ${spct.id}
                    </tr>
                </c:forEach>
            </div>
            </c:if>
        </form>
    </div>
</div>
</div>

<!-- Link thư viện Bootstrap JS và Popper.js -->
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
<script>
    function validateDateRange() {
        var startDate = document.getElementById('startDate').value;
        var endDate = document.getElementById('endDate').value;
        var currentDate = new Date();

        // Đặt tất cả các thành phần giờ, phút, giây, và mili giây về 0
        startDate = new Date(startDate);
        endDate = new Date(endDate);
        currentDate.setHours(0, 0, 0, 0);

        if (startDate >= endDate) {
            // Sử dụng SweetAlert2 để hiển thị thông báo và tự động đóng sau 1 giây
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Ngày bắt đầu phải nhỏ hơn ngày kết thúc',
                timer: 1000, // 1 giây
                showConfirmButton: false,
            });
            return false; // Ngăn chặn việc submit form
        } else if (startDate <= currentDate) {
            // Sử dụng SweetAlert2 để hiển thị thông báo và tự động đóng sau 1 giây
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Ngày bắt đầu phải lớn hơn ngày hiện tại',
                timer: 1000, // 1 giây
                showConfirmButton: false,
            });
            return false; // Ngăn chặn việc submit form
        } else {
            // Sử dụng SweetAlert2 để hiển thị thông báo thành công và tự động đóng sau 1 giây
            Swal.fire({
                icon: 'success',
                title: 'Thành công',
                text: 'Cập nhật thành công',
                timer: 1000, // 1 giây
                showConfirmButton: false,
            });
            setTimeout(() => {
                submitForm();
            }, 1200);
            return false; // Thay đổi thành false để không submit form ngay lập tức
        }
    }

    function submitForm() {
        // Thực hiện hành động submit form
        document.getElementById('myForm').submit();
    }

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
            discountInput.max = null;
        } else if (percentageRadio.checked) {
            // Nếu đã chọn radio "%", áp dụng giới hạn giá trị là 100
            discountInput.max = 90;
        }
    }
</script>
<style>

    form[role="search"] {
        margin-bottom: 1rem;
    }

    .container {
        background-color: #ffffff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        padding: 30px;
        border-radius: 10px;
    }


    /* Checkbox styles */
    .checkbox {
        margin-right: 5px;
    }

    /* Button styles */
    .btn-outline-success {
        margin-right: 5px;
    }

    /* Table border styles with raised effect */
    .table {
        border-collapse: collapse;
        width: 100%;
        margin-bottom: 1rem;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        border-radius: 10px;

    }

    .col-md-3 {
        border-collapse: collapse;
        width: 100%;
        margin-bottom: 1rem;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        background-color: white;
        color: black;
        border: 1px solid #dee2e6;
    }


    .table th, .table td {
        border: 1px solid #dee2e6; /* Default border color */
        padding: 8px;
        text-align: center;
    }

    .table th {
        background-color: #5c636a;
        color: white;
    }

    /* Responsive styles */
    @media screen and (max-width: 768px) {
        /* Adjust styles for smaller screens if needed */
    }


</style>

</body>
</html>
